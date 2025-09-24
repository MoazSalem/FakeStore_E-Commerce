import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/payment/domain/enums/payment_enum.dart';
import 'package:ecommerce/features/payment/presentation/controller/payment_cubit.dart';
import 'package:ecommerce/features/payment/presentation/widgets/tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectMethodScreen extends StatefulWidget {
  const SelectMethodScreen({super.key});

  @override
  State<SelectMethodScreen> createState() => _SelectMethodScreenState();
}

class _SelectMethodScreenState extends State<SelectMethodScreen> {
  final TextEditingController _walletNumberController = TextEditingController(
    text: "01010101010",
  );
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        switch (state) {
          case PaymentLoading():
            return SizedBox(
              width: double.infinity,
              height: 246,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: SizesManager.padding,
                  children: [
                    const Text("Opening Payment Page..."),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          case PaymentWalletNumber():
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: SizesManager.padding32,
                horizontal: SizesManager.padding20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: SizesManager.padding,
                children: [
                  const Text(
                    "Enter your wallet number",
                    style: TextStyle(
                      fontSize: SizesManager.font18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _walletNumberController,
                          keyboardType: TextInputType.number,
                          maxLength: 11,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your wallet number';
                            } else if (value.length != 11 ||
                                !value.startsWith('01')) {
                              return 'Please enter a valid 11-digit number starting with 01';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                SizesManager.roundedCorners,
                              ),
                            ),
                            hintText: "Enter your wallet number",
                            hintStyle: TextStyle(fontSize: SizesManager.font16),
                            labelStyle: TextStyle(
                              fontSize: SizesManager.font16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    onPressed: () {
                      // Validate the form when the button is pressed.
                      if (_formKey.currentState!.validate()) {
                        // If validation passes, proceed with wallet payment logic.
                        BlocProvider.of<PaymentCubit>(
                          context,
                        ).initWalletPayment(
                          _walletNumberController.text,
                          context,
                        );
                      }
                    },
                    child: const Text("Continue"),
                  ),
                ],
              ),
            );
          default:
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: SizesManager.padding32,
                horizontal: SizesManager.padding20,
              ),
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Select Payment Method',
                      style: TextStyle(
                        fontSize: SizesManager.font18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: SizesManager.padding20),
                    TileCard(
                      title: 'Card',
                      leading: SvgImage(asset: AssetsManager.cards),
                      onTap: () => BlocProvider.of<PaymentCubit>(
                        context,
                      ).initPayment(PaymentMethod.card, context),
                    ),
                    SizedBox(height: SizesManager.padding8),
                    TileCard(
                      title: 'Mobile Wallet',
                      leading: SvgImage(asset: AssetsManager.wallet),
                      onTap: () => BlocProvider.of<PaymentCubit>(
                        context,
                      ).initPayment(PaymentMethod.wallet, context),
                    ),
                    SizedBox(height: SizesManager.padding),
                  ],
                ),
              ),
            );
        }
      },
    );
  }
}
