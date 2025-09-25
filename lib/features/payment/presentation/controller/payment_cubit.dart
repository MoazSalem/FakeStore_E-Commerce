import 'package:ecommerce/core/utils/consts_manager.dart';
import 'package:ecommerce/core/widgets/snack_bar.dart';
import 'package:ecommerce/features/payment/domain/enums/payment_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paymob/flutter_paymob.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  static Future<void> initPaymob() async {
    FlutterPaymob.instance.initialize(
      apiKey: ConstsManager.paymobApiKey,
      integrationID: int.parse(ConstsManager.integrationID),
      walletIntegrationId: int.parse(ConstsManager.walletIntegrationId),
      iFrameID: int.parse(ConstsManager.iFrameID),
    );
  }

  void initPayment(
    PaymentMethod paymentMethod,
    BuildContext context,
    double amount,
  ) async {
    emit(PaymentLoading());
    switch (paymentMethod) {
      case PaymentMethod.card:
        try {
          await FlutterPaymob.instance.payWithCard(
            title: Text(
              "Card Payment",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            // Optional - Custom title AppBar
            appBarColor: Theme.of(context).colorScheme.surface,
            // Optional - Custom AppBar color
            context: context,
            currency: "EGP",
            amount: amount,
            onPayment: (response) {
              if (response.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  customSnackBar(
                    "🎉 Card Payment Success! TxID: ${response.transactionID}",
                    duration: 5,
                  ),
                );
                emit(PaymentSuccess());
                if (context.mounted) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  customSnackBar(
                    "❌ Card Payment Failed: ${response.message}",
                    duration: 5,
                  ),
                );
                emit(
                  PaymentError(message: response.message ?? "Unknown Error"),
                );
              }
            },
          );
          emit(PaymentInitial());
        } catch (e) {
          debugPrint(e.toString());
          emit(PaymentError(message: e.toString()));
        }
        break;
      case PaymentMethod.wallet:
        emit(PaymentWalletNumber());
        break;
    }
  }

  void initWalletPayment(
    String number,
    BuildContext context,
    double amount,
  ) async {
    emit(PaymentLoading());
    try {
      await FlutterPaymob.instance.payWithWallet(
        title: Text(
          "Wallet Payment",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        // Optional - Custom title AppBar
        appBarColor: Theme.of(context).colorScheme.surface,
        // Optional - Custom AppBar color
        context: context,
        currency: "EGP",
        amount: amount,
        number: number,
        onPayment: (response) {
          if (response.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                "🎉 Wallet Payment Successful! TxID: ${response.transactionID}",
                duration: 5,
              ),
            );
            emit(PaymentSuccess());
            if (context.mounted) {
              Navigator.popUntil(context, (route) => route.isFirst);
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                "❌ Wallet Payment Failed: ${response.message}",
                duration: 5,
              ),
            );
            emit(PaymentError(message: response.message ?? "Unknown Error"));
          }
        },
      );
      emit(PaymentInitial());
    } catch (e) {
      debugPrint(e.toString());
      emit(PaymentError(message: e.toString()));
    }
  }
}
