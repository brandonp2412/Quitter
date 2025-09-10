import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:quitter/color_scheme_helper.dart';
import 'package:quitter/marijuana_page.dart';
import 'package:quitter/nicotine_pouches.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/utils.dart';
import 'package:quitter/whats_new.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/opioid_page.dart';
import 'package:quitter/settings_page.dart';
import 'package:quitter/smoking_page.dart';
import 'package:quitter/social_media_page.dart';
import 'package:quitter/vaping_page.dart';
import 'package:quitter/pornography_page.dart';
import 'package:quitter/reminders.dart';
import 'package:quitter/custom_quit_entry.dart';
import 'package:quitter/custom_entry_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  int? alcoholDays;
  int? vapingDays;
  int? smokingDays;
  int? pouchesDays;
  int? opioidDays;
  int? socialMediaDays;
  int? pornographyDays;
  int? marijuanaDays;
  String? quitAlcohol;
  String? quitVaping;
  String? quitSmoking;
  String? quitPouches;
  String? quitOpioids;
  String? quitSocialMedia;
  String? quitPornography;
  String? quitMarijuana;
  List<CustomQuitEntry> customEntries = [];

  @override
  void initState() {
    super.initState();
    _loadQuitDays();
    _whatsNew();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _loadQuitDays();
    }
  }

  void _whatsNew() async {
    final prefs = await SharedPreferences.getInstance();
    final lastVersion = prefs.getInt('last_build_number') ?? 0;
    final info = await PackageInfo.fromPlatform();
    final currentVersion = int.parse(info.buildNumber);
    await prefs.setInt('last_build_number', currentVersion);
    if (lastVersion == 0) return;

    if (currentVersion > lastVersion) {
      if (!mounted) return;
      toast(
        context,
        "New version ${info.version}",
        SnackBarAction(
          label: 'Changes',
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const WhatsNew())),
        ),
      );
    }
  }

  void _loadQuitDays() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    final settingsProvider = Provider.of<SettingsProvider>(
      context,
      listen: false,
    );
    await settingsProvider.loadPreferences();

    setState(() {
      quitSmoking = prefs.getString('smoking');
      quitVaping = prefs.getString('vaping');
      quitAlcohol = prefs.getString('alcohol');
      quitOpioids = prefs.getString('opioids');
      quitPouches = prefs.getString('nicotine_pouches');
      quitSocialMedia = prefs.getString('social_media');
      quitPornography = prefs.getString('pornography');
      quitMarijuana = prefs.getString('marijuana');
      customEntries = settingsProvider.customEntries;
    });

    if (mounted) {
      setState(() {
        if (quitSmoking != null) smokingDays = daysCeil(quitSmoking!);
        if (quitMarijuana != null) marijuanaDays = daysCeil(quitMarijuana!);
        if (quitAlcohol != null) alcoholDays = daysCeil(quitAlcohol!);
        if (quitVaping != null) vapingDays = daysCeil(quitVaping!);
        if (quitOpioids != null) opioidDays = daysCeil(quitOpioids!);
        if (quitPouches != null) pouchesDays = daysCeil(quitPouches!);
        if (quitSocialMedia != null)
          socialMediaDays = daysCeil(quitSocialMedia!);
        if (quitPornography != null)
          pornographyDays = daysCeil(quitPornography!);
      });
    }
  }

  void _showHideBottomSheet(String title, VoidCallback onConfirm) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withAlpha(255 ~/ (1 / 0.1)),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.visibility_off,
                  size: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
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
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withAlpha(255 ~/ (1 / 0.7)),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
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
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Hide'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuitCard({
    required String title,
    required IconData icon,
    required List<Color> gradientColors,
    int? days,
    String? quitDate,
    required VoidCallback onTap,
    required VoidCallback onLongPress,
  }) {
    return Hero(
      tag: title,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: gradientColors.first.withAlpha(255 ~/ (1 / 0.3)),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              onLongPress: onLongPress,
              borderRadius: BorderRadius.circular(20),
              splashColor: Colors.white.withAlpha(255 ~/ (1 / 0.3)),
              highlightColor: Colors.white.withAlpha(255 ~/ (1 / 0.1)),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(
                    context,
                  ).colorScheme.surface.withAlpha(255 ~/ (1 / 0.9)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(icon, color: Colors.white, size: 24),
                        ),
                        const Spacer(),
                        if (quitDate != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withAlpha(255 ~/ (1 / 0.1)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              DateFormat.MMMd().format(
                                DateTime.parse(quitDate),
                              ),
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (days != null) ...[
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: '$days'),
                            TextSpan(
                              text: days == 1 ? ' day' : ' days',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withAlpha(255 ~/ (1 / 0.7)),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
                      Text(
                        'Tap to start',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withAlpha(255 ~/ (1 / 0.6)),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quitter', style: TextStyle(fontSize: 32)),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SvgPicture.asset(
            'assets/neurology.svg',
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
              _loadQuitDays();
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: Consumer<SettingsProvider>(
              builder: (context, settings, child) {
                final cards = <Widget>[];

                if (settings.showAlcohol) {
                  cards.add(
                    _buildQuitCard(
                      title: 'Alcohol',
                      icon: Icons.local_bar,
                      gradientColors: [
                        const Color(0xFF6366F1),
                        const Color(0xFF8B5CF6),
                      ],
                      days: alcoholDays,
                      quitDate: quitAlcohol,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AlcoholPage(
                              initialStarted: alcoholDays != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet('Alcohol', () {
                          settings.setShowAlcohol(false);
                        });
                      },
                    ),
                  );
                }

                if (settings.showVaping) {
                  cards.add(
                    _buildQuitCard(
                      title: 'Vaping',
                      icon: Icons.air,
                      gradientColors: [
                        const Color(0xFF06B6D4),
                        const Color(0xFF0EA5E9),
                      ],
                      days: vapingDays,
                      quitDate: quitVaping,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                VapingPage(initialStarted: vapingDays != null),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet('Vaping', () {
                          settings.setShowVaping(false);
                        });
                      },
                    ),
                  );
                }

                if (settings.showSmoking) {
                  cards.add(
                    _buildQuitCard(
                      title: 'Smoking',
                      icon: Icons.eco,
                      gradientColors: [
                        const Color(0xFF10B981),
                        const Color(0xFF059669),
                      ],
                      days: smokingDays,
                      quitDate: quitSmoking,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SmokingPage(
                              initialStarted: smokingDays != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet('Smoking', () {
                          settings.setShowSmoking(false);
                        });
                      },
                    ),
                  );
                }

                if (settings.showMarijuana) {
                  cards.add(
                    _buildQuitCard(
                      title: 'Marijuana',
                      icon: Icons.grass,
                      gradientColors: [
                        const Color.fromARGB(255, 132, 230, 128),
                        const Color.fromARGB(255, 30, 87, 3),
                      ],
                      days: marijuanaDays,
                      quitDate: quitMarijuana,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MarijuanaPage(
                              initialStarted: marijuanaDays != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet('Marijuana', () {
                          settings.setShowMarijuana(false);
                        });
                      },
                    ),
                  );
                }
                if (settings.showNicotinePouches) {
                  cards.add(
                    _buildQuitCard(
                      title: 'Nicotine Pouches',
                      icon: Icons.scatter_plot,
                      gradientColors: [
                        const Color(0xFFF59E0B),
                        const Color(0xFFEF4444),
                      ],
                      days: pouchesDays,
                      quitDate: quitPouches,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NicotinePouchesPage(
                              initialStarted: pouchesDays != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet('Nicotine pouches', () {
                          settings.setShowNicotinePouches(false);
                        });
                      },
                    ),
                  );
                }

                if (settings.showOpioids) {
                  cards.add(
                    _buildQuitCard(
                      title: 'Opioids',
                      icon: Icons.medication,
                      gradientColors: [
                        const Color(0xFFEC4899),
                        const Color(0xFFBE185D),
                      ],
                      days: opioidDays,
                      quitDate: quitOpioids,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                OpioidPage(initialStarted: opioidDays != null),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet('Opioids', () {
                          settings.setShowOpioids(false);
                        });
                      },
                    ),
                  );
                }

                if (settings.showSocialMedia) {
                  cards.add(
                    _buildQuitCard(
                      title: 'Social Media',
                      icon: Icons.public,
                      gradientColors: [
                        const Color(0xFF8B5CF6),
                        const Color(0xFF7C3AED),
                      ],
                      days: socialMediaDays,
                      quitDate: quitSocialMedia,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SocialMediaPage(
                              initialStarted: socialMediaDays != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet('Social Media', () {
                          settings.setShowSocialMedia(false);
                        });
                      },
                    ),
                  );
                }

                if (settings.showPornography) {
                  cards.add(
                    _buildQuitCard(
                      title: 'Pornography',
                      icon: Icons.block,
                      gradientColors: [
                        const Color(0xFFF43F5E),
                        const Color(0xFFE11D48),
                      ],
                      days: pornographyDays,
                      quitDate: quitPornography,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PornographyPage(
                              initialStarted: pornographyDays != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet('Pornography', () {
                          settings.setShowPornography(false);
                        });
                      },
                    ),
                  );
                }

                for (var entry in customEntries) {
                  cards.add(
                    _buildQuitCard(
                      title: entry.title,
                      icon: Icons.star, // Generic icon for custom entries
                      gradientColors: [
                        entry.color,
                        entry.color.withValues(alpha: 0.7),
                      ],
                      days: daysCeil(entry.quitDate.toIso8601String()),
                      quitDate: entry.quitDate.toIso8601String(),
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CustomEntryPage(entry: entry),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        // No hide option for custom entries, directly edit/delete
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CustomEntryPage(entry: entry),
                          ),
                        );
                      },
                    ),
                  );
                }

                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > 600
                        ? 3
                        : 2,
                    mainAxisExtent: 200, // Fixed height
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => cards[index],
                    childCount: cards.length,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CustomEntryPage()),
          );
          _loadQuitDays();
        },
        label: const Text("Add"),
        icon: const Icon(Icons.add),
        tooltip: 'Add a custom quit entry',
      ),
    );
  }

  bool isNewerVersion(String lastVersion, currentVersion) {
    final lastParts = lastVersion.split('.').map(int.parse).toList();
    final currentParts = currentVersion.split('.').map(int.parse).toList();

    for (int i = 0; i < 3; i++) {
      if (currentParts[i] > lastParts[i]) return true;
      if (currentParts[i] < lastParts[i]) return false;
    }
    return false;
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
