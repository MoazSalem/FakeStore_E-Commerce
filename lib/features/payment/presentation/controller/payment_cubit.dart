import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/utils/navigation_manager.dart';
import 'package:ecommerce/features/payment/domain/enums/payment_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paymob/flutter_paymob.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  void initPayment(PaymentMethod paymentMethod, BuildContext context) async {
    emit(PaymentLoading());
    switch (paymentMethod) {
      case PaymentMethod.card:
        try {
          await FlutterPaymob.instance.payWithCard(
            title: Text("Card Payment"),
            // Optional - Custom title AppBar
            appBarColor: Colors.blueAccent,
            // Optional - Custom AppBar color
            context: context,
            currency: "EGP",
            amount: 150,
            onPayment: (response) {
              if (response.success) {
                print("🎉 Payment Success! TxID: ${response.transactionID}");
                emit(PaymentSuccess());
                if (context.mounted) {
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName(NavigationManager.mainScreen),
                  );
                }
              } else {
                print("❌ Payment Failed: ${response.message}");
                emit(
                  PaymentError(message: response.message ?? "Unknown Error"),
                );
              }
            },
          );
        } catch (e) {
          print(e);
          emit(PaymentError(message: e.toString()));
        }
        emit(PaymentInitial());
        break;
      case PaymentMethod.wallet:
        emit(PaymentWalletNumber());
        break;
    }
  }

  void initWalletPayment(String number, BuildContext context) async {
    emit(PaymentLoading());
    try {
      await FlutterPaymob.instance.payWithWallet(
        title: Text("Card Payment"),
        // Optional - Custom title AppBar
        appBarColor: Colors.blueAccent,
        // Optional - Custom AppBar color
        context: context,
        currency: "EGP",
        amount: 150,
        number: number,
        onPayment: (response) {
          if (response.success) {
            print("🎉 Wallet Payment Successful");
            emit(PaymentSuccess());
            if (context.mounted) {
              Navigator.popUntil(
                context,
                ModalRoute.withName(NavigationManager.checkoutScreen),
              );
            }
          } else {
            print("❌ Wallet Payment Failed");
            emit(PaymentError(message: response.message ?? "Unknown Error"));
          }
        },
      );
    } catch (e) {
      print(e);
      emit(PaymentError(message: e.toString()));
    }
    emit(PaymentInitial());
  }
}
