import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

final talker = TalkerFlutter.init();

void installTalkerErrorHandlers() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    talker.handle(details.exception, details.stack, 'Flutter framework error');
  };
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    talker.handle(error, stackTrace, 'Uncaught platform error');
    return true;
  };
}
