import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/smoking_page.dart';

class NicotinePouchesPage extends StatelessWidget {
  final bool started;

  const NicotinePouchesPage({super.key, required this.started});

  static Map<int, QuitMilestone> _milestoneOverrides(AppLocalizations l10n) {
    const sourceName =
        'McLaughlin, Dani & De Biasi — Nicotine Withdrawal (PubMed)';
    const sourceUrl = 'https://pubmed.ncbi.nlm.nih.gov/25638335/';

    return {
      1: QuitMilestone(
        day: 1,
        title: l10n.nicotinePouchesMilestone1Title,
        description: l10n.nicotinePouchesMilestone1Description,
        reference: sourceName,
        link: sourceUrl,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.nicotinePouchesReferenceDay1,
        referenceContent: '''Day One: Nicotine Withdrawal Begins

Source: McLaughlin, Dani & De Biasi — Nicotine Withdrawal

A review of withdrawal from chronic use of nicotine-containing products reports that the withdrawal syndrome can begin 4–24 hours after stopping. That makes the first pouch-free day a real physiological milestone.

What happens next
Symptoms typically peak around day 3 and then taper over the following 3–4 weeks. Withdrawal intensity varies with how nicotine was consumed, so the experience can differ from person to person.''',
      ),
      3: QuitMilestone(
        day: 3,
        title: l10n.nicotinePouchesMilestone3Title,
        description: l10n.nicotinePouchesMilestone3Description,
        reference: sourceName,
        link: sourceUrl,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.nicotinePouchesReferenceDay3,
        referenceContent: '''Day Three: Peak Nicotine Withdrawal

Source: McLaughlin, Dani & De Biasi — Nicotine Withdrawal

The review places the typical nicotine-withdrawal peak at about the third day after stopping chronic nicotine use.

The curve from here
After the peak, symptoms usually taper over the following 3–4 weeks. The review also notes that withdrawal severity varies with how nicotine was consumed, so the exact intensity is individual.

Day three is a hard-earned milestone: you've reached the top of the typical early withdrawal curve.''',
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SmokingPage(
      started: started,
      storageKey: 'nicotine_pouches',
      pageTitle: l10n.nicotinePouchesPageTitle,
      headerStarted: l10n.nicotinePouchesHeaderStarted,
      headerNotStarted: l10n.nicotinePouchesHeaderNotStarted,
      subtitleStarted: l10n.nicotinePouchesSubtitleStarted,
      subtitleNotStarted: l10n.nicotinePouchesSubtitleNotStarted,
      milestoneOverridesBuilder: _milestoneOverrides,
    );
  }
}
