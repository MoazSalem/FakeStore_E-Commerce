import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:flutter/material.dart';

class AmountRow extends StatefulWidget {
  const AmountRow({super.key, required this.theme});
  final ThemeData theme;

  @override
  State<AmountRow> createState() => _AmountRowState();
}

class _AmountRowState extends State<AmountRow> {
  int amount = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: SizesManager.padding10,
      children: [
        CircularButton(
          elevation: 0,
          side: BorderSide(color: widget.theme.colorScheme.outline, width: 1),
          child: Icon(
            fontWeight: FontWeight.bold,
            Icons.remove,
            size: SizesManager.iconSize16,
          ),
          onTap: () => setState(() {
            amount > 0 ? amount-- : null;
          }),
        ),
        Text(
          amount.toString(),
          style: TextStyle(
            fontSize: SizesManager.font16,
            fontWeight: FontWeight.w900,
          ),
        ),
        CircularButton(
          elevation: 0,
          side: BorderSide(color: widget.theme.colorScheme.outline, width: 1),
          child: Icon(
            fontWeight: FontWeight.bold,
            Icons.add,
            size: SizesManager.iconSize16,
          ),
          onTap: () => setState(() {
            amount++;
          }),
        ),
      ],
    );
  }
}
