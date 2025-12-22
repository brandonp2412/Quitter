import 'package:flutter/material.dart';
import 'package:quitter/cocaine_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/edit_entry_page.dart';
import 'package:quitter/entry_page.dart';
import 'package:quitter/marijuana_page.dart';
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 56 + MediaQuery.of(context).padding.bottom,
            ),
            sliver: Consumer2<SettingsProvider, AddictionProvider>(
              builder: (context, settings, addictions, child) {
                final cards = <Widget>[];

                if (settings.showAlcohol) {
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

                if (settings.showVaping) {
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

                if (settings.showSmoking) {
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

                if (settings.showMarijuana) {
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
                if (settings.showNicotinePouches) {
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

                if (settings.showOpioids) {
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

                if (settings.showSocialMedia) {
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

                if (settings.showPornography) {
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

                if (settings.showCocaine) {
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

                for (var entry in addictions.entries) {
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
