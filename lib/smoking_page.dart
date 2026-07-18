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

  const SmokingPage({
    super.key,
    required this.started,
    this.storageKey = 'smoking',
    this.pageTitle,
    this.headerStarted,
    this.headerNotStarted,
    this.subtitleStarted,
    this.subtitleNotStarted,
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
        referenceContent:
            "Day One: Benefits Start Now\n\n"
            "Source: NHS Better Health\n\n"
            "Benefits begin within minutes — not days. The body starts to normalise as soon as the smoke stops.\n\n"
            "What happens today\n"
            "• 20 minutes: heart rate and blood pressure drop\n"
            "• 8 hours: carbon monoxide in the blood falls by half; oxygen returns to normal\n"
            "• 24 hours: carbon monoxide fully cleared\n\n"
            "Carbon monoxide binds to red blood cells more strongly than oxygen, displacing it from your blood. Every organ was getting less oxygen than it should. That reverses completely within a day.\n\n"
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
            "This is the hardest day. It doesn't get worse than this — from here the symptoms steadily ease as your brain recalibrates.\n\n"
            "NRT, varenicline, and bupropion all significantly reduce withdrawal severity at this stage.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.smokingMilestone7Title,
        description: l10n.smokingMilestone7Description,
        reference: "NHS Better Health - Benefits of Quitting Smoking",
        link: "https://www.nhs.uk/better-health/quit-smoking/",
        referenceDate: "March 2026",
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
        referenceContent:
            "Three Months: Heart Attack Risk Drops\n\n"
            "Source: PMC — Cardiovascular Effects of Smoking and Cessation (2024)\n\n"
            "Smoking damages the heart and arteries in multiple ways: it accelerates artery plaque buildup, promotes blood clotting, raises blood pressure, and damages the arterial lining. After 1–3 months of stopping, cardiovascular recovery accelerates.\n\n"
            "What's improved by now\n"
            "• Arterial wall health shows significant improvement\n"
            "• Blood clotting factors are normalising\n"
            "• Inflammatory markers are reducing\n"
            "• Blood pressure and heart rate are stable at normal levels\n\n"
            "One year after quitting, coronary heart disease risk is halved compared to continuing to smoke. At three months, that risk reduction is well underway. Every month adds more.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.smokingMilestone180Title,
        description: l10n.smokingMilestone180Description,
        reference:
            "Smoke-free period and recovery of alveolar immune-cell function (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/11465626/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months: Immune Defences Recover\n\n"
            "Source: Smoke-free period and recovery of alveolar immune-cell function (PubMed)\n\n"
            "Smoking suppresses the immune cells deep in the lungs, impairing their ability to engulf and kill bacteria. Recovery is gradual — those only 2 months abstinent show the most impairment, while function improves steadily with longer abstinence. By 6 months, pulmonary immune defences have substantially recovered.\n\n"
            "What this means\n"
            "The lungs can clear inhaled bacteria and particles more effectively, reducing susceptibility to colds, flu, and pneumonia.\n\n"
            "Immune defences keep improving beyond six months — but by now the body's protection is markedly stronger than it was in those early weeks.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.smokingMilestone365Title,
        description: l10n.smokingMilestone365Description,
        reference: "PMC - Smoking Cessation and Stroke Outcome",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5644463/",
        referenceDate: "March 2026",
        referenceContent:
            "One Year: Stroke Risk Substantially Reduced\n\n"
            "Source: PMC — Smoking Cessation and Stroke Outcome\n\n"
            "Smoking roughly doubles stroke risk by promoting artery plaque buildup, increasing blood clotting, raising blood pressure, and damaging cerebral blood vessels. One year after quitting, stroke risk is substantially reduced — beginning to approach non-smoker levels.\n\n"
            "Heart disease at one year\n"
            "Coronary heart disease risk is approximately halved compared to continued smoking.\n\n"
            "One year is a genuine medical milestone — measurable risk reduction across cancer, cardiovascular disease, stroke, and lung disease. The body's capacity for recovery is one of the most documented facts in preventive medicine.",
      ),
      QuitMilestone(
        day: 1825,
        title: l10n.smokingMilestone1825Title,
        description: l10n.smokingMilestone1825Description,
        reference: "CDC - Benefits of Quitting Smoking",
        link: "https://www.cdc.gov/tobacco/about/how-to-quit.html",
        referenceDate: "March 2026",
        referenceContent:
            "Five Years: Cancer Risk Plummets\n\n"
            "Source: CDC\n\n"
            "At five years, some of the most dramatic cancer benefits arrive.\n\n"
            "Five-year milestones\n"
            "• Mouth, throat, oesophagus, and bladder cancer risk: halved\n"
            "• Cervical cancer risk: returns to non-smoker levels\n"
            "• Stroke risk: similar to a non-smoker\n"
            "• Coronary heart disease risk: at the level of a non-smoker\n\n"
            "Looking ahead to ten years\n"
            "• Lung cancer death risk: roughly half that of a continuing smoker\n"
            "• Cancers of the mouth, throat, oesophagus, bladder, kidney, and pancreas continue to decrease\n\n"
            "Five years of not smoking is a profound achievement — a biological transformation that has meaningfully extended life expectancy.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: pageTitle ?? l10n.smokingPageTitle,
      storageKey: storageKey,
      milestones: _getMilestones(l10n),
      headerStarted: headerStarted ?? l10n.smokingHeaderStarted,
      headerNotStarted: headerNotStarted ?? l10n.smokingHeaderNotStarted,
      subtitleStarted: subtitleStarted ?? l10n.smokingSubtitleStarted,
      subtitleNotStarted: subtitleNotStarted ?? l10n.smokingSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
