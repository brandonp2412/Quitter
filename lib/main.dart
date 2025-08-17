import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/opioid_page.dart';
import 'package:quitter/settings_page.dart';
import 'package:quitter/smoking_page.dart';
import 'package:quitter/vaping_page.dart';

// Settings Provider - simplified and robust
class SettingsProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  static const String _colorSchemeKey = 'color_scheme';
  static const String _alcoholKey = 'show_alcohol';
  static const String _vapingKey = 'show_vaping';
  static const String _smokingKey = 'show_smoking';
  static const String _opioidsKey = 'show_opioids';

  SharedPreferences? _prefs;

  ThemeMode _themeMode = ThemeMode.system;
  ColorSchemeType _colorSchemeType = ColorSchemeType.dynamic;
  bool _showAlcohol = true;
  bool _showVaping = true;
  bool _showSmoking = true;
  bool _showOpioids = true;

  // Getters
  ThemeMode get themeMode => _themeMode;
  ColorSchemeType get colorSchemeType => _colorSchemeType;
  bool get showAlcohol => _showAlcohol;
  bool get showVaping => _showVaping;
  bool get showSmoking => _showSmoking;
  bool get showOpioids => _showOpioids;

  // Initialize preferences - called once at app start
  Future<void> loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    _themeMode =
        ThemeMode.values[_prefs!.getInt(_themeKey) ?? ThemeMode.system.index];
    _colorSchemeType =
        ColorSchemeType.values[_prefs!.getInt(_colorSchemeKey) ??
            ColorSchemeType.dynamic.index];
    _showAlcohol = _prefs!.getBool(_alcoholKey) ?? true;
    _showVaping = _prefs!.getBool(_vapingKey) ?? true;
    _showSmoking = _prefs!.getBool(_smokingKey) ?? true;
    _showOpioids = _prefs!.getBool(_opioidsKey) ?? true;

    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _prefs?.setInt(_themeKey, mode.index);
    notifyListeners();
  }

  Future<void> setColorSchemeType(ColorSchemeType type) async {
    _colorSchemeType = type;
    await _prefs?.setInt(_colorSchemeKey, type.index);
    notifyListeners();
  }

  Future<void> setShowAlcohol(bool show) async {
    _showAlcohol = show;
    await _prefs?.setBool(_alcoholKey, show);
    notifyListeners();
  }

  Future<void> setShowVaping(bool show) async {
    _showVaping = show;
    await _prefs?.setBool(_vapingKey, show);
    notifyListeners();
  }

  Future<void> setShowSmoking(bool show) async {
    _showSmoking = show;
    await _prefs?.setBool(_smokingKey, show);
    notifyListeners();
  }

  Future<void> setShowOpioids(bool show) async {
    _showOpioids = show;
    await _prefs?.setBool(_opioidsKey, show);
    notifyListeners();
  }
}

// Enum for color scheme types
enum ColorSchemeType { dynamic, blue, green, red, purple, orange }

// Color scheme helper
class ColorSchemeHelper {
  static ColorScheme getColorScheme(
    ColorSchemeType type,
    Brightness brightness,
    ColorScheme? dynamicScheme,
  ) {
    switch (type) {
      case ColorSchemeType.dynamic:
        return dynamicScheme ??
            ColorScheme.fromSeed(
              seedColor: const Color(0xFF2E8B57),
              brightness: brightness,
            );
      case ColorSchemeType.blue:
        return ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: brightness,
        );
      case ColorSchemeType.green:
        return ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E8B57),
          brightness: brightness,
        );
      case ColorSchemeType.red:
        return ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: brightness,
        );
      case ColorSchemeType.purple:
        return ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: brightness,
        );
      case ColorSchemeType.orange:
        return ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: brightness,
        );
    }
  }

  static String getColorSchemeName(ColorSchemeType type) {
    switch (type) {
      case ColorSchemeType.dynamic:
        return 'Dynamic Colors';
      case ColorSchemeType.blue:
        return 'Blue';
      case ColorSchemeType.green:
        return 'Green';
      case ColorSchemeType.red:
        return 'Red';
      case ColorSchemeType.purple:
        return 'Purple';
      case ColorSchemeType.orange:
        return 'Orange';
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var alcoholDays = 0;
  var vapingDays = 0;
  var smokingDays = 0;
  var opioidDays = 0;

  @override
  void initState() {
    super.initState();
    _loadQuitDays();
  }

  void _loadQuitDays() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();

    final quitSmoking = prefs.getString('smoking');
    final quitVaping = prefs.getString('vaping');
    final quitAlcohol = prefs.getString('alcohol');
    final quitOpioids = prefs.getString('opioids');

    if (mounted) {
      setState(() {
        smokingDays = quitSmoking != null
            ? now.difference(DateTime.parse(quitSmoking)).inDays
            : 0;
        alcoholDays = quitAlcohol != null
            ? now.difference(DateTime.parse(quitAlcohol)).inDays
            : 0;
        vapingDays = quitVaping != null
            ? now.difference(DateTime.parse(quitVaping)).inDays
            : 0;
        opioidDays = quitOpioids != null
            ? now.difference(DateTime.parse(quitOpioids)).inDays
            : 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quitter', style: TextStyle(color: Colors.white)),
        leading: const Icon(Icons.sunny, color: Colors.white),
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
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AlcoholPage()),
                    );
                    if (result != null && mounted) {
                      setState(() => alcoholDays = result);
                    }
                  },
                ),

              if (settings.showVaping)
                ListTile(
                  title: const Text("Vaping"),
                  subtitle: Text("Day $vapingDays"),
                  leading: const Icon(Icons.air),
                  onTap: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => VapingPage()),
                    );
                    if (result != null && mounted) {
                      setState(() => vapingDays = result);
                    }
                  },
                ),

              if (settings.showSmoking)
                ListTile(
                  title: const Text("Smoking"),
                  subtitle: Text("Day $smokingDays"),
                  leading: const Icon(Icons.eco),
                  onTap: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SmokingPage()),
                    );
                    if (result != null && mounted) {
                      setState(() => smokingDays = result);
                    }
                  },
                ),

              if (settings.showOpioids)
                ListTile(
                  title: const Text("Opioids"),
                  subtitle: Text("Day $opioidDays"),
                  leading: const Icon(Icons.medication),
                  onTap: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => OpioidPage()),
                    );
                    if (result != null && mounted) {
                      setState(() => opioidDays = result);
                    }
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

// Main app initialization
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create and initialize the settings provider
  final settingsProvider = SettingsProvider();
  await settingsProvider.loadPreferences();

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
