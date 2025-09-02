import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:flutter/material.dart';

class AmountRow extends StatelessWidget {
  const AmountRow({
    super.key,
    this.buttonsPadding,
    this.iconSize,
    this.amountTextSize,
    this.spacing,
    required this.onRemove,
    required this.onAdd,
    required this.amount,
  });
  final double? buttonsPadding;
  final double? iconSize;
  final double? amountTextSize;
  final double? spacing;
  final Function() onRemove;
  final Function() onAdd;
  final int amount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: spacing ?? SizesManager.padding10,
      children: [
        CircularButton(
          padding: buttonsPadding,
          elevation: 0,
          side: BorderSide(color: theme.colorScheme.outline, width: 1),
          onTap: onRemove,
          child: Icon(
            fontWeight: FontWeight.bold,
            Icons.remove,
            size: iconSize ?? SizesManager.iconSize16,
          ),
        ),
        Text(
          amount.toString(),
          style: TextStyle(
            fontSize: amountTextSize ?? SizesManager.font16,
            fontWeight: FontWeight.w900,
          ),
        ),
        CircularButton(
          padding: buttonsPadding,
          elevation: 0,
          side: BorderSide(color: theme.colorScheme.outline, width: 1),
          onTap: onAdd,
          child: Icon(
            fontWeight: FontWeight.bold,
            Icons.add,
            size: iconSize ?? SizesManager.iconSize16,
          ),
        ),
      ],
    );
  }
}
