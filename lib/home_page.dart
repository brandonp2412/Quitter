import 'package:flutter/material.dart';
import 'package:quitter/add_addiction_page.dart';
import 'package:quitter/adderall_page.dart';
import 'package:quitter/benzodiazepine_page.dart';
import 'package:quitter/maoi_page.dart';
import 'package:quitter/nitrous_oxide_page.dart';
import 'package:quitter/snri_page.dart';
import 'package:quitter/ssri_page.dart';
import 'package:quitter/tca_page.dart';
import 'package:quitter/cocaine_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/entry.dart';
import 'package:quitter/edit_entry_page.dart';
import 'package:quitter/edit_preset_page.dart';
import 'package:quitter/entry_page.dart';
import 'package:quitter/marijuana_page.dart';
import 'package:quitter/meth_page.dart';
import 'package:quitter/nicotine_pouches.dart';
import 'package:quitter/opioid_page.dart';
import 'package:quitter/pornography_page.dart';
import 'package:quitter/quit_card.dart';
import 'package:quitter/settings_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:quitter/smoking_page.dart';
import 'package:quitter/social_media_page.dart';
import 'package:quitter/utils.dart';
import 'package:quitter/vaping_page.dart';
import 'package:quitter/whats_new.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _CardData {
  const _CardData({
    required this.key,
    required this.title,
    required this.icon,
    required this.gradientColors,
    this.quitDate,
    required this.onTap,
    required this.onDelete,
    required this.onRename,
  });

  final String key;
  final String title;
  final IconData icon;
  final List<Color> gradientColors;
  final String? quitDate;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onRename;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isEditMode = false;

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

  void _showStopTrackingBottomSheet(String title, VoidCallback onConfirm) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
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
                    color: Theme.of(context).colorScheme.error.withAlpha(26),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.remove_circle_outline,
                    size: 32,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.stopTrackingDialogTitle(title),
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.stopTrackingDialogMessage(title),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(179),
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
                          backgroundColor: Theme.of(context).colorScheme.error,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(l10n.stopTracking),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _matchesSearch(String title) {
    if (_searchQuery.isEmpty) return true;
    return title.toLowerCase().contains(_searchQuery);
  }

  List<_CardData> _buildAllCards(
    BuildContext context,
    AddictionProvider addictions,
    AppLocalizations l10n,
  ) {
    final cards = <_CardData>[];

    void addPreset(
      String key,
      String defaultTitle,
      IconData icon,
      List<Color> colors,
      String? quitDate,
      Widget Function(BuildContext) page,
    ) {
      if (quitDate == null) return;
      final title = addictions.customNames[key] ?? defaultTitle;
      if (!_matchesSearch(title)) return;
      final effectiveIcon = addictions.customIcons[key] ?? icon;
      final customColor = addictions.customColors[key];
      final gradientColors = customColor != null
          ? [customColor, customColor.withValues(alpha: 0.7)]
          : colors;
      cards.add(
        _CardData(
          key: key,
          title: title,
          icon: effectiveIcon,
          gradientColors: gradientColors,
          quitDate: quitDate,
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(builder: page));
            if (mounted) _loadQuitDays();
          },
          onDelete: () => _showStopTrackingBottomSheet(
            title,
            () => addictions.setAddiction(key, null),
          ),
          onRename: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditPresetPage(
                  presetKey: key,
                  title: title,
                  icon: effectiveIcon,
                  color: gradientColors.first,
                ),
              ),
            );
            if (mounted) _loadQuitDays();
          },
        ),
      );
    }

    addPreset(
      'adderall',
      l10n.addictionAdderall,
      Icons.lightbulb_outline,
      [const Color(0xFFFF8C42), const Color(0xFFFF6B35)],
      addictions.quitAdderall,
      (context) => const AdderallPage(started: true),
    );
    addPreset(
      'ssri',
      l10n.addictionSsri,
      Icons.psychology,
      [const Color(0xFF7C3AED), const Color(0xFF4F46E5)],
      addictions.quitSsri,
      (context) => const SsriPage(started: true),
    );
    addPreset(
      'snri',
      l10n.addictionSnri,
      Icons.psychology_alt,
      [const Color(0xFF6D28D9), const Color(0xFF7C3AED)],
      addictions.quitSnri,
      (context) => const SnriPage(started: true),
    );
    addPreset(
      'tca',
      l10n.addictionTca,
      Icons.medication_liquid,
      [const Color(0xFF5B21B6), const Color(0xFF6D28D9)],
      addictions.quitTca,
      (context) => const TcaPage(started: true),
    );
    addPreset(
      'maoi',
      l10n.addictionMaoi,
      Icons.science,
      [const Color(0xFF4C1D95), const Color(0xFF5B21B6)],
      addictions.quitMaoi,
      (context) => const MaoiPage(started: true),
    );
    addPreset(
      'nitrous_oxide',
      l10n.addictionNitrousOxide,
      Icons.air_outlined,
      [const Color(0xFF38BDF8), const Color(0xFF7DD3FC)],
      addictions.quitNitrousOxide,
      (context) => const NitrousOxidePage(started: true),
    );
    addPreset(
      'alcohol',
      l10n.addictionAlcohol,
      Icons.local_bar,
      [const Color(0xFF6366F1), const Color(0xFF8B5CF6)],
      addictions.quitAlcohol,
      (context) => const AlcoholPage(started: true),
    );
    addPreset(
      'benzos',
      l10n.addictionBenzos,
      Icons.bedtime,
      [const Color(0xFF6D5DD3), const Color(0xFF1E1B4B)],
      addictions.quitBenzos,
      (context) => const BenzodiazepinePage(started: true),
    );
    addPreset(
      'cocaine',
      l10n.addictionCocaine,
      Icons.bolt,
      [const Color(0xFF3B82F6), const Color(0xFF1D4ED8)],
      addictions.quitCocaine,
      (context) => const CocainePage(started: true),
    );
    addPreset(
      'marijuana',
      l10n.addictionMarijuana,
      Icons.grass,
      [
        const Color.fromARGB(255, 132, 230, 128),
        const Color.fromARGB(255, 30, 87, 3),
      ],
      addictions.quitMarijuana,
      (context) => const MarijuanaPage(started: true),
    );
    addPreset(
      'meth',
      l10n.addictionMeth,
      Icons.battery_charging_full,
      [const Color(0xFF14B8A6), const Color(0xFF0D9488)],
      addictions.quitMeth,
      (context) => const MethPage(started: true),
    );
    addPreset(
      'nicotine_pouches',
      l10n.addictionNicotinePouches,
      Icons.scatter_plot,
      [const Color(0xFFF59E0B), const Color(0xFFEF4444)],
      addictions.quitPouches,
      (context) => const NicotinePouchesPage(started: true),
    );
    addPreset(
      'opioids',
      l10n.addictionOpioids,
      Icons.medication,
      [const Color(0xFFEC4899), const Color(0xFFBE185D)],
      addictions.quitOpioids,
      (context) => const OpioidPage(started: true),
    );
    addPreset(
      'pornography',
      l10n.addictionAC,
      Icons.block,
      [const Color(0xFFF43F5E), const Color(0xFFE11D48)],
      addictions.quitPornography,
      (context) => const PornographyPage(started: true),
    );
    addPreset(
      'smoking',
      l10n.addictionSmoking,
      Icons.eco,
      [const Color(0xFF10B981), const Color(0xFF059669)],
      addictions.quitSmoking,
      (context) => const SmokingPage(started: true),
    );
    addPreset(
      'social_media',
      l10n.addictionSocialMedia,
      Icons.public,
      [const Color(0xFF8B5CF6), const Color(0xFF7C3AED)],
      addictions.quitSocialMedia,
      (context) => const SocialMediaPage(started: true),
    );
    addPreset(
      'vaping',
      l10n.addictionVaping,
      Icons.air,
      [const Color(0xFF06B6D4), const Color(0xFF0EA5E9)],
      addictions.quitVaping,
      (context) => const VapingPage(started: true),
    );

    for (final Entry entry in addictions.entries) {
      if (!_matchesSearch(entry.title)) continue;
      cards.add(
        _CardData(
          key: entry.id,
          title: entry.title,
          icon: entry.icon ?? Icons.star,
          gradientColors: [entry.color, entry.color.withValues(alpha: 0.7)],
          quitDate: entry.quitDate.toIso8601String(),
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EntryPage(entry: entry)),
            );
            if (mounted) _loadQuitDays();
          },
          onDelete: () => _showStopTrackingBottomSheet(
            entry.title,
            () => addictions.deleteEntry(entry.id),
          ),
          onRename: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditEntryPage(entry: entry),
              ),
            );
            if (mounted) _loadQuitDays();
          },
        ),
      );
    }

    return cards;
  }

  List<_CardData> _sortByOrder(List<_CardData> cards, List<String> order) {
    if (order.isEmpty) return cards;
    final indexMap = {for (var i = 0; i < order.length; i++) order[i]: i};
    return [...cards]..sort((a, b) {
      final ai = indexMap[a.key] ?? cards.length;
      final bi = indexMap[b.key] ?? cards.length;
      return ai.compareTo(bi);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return PopScope(
      canPop: !_isEditMode,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (_isEditMode) setState(() => _isEditMode = false);
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              primary: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 64,
              flexibleSpace: Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                alignment: Alignment.topCenter,
                child: SearchBar(
                  controller: _searchController,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: const Icon(Icons.search),
                  ),
                  hintText: 'Search addictions...',
                  trailing: [
                    if (_searchQuery.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _searchController.clear(),
                      ),
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 56 + MediaQuery.of(context).padding.bottom,
              ),
              sliver: Consumer<AddictionProvider>(
                builder: (context, addictions, child) {
                  final allCards = _buildAllCards(context, addictions, l10n);
                  final cards = _sortByOrder(allCards, addictions.cardOrder);

                  if (cards.isEmpty) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _searchQuery.isNotEmpty
                                  ? Icons.search_off
                                  : Icons.track_changes,
                              size: 64,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withAlpha(128),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _searchQuery.isNotEmpty
                                  ? 'No matches found'
                                  : l10n.homeEmptyTitle,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface.withAlpha(128),
                                  ),
                            ),
                            if (_searchQuery.isEmpty) ...[
                              const SizedBox(height: 8),
                              Text(
                                l10n.homeEmptySubtitle,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface.withAlpha(102),
                                    ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  }

                  return SliverToBoxAdapter(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final columnCount =
                            MediaQuery.of(context).size.width > 600 ? 3 : 2;
                        const spacing = 16.0;
                        final cardWidth =
                            (constraints.maxWidth -
                                spacing * (columnCount - 1)) /
                            columnCount;
                        // 216dp fits QuitCard: icon(48) + gaps + titleMedium(24) +
                        // headlineSmall(32) + date-chip(24) + 40dp padding = 204dp.
                        // Extra 12dp gives breathing room for varying font metrics.
                        const cardHeight = 216.0;

                        return ReorderableGridView.count(
                          crossAxisCount: columnCount,
                          mainAxisSpacing: spacing,
                          crossAxisSpacing: spacing,
                          childAspectRatio: cardWidth / cardHeight,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          dragEnabled: _searchQuery.isEmpty,
                          onDragStart: (_) {
                            setState(() => _isEditMode = true);
                          },
                          onReorder: (oldIndex, newIndex) {
                            if (_searchQuery.isNotEmpty) return;
                            final newOrder = cards.map((c) => c.key).toList();
                            final item = newOrder.removeAt(oldIndex);
                            newOrder.insert(newIndex, item);
                            addictions.saveCardOrder(newOrder);
                          },
                          children: cards.map((data) {
                            return SizedBox(
                              key: ValueKey(data.key),
                              child: QuitCard(
                                context: context,
                                title: data.title,
                                icon: data.icon,
                                gradientColors: data.gradientColors,
                                quitDate: data.quitDate,
                                onTap: _isEditMode
                                    ? () => setState(() => _isEditMode = false)
                                    : data.onTap,
                                onDelete: _isEditMode ? data.onDelete : null,
                                onRename: _isEditMode ? data.onRename : null,
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: _isEditMode
            ? FloatingActionButton.extended(
                onPressed: () => setState(() => _isEditMode = false),
                label: Text(l10n.done),
                icon: const Icon(Icons.check),
              )
            : FloatingActionButton.extended(
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddAddictionPage(),
                    ),
                  );
                  _loadQuitDays();
                },
                label: Text(l10n.homeAddButton),
                icon: const Icon(Icons.add),
                tooltip: l10n.homeAddTooltip,
              ),
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
