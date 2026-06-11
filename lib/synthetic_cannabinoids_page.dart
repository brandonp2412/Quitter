import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class SyntheticCannabinoidsPage extends StatelessWidget {
  final bool started;

  const SyntheticCannabinoidsPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.synthetic_cannabinoidsMilestone1Title,
        description: l10n.synthetic_cannabinoidsMilestone1Description,
        reference: "Adverse Effects of Synthetic Cannabinoids (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4923337/",
        referenceDate: "June 2026",
        referenceContent:
            "Synthetic Cannabinoid Withdrawal: Day One\n\nSource: \"Adverse Effects of Synthetic Cannabinoids: Management of Acute Toxicity and Withdrawal,\" on PubMed Central\n\nWhy It Is Harsher Than Cannabis\nSynthetic cannabinoid receptor agonists (“Spice”, “K2”) are they bind to the brain's cannabis receptors far more strongly than THC does. The withdrawal syndrome is similar to cannabis withdrawal but more severe, and notably does not improve with THC.\n\nEarly Symptoms\n• Anxiety and irritability\n• Fast heart rate (tachycardia) and sweating\n• Sleep problems\n• Cravings\n\nA Safety Note\nProducts vary widely in composition and potency. Heavy daily users can have intense withdrawal and may need medically supported detox.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.synthetic_cannabinoidsMilestone3Title,
        description: l10n.synthetic_cannabinoidsMilestone3Description,
        reference: "Adverse Effects of Synthetic Cannabinoids (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4923337/",
        referenceDate: "June 2026",
        referenceContent:
            "Synthetic Cannabinoid Withdrawal: Peak\n\nSource: \"Adverse Effects of Synthetic Cannabinoids: Management of Acute Toxicity and Withdrawal,\" on PubMed Central\n\nThe Peak\nWithdrawal symptoms generally peak within the first few days. Surveys of users most often report sleep problems, irritability, and low mood, alongside the anxiety and tachycardia that mark the acute phase.\n\nGetting Through It\nSupportive care, hydration, and rest help. Because some products contain other active compounds, any severe agitation, chest pain, or confusion warrants medical attention.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.synthetic_cannabinoidsMilestone7Title,
        description: l10n.synthetic_cannabinoidsMilestone7Description,
        reference: "Adverse Effects of Synthetic Cannabinoids (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4923337/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Off Synthetic Cannabinoids\n\nSource: \"Adverse Effects of Synthetic Cannabinoids: Management of Acute Toxicity and Withdrawal,\" on PubMed Central\n\nThe Acute Window Closes\nThe most intense withdrawal symptoms typically begin to ease within about a week, though sleep and mood take longer to fully normalise.\n\nWhat Remains\n• Irritability and low mood\n• Disrupted sleep\n• Intermittent cravings\n\nThis is a high-risk point for relapse; structure and support help carry the progress forward.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.synthetic_cannabinoidsMilestone14Title,
        description: l10n.synthetic_cannabinoidsMilestone14Description,
        reference: "Adverse Effects of Synthetic Cannabinoids (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4923337/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Off Synthetic Cannabinoids\n\nSource: \"Adverse Effects of Synthetic Cannabinoids: Management of Acute Toxicity and Withdrawal,\" on PubMed Central\n\nSettling\nWith the acute phase past, the racing heart and blood pressure issues have settled and sleep and mood are steadier. A post-acute phase of milder mood and sleep disturbance can continue for some people.\n\nWhy Stay the Course\nSynthetic cannabinoids carry serious toxicity risks well beyond withdrawal — unpredictable potency, agitation, and medical emergencies. Two weeks free removes that ongoing danger entirely.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.synthetic_cannabinoidsMilestone30Title,
        description: l10n.synthetic_cannabinoidsMilestone30Description,
        reference: "Adverse Effects of Synthetic Cannabinoids (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4923337/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Off Synthetic Cannabinoids\n\nSource: \"Adverse Effects of Synthetic Cannabinoids: Management of Acute Toxicity and Withdrawal,\" on PubMed Central\n\nWhere One Month Sits\nBy a month the withdrawal syndrome has largely resolved for most people. Sleep, mood, and concentration are clearer, and cravings are less frequent.\n\nStaying Free\nBecause these products are potent and inconsistent, returning even once carries real risk. The routines and supports built over this month are what keep use from restarting.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.synthetic_cannabinoidsMilestone90Title,
        description: l10n.synthetic_cannabinoidsMilestone90Description,
        reference: "Adverse Effects of Synthetic Cannabinoids (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4923337/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Off Synthetic Cannabinoids\n\nSource: \"Adverse Effects of Synthetic Cannabinoids: Management of Acute Toxicity and Withdrawal,\" on PubMed Central\n\nA Steadier Baseline\nBy three months the brain's the brain's cannabis receptor system has rebalanced after the intense stimulation of synthetic agonists. Mood and sleep are stable and cravings are infrequent.\n\nThe Bigger Picture\nThree months is a strong foundation. Staying connected to support keeps it secure and makes the rare craving easy to ride out.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.synthetic_cannabinoidsMilestone180Title,
        description: l10n.synthetic_cannabinoidsMilestone180Description,
        reference: "Adverse Effects of Synthetic Cannabinoids (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4923337/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Off Synthetic Cannabinoids\n\nSource: \"Adverse Effects of Synthetic Cannabinoids: Management of Acute Toxicity and Withdrawal,\" on PubMed Central\n\nHalf a Year On\nWell beyond withdrawal, mood, sleep, and cognition are stable, and the unpredictable medical dangers of synthetic cannabinoid use are entirely behind you.\n\nThe Bigger Picture\nSix months free is strong evidence the change has held. The habits and connections that got you here are worth protecting.",
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
