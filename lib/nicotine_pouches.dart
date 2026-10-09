import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/smoking_page.dart';

class NicotinePouchesPage extends StatelessWidget {
  final bool started;

  const NicotinePouchesPage({super.key, required this.started});

  static Map<int, QuitMilestone> _milestoneOverrides(AppLocalizations l10n) {
    const withdrawalSourceName =
        'McLaughlin, Dani & De Biasi — Nicotine Withdrawal (PubMed)';
    const withdrawalSourceUrl = 'https://pubmed.ncbi.nlm.nih.gov/25638335/';
    const reviewSourceName =
        'Rungraungrayabkul et al. — Nicotine Pouches and Oral Health (PubMed)';
    const reviewSourceUrl = 'https://pubmed.ncbi.nlm.nih.gov/39097712/';
    const cdcSourceName = 'CDC — Nicotine Pouches';
    const cdcSourceUrl = 'https://www.cdc.gov/tobacco/nicotine-pouches/';

    return {
      1: QuitMilestone(
        day: 1,
        title: l10n.nicotinePouchesMilestone1Title,
        description: l10n.nicotinePouchesMilestone1Description,
        reference: withdrawalSourceName,
        link: withdrawalSourceUrl,
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
        reference: withdrawalSourceName,
        link: withdrawalSourceUrl,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.nicotinePouchesReferenceDay3,
        referenceContent: '''Day Three: Peak Nicotine Withdrawal

Source: McLaughlin, Dani & De Biasi — Nicotine Withdrawal

The review places the typical nicotine-withdrawal peak at about the third day after stopping chronic nicotine use.

The curve from here
After the peak, symptoms usually taper over the following 3–4 weeks. The review also notes that withdrawal severity varies with how nicotine was consumed, so the exact intensity is individual.

Day three is a hard-earned milestone: you've reached the top of the typical early withdrawal curve.''',
      ),
      7: QuitMilestone(
        day: 7,
        title: l10n.nicotinePouchesMilestone7Title,
        description: l10n.nicotinePouchesMilestone7Description,
        reference: withdrawalSourceName,
        link: withdrawalSourceUrl,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.nicotinePouchesReferenceDay7,
        referenceContent: '''One Week: Withdrawal Is Easing

Source: McLaughlin, Dani & De Biasi — Nicotine Withdrawal

The review reports that withdrawal from chronic use of nicotine-containing products begins 4–24 hours after stopping, peaks around day 3, then tapers over the following 3–4 weeks.

A real one-week win
At one week, you're several days past the typical peak and into the taper phase. The review also notes that withdrawal severity varies with how nicotine was consumed, so intensity differs between people.

One week pouch-free means the steepest part of the typical early withdrawal curve is behind you.''',
      ),
      14: QuitMilestone(
        day: 14,
        title: l10n.nicotinePouchesMilestone14Title,
        description: l10n.nicotinePouchesMilestone14Description,
        reference: withdrawalSourceName,
        link: withdrawalSourceUrl,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.nicotinePouchesReferenceDay14,
        referenceContent: '''Two Weeks: Withdrawal Keeps Easing

Source: McLaughlin, Dani & De Biasi — Nicotine Withdrawal

The review places the typical nicotine-withdrawal peak around day 3 and says symptoms taper over the following 3–4 weeks.

Well into the taper
At two weeks, you're well into that post-peak taper window. The review covers chronic use of nicotine-containing products and notes that withdrawal severity varies with how nicotine was consumed.

Two weeks pouch-free is a concrete checkpoint on the downward curve: the typical withdrawal syndrome is continuing to ease.''',
      ),
      730: QuitMilestone(
        day: 730,
        title: l10n.nicotinePouchesMilestone730Title,
        description: l10n.nicotinePouchesMilestone730Description,
        reference: reviewSourceName,
        link: reviewSourceUrl,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.nicotinePouchesReferenceDay730,
        referenceContent: '''Two Years: Pouch-Free Power

Source: Rungraungrayabkul et al. — What is the impact of nicotine pouches on oral health?

The 2024 systematic review found only three human studies of nicotine-pouch oral health, covering 190 participants, and rated all three at high risk of bias. It included people with pouch-use histories ranging from one month to ten years, but it did not establish a two-year recovery threshold after stopping.

A milestone the evidence can support
Two years pouch-free is still a substantial achievement: two years without repeated nicotine-pouch exposure. This anniversary celebrates sustained change without turning limited research into a medical countdown.''',
      ),
      1095: QuitMilestone(
        day: 1095,
        title: l10n.nicotinePouchesMilestone1095Title,
        description: l10n.nicotinePouchesMilestone1095Description,
        reference: cdcSourceName,
        link: cdcSourceUrl,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.nicotinePouchesReferenceDay1095,
        referenceContent: '''Three Years: Freedom Holds

Source: CDC — Nicotine Pouches

CDC says scientists are still learning about the short- and long-term health effects of nicotine pouches and that more research is needed. It does not identify a special medical change at three years after stopping.

Three years still counts
Three years pouch-free is a durable personal milestone. The evidence does not need an invented biological threshold for three years of sustained freedom from pouch nicotine to be worth celebrating.''',
      ),
      1460: QuitMilestone(
        day: 1460,
        title: l10n.nicotinePouchesMilestone1460Title,
        description: l10n.nicotinePouchesMilestone1460Description,
        reference: reviewSourceName,
        link: reviewSourceUrl,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.nicotinePouchesReferenceDay1460,
        referenceContent: '''Four Years: Built to Last

Source: Rungraungrayabkul et al. — What is the impact of nicotine pouches on oral health?

The systematic review found that long-term evidence remains limited and called for further research on short- and long-term oral-health effects. Nothing in the review supports a universal medical switch at exactly four years after quitting.

Built through repetition
Four pouch-free years show sustained change over a long stretch of ordinary days. This milestone celebrates that consistency while keeping the health claims inside the evidence.''',
      ),
      1825: QuitMilestone(
        day: 1825,
        title: l10n.nicotinePouchesMilestone1825Title,
        description: l10n.nicotinePouchesMilestone1825Description,
        reference: cdcSourceName,
        link: cdcSourceUrl,
        referenceDate: 'October 2026',
        localizedReferenceContent: l10n.nicotinePouchesReferenceDay1825,
        referenceContent: '''Five Years: Five-Year Victory

Source: CDC — Nicotine Pouches

CDC notes that nicotine pouches are relatively new and that their long-term health effects are still being studied. Current evidence does not establish a specific five-year recovery event after stopping.

Five years is the headline
Five years pouch-free is an enormous sustained-change milestone on its own. Celebrate the years you have stacked up without attaching a medical promise that research has not demonstrated.''',
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
      milestoneDays: const {1, 3, 7, 14, 730, 1095, 1460, 1825},
    );
  }
}
