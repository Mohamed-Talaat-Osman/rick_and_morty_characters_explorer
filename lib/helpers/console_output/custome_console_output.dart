import 'dart:developer' as developer;
import 'package:logger/logger.dart';

class CustomeConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    final StringBuffer buffer = StringBuffer();
    event.lines.forEach(buffer.writeln);
    developer.log(buffer.toString());
  }
}