import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quitter/about_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';

void main() {
  testWidgets('desktop About uses a two-column card layout', (tester) async {
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    PackageInfo.setMockInitialValues(
      appName: 'Quitter',
      packageName: 'com.quitter.app',
      version: '1.1.81',
      buildNumber: '1260',
      buildSignature: '',
    );

    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: AboutPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(AppBar), findsNothing);
    expect(find.byType(Card), findsNWidgets(6));
    expect(find.text('Quitter'), findsOneWidget);
    expect(find.text('1.1.81'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
