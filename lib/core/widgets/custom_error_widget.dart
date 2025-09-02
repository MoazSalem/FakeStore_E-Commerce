import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.message, this.statusCode});
  final String message;
  final int? statusCode;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: SizesManager.padding,
        children: [
          Icon(
            Icons.error,
            color: Theme.of(context).colorScheme.error,
            size: 50,
          ),
          if (statusCode != null)
            Text(
              "Error Code: $statusCode",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          Text(
            message,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
