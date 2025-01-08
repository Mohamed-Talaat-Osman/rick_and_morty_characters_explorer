
import 'package:logger/logger.dart';

import '../../helpers/console_output/custome_console_output.dart';

class LoggerManager {
  LoggerManager._privateConstructor();

  // Static final instance
  static final LoggerManager _instance = LoggerManager._privateConstructor();

  // Static method
  static LoggerManager get instance {
    return _instance;
  }

  final Logger _logger = Logger(
      printer: PrettyPrinter(
        stackTraceBeginIndex: 0,
        methodCount: 2,
        errorMethodCount: null,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: true,
        levelColors: {
          /*
              0:  Black,      8:  Grey
              1:  Red,        9:  Red Ascend
              2:  Green,      10: Green Ascend
              3:  Yellow      11: Yellow Ascend
              4:  Blue        12: Blue Ascend
              5:  Purple      13: Purple Ascend
              6:  Turquoise   14: Turquoise Ascend
              7:  White       15: Bright White
            */
          Level.trace: const AnsiColor.fg(6),
          Level.debug: const AnsiColor.fg(8),
          Level.info: const AnsiColor.fg(3),
          Level.warning: const AnsiColor.fg(5),
          Level.error: const AnsiColor.fg(9),
          Level.fatal: const AnsiColor.fg(1),
        },
      ),
      output: CustomeConsoleOutput()
      );



  debug(dynamic message) {
    _logger.d(message);
  }

  info(dynamic message) {
    _logger.i(message);
  }

  warning(dynamic message) {
    _logger.w(message);
  }

  error(dynamic message) {
    _logger.e(message);
  }

  trace(dynamic message) {
    _logger.t(message);
  }
}






