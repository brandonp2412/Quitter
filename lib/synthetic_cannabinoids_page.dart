import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class SyntheticCannabinoidsPage extends StatelessWidget {
  final bool started;

  const SyntheticCannabinoidsPage({super.key, required this.started});

  static const _withdrawalStudyLink =
      'https://pmc.ncbi.nlm.nih.gov/articles/PMC9110517/';
  static const _clinicalReviewLink =
      'https://pmc.ncbi.nlm.nih.gov/articles/PMC4923337/';

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.synthetic_cannabinoidsMilestone1Title,
        description: l10n.synthetic_cannabinoidsMilestone1Description,
        reference: 'Cooper (2016) — Synthetic Cannabinoid Withdrawal',
        link: _clinicalReviewLink,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.synthetic_cannabinoidsRiskReference,
      ),
      QuitMilestone(
        day: 3,
        title: l10n.synthetic_cannabinoidsMilestone3Title,
        description: l10n.synthetic_cannabinoidsMilestone3Description,
        reference: 'Craft et al. (2022) — SCRA Withdrawal Profile',
        link: _withdrawalStudyLink,
        referenceDate: 'October 2026',
        localizedReferenceContent:
            l10n.synthetic_cannabinoidsWithdrawalReference,
      ),
      QuitMilestone(
        day: 7,
        title: l10n.synthetic_cannabinoidsMilestone7Title,
        description: l10n.synthetic_cannabinoidsMilestone7Description,
        reference: 'Craft et al. (2022) — SCRA Withdrawal Profile',
        link: _withdrawalStudyLink,
        referenceDate: 'October 2026',
        localizedReferenceContent:
            l10n.synthetic_cannabinoidsWithdrawalReference,
      ),
      QuitMilestone(
        day: 14,
        title: l10n.synthetic_cannabinoidsMilestone14Title,
        description: l10n.synthetic_cannabinoidsMilestone14Description,
        reference: 'Cooper (2016) — Synthetic Cannabinoid Risks',
        link: _clinicalReviewLink,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.synthetic_cannabinoidsRiskReference,
      ),
      QuitMilestone(
        day: 30,
        title: l10n.synthetic_cannabinoidsMilestone30Title,
        description: l10n.synthetic_cannabinoidsMilestone30Description,
        reference: 'Cooper (2016) — Synthetic Cannabinoid Risks',
        link: _clinicalReviewLink,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.synthetic_cannabinoidsRiskReference,
      ),
      QuitMilestone(
        day: 90,
        title: l10n.synthetic_cannabinoidsMilestone90Title,
        description: l10n.synthetic_cannabinoidsMilestone90Description,
        reference: 'Cooper (2016) — Synthetic Cannabinoid Risks',
        link: _clinicalReviewLink,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.synthetic_cannabinoidsRiskReference,
      ),
      QuitMilestone(
        day: 180,
        title: l10n.synthetic_cannabinoidsMilestone180Title,
        description: l10n.synthetic_cannabinoidsMilestone180Description,
        reference: 'Cooper (2016) — Synthetic Cannabinoid Risks',
        link: _clinicalReviewLink,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.synthetic_cannabinoidsRiskReference,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.synthetic_cannabinoidsPageTitle,
      storageKey: 'synthetic_cannabinoids',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.synthetic_cannabinoidsHeaderStarted,
      headerNotStarted: l10n.synthetic_cannabinoidsHeaderNotStarted,
      subtitleStarted: l10n.synthetic_cannabinoidsSubtitleStarted,
      subtitleNotStarted: l10n.synthetic_cannabinoidsSubtitleNotStarted,
      infoBoxMessage: l10n.synthetic_cannabinoidsInfoBox,
      initialStarted: started,
    );
  }
}
