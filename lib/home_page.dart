import 'package:flutter/material.dart';
import 'package:quitter/benzodiazepine_page.dart';
import 'package:quitter/cocaine_page.dart';
import 'package:quitter/heroin_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/edit_entry_page.dart';
import 'package:quitter/entry_page.dart';
import 'package:quitter/marijuana_page.dart';
import 'package:quitter/meth_page.dart';
import 'package:quitter/nicotine_pouches.dart';
import 'package:quitter/opioid_page.dart';
import 'package:quitter/pornography_page.dart';
import 'package:quitter/quit_card.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/smoking_page.dart';
import 'package:quitter/social_media_page.dart';
import 'package:quitter/utils.dart';
import 'package:quitter/vaping_page.dart';
import 'package:quitter/whats_new.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadQuitDays();
    _whatsNew();
    WidgetsBinding.instance.addObserver(this);
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
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

    if (currentVersion > lastVersion && mounted) {
      final l10n = AppLocalizations.of(context)!;
      toast(
        l10n.newVersionToast(info.version),
        action: SnackBarAction(
          label: l10n.changesAction,
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const WhatsNew())),
        ),
      );
    }
  }

  void _loadQuitDays() async {
    final settings = context.read<SettingsProvider>();
    final addictions = context.read<AddictionProvider>();
    await settings.loadPreferences();
    await addictions.loadAddictions();
  }

  void _showHideBottomSheet(String title, VoidCallback onConfirm) {
    final l10n = AppLocalizations.of(context)!;
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
                l10n.hideDialogTitle(title),
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.hideDialogMessage(title),
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
                      child: Text(l10n.cancel),
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
                      child: Text(l10n.hide),
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

  bool _matchesSearch(String title) {
    if (_searchQuery.isEmpty) return true;
    return title.toLowerCase().contains(_searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 80,
            flexibleSpace: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primaryContainer,
                        Theme.of(context).colorScheme.secondaryContainer,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withAlpha(51),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search addictions...',
                      hintStyle: TextStyle(
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimaryContainer.withAlpha(153),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                              ),
                              onPressed: () {
                                _searchController.clear();
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 56 + MediaQuery.of(context).padding.bottom,
            ),
            sliver: Consumer2<SettingsProvider, AddictionProvider>(
              builder: (context, settings, addictions, child) {
                final cards = <Widget>[];

                if (settings.showAlcohol &&
                    _matchesSearch(l10n.addictionAlcohol)) {
                  cards.add(
                    QuitCard(
                      context: context,
                      title: l10n.addictionAlcohol,
                      icon: Icons.local_bar,
                      gradientColors: [
                        const Color(0xFF6366F1),
                        const Color(0xFF8B5CF6),
                      ],
                      quitDate: addictions.quitAlcohol,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AlcoholPage(
                              started: addictions.quitAlcohol != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet(l10n.addictionAlcohol, () {
                          settings.showAlcohol = false;
                        });
                      },
                    ),
                  );
                }

                if (settings.showVaping &&
                    _matchesSearch(l10n.addictionVaping)) {
                  cards.add(
                    QuitCard(
                      context: context,
                      title: l10n.addictionVaping,
                      icon: Icons.air,
                      gradientColors: [
                        const Color(0xFF06B6D4),
                        const Color(0xFF0EA5E9),
                      ],
                      quitDate: addictions.quitVaping,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => VapingPage(
                              started: addictions.quitVaping != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet(l10n.addictionVaping, () {
                          settings.showVaping = false;
                        });
                      },
                    ),
                  );
                }

                if (settings.showSmoking &&
                    _matchesSearch(l10n.addictionSmoking)) {
                  cards.add(
                    QuitCard(
                      context: context,
                      title: l10n.addictionSmoking,
                      icon: Icons.eco,
                      gradientColors: [
                        const Color(0xFF10B981),
                        const Color(0xFF059669),
                      ],
                      quitDate: addictions.quitSmoking,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SmokingPage(
                              started: addictions.quitSmoking != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet(l10n.addictionSmoking, () {
                          settings.showSmoking = false;
                        });
                      },
                    ),
                  );
                }

                if (settings.showMarijuana &&
                    _matchesSearch(l10n.addictionMarijuana)) {
                  cards.add(
                    QuitCard(
                      context: context,
                      title: l10n.addictionMarijuana,
                      icon: Icons.grass,
                      gradientColors: [
                        const Color.fromARGB(255, 132, 230, 128),
                        const Color.fromARGB(255, 30, 87, 3),
                      ],
                      quitDate: addictions.quitMarijuana,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MarijuanaPage(
                              started: addictions.quitMarijuana != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet(l10n.addictionMarijuana, () {
                          settings.showMarijuana = false;
                        });
                      },
                    ),
                  );
                }
                if (settings.showNicotinePouches &&
                    _matchesSearch(l10n.addictionNicotinePouches)) {
                  cards.add(
                    QuitCard(
                      context: context,
                      title: l10n.addictionNicotinePouches,
                      icon: Icons.scatter_plot,
                      gradientColors: [
                        const Color(0xFFF59E0B),
                        const Color(0xFFEF4444),
                      ],
                      quitDate: addictions.quitPouches,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NicotinePouchesPage(
                              started: addictions.quitPouches != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet(l10n.addictionNicotinePouches, () {
                          settings.showNicotinePouches = false;
                        });
                      },
                    ),
                  );
                }

                if (settings.showOpioids &&
                    _matchesSearch(l10n.addictionOpioids)) {
                  cards.add(
                    QuitCard(
                      context: context,
                      title: l10n.addictionOpioids,
                      icon: Icons.medication,
                      gradientColors: [
                        const Color(0xFFEC4899),
                        const Color(0xFFBE185D),
                      ],
                      quitDate: addictions.quitOpioids,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OpioidPage(
                              started: addictions.quitOpioids != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet(l10n.addictionOpioids, () {
                          settings.showOpioids = false;
                        });
                      },
                    ),
                  );
                }

                if (settings.showSocialMedia &&
                    _matchesSearch(l10n.addictionSocialMedia)) {
                  cards.add(
                    QuitCard(
                      context: context,
                      title: l10n.addictionSocialMedia,
                      icon: Icons.public,
                      gradientColors: [
                        const Color(0xFF8B5CF6),
                        const Color(0xFF7C3AED),
                      ],
                      quitDate: addictions.quitSocialMedia,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SocialMediaPage(
                              started: addictions.quitSocialMedia != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet(l10n.addictionSocialMedia, () {
                          settings.showSocialMedia = false;
                        });
                      },
                    ),
                  );
                }

                if (settings.showPornography &&
                    _matchesSearch(l10n.addictionAC)) {
                  cards.add(
                    QuitCard(
                      context: context,
                      title: l10n.addictionAC,
                      icon: Icons.block,
                      gradientColors: [
                        const Color(0xFFF43F5E),
                        const Color(0xFFE11D48),
                      ],
                      quitDate: addictions.quitPornography,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PornographyPage(
                              started: addictions.quitPornography != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet(l10n.addictionAC, () {
                          settings.showPornography = false;
                        });
                      },
                    ),
                  );
                }

                if (settings.showCocaine &&
                    _matchesSearch(l10n.addictionCocaine)) {
                  cards.add(
                    QuitCard(
                      context: context,
                      title: l10n.addictionCocaine,
                      icon: Icons.bolt,
                      gradientColors: [
                        const Color(0xFF3B82F6),
                        const Color(0xFF1D4ED8),
                      ],
                      quitDate: addictions.quitCocaine,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CocainePage(
                              started: addictions.quitCocaine != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet(l10n.addictionCocaine, () {
                          settings.showCocaine = false;
                        });
                      },
                    ),
                  );
                }

                if (settings.showMeth && _matchesSearch(l10n.addictionMeth)) {
                  cards.add(
                    QuitCard(
                      context: context,
                      title: l10n.addictionMeth,
                      icon: Icons.battery_charging_full,
                      gradientColors: [
                        const Color(0xFF14B8A6),
                        const Color(0xFF0D9488),
                      ],
                      quitDate: addictions.quitMeth,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                MethPage(started: addictions.quitMeth != null),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet(l10n.addictionMeth, () {
                          settings.showMeth = false;
                        });
                      },
                    ),
                  );
                }

                if (settings.showHeroin &&
                    _matchesSearch(l10n.addictionHeroin)) {
                  cards.add(
                    QuitCard(
                      context: context,
                      title: l10n.addictionHeroin,
                      icon: Icons.vaccines,
                      gradientColors: [
                        const Color.fromARGB(255, 133, 14, 163),
                        const Color.fromARGB(255, 201, 5, 250),
                      ],
                      quitDate: addictions.quitHeroin,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HeroinPage(
                              started: addictions.quitHeroin != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet(l10n.addictionHeroin, () {
                          settings.showHeroin = false;
                        });
                      },
                    ),
                  );
                }

                if (settings.showBenzos &&
                    _matchesSearch(l10n.addictionBenzos)) {
                  cards.add(
                    QuitCard(
                      context: context,
                      title: l10n.addictionBenzos,
                      icon: Icons.bedtime,
                      gradientColors: [Color(0xFF6D5DD3), Color(0xFF1E1B4B)],
                      quitDate: addictions.quitBenzos,
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BenzodiazepinePage(
                              started: addictions.quitBenzos != null,
                            ),
                          ),
                        );
                        if (mounted) _loadQuitDays();
                      },
                      onLongPress: () {
                        _showHideBottomSheet(l10n.addictionBenzos, () {
                          settings.showBenzos = false;
                        });
                      },
                    ),
                  );
                }

                for (var entry in addictions.entries) {
                  if (_matchesSearch(entry.title)) {
                    cards.add(
                      QuitCard(
                        context: context,
                        title: entry.title,
                        icon: entry.icon ?? Icons.star,
                        gradientColors: [
                          entry.color,
                          entry.color.withValues(alpha: 0.7),
                        ],
                        quitDate: entry.quitDate.toIso8601String(),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EntryPage(entry: entry),
                            ),
                          );
                          if (mounted) _loadQuitDays();
                        },
                        onLongPress: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditEntryPage(entry: entry),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }

                if (cards.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withAlpha(128),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No matches found',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withAlpha(128),
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > 600
                        ? 3
                        : 2,
                    mainAxisExtent: 220,
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
            MaterialPageRoute(builder: (context) => const EditEntryPage()),
          );
          _loadQuitDays();
        },
        label: Text(l10n.homeAddButton),
        icon: const Icon(Icons.add),
        tooltip: l10n.homeAddTooltip,
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
