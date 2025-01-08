import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_characters_explorer/helpers/navigator/go_to.dart';

import '../../gen/assets.gen.dart';
import '../../helpers/padding/padding.dart';
import '../theme/colors_manager.dart';
import '../theme/textstyles_manager.dart';
import '../../helpers/corner_radius/corner_radius.dart';

class SnackBarManager {
  static SnackBarManager? _instance;

  SnackBarManager._internal();

  factory SnackBarManager() {
    _instance ??= SnackBarManager._internal();
    return _instance!;
  }

  static void showSuccessMessage(String message) {
    ScaffoldMessenger.of(GoTo.navigationKey.currentContext!).showSnackBar(SnackBar(
      backgroundColor: ColorsManager.foundationMainPrimary,
      content: Row(
        children: [
          Assets.icons.icOutlinedCheck.svg(),
          SizedBox(
            width: PaddingHorizontal.eight,
          ),
          Expanded(
            child: Text(
              message,
              style: TextStylesManager.p1
                  .copyWith(color: ColorsManager.foundationMainWhite),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CornerRadius.eight),
      ),
    ));
  }

  static void showErrorMessage(String message) {
    ScaffoldMessenger.of(GoTo.navigationKey.currentContext!).showSnackBar(SnackBar(
      backgroundColor: ColorsManager.foundationAccentDanger,
      content: Row(
        children: [
          Assets.icons.icFilledInfo.svg(),
          SizedBox(
            width: PaddingHorizontal.eight,
          ),
          Expanded(
            child: Text(
              message,
              style: TextStylesManager.p1
                  .copyWith(color: ColorsManager.foundationMainWhite),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CornerRadius.eight),
      ),
    ));
  }
}
