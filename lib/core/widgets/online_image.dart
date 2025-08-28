import 'package:flutter/material.dart';

class OnlineImage extends StatelessWidget {
  const OnlineImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.scaleDown,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          // Image has finished loading, return the image
          return child;
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }
}
