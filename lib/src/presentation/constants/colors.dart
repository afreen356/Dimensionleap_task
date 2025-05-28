// lib/constants/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryBlue = Color(0xFF2871FA);
  static const Color primaryPurple = Color(0xFF800080); // Purple from your app bar
  static const Color primaryBlueLight = Color.fromARGB(255, 179, 213, 255);
  
  // Text Colors
  static const Color textDark = Colors.black87;
  static const Color textMedium = Color(0xFF424242);
  static const Color textLight = Color(0xFF757575);
  static const Color textWhite = Colors.white;
  
  // UI Colors
  static const Color cardBorder = Color(0xFFE0E0E0);
  static const Color cardShadow = Color(0x33000000);
  static const Color appBarShadow = Color(0x0D000000); // 5% opacity black
  static const Color appBarBackground = Colors.white;
  static const Color placeholderBg = Color(0xFFEEEEEE);
  static const Color placeholderText = Color(0xFF9E9E9E);
  
  // Button Colors
  static const Color activeNavLink = primaryPurple;
  static const Color inactiveNavLink = Colors.black;
  
  // Icon Colors
  static const Color iconBlue = Color.fromARGB(255, 179, 213, 255);
  static const Color iconGrey = Color(0xFF9E9E9E);
  static const Color iconDark = Colors.black;
  
  // Status Colors
  static const Color savedBookmark = primaryBlue;
  static const Color unsavedBookmark = Color(0xFF9E9E9E);
  
  // Avatar Colors
  static const Color avatarBackground = Color(0xFFE0E0E0);
}