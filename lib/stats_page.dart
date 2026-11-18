import 'package:flutter/material.dart';
import 'package:quitter/addiction_icon.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quitter/preset_icons.dart';
import 'package:quitter/add_addiction_page.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/empty_state.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/utils.dart';
import 'package:quitter/money_saved_settings_page.dart';
import 'package:quitter/time_saved_settings_page.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<AddictionProvider>(
      builder: (context, addictions, child) {
        final entries = _buildStatEntries(l10n, addictions);

        if (entries.isEmpty) {
          return AppEmptyState(
            icon: Icons.bar_chart_rounded,
            title: l10n.statsNoAddictions,
            actionLabel: l10n.homeAddButton,
            actionIcon: Icons.add_rounded,
            onAction: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const AddAddictionPage())),
          );
        }

        final totalDays = entries.fold(0, (sum, e) => sum + e.days);
        final moneySaved = entries.fold(
          0.0,
          (sum, e) => sum + (e.costPerDay ?? 0) * e.days,
        );
        final minutesReclaimed = entries
            .fold<double>(
              0,
              (sum, e) => sum + (e.weeklyMinutes ?? 0) * e.days / 7,
            )
            .round();
        final totalRelapses = entries.fold(0, (sum, e) => sum + e.relapseCount);
        final totalRelapseDays = entries.fold(
          0,
          (sum, e) => sum + e.totalRelapseDays,
        );

        final moneyEntries = entries
            .where((e) => e.costPerDay != null && e.costPerDay! > 0)
            .toList();
        final timeEntries =
            entries
                .where((e) => e.weeklyMinutes != null && e.weeklyMinutes! > 0)
                .toList()
              ..sort((a, b) => b.weeklyMinutes!.compareTo(a.weeklyMinutes!));
        final sortedByStreak = [...entries]
          ..sort((a, b) => b.days.compareTo(a.days));

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 24,
                bottom: 8,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  l10n.statsTitle,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final desktop = constraints.maxWidth >= 840;
                    final spacing = desktop ? 20.0 : 12.0;
                    final width = desktop
                        ? (constraints.maxWidth - spacing) / 2
                        : constraints.maxWidth;
                    final cards = <Widget>[
                      _TimeSavedCard(
                        minutesReclaimed: minutesReclaimed,
                        timeEntries: timeEntries,
                        allEntries: entries,
                        l10n: l10n,
                      ),
                      _JourneyCard(
                        totalDays: totalDays,
                        addictionCount: entries.length,
                        l10n: l10n,
                      ),
                      _MoneySavedCard(
                        moneySaved: moneySaved,
                        moneyEntries: moneyEntries,
                        allEntries: entries,
                        l10n: l10n,
                      ),
                      _StreaksCard(entries: sortedByStreak, l10n: l10n),
                      if (totalRelapses > 0)
                        _ResilienceCard(
                          totalRelapses: totalRelapses,
                          totalRelapseDays: totalRelapseDays,
                          l10n: l10n,
                        ),
                    ];
                    return Wrap(
                      spacing: spacing,
                      runSpacing: spacing,
                      children: [
                        for (final card in cards)
                          SizedBox(width: width, child: card),
                      ],
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24 + MediaQuery.of(context).padding.bottom,
              ),
            ),
          ],
        );
      },
    );
  }

  List<_StatEntry> _buildStatEntries(
    AppLocalizations l10n,
    AddictionProvider addictions,
  ) {
    final entries = <_StatEntry>[];

    void addPreset(
      String? quitDate,
      String name,
      IconData icon,
      Color color, {
      double? costPerDay,
      required String key,
    }) {
      if (quitDate == null) return;
      final days = daysCeil(quitDate);
      final allDays = addictions.getDays(key);
      final weeklySpend = addictions.weeklySpendFor(key);
      entries.add(
        _StatEntry(
          id: key,
          name: name,
          icon: icon,
          color: color,
          days: days,
          costPerDay: weeklySpend == null ? costPerDay : weeklySpend / 7,
          hasCustomCost: weeklySpend != null,
          weeklyMinutes: addictions.weeklyTimeMinutesFor(key),
          relapseCount: allDays.length,
          totalRelapseDays: allDays.fold(0, (s, d) => s + d),
        ),
      );
    }

    addPreset(
      addictions.quitAlcohol,
      l10n.addictionAlcohol,
      Icons.local_bar,
      const Color(0xFF6366F1),
      costPerDay: 7.14,
      key: 'alcohol',
    );
    addPreset(
      addictions.quitSmoking,
      l10n.addictionSmoking,
      PresetIcons.smoking,
      const Color(0xFF10B981),
      costPerDay: 10.0,
      key: 'smoking',
    );
    addPreset(
      addictions.quitVaping,
      l10n.addictionVaping,
      Icons.air,
      const Color(0xFF06B6D4),
      costPerDay: 5.0,
      key: 'vaping',
    );
    addPreset(
      addictions.quitMarijuana,
      l10n.addictionMarijuana,
      PresetIcons.cannabis,
      const Color(0xFF84E680),
      costPerDay: 4.29,
      key: 'marijuana',
    );
    addPreset(
      addictions.quitPouches,
      l10n.addictionNicotinePouches,
      PresetIcons.package,
      const Color(0xFFF59E0B),
      costPerDay: 5.0,
      key: 'nicotine_pouches',
    );
    addPreset(
      addictions.quitSocialMedia,
      l10n.addictionSocialMedia,
      PresetIcons.social,
      const Color(0xFF8B5CF6),
      key: 'social_media',
    );
    addPreset(
      addictions.quitPornography,
      l10n.addictionAdultContent,
      Icons.block,
      const Color(0xFFF43F5E),
      key: 'pornography',
    );
    addPreset(
      addictions.quitOpioids,
      l10n.addictionOpioids,
      PresetIcons.opioids,
      const Color(0xFFEC4899),
      key: 'opioids',
    );
    addPreset(
      addictions.quitCocaine,
      l10n.addictionCocaine,
      Icons.bolt,
      const Color(0xFF3B82F6),
      key: 'cocaine',
    );
    addPreset(
      addictions.quitMeth,
      l10n.addictionMeth,
      PresetIcons.meth,
      const Color(0xFF14B8A6),
      key: 'meth',
    );
    addPreset(
      addictions.quitBenzos,
      l10n.addictionBenzos,
      Icons.bedtime,
      const Color(0xFF6D5DD3),
      key: 'benzos',
    );
    addPreset(
      addictions.quitAdderall,
      l10n.addictionAdderall,
      Icons.lightbulb_outline,
      const Color(0xFFFF8C42),
      key: 'adderall',
    );
    addPreset(
      addictions.quitSsri,
      l10n.addictionSsri,
      Icons.psychology,
      const Color(0xFF7C3AED),
      key: 'ssri',
    );
    addPreset(
      addictions.quitSnri,
      l10n.addictionSnri,
      Icons.psychology_alt,
      const Color(0xFF6D28D9),
      key: 'snri',
    );
    addPreset(
      addictions.quitTca,
      l10n.addictionTca,
      PresetIcons.tca,
      const Color(0xFF5B21B6),
      key: 'tca',
    );
    addPreset(
      addictions.quitMaoi,
      l10n.addictionMaoi,
      PresetIcons.maoi,
      const Color(0xFF4C1D95),
      key: 'maoi',
    );
    addPreset(
      addictions.quitKratom,
      l10n.addictionKratom,
      PresetIcons.leaf,
      const Color(0xFF6D9F4E),
      key: 'kratom',
    );
    addPreset(
      addictions.quitGabapentinoids,
      l10n.addictionGabapentinoid,
      PresetIcons.gabapentin,
      const Color(0xFF94A3B8),
      key: 'gabapentinoids',
    );
    addPreset(
      addictions.quitGhb,
      l10n.addictionGhb,
      PresetIcons.bottle,
      const Color(0xFF60A5FA),
      key: 'ghb',
    );
    addPreset(
      addictions.quitKetamine,
      l10n.addictionKetamine,
      Icons.vaccines,
      const Color(0xFF818CF8),
      key: 'ketamine',
    );
    addPreset(
      addictions.quitInhalants,
      l10n.addictionInhalants,
      PresetIcons.spray,
      const Color(0xFF9CA3AF),
      key: 'inhalants',
    );
    addPreset(
      addictions.quitSyntheticCannabinoids,
      l10n.addictionSyntheticCannabinoids,
      PresetIcons.flask,
      const Color(0xFFA3E635),
      key: 'synthetic_cannabinoids',
    );
    addPreset(
      addictions.quitMdma,
      l10n.addictionMdma,
      Icons.favorite,
      const Color(0xFFF472B6),
      key: 'mdma',
    );
    addPreset(
      addictions.quitSteroids,
      l10n.addictionSteroids,
      Icons.fitness_center,
      const Color(0xFFEF4444),
      key: 'steroids',
    );
    addPreset(
      addictions.quitNitrousOxide,
      l10n.addictionNitrousOxide,
      PresetIcons.balloon,
      const Color(0xFF38BDF8),
      key: 'nitrous_oxide',
    );
    addPreset(
      addictions.quitFentanyl,
      l10n.addictionFentanyl,
      PresetIcons.opioids,
      const Color(0xFFDC2626),
      key: 'fentanyl',
    );
    addPreset(
      addictions.quitSmokelessTobacco,
      l10n.addictionSmokelessTobacco,
      PresetIcons.package,
      const Color(0xFF92400E),
      key: 'smokeless_tobacco',
    );
    addPreset(
      addictions.quitHeroin,
      l10n.addictionHeroin,
      PresetIcons.opioids,
      const Color(0xFFB91C1C),
      key: 'heroin',
    );

    for (final entry in addictions.entries) {
      final days = daysCeil(entry.quitDate.toIso8601String());
      final customColor = addictions.customColors[entry.id] ?? entry.color;
      final weeklySpend = addictions.weeklySpendFor(entry.id);
      entries.add(
        _StatEntry(
          id: entry.id,
          name: addictions.customNames[entry.id] ?? entry.title,
          icon: addictions.customIcons[entry.id] ?? entry.icon ?? Icons.star,
          color: customColor,
          days: days,
          costPerDay: weeklySpend == null ? null : weeklySpend / 7,
          hasCustomCost: weeklySpend != null,
          weeklyMinutes: addictions.weeklyTimeMinutesFor(entry.id),
          relapseCount: entry.daysAchieved.length,
          totalRelapseDays: entry.daysAchieved.fold(0, (s, d) => s + d),
        ),
      );
    }

    return entries;
  }
}

class _StatEntry {
  final String id;
  final String name;
  final IconData icon;
  final Color color;
  final int days;
  final double? costPerDay;
  final bool hasCustomCost;
  final int? weeklyMinutes;
  final int relapseCount;
  final int totalRelapseDays;

  const _StatEntry({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.days,
    this.costPerDay,
    this.hasCustomCost = false,
    this.weeklyMinutes,
    this.relapseCount = 0,
    this.totalRelapseDays = 0,
  });
}

class _JourneyCard extends StatelessWidget {
  const _JourneyCard({
    required this.totalDays,
    required this.addictionCount,
    required this.l10n,
  });

  final int totalDays;
  final int addictionCount;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primary,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.statsJourneyTitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$totalDays',
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        l10n.statsDayUnit(totalDays),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.statsAddictionsTracked(addictionCount),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.emoji_events, color: primary, size: 32),
          ),
        ],
      ),
    );
  }
}

class _MoneySavedCard extends StatelessWidget {
  const _MoneySavedCard({
    required this.moneySaved,
    required this.moneyEntries,
    required this.allEntries,
    required this.l10n,
  });

  final double moneySaved;
  final List<_StatEntry> moneyEntries;
  final List<_StatEntry> allEntries;
  final AppLocalizations l10n;

  String _equivalence(double amount, AppLocalizations l) {
    if (amount >= 2000) return l.statsEquivalentVacation;
    if (amount >= 500) return l.statsEquivalentFlight;
    if (amount >= 100) return l.statsEquivalentMeals((amount / 25).round());
    return l.statsEquivalentCoffees((amount / 5).round());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currencyFmt = NumberFormat.simpleCurrency(
      locale: l10n.localeName,
      name: context.watch<AddictionProvider>().moneyCurrency,
      decimalDigits: 0,
    );
    final equivalence = _equivalence(moneySaved, l10n);

    return InkWell(
      key: const ValueKey('moneySavedCard'),
      borderRadius: BorderRadius.circular(20),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => MoneySavedSettingsPage(
            items: [
              for (final entry in allEntries)
                MoneySavedItem(
                  id: entry.id,
                  name: entry.name,
                  icon: entry.icon,
                  color: entry.color,
                ),
            ],
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF16A34A).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.savings,
                    color: Color(0xFF16A34A),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    l10n.statsMoneySavedTitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(Icons.chevron_right),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              currencyFmt.format(moneySaved.round()),
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF16A34A),
                height: 1,
              ),
            ),
            if (moneySaved > 0) ...[
              const SizedBox(height: 4),
              Text(
                equivalence,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
                ),
              ),
            ],
            const SizedBox(height: 16),
            ...moneyEntries.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    Icon(e.icon, size: 16, color: e.color),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        e.name,
                        style: theme.textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${currencyFmt.format((e.costPerDay! * e.days).round())}  ·  ${l10n.statsDaysSuffix(e.days)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              moneyEntries.any((entry) => entry.hasCustomCost)
                  ? l10n.statsMoneySavedCustomEstimate
                  : l10n.statsMoneySavedEstimate,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeSavedCard extends StatelessWidget {
  const _TimeSavedCard({
    required this.minutesReclaimed,
    required this.timeEntries,
    required this.allEntries,
    required this.l10n,
  });

  final int minutesReclaimed;
  final List<_StatEntry> timeEntries;
  final List<_StatEntry> allEntries;
  final AppLocalizations l10n;

  String formatMinutes(int minutes) {
    final hours = minutes ~/ 60;
    final remaining = minutes % 60;
    final minutesText = '$remaining${l10n.statsTimeMinuteAbbreviation}';
    if (hours == 0) return minutesText;
    if (remaining == 0) return l10n.statsHoursSuffix(hours);
    return '${l10n.statsHoursSuffix(hours)} $minutesText';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accent = isDark ? const Color(0xFFC4B5FD) : const Color(0xFF6D28D9);
    final primaryShade = isDark
        ? const Color(0xFF251A41)
        : const Color(0xFFF0E9FF);
    final secondaryShade = isDark
        ? const Color(0xFF1A1B30)
        : const Color(0xFFF9F7FF);
    final foreground = theme.colorScheme.onSurface;
    final weeklyTotal = timeEntries.fold<int>(
      0,
      (sum, e) => sum + e.weeklyMinutes!,
    );
    final largestWeekly = timeEntries.isEmpty
        ? 1
        : timeEntries.first.weeklyMinutes!;
    final subtitle = l10n.statsTimeWeekly;

    return Container(
      key: const ValueKey('timeSavedCard'),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryShade, secondaryShade],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: accent.withValues(alpha: 0.17)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.hourglass_top_rounded,
                  color: accent,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.statsTimeSavedTitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: foreground,
                  ),
                ),
              ),
              IconButton.filledTonal(
                key: const ValueKey('editTimeSaved'),
                tooltip: l10n.statsTimeConfigure,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => TimeSavedSettingsPage(
                      items: [
                        for (final e in allEntries)
                          TimeSavedItem(
                            id: e.id,
                            name: e.name,
                            icon: e.icon,
                            color: e.color,
                          ),
                      ],
                    ),
                  ),
                ),
                icon: const Icon(Icons.tune_rounded, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            formatMinutes(minutesReclaimed),
            key: const ValueKey('timeSavedTotal'),
            style: theme.textTheme.displayMedium?.copyWith(
              color: accent,
              fontSize: 40,
              height: 1.05,
              fontWeight: FontWeight.w900,
              letterSpacing: -1.5,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.trending_up_rounded, size: 17, color: accent),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  '${formatMinutes(weeklyTotal)} $subtitle',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: foreground.withValues(alpha: 0.75),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          if (timeEntries.isNotEmpty) ...[
            const SizedBox(height: 18),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 9,
                child: Row(
                  children: [
                    for (final e in timeEntries)
                      Expanded(
                        flex: e.weeklyMinutes!,
                        child: ColoredBox(color: e.color),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            for (final e in timeEntries) ...[
              Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: e.color.withValues(alpha: 0.13),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Icon(e.icon, size: 18, color: e.color),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: foreground,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${formatMinutes(e.weeklyMinutes!)} $subtitle',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: foreground.withValues(alpha: 0.62),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    formatMinutes((e.weeklyMinutes! * e.days / 7).round()),
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: foreground,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 44),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    minHeight: 4,
                    value: e.weeklyMinutes! / largestWeekly,
                    color: e.color,
                    backgroundColor: e.color.withValues(alpha: 0.12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ] else ...[
            const SizedBox(height: 20),
            Text(l10n.statsTimeEmpty, style: theme.textTheme.bodyMedium),
          ],
          Divider(color: accent.withValues(alpha: 0.15), height: 8),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline_rounded,
                size: 16,
                color: foreground.withValues(alpha: 0.55),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l10n.statsTimeDetail,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: foreground.withValues(alpha: 0.65),
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StreaksCard extends StatelessWidget {
  const _StreaksCard({required this.entries, required this.l10n});

  final List<_StatEntry> entries;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maxDays = switch (entries.isEmpty) {
      true => 1,
      false => entries.map((e) => e.days).reduce((a, b) => a > b ? a : b),
    };

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.local_fire_department,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                l10n.statsStreaksTitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...entries.asMap().entries.map((mapEntry) {
            final i = mapEntry.key;
            final e = mapEntry.value;
            final fraction = maxDays > 0 ? e.days / maxDays : 0.0;
            return Padding(
              padding: EdgeInsets.only(bottom: i < entries.length - 1 ? 10 : 0),
              child: _StreakBar(
                entry: e,
                fraction: fraction.clamp(0.0, 1.0),
                l10n: l10n,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _StreakBar extends StatelessWidget {
  const _StreakBar({
    required this.entry,
    required this.fraction,
    required this.l10n,
  });

  final _StatEntry entry;
  final double fraction;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AddictionIcon(entry.icon, size: 14, color: entry.color),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                entry.name,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              l10n.statsDaysSuffix(entry.days),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: fraction,
            minHeight: 8,
            backgroundColor: entry.color.withValues(alpha: 0.15),
            valueColor: AlwaysStoppedAnimation<Color>(entry.color),
          ),
        ),
      ],
    );
  }
}

class _ResilienceCard extends StatelessWidget {
  const _ResilienceCard({
    required this.totalRelapses,
    required this.totalRelapseDays,
    required this.l10n,
  });

  final int totalRelapses;
  final int totalRelapseDays;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avgDays = totalRelapses > 0
        ? (totalRelapseDays / totalRelapses).round()
        : 0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF97316).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.trending_up,
                  color: Color(0xFFF97316),
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                l10n.statsResilienceTitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            l10n.statsTimesBouncedBack(totalRelapses),
            style: theme.textTheme.bodyLarge,
          ),
          if (avgDays > 0) ...[
            const SizedBox(height: 4),
            Text(
              l10n.statsDaysBeforeRelapse(avgDays),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
