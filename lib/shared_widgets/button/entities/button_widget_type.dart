

import '../type/button_widget_type.dart';
import 'button_widget_state.dart';

enum ButtonWidgetType {
  primary,
  secondary,
  terteiry;

  ButtonWidgetTypeInterface theme(ButtonWidgetState state) {
    switch (this) {
      case ButtonWidgetType.primary:
        switch (state) {
          case ButtonWidgetState.enabled:
            return ButtonWidgetPrimaryEnabled();
          case ButtonWidgetState.disabled:
            return ButtonWidgetPrimaryDisabled();
          case ButtonWidgetState.danger:
            return ButtonWidgetPrimaryDanger();
        }
      case ButtonWidgetType.secondary:
        switch (state) {
          case ButtonWidgetState.enabled:
            return ButtonWidgetSecondaryEnabled();
          case ButtonWidgetState.disabled:
            return ButtonWidgetSecondaryDisabled();
          case ButtonWidgetState.danger:
            return ButtonWidgetSecondaryDanger();
        }
      case ButtonWidgetType.terteiry:
        switch (state) {
          case ButtonWidgetState.enabled:
            return ButtonWidgetTerteiryEnabled();
          case ButtonWidgetState.disabled:
            return ButtonWidgetTerteiryDisabled();
          case ButtonWidgetState.danger:
            return ButtonWidgetTerteiryDanger();
        }
    }
  }
}
