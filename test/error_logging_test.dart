import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/logging.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Talker preserves previously installed error handlers', () {
    final oldFlutterHandler = FlutterError.onError;
    final oldPlatformHandler = PlatformDispatcher.instance.onError;
    var flutterCalled = false;
    var platformCalled = false;
    try {
      FlutterError.onError = (_) => flutterCalled = true;
      PlatformDispatcher.instance.onError = (error, stack) {
        platformCalled = true;
        return true;
      };
      installTalkerErrorHandlers();

      FlutterError.onError?.call(
        FlutterErrorDetails(exception: StateError('flutter-marker')),
      );
      final handled = PlatformDispatcher.instance.onError?.call(
        StateError('platform-marker'),
        StackTrace.current,
      );

      expect(flutterCalled, isTrue);
      expect(platformCalled, isTrue);
      expect(handled, isTrue);
    } finally {
      FlutterError.onError = oldFlutterHandler;
      PlatformDispatcher.instance.onError = oldPlatformHandler;
    }
  });
}
