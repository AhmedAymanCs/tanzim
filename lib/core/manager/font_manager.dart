import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontConstants {
  static const String fontFamily = 'Cairo';
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w800;
}

class FontSize {
  static double get s12 => 12.0.sp;
  static double get s14 => 14.0.sp;
  static double get s16 => 16.0.sp;
  static double get s18 => 18.0.sp;
  static double get s20 => 20.0.sp;
  static double get s22 => 22.0.sp;
  static double get s28 => 28.0.sp;
  static double get s35 => 35.0.sp;
  static double get s50 => 50.0.sp;
}
