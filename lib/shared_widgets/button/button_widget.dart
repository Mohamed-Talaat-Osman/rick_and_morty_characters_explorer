import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters_explorer/shared_widgets/button/type/button_widget_type.dart';

import '../../managers/theme/textstyles_manager.dart';
import 'entities/button_widget_state.dart';
import 'entities/button_widget_type.dart';


// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  late ButtonWidgetState _state;
  late ButtonWidgetType _type;
  late ButtonWidgetTypeInterface _theme;

  ButtonWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      ButtonWidgetState state = ButtonWidgetState.enabled,
      ButtonWidgetType type = ButtonWidgetType.primary}) {
    _state = state;
    _theme = type.theme(_state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: _state == ButtonWidgetState.enabled ? onPressed : () => {},
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
            color: _theme.backgroundColor,
            borderRadius: _theme.radius,
            border: _theme.border),
        child: Center(
          child: Text(
            title,
            style: TextStylesManager.button1.copyWith(color: _theme.textColor),
          ),
        ),
      ),
    );
  }
}
