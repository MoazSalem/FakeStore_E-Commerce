import 'package:ecommerce/core/utils/assets_manager.dart';

class HelperFunctions {
  static String capitalizeWords(String sentence) {
    if (sentence.isEmpty) return sentence;

    return sentence
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
  }

  static String getNavigationItemsSvg(int index, bool isSelected) {
    switch (index) {
      case 0:
        return isSelected ? AssetsManager.homeFilled : AssetsManager.home;
      case 1:
        return isSelected ? AssetsManager.cartFilled : AssetsManager.cart;
      case 2:
        return isSelected ? AssetsManager.heartFilled : AssetsManager.heart;
      case 3:
        return isSelected ? AssetsManager.profileFilled : AssetsManager.profile;
      default:
        return '';
    }
  }
}
