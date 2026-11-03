import 'dart:async';

import 'package:quitter/logging.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  talker.configure(
    filter: TalkerFilter(
      disabledKeys: [TalkerKey.debug, TalkerKey.info, TalkerKey.verbose],
    ),
  );
  await testMain();
}
