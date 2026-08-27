import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// Persists uncaught Flutter, platform, and zone errors for Quitter.
class CrashLogger {
  CrashLogger._(this._file);

  final File? _file;
  static CrashLogger? _instance;

  static Future<CrashLogger> install({String fileName = 'crash.log'}) async {
    File? file;
    if (!kIsWeb) {
      final dir = await getApplicationSupportDirectory();
      file = File('${dir.path}${Platform.pathSeparator}$fileName');
    }

    final logger = CrashLogger._(file);
    _instance = logger;

    final previousFlutterOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      logger.record(details.exception, details.stack, context: 'FlutterError');
      previousFlutterOnError?.call(details);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      logger.record(error, stack, context: 'PlatformDispatcher');
      return true;
    };

    if (file != null) debugPrint('Crash log: ${file.path}');
    return logger;
  }

  static CrashLogger? get instance => _instance;

  void record(Object error, StackTrace? stack, {String context = 'uncaught'}) {
    final entry = StringBuffer()
      ..writeln('[${DateTime.now().toIso8601String()}] ($context) $error');
    if (stack != null) entry.writeln(stack.toString().trimRight());
    entry.writeln();

    debugPrint(entry.toString());
    final file = _file;
    if (file == null) return;

    try {
      file.writeAsStringSync(entry.toString(), mode: FileMode.append);
    } catch (_) {
      // Logging must remain best-effort.
    }
  }
}
