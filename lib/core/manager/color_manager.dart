import 'package:flutter/material.dart';

class ColorManager {
  static const Color green400 = Color(0xFF4ADE80);
  static const Color emerald500 = Color(0xFF10B981);
  static const Color emerald50 = Color(0xFFECFDF5);
  static const Color green50 = Color(0xFFF0FDF4);
  static const Color green = Color(0xFF10b981);
  static const Color blue = Color(0xFF3b82f6);
  static const Color purple = Color(0xFF8b5cf6);
  static const Color lightGrey = Color(0xFF64748b);
  static const Color darkGrey = Color(0xFF1e293b);
  static const Color background = Color(0xFFf8fafc);
  static const Color background2 = Color(0xFFeff6ff);
  static const Color appBarColor = Color(0xFFFFFFFF);
  static const Color textLightGrey = lightGrey;

  //Linear gradient

  static const List<Color> taskCardGradient = [
    ColorManager.green50,
    ColorManager.emerald50,
  ];
  static const List<Color> taskIconGradient = [
    ColorManager.green400,
    ColorManager.emerald500,
  ];
  static const List<Color> notesIconGradient = [
    Color(0xFF60A5FA), // blue-400
    Color(0xFF6366F1), // indigo-500
  ];
  static const List<Color> notesCardGradient = [
    Color(0xFFE0F2FE), // blue-100
    Color(0xFFE0E7FF), // indigo-100
  ];
  static const List<Color> reportsIconGradient = [
    Color(0xFFC084FC), // purple-400
    Color(0xFFEC4899), // pink-500
  ];
  static const List<Color> reportsCardGradient = [
    Color(0xFFF5F3FF), // purple-50
    Color(0xFFFDF2F8), // pink-50
  ];
}
