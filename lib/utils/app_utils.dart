import 'package:flutter/material.dart';

class AppUtils {
  static Color getColorType(String type) {
    switch (type) {
      case 'grass':
        return Colors.lightGreen;
      case 'bug':
        return Colors.lightGreen;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.lightBlue;
      case 'fighting':
        return Colors.orange;
      case 'normal':
        return Colors.grey[400]!;
      case 'electric':
        return Colors.yellow[700]!;
      case 'psychic':
        return Colors.pink;
      case 'poison':
        return Colors.purple;
      case 'ghost':
        return Colors.purple[900]!;
      case 'ground':
        return Colors.brown;
      case 'rock':
        return Colors.brown[400]!;
      case 'dark':
        return Colors.black87;
      case 'dragon':
        return Colors.deepPurple[800]!;
      case 'fairy':
        return Colors.pink[300]!;
      case 'flying':
        return Colors.lightBlue[100]!;
      case 'ice':
        return Colors.cyan[200]!;
      case 'steel':
        return Colors.grey[600]!;
      default:
        return Colors.white;
    }
  }
}

extension StringExtension on String {
  String capitalizeFirst() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
