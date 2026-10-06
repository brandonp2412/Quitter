import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class VapingPage extends StatelessWidget {
  final bool started;

  const VapingPage({super.key, required this.started});

  static const _withdrawalStudyLink =
      'https://pmc.ncbi.nlm.nih.gov/articles/PMC7171279/';
  static const _healthEffectsLink =
      'https://www.cdc.gov/tobacco/e-cigarettes/health-effects.html';

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.vapingStreakTitle(1),
        description: l10n.vapingDay1Description,
        reference: 'Hughes et al. — E-Cigarette Abstinence and Withdrawal',
        link: _withdrawalStudyLink,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.vapingWithdrawalReference,
      ),
      QuitMilestone(
        day: 3,
        title: l10n.vapingStreakTitle(3),
        description: l10n.vapingDay3Description,
        reference: 'Hughes et al. — E-Cigarette Abstinence and Withdrawal',
        link: _withdrawalStudyLink,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.vapingWithdrawalReference,
      ),
      QuitMilestone(
        day: 7,
        title: l10n.vapingStreakTitle(7),
        description: l10n.vapingDay7Description,
        reference: 'CDC — Health Effects of Vaping',
        link: _healthEffectsLink,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.vapingHealthReference,
      ),
      for (final day in [14, 30, 60, 90, 180, 365])
        QuitMilestone(
          day: day,
          title: l10n.vapingStreakTitle(day),
          description: l10n.vapingLongStreakDescription(day),
          reference: 'CDC — Health Effects of Vaping',
          link: _healthEffectsLink,
          referenceDate: 'October 2026',
          localizedReferenceContent: l10n.vapingHealthReference,
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.vapingPageTitle,
      storageKey: 'vaping',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.vapingHeaderStarted,
      headerNotStarted: l10n.vapingHeaderNotStarted,
      subtitleStarted: l10n.vapingSubtitleStarted,
      subtitleNotStarted: l10n.vapingSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
