import 'package:flutter/material.dart';
import 'package:hivedex/presentation/theme/app_colors.dart';

class AppUtils {
  static Color getColorType(String type) {
    switch (type) {
      case 'grass':
        return AppColors.lightGreen;
      case 'bug':
        return AppColors.lightTeal;
      case 'fire':
        return AppColors.red;
      case 'water':
        return AppColors.lightBlue;
      case 'fighting':
        return AppColors.red;
      case 'normal':
        return AppColors.beige;
      case 'electric':
        return AppColors.lightYellow;
      case 'psychic':
        return AppColors.lightPink;
      case 'poison':
        return AppColors.lightPurple;
      case 'ghost':
        return AppColors.purple;
      case 'ground':
        return AppColors.darkBrown;
      case 'rock':
        return AppColors.lightBrown;
      case 'dark':
        return AppColors.black;
      case 'dragon':
        return AppColors.violet;
      case 'fairy':
        return AppColors.pink;
      case 'flying':
        return AppColors.lilac;
      case 'ice':
        return AppColors.lightCyan;
      case 'steel':
        return AppColors.grey;
      default:
        return AppColors.lightBlue;
    }
  }
}

extension StringExtension on String {
  String capitalizeFirst() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
