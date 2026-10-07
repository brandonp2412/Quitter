import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class SmokingPage extends StatelessWidget {
  final bool started;
  final String storageKey;
  final String? pageTitle;
  final String? headerStarted;
  final String? headerNotStarted;
  final String? subtitleStarted;
  final String? subtitleNotStarted;
  final Map<int, QuitMilestone> Function(AppLocalizations)?
  milestoneOverridesBuilder;

  const SmokingPage({
    super.key,
    required this.started,
    this.storageKey = 'smoking',
    this.pageTitle,
    this.headerStarted,
    this.headerNotStarted,
    this.subtitleStarted,
    this.subtitleNotStarted,
    this.milestoneOverridesBuilder,
  });

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.smokingMilestone1Title,
        description: l10n.smokingMilestone1Description,
        reference: "NHS Better Health - Quit Smoking Timeline",
        link: "https://www.nhs.uk/better-health/quit-smoking/",
        referenceDate: "March 2026",
        localizedReferenceContent: l10n.smokingReferenceDay1,
        referenceContent:
            "Day One: Benefits Start Now\n\n"
            "Source: NHS Better Health\n\n"
            "Benefits begin within minutes — not days. The body starts to normalise as soon as the smoke stops.\n\n"
            "What happens today\n"
            "• 20 minutes: pulse rate begins returning to normal\n"
            "• 8 hours: carbon monoxide in the blood falls by half; oxygen levels are recovering\n"
            "• 48 hours: carbon monoxide has dropped to the level of a non-smoker\n\n"
            "Carbon monoxide binds to red blood cells more strongly than oxygen, displacing it from your blood. Every organ was getting less oxygen than it should. That reverses within two days.\n\n"
            "Withdrawal begins on day one\n"
            "• Cravings — each typically lasting 3–5 minutes\n"
            "• Irritability and difficulty concentrating\n"
            "• Increased appetite\n\n"
            "These are temporary and manageable. The NHS Better Health programme offers free support including apps and pharmacist advice.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.smokingMilestone3Title,
        description: l10n.smokingMilestone3Description,
        reference: "McLaughlin, Dani & De Biasi — Nicotine Withdrawal (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/25638335/",
        referenceDate: "March 2026",
        localizedReferenceContent: l10n.smokingReferenceDay3,
        referenceContent:
            "Day Three: Peak Withdrawal\n\n"
            "Source: McLaughlin, Dani & De Biasi\n\n"
            "By 72 hours, nicotine is gone from your body. The brain built extra nicotine receptors during your smoking years; now they're understimulated, causing the withdrawal syndrome.\n\n"
            "Peak symptoms\n"
            "• Cravings — most intense right now\n"
            "• Irritability, frustration, restlessness\n"
            "• Difficulty concentrating\n"
            "• Anxiety\n"
            "• Headaches\n"
            "• Increased appetite\n"
            "• Coughing (the airways are clearing — a good sign)\n\n"
            "This is the hardest day. It doesn't get worse than this — from here the symptoms steadily ease as your brain readjusts.\n\n"
            "NRT, varenicline, and bupropion all significantly reduce withdrawal severity at this stage.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.smokingMilestone7Title,
        description: l10n.smokingMilestone7Description,
        reference: "NHS Better Health - Benefits of Quitting Smoking",
        link: "https://www.nhs.uk/better-health/quit-smoking/",
        referenceDate: "March 2026",
        localizedReferenceContent: l10n.smokingReferenceDay7,
        referenceContent:
            "One Week: Taste and Smell Return\n\n"
            "Source: NHS Better Health\n\n"
            "Reaching one week smoke-free is a strong predictor of long-term success — people who get through the first week are far more likely to quit for good.\n\n"
            "What's recovered\n"
            "• Food tastes more flavourful\n"
            "• Smells are more vivid\n"
            "• Breathing is easier — airways are clearing\n"
            "• Circulation is improving\n"
            "• Skin is better hydrated\n\n"
            "Smoking damages taste and smell receptors directly; within days of stopping, they begin to recover.\n\n"
            "The acute nicotine withdrawal is easing. Physical cravings are shorter and less frequent. Trigger-based cravings may still be present, but the worst of the physical urgency is behind you.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.smokingMilestone14Title,
        description: l10n.smokingMilestone14Description,
        reference: "NHS - Quit Smoking Timeline",
        link: "https://www.nhs.uk/better-health/quit-smoking/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.smokingReferenceDay14,
        referenceContent:
            "Two Weeks: Circulation Improves\n\n"
            "Source: NHS Better Health\n\n"
            "Within 2–12 weeks of stopping, blood circulation improves. Nicotine narrows blood vessels with every cigarette; without it, the vessels relax and blood flows more freely.\n\n"
            "What this means\n"
            "• Blood flow to hands, feet, and peripheral tissues improves\n"
            "• Many people notice warmer hands and feet\n"
            "• Walking and climbing stairs starts to feel easier\n\n"
            "With carbon monoxide already cleared from the blood in the first day and circulation improving now, oxygen reaches muscles more effectively.\n\n"
            "The cilia lining the airways are recovering and pushing out built-up mucus. If you're coughing more than usual, it's a sign of recovery, not a setback.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.smokingMilestone30Title,
        description: l10n.smokingMilestone30Description,
        reference: "NHS - Quit Smoking Timeline",
        link: "https://www.nhs.uk/better-health/quit-smoking/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.smokingReferenceDay30,
        referenceContent:
            "One Month: Lung Function Climbs\n\n"
            "Source: NHS Better Health\n\n"
            "Breathing becomes easier and lung function improves — increasing by up to 10% over the 3-to-9-month window. At one month, you're well into that recovery curve.\n\n"
            "What's happening in the lungs\n"
            "• Cilia have regrown and are clearing mucus more effectively\n"
            "• Airway inflammation is settling\n"
            "• The persistent smoker's cough is fading\n"
            "• Exercise tolerance is improving\n\n"
            "Any coughs, wheezing and breathing problems improve as lung function increases. One month is a meaningful point on that recovery curve.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.smokingMilestone90Title,
        description: l10n.smokingMilestone90Description,
        reference:
            "PMC - Cardiovascular Effects of Smoking and Smoking Cessation (2024)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC11843939/",
        referenceDate: "March 2026",
        localizedReferenceContent: l10n.smokingReferenceDay90,
        referenceContent:
            "Three Months: Heart Attack Risk Drops\n\n"
            "Source: PMC — Cardiovascular Effects of Smoking and Cessation (2024)\n\n"
            "Smoking damages the heart and arteries in multiple ways: it accelerates artery plaque buildup, promotes blood clotting, raises blood pressure, and damages the arterial lining. The procoagulant, clot-promoting effects reverse within days of stopping, and this review reports a notable decline in heart attacks and strokes within the first year of quitting.\n\n"
            "What's improved by now\n"
            "• Blood clotting factors are normalising\n"
            "• Blood pressure and heart rate are stabilising\n"
            "• The sharpest early drop in acute cardiovascular event risk is well underway\n\n"
            "The slower-acting benefits — reversing years of arterial plaque buildup — take longer and are covered in later milestones. Every smoke-free month adds to the recovery.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.smokingMilestone180Title,
        description: l10n.smokingMilestone180Description,
        reference:
            "Smoke-free period and recovery of alveolar immune-cell function (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/11465626/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.smokingReferenceDay180,
        referenceContent: """
Six Months: Lung Immune Cells Bounce Back

Source: Smoke-free period and recovery of alveolar immune-cell function (PubMed)

Smoking can suppress alveolar macrophages — immune cells deep in the lungs that engulf and kill bacteria.

What the study measured
Researchers compared 15 never-smokers, 15 current smokers, and 41 former smokers who had been smoke-free for 2 months, 3–5 months, or 6–12 months during general anesthesia.

A concrete recovery signal
During anesthesia, the drop in alveolar-macrophage phagocytosis and bacteria-killing activity was 1.5–3 times greater in current smokers and two-month quitters than in never-smokers. At 3–12 months smoke-free, antimicrobial responses were closer to the never-smoker pattern than at two months.

Inflammatory signaling recovered on a slower timetable, with altered cytokine responses still seen through six months. Six months is a real checkpoint in lung immune recovery, with more healing still ahead.""",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.smokingMilestone365Title,
        description: l10n.smokingMilestone365Description,
        reference: "PMC - Smoking Cessation and Stroke Outcome",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5644463/",
        referenceDate: "March 2026",
        localizedReferenceContent: l10n.smokingReferenceDay365,
        referenceContent:
            "One Year: Heart Attack Risk Falls Sharply\n\n"
            "Source: PMC — Smoking Cessation and Stroke Outcome; CDC, Benefits of Quitting Smoking\n\n"
            "Smoking roughly doubles stroke risk by promoting artery plaque buildup, increasing blood clotting, raising blood pressure, and damaging cerebral blood vessels. The CDC's own quitting-benefits timeline puts the sharp drop in heart attack risk at the 1-to-2-year mark — you're at the front edge of that window.\n\n"
            "Recovery Timeline\n"
            "Full stroke-risk normalisation takes longer: the cited stroke study followed quitters for a median of nearly five years to show a meaningfully lower stroke rate than continued smokers, and CDC data puts halved coronary heart disease risk at 3 to 6 years, with stroke risk decreasing over the 5-to-10-year mark.\n\n"
            "One year is still a genuine medical milestone — the steepest part of the acute-risk decline is behind you, even though the longer-term cardiovascular and cancer benefits continue to build for years.",
      ),
      QuitMilestone(
        day: 1825,
        title: l10n.smokingMilestone1825Title,
        description: l10n.smokingMilestone1825Description,
        reference: "CDC - Benefits of Quitting Smoking",
        link: "https://www.cdc.gov/tobacco/about/benefits-of-quitting.html",
        referenceDate: "July 2026",
        localizedReferenceContent: l10n.smokingReferenceDay1825,
        referenceContent:
            "Five Years: Big Cancer-Risk Wins Begin\n\n"
            "Source: CDC, Benefits of Quitting Smoking\n\n"
            "Five years puts you at the front edge of a major risk-reduction window.\n\n"
            "Five-to-ten-year milestones\n"
            "• Added risk of cancers of the mouth, throat, and voice box: drops by half\n"
            "• Stroke risk: decreases\n\n"
            "Still ahead\n"
            "• Around 10 years: risk of bladder, esophagus, and kidney cancers decreases\n"
            "• 10–15 years: added lung-cancer risk drops by half\n"
            "• 15 years: coronary heart disease risk falls close to that of someone who does not smoke\n"
            "• 20 years: mouth, throat, and voice-box cancer risk falls close to that of someone who does not smoke; added cervical-cancer risk drops by about half\n\n"
            "Five years smoke-free is a huge milestone — you've reached the window where major cancer and stroke-risk reductions are taking hold, with more big wins still ahead.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final overrides =
        milestoneOverridesBuilder?.call(l10n) ?? <int, QuitMilestone>{};
    final milestones = _getMilestones(l10n)
        .map((milestone) => overrides[milestone.day] ?? milestone)
        .toList(growable: false);

    return QuitMilestonesPage(
      title: pageTitle ?? l10n.smokingPageTitle,
      storageKey: storageKey,
      milestones: milestones,
      headerStarted: headerStarted ?? l10n.smokingHeaderStarted,
      headerNotStarted: headerNotStarted ?? l10n.smokingHeaderNotStarted,
      subtitleStarted: subtitleStarted ?? l10n.smokingSubtitleStarted,
      subtitleNotStarted: subtitleNotStarted ?? l10n.smokingSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
