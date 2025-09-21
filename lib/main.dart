import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/app_scheme.dart';
import 'package:quitter/home_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/reminders.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settings = SettingsProvider();
  await settings.loadPreferences();
  final addiction = AddictionProvider();
  await addiction.loadAddictions();

  setupReminders();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => settings),
        ChangeNotifierProvider(create: (context) => addiction),
      ],
      child: const QuitterApp(),
    ),
  );
}

class QuitterApp extends StatelessWidget {
  const QuitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, child) {
        return DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            final lightColorScheme = AppScheme.getColorScheme(
              settings.colorSchemeType,
              Brightness.light,
              lightDynamic,
            );
            final darkColorScheme = AppScheme.getColorScheme(
              settings.colorSchemeType,
              Brightness.dark,
              darkDynamic,
            );

            return MaterialApp(
              title: 'Quitter',
              themeMode: settings.themeMode,
              theme: ThemeData(
                colorScheme: lightColorScheme,
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                colorScheme: darkColorScheme,
                useMaterial3: true,
              ),
              home: const HomePage(),
            );
          },
        );
      },
    );
  }
}
