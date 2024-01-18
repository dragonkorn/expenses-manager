import 'package:logger/logger.dart';

class AppLogger {
  static final _logger = Logger(
    level: Level.all,
    printer: PrettyPrinter(
      methodCount: 1, // Number of method calls to be displayed
      errorMethodCount: 5, // Number of method calls if stacktrace is provided
      colors: false, // Enable ANSI colors in the output
      printEmojis: true, // Print emojis for log levels
      printTime: true, // Show the timestamp of the log message
      noBoxingByDefault: true,
    ), // Use the PrettyPrinter to format and print log
  );

  factory AppLogger() {
    return _instance;
  }

  AppLogger._internal();

  static final AppLogger _instance = AppLogger._internal();

  Logger get logger => _logger;
}
