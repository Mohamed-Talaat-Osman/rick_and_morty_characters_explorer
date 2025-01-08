import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters_explorer/helpers/corner_radius/corner_radius.dart';

import '../../../managers/theme/colors_manager.dart';

abstract class ButtonWidgetTypeInterface {
  late Color backgroundColor;
  late Color textColor;
  Border? border;
  BorderRadius? radius;
}

class ButtonWidgetPrimaryEnabled extends ButtonWidgetTypeInterface {
  @override
  Color backgroundColor = ColorsManager.foundationMainPrimary;

  @override
  Color textColor = ColorsManager.foundationMainWhite;

  @override
  BorderRadius? get radius => BorderRadius.all(Radius.circular(CornerRadius.sixteen));
}

class ButtonWidgetSecondaryEnabled extends ButtonWidgetTypeInterface {
  @override
  Color backgroundColor = Colors.transparent;

  @override
  Color textColor = ColorsManager.foundationMainPrimary;
}

class ButtonWidgetTerteiryEnabled extends ButtonWidgetTypeInterface {
  @override
  Color backgroundColor = Colors.transparent;

  @override
  Color textColor = ColorsManager.foundationMainPrimary;

  @override
  Border? get border =>
      Border.all(color: ColorsManager.foundationMainPrimary, width: 1);

  @override
  BorderRadius? get radius => BorderRadius.all(Radius.circular(CornerRadius.sixteen));
}

class ButtonWidgetPrimaryDisabled extends ButtonWidgetTypeInterface {
  @override
  Color backgroundColor = ColorsManager.coreAppBackgroundDisabled;

  @override
  Color textColor = ColorsManager.coreAppContentDisabled;

  @override
  BorderRadius? get radius => BorderRadius.all(Radius.circular(CornerRadius.sixteen));
}

class ButtonWidgetSecondaryDisabled extends ButtonWidgetTypeInterface {
  @override
  Color backgroundColor = Colors.transparent;

  @override
  Color textColor = ColorsManager.coreAppContentDisabled;
}

class ButtonWidgetTerteiryDisabled extends ButtonWidgetTypeInterface {
  @override
  Color backgroundColor = Colors.transparent;

  @override
  Color textColor = ColorsManager.coreAppContentDisabled;

  @override
  Border? get border =>
      Border.all(color: ColorsManager.coreAppBorderDisabled, width: 1);

  BorderRadius? get radius => BorderRadius.all(Radius.circular(CornerRadius.sixteen));
}

class ButtonWidgetPrimaryDanger extends ButtonWidgetTypeInterface {
  @override
  Color backgroundColor = ColorsManager.coreAppBackgroundDanger;

  @override
  Color textColor = ColorsManager.foundationAccentStrongPink;

  @override
  BorderRadius? get radius => BorderRadius.all(Radius.circular(CornerRadius.sixteen));
}

class ButtonWidgetSecondaryDanger extends ButtonWidgetTypeInterface {
  @override
  Color backgroundColor = Colors.transparent;

  @override
  Color textColor = ColorsManager.foundationAccentStrongPink;
}

class ButtonWidgetTerteiryDanger extends ButtonWidgetTypeInterface {
  @override
  Color backgroundColor = Colors.transparent;

  @override
  Color textColor = ColorsManager.foundationAccentStrongPink;

  @override
  Border? get border =>
      Border.all(color: ColorsManager.foundationAccentStrongPink, width: 1);

  BorderRadius? get radius => BorderRadius.all(Radius.circular(CornerRadius.sixteen));
}
