import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/opioid_page.dart';
import 'package:quitter/settings_page.dart';
import 'package:quitter/smoking_page.dart';
import 'package:quitter/vaping_page.dart';

// Settings Provider
class SettingsProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  static const String _colorSchemeKey = 'color_scheme';
  static const String _alcoholKey = 'show_alcohol';
  static const String _vapingKey = 'show_vaping';
  static const String _smokingKey = 'show_smoking';
  static const String _opioidsKey = 'show_opioids';

  SharedPreferences? _prefs;
  bool _isInitialized = false;

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
  bool get isInitialized => _isInitialized;

  // Initialize preferences
  Future<void> init() async {
    if (_isInitialized) return;

    try {
      _prefs = await SharedPreferences.getInstance();
      _loadSettings();
      _isInitialized = true;
    } catch (e) {
      _isInitialized =
          true; // Still mark as initialized to prevent infinite loading
      print('Error initializing settings: $e');
    }
  }

  void _loadSettings() {
    if (_prefs == null) return;

    _themeMode =
        ThemeMode.values[_prefs!.getInt(_themeKey) ?? ThemeMode.system.index];
    _colorSchemeType =
        ColorSchemeType.values[_prefs!.getInt(_colorSchemeKey) ??
            ColorSchemeType.dynamic.index];
    _showAlcohol = _prefs!.getBool(_alcoholKey) ?? true;
    _showVaping = _prefs!.getBool(_vapingKey) ?? true;
    _showSmoking = _prefs!.getBool(_smokingKey) ?? true;
    _showOpioids = _prefs!.getBool(_opioidsKey) ?? true;

    if (_isInitialized) {
      notifyListeners();
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;
    _themeMode = mode;
    await _prefs?.setInt(_themeKey, mode.index);
    notifyListeners();
  }

  Future<void> setColorSchemeType(ColorSchemeType type) async {
    if (_colorSchemeType == type) return;
    _colorSchemeType = type;
    await _prefs?.setInt(_colorSchemeKey, type.index);
    notifyListeners();
  }

  Future<void> setShowAlcohol(bool show) async {
    if (_showAlcohol == show) return;
    _showAlcohol = show;
    await _prefs?.setBool(_alcoholKey, show);
    notifyListeners();
  }

  Future<void> setShowVaping(bool show) async {
    if (_showVaping == show) return;
    _showVaping = show;
    await _prefs?.setBool(_vapingKey, show);
    notifyListeners();
  }

  Future<void> setShowSmoking(bool show) async {
    if (_showSmoking == show) return;
    _showSmoking = show;
    await _prefs?.setBool(_smokingKey, show);
    notifyListeners();
  }

  Future<void> setShowOpioids(bool show) async {
    if (_showOpioids == show) return;
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
    try {
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
    } catch (e) {
      print('Error loading quit days: $e');
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
          // Show loading if settings aren't initialized yet
          if (!settings.isInitialized) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: [
              if (settings.showAlcohol)
                ListTile(
                  title: const Text("Alcohol"),
                  subtitle: Text("Day $alcoholDays"),
                  leading: const Icon(Icons.water_drop),
                  onTap: () => _navigateToPage(
                    AlcoholPage(),
                    (value) => alcoholDays = value ?? alcoholDays,
                  ),
                ),

              if (settings.showVaping)
                ListTile(
                  title: const Text("Vaping"),
                  subtitle: Text("Day $vapingDays"),
                  leading: const Icon(Icons.air),
                  onTap: () => _navigateToPage(
                    VapingPage(),
                    (value) => vapingDays = value ?? vapingDays,
                  ),
                ),

              if (settings.showSmoking)
                ListTile(
                  title: const Text("Smoking"),
                  subtitle: Text("Day $smokingDays"),
                  leading: const Icon(Icons.eco),
                  onTap: () => _navigateToPage(
                    SmokingPage(),
                    (value) => smokingDays = value ?? smokingDays,
                  ),
                ),

              if (settings.showOpioids)
                ListTile(
                  title: const Text("Opioids"),
                  subtitle: Text("Day $opioidDays"),
                  leading: const Icon(Icons.medication),
                  onTap: () => _navigateToPage(
                    OpioidPage(),
                    (value) => opioidDays = value ?? opioidDays,
                  ),
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
          _loadQuitDays(); // Refresh days when returning from settings
        },
        label: const Text("Settings"),
        icon: const Icon(Icons.settings),
      ),
    );
  }

  void _navigateToPage(Widget page, Function(int?) updateDays) async {
    final result = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => page));

    if (mounted) {
      setState(() {
        updateDays(result);
      });
    }
  }
}

void main() {
  runApp(const QuitterApp());
}

class QuitterApp extends StatelessWidget {
  const QuitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsProvider()..init(),
      child: Consumer<SettingsProvider>(
        builder: (context, settings, child) {
          // Show loading screen until settings are initialized
          if (!settings.isInitialized) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Loading...'),
                    ],
                  ),
                ),
              ),
            );
          }

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
      ),
    );
  }
}
