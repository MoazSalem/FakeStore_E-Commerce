import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/custom_divider.dart';
import 'package:ecommerce/core/widgets/horizontal_item_widget.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/cart/presentation/controller/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizesManager.padding20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'Checkout',
                leading: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SizesManager.padding8,
                    vertical: SizesManager.padding20,
                  ),
                  child: CircularButton(
                    elevation: 0,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    child: SvgImage(asset: AssetsManager.back),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartLoaded) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            HorizontalItemWidget(
                              pressable: false,
                              product: state.products[index],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: SizesManager.padding10,
                              ),
                              child: const CustomDivider(),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const Text(
                'Shipping Information',
                style: TextStyle(
                  fontSize: SizesManager.font16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: SizesManager.padding),
              // Order Summary
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartLoaded) {
                    return OrderSummary(
                      total: state.totalAmount,
                      shippingFee: 0,
                      discount: 0,
                      items: state.products.length,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(height: 20),
              // Pay Button
              CustomButton(
                child: Text(
                  'Pay',
                  style: TextStyle(
                    fontSize: SizesManager.font16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  final double total;
  final double shippingFee;
  final double discount;
  final int items;

  const OrderSummary({
    super.key,
    required this.total,
    required this.shippingFee,
    required this.discount,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SummaryRow(label: 'Total ($items items)', value: '\$$total'),
        const SizedBox(height: 10),
        SummaryRow(label: 'Shipping Fee', value: '\$$shippingFee'),
        const SizedBox(height: 10),
        SummaryRow(label: 'Discount', value: '\$$discount'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: SizesManager.padding),
          child: CustomDivider(),
        ),
        SummaryRow(label: 'Sub Total', value: '\$$total', isTotal: true),
      ],
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: isTotal ? Colors.black : Colors.grey[600],
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
