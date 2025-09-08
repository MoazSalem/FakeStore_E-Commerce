import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/core/widgets/online_image.dart';
import 'package:flutter/material.dart';

Future<void> interactiveViewerBuilder({
  required BuildContext context,
  required String imageUrl,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizesManager.roundedCorners),
        ),
        contentPadding: const EdgeInsets.all(0),
        content: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  SizesManager.roundedCorners,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  SizesManager.roundedCorners,
                ),
                child: InteractiveViewer(
                  constrained: true,
                  child: OnlineImage(imageUrl: imageUrl),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(SizesManager.padding),
              child: CircularButton(
                padding: SizesManager.padding5,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.close,
                  size: SizesManager.iconSize16,
                  color: Colors.white,
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      );
    },
  );
}
