import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/app_scheme.dart';
import 'package:quitter/home_page.dart';
import 'package:quitter/journal_page.dart';
import 'package:quitter/pin_page.dart';
import 'package:quitter/settings_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/tasks.dart';
import 'package:quitter/app_theme_mode.dart';

final rootScaffoldMessenger = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settings = SettingsProvider();
  await settings.loadPreferences();
  final addiction = AddictionProvider();
  await addiction.loadAddictions();

  cancelTasks();
  setupTasks();

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

class QuitterApp extends StatefulWidget {
  const QuitterApp({super.key});

  @override
  State<QuitterApp> createState() => _QuitterAppState();
}

class _QuitterAppState extends State<QuitterApp>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late TabController _tabController;
  DateTime? _pausedTime;

  @override
  void initState() {
    super.initState();
    final settings = context.read<SettingsProvider>();
    if (settings.showJournal)
      _tabController = TabController(length: 3, vsync: this);
    else
      _tabController = TabController(length: 2, vsync: this);

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _pausedTime = DateTime.now();
    } else if (state == AppLifecycleState.resumed && _pausedTime != null) {
      final now = DateTime.now();
      final elapsed = now.difference(_pausedTime!);
      final settings = context.read<SettingsProvider>();
      if (elapsed.inSeconds < settings.pinTimeout) return;

      settings.lockApp();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, child) {
        if (settings.showJournal && _tabController.length != 3)
          _tabController = TabController(
            length: 3,
            vsync: this,
            initialIndex: 2,
          );
        if (!settings.showJournal && _tabController.length != 2)
          _tabController = TabController(
            length: 2,
            vsync: this,
            initialIndex: 1,
          );

        return DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            final lightColorScheme = AppScheme.getColorScheme(
              settings.colorSchemeType,
              Brightness.light,
              lightDynamic,
            );
            ColorScheme darkColorScheme = AppScheme.getColorScheme(
              settings.colorSchemeType,
              Brightness.dark,
              darkDynamic,
            );

            if (settings.themeMode == AppThemeMode.pureBlack) {
              darkColorScheme = darkColorScheme.copyWith(
                surface: Colors.black,
                surfaceContainer: const Color(0xFF0A0A0A),
                surfaceContainerLow: Colors.black,
                surfaceContainerLowest: Colors.black,
                surfaceContainerHigh: const Color(0xFF151515),
                surfaceContainerHighest: const Color(0xFF1A1A1A),
                onSurface: Colors.white,
                outline: const Color(0xFF404040),
                outlineVariant: const Color(0xFF303030),
              );
            }

            return MaterialApp(
              title: 'Quitter',
              scaffoldMessengerKey: rootScaffoldMessenger,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ja'),
              ],
              themeMode: settings.themeMode.toThemeMode(),
              theme: ThemeData(
                colorScheme: lightColorScheme,
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                colorScheme: darkColorScheme,
                useMaterial3: true,
                scaffoldBackgroundColor:
                    settings.themeMode == AppThemeMode.pureBlack
                    ? Colors.black
                    : null,
              ),
              home: settings.isPinEnabled && !settings.isUnlocked
                  ? PinPage()
                  : Column(
                      children: [
                        AppBar(
                          title: AnimatedBuilder(
                            animation: _tabController,
                            builder: (context, child) {
                              return TabBar(
                                indicatorPadding: EdgeInsetsGeometry.only(
                                  bottom: 32,
                                ),
                                controller: _tabController,
                                tabs: [
                                  Tab(
                                    icon: SvgPicture.asset(
                                      'assets/neurology.svg',
                                      width: 24,
                                      height: 24,
                                      colorFilter: ColorFilter.mode(
                                        _tabController.index == 0
                                            ? Theme.of(
                                                context,
                                              ).colorScheme.primary
                                            : Theme.of(
                                                context,
                                              ).colorScheme.onSurfaceVariant,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    text: AppLocalizations.of(context)!.tabQuitter,
                                  ),
                                  if (settings.showJournal)
                                    Tab(
                                      icon: Icon(Icons.menu_book),
                                      text: AppLocalizations.of(context)!.tabJournal,
                                    ),
                                  Tab(
                                    icon: Icon(Icons.settings),
                                    text: AppLocalizations.of(context)!.tabSettings,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            physics: settings.swipeTabs
                                ? AlwaysScrollableScrollPhysics()
                                : NeverScrollableScrollPhysics(),
                            children: [
                              HomePage(),
                              if (settings.showJournal) JournalPage(),
                              SettingsPage(),
                            ],
                          ),
                        ),
                      ],
                    ),
            );
          },
        );
      },
    );
  }
}
