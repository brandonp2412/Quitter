import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/utils.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<AddictionProvider>(
      builder: (context, addictions, child) {
        final entries = _buildStatEntries(l10n, addictions);

        if (entries.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.bar_chart,
                  size: 64,
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.statsNoAddictions,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha(128),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        final totalDays = entries.fold(0, (sum, e) => sum + e.days);
        final moneySaved = entries.fold(
          0.0,
          (sum, e) => sum + (e.costPerDay ?? 0) * e.days,
        );
        final hoursSaved = entries.fold(
          0.0,
          (sum, e) => sum + (e.hoursPerDay ?? 0) * e.days,
        );
        final totalRelapses = entries.fold(0, (sum, e) => sum + e.relapseCount);
        final totalRelapseDays = entries.fold(
          0,
          (sum, e) => sum + e.totalRelapseDays,
        );

        final moneyEntries = entries
            .where((e) => e.costPerDay != null && e.costPerDay! > 0)
            .toList();
        final timeEntries = entries
            .where((e) => e.hoursPerDay != null && e.hoursPerDay! > 0)
            .toList();
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
                child: _JourneyCard(
                  totalDays: totalDays,
                  addictionCount: entries.length,
                  l10n: l10n,
                ),
              ),
            ),
            if (moneySaved > 0) ...[
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: _MoneySavedCard(
                    moneySaved: moneySaved,
                    moneyEntries: moneyEntries,
                    l10n: l10n,
                  ),
                ),
              ),
            ],
            if (hoursSaved >= 1) ...[
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: _TimeSavedCard(
                    hoursSaved: hoursSaved,
                    timeEntries: timeEntries,
                    l10n: l10n,
                  ),
                ),
              ),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: _StreaksCard(entries: sortedByStreak, l10n: l10n),
              ),
            ),
            if (totalRelapses > 0) ...[
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: _ResilienceCard(
                    totalRelapses: totalRelapses,
                    totalRelapseDays: totalRelapseDays,
                    l10n: l10n,
                  ),
                ),
              ),
            ],
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
      double? hoursPerDay,
      String? key,
    }) {
      if (quitDate == null) return;
      final days = daysCeil(quitDate);
      final allDays = key != null ? addictions.getDays(key) : <int>[];
      entries.add(
        _StatEntry(
          name: name,
          icon: icon,
          color: color,
          days: days,
          costPerDay: costPerDay,
          hoursPerDay: hoursPerDay,
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
      Icons.eco,
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
      Icons.grass,
      const Color(0xFF84E680),
      costPerDay: 4.29,
      key: 'marijuana',
    );
    addPreset(
      addictions.quitPouches,
      l10n.addictionNicotinePouches,
      Icons.scatter_plot,
      const Color(0xFFF59E0B),
      costPerDay: 5.0,
      key: 'nicotine_pouches',
    );
    addPreset(
      addictions.quitSocialMedia,
      l10n.addictionSocialMedia,
      Icons.public,
      const Color(0xFF8B5CF6),
      hoursPerDay: 2.5,
      key: 'social_media',
    );
    addPreset(
      addictions.quitPornography,
      l10n.addictionAdultContent,
      Icons.block,
      const Color(0xFFF43F5E),
      hoursPerDay: 1.0,
      key: 'pornography',
    );
    addPreset(
      addictions.quitOpioids,
      l10n.addictionOpioids,
      Icons.medication,
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
      Icons.battery_charging_full,
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
      Icons.medication_liquid,
      const Color(0xFF5B21B6),
      key: 'tca',
    );
    addPreset(
      addictions.quitMaoi,
      l10n.addictionMaoi,
      Icons.science,
      const Color(0xFF4C1D95),
      key: 'maoi',
    );
    addPreset(
      addictions.quitKratom,
      l10n.addictionKratom,
      Icons.local_florist,
      const Color(0xFF6D9F4E),
      key: 'kratom',
    );
    addPreset(
      addictions.quitGabapentinoids,
      l10n.addictionGabapentinoid,
      Icons.medication_outlined,
      const Color(0xFF94A3B8),
      key: 'gabapentinoids',
    );
    addPreset(
      addictions.quitGhb,
      l10n.addictionGhb,
      Icons.water_drop,
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
      Icons.local_gas_station,
      const Color(0xFF9CA3AF),
      key: 'inhalants',
    );
    addPreset(
      addictions.quitSyntheticCannabinoids,
      l10n.addictionSyntheticCannabinoids,
      Icons.whatshot,
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
      Icons.air_outlined,
      const Color(0xFF38BDF8),
      key: 'nitrous_oxide',
    );
    addPreset(
      addictions.quitFentanyl,
      l10n.addictionFentanyl,
      Icons.warning_amber,
      const Color(0xFFDC2626),
      key: 'fentanyl',
    );
    addPreset(
      addictions.quitSmokelessTobacco,
      l10n.addictionSmokelessTobacco,
      Icons.sports_baseball,
      const Color(0xFF92400E),
      key: 'smokeless_tobacco',
    );
    addPreset(
      addictions.quitHeroin,
      l10n.addictionHeroin,
      Icons.medication,
      const Color(0xFFB91C1C),
      key: 'heroin',
    );

    for (final entry in addictions.entries) {
      final days = daysCeil(entry.quitDate.toIso8601String());
      final customColor = addictions.customColors[entry.id] ?? entry.color;
      entries.add(
        _StatEntry(
          name: addictions.customNames[entry.id] ?? entry.title,
          icon: addictions.customIcons[entry.id] ?? entry.icon ?? Icons.star,
          color: customColor,
          days: days,
          relapseCount: entry.daysAchieved.length,
          totalRelapseDays: entry.daysAchieved.fold(0, (s, d) => s + d),
        ),
      );
    }

    return entries;
  }
}

class _StatEntry {
  final String name;
  final IconData icon;
  final Color color;
  final int days;
  final double? costPerDay;
  final double? hoursPerDay;
  final int relapseCount;
  final int totalRelapseDays;

  const _StatEntry({
    required this.name,
    required this.icon,
    required this.color,
    required this.days,
    this.costPerDay,
    this.hoursPerDay,
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
        gradient: LinearGradient(
          colors: [primary, primary.withValues(alpha: 0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
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
                    color: Colors.white.withValues(alpha: 0.85),
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
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        'days',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white.withValues(alpha: 0.75),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.statsAddictionsTracked(addictionCount),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.75),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.emoji_events,
              color: Colors.white,
              size: 32,
            ),
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
    required this.l10n,
  });

  final double moneySaved;
  final List<_StatEntry> moneyEntries;
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
    final currencyFmt = NumberFormat.currency(symbol: '\$', decimalDigits: 0);
    final equivalence = _equivalence(moneySaved, l10n);

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
              Text(
                l10n.statsMoneySavedTitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
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
          const SizedBox(height: 4),
          Text(
            equivalence,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
            ),
          ),
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
                    '${currencyFmt.format((e.costPerDay! * e.days).round())}  ·  ${e.days}d',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.statsMoneySavedEstimate,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeSavedCard extends StatelessWidget {
  const _TimeSavedCard({
    required this.hoursSaved,
    required this.timeEntries,
    required this.l10n,
  });

  final double hoursSaved;
  final List<_StatEntry> timeEntries;
  final AppLocalizations l10n;

  String _equivalence(double hours, AppLocalizations l) {
    final movies = (hours / 2).round();
    final books = (hours / 6).round();
    if (books >= 3) return l.statsEquivalentBooks(books);
    return l.statsEquivalentMovies(movies.clamp(1, 9999));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final equivalence = _equivalence(hoursSaved, l10n);

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
                  color: const Color(0xFF7C3AED).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.access_time,
                  color: Color(0xFF7C3AED),
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                l10n.statsTimeSavedTitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                l10n.statsHoursSaved(hoursSaved.round()),
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF7C3AED),
                  height: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            equivalence,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
            ),
          ),
          const SizedBox(height: 16),
          ...timeEntries.map(
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
                    '${(e.hoursPerDay! * e.days).round()}h  ·  ${e.days}d',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
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
    final maxDays = entries.isEmpty
        ? 1
        : entries.map((e) => e.days).reduce((a, b) => a > b ? a : b);

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
            Icon(entry.icon, size: 14, color: entry.color),
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
