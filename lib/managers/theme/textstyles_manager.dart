import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors_manager.dart';

extension TextStylesManager on TextStyle {
  // Title - Display
  static TextStyle displayLg = TextStyle(
    fontSize: 44.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.coreAppContentPrimary,
  );

  static TextStyle display = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.coreAppContentPrimary,
  );

  static TextStyle displaySm = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.coreAppContentPrimary,
  );

  // Title - Heading
  static TextStyle h1 = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.coreAppContentPrimary,
  );

  static TextStyle h2 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.coreAppContentPrimary,
  );

  static TextStyle h3 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.coreAppContentPrimary,
  );

  static TextStyle h4 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.coreAppContentPrimary,
  );

  // Title - Subtitles
  static TextStyle st1 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.coreAppContentPrimary,
  );

  static TextStyle st2 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.coreAppContentPrimary,
  );

  static TextStyle st3 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.coreAppContentPrimary,
  );

  // Content - Paragraph
  static TextStyle p1 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.coreAppContentPrimary,
  );

  static TextStyle p2 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.coreAppContentPrimary,
  );

  static TextStyle p3 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.coreAppContentPrimary,
  );

  // Content - Caption
  static TextStyle caption1 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.coreAppContentPrimary,
  );

  static TextStyle caption2 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.coreAppContentPrimary,
  );

  static TextStyle caption3 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: ColorsManager.coreAppContentPrimary,
  );

  // Component - Button
  static TextStyle button1 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.coreAppContentPrimary,
  );

  static TextStyle button2 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.coreAppContentPrimary,
  );

  // Component - Tab bar
  static TextStyle navTab = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: ColorsManager.coreAppContentPrimary,
  );
}
