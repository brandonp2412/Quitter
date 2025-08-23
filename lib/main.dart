import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:quitter/color_scheme_helper.dart';
import 'package:quitter/nicotine_pouches.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/opioid_page.dart';
import 'package:quitter/settings_page.dart';
import 'package:quitter/smoking_page.dart';
import 'package:quitter/vaping_page.dart';
import 'package:quitter/reminders.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var alcoholDays = 0;
  var vapingDays = 0;
  var smokingDays = 0;
  var pouchesDays = 0;
  var opioidDays = 0;

  @override
  void initState() {
    super.initState();
    _loadQuitDays();
  }

  void _loadQuitDays() async {
    final prefs = await SharedPreferences.getInstance();

    final quitSmoking = prefs.getString('smoking');
    final quitVaping = prefs.getString('vaping');
    final quitAlcohol = prefs.getString('alcohol');
    final quitOpioids = prefs.getString('opioids');

    if (mounted) {
      setState(() {
        smokingDays = daysCeil(quitSmoking);
        alcoholDays = daysCeil(quitAlcohol);
        vapingDays = daysCeil(quitVaping);
        opioidDays = daysCeil(quitOpioids);
      });
    }
  }

  void _showHideBottomSheet(String title, VoidCallback onConfirm) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.visibility_off,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                'Hide $title?',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'This will hide the $title option from your home screen. You can show it again in Settings.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                        onConfirm();
                      },
                      child: const Text('Hide'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quitter',
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SvgPicture.asset(
            'assets/icon/neurology.svg',
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Consumer<SettingsProvider>(
        builder: (context, settings, child) {
          return ListView(
            children: [
              if (settings.showAlcohol)
                ListTile(
                  title: const Text("Alcohol"),
                  subtitle: Text("Day $alcoholDays"),
                  leading: const Icon(Icons.water_drop),
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AlcoholPage()),
                    );
                    if (mounted) {
                      _loadQuitDays();
                    }
                  },
                  onLongPress: () {
                    _showHideBottomSheet('Alcohol', () {
                      settings.setShowAlcohol(false);
                    });
                  },
                ),

              if (settings.showVaping)
                ListTile(
                  title: const Text("Vaping"),
                  subtitle: Text("Day $vapingDays"),
                  leading: const Icon(Icons.air),
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => VapingPage()),
                    );
                    if (mounted) {
                      _loadQuitDays();
                    }
                  },
                  onLongPress: () {
                    _showHideBottomSheet('Vaping', () {
                      settings.setShowVaping(false);
                    });
                  },
                ),

              if (settings.showSmoking)
                ListTile(
                  title: const Text("Smoking"),
                  subtitle: Text("Day $smokingDays"),
                  leading: const Icon(Icons.eco),
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SmokingPage()),
                    );
                    if (mounted) {
                      _loadQuitDays();
                    }
                  },
                  onLongPress: () {
                    _showHideBottomSheet('Smoking', () {
                      settings.setShowSmoking(false);
                    });
                  },
                ),

              if (settings.showNicotinePouches)
                ListTile(
                  title: const Text("Nicotine pouches"),
                  subtitle: Text("Day $pouchesDays"),
                  leading: const Icon(Icons.scatter_plot),
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NicotinePouchesPage(),
                      ),
                    );
                    if (mounted) {
                      _loadQuitDays();
                    }
                  },
                  onLongPress: () {
                    _showHideBottomSheet('Nicotine pouches', () {
                      settings.setShowNicotinePouches(false);
                    });
                  },
                ),

              if (settings.showOpioids)
                ListTile(
                  title: const Text("Opioids"),
                  subtitle: Text("Day $opioidDays"),
                  leading: const Icon(Icons.medication),
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => OpioidPage()),
                    );
                    if (mounted) {
                      _loadQuitDays();
                    }
                  },
                  onLongPress: () {
                    _showHideBottomSheet('Opioids', () {
                      settings.setShowOpioids(false);
                    });
                  },
                ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const SettingsPage()));
          _loadQuitDays();
        },
        label: const Text("Settings"),
        icon: const Icon(Icons.settings),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingsProvider = SettingsProvider();
  await settingsProvider.loadPreferences();

  setupReminders();

  runApp(
    ChangeNotifierProvider.value(
      value: settingsProvider,
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
            final lightColorScheme = ColorSchemeHelper.getColorScheme(
              settings.colorSchemeType,
              Brightness.light,
              lightDynamic,
            );
            final darkColorScheme = ColorSchemeHelper.getColorScheme(
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
