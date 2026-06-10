import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class KratomPage extends StatelessWidget {
  final bool started;

  const KratomPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.kratomMilestone1Title,
        description: l10n.kratomMilestone1Description,
        reference: "Kratom (Mitragyna speciosa) — NIDA",
        link: "https://nida.nih.gov/research-topics/kratom",
        referenceDate: "June 2026",
        referenceContent:
            "Kratom Withdrawal: The First Day\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nWhy Withdrawal Happens\nKratom's main alkaloids, mitragynine and 7-hydroxymitragynine, act on the brain's mu-opioid receptors. With regular use the body adapts, so stopping produces an opioid-like withdrawal. NIDA notes that people who use kratom regularly can develop dependence and report withdrawal symptoms when they stop.\n\nDay One Symptoms\nEarly withdrawal typically begins within 6–12 hours and resembles a milder opioid withdrawal:\n• Restlessness, anxiety, and irritability\n• Muscle aches and runny nose\n• Sweating and watery eyes\n• Cravings\n\nA Safety Note\nIf you have used kratom heavily, or together with opioids, withdrawal can be more intense. Buprenorphine and other opioid treatments have been used under medical supervision to manage kratom withdrawal — worth discussing with a clinician.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.kratomMilestone3Title,
        description: l10n.kratomMilestone3Description,
        reference: "Kratom (Mitragyna speciosa) — NIDA",
        link: "https://nida.nih.gov/research-topics/kratom",
        referenceDate: "June 2026",
        referenceContent:
            "Kratom Withdrawal: Peak Intensity\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nThe Peak\nLike other short-acting opioids, kratom withdrawal tends to build over the first couple of days and peak around days 2–3 before easing.\n\nSymptoms at the Peak\n• Muscle and joint aches, restless legs\n• Insomnia despite exhaustion\n• Nausea, stomach cramps, and diarrhoea\n• Marked anxiety, low mood, and irritability\n• Strong cravings\n\nGetting Through It\nThis is usually the worst day. Hydration, rest, and symptomatic support help; clonidine and short-term anti-nausea or sleep aids are sometimes used. Knowing the acute phase is short makes it easier to ride out.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.kratomMilestone7Title,
        description: l10n.kratomMilestone7Description,
        reference: "Kratom (Mitragyna speciosa) — NIDA",
        link: "https://nida.nih.gov/research-topics/kratom",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nEnd of Acute Withdrawal\nKratom's acute withdrawal is generally shorter than that of stronger opioids. By the end of the first week the most intense physical symptoms — muscle aches, sweating, GI upset — have usually settled.\n\nWhat Remains\n• Fatigue and low energy\n• Disrupted sleep that takes time to normalise\n• Low mood and episodic cravings\n\nThis is a common point for relapse, so continued support matters. Because tolerance falls during abstinence, returning to a previous dose — especially of opioids — is dangerous.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.kratomMilestone14Title,
        description: l10n.kratomMilestone14Description,
        reference: "Kratom (Mitragyna speciosa) — NIDA",
        link: "https://nida.nih.gov/research-topics/kratom",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nThe Post-Acute Phase\nWith the acute syndrome over, the lingering symptoms are the protracted ones — sleep disturbance, variable mood, and intermittent cravings — which are typically milder now than in the first week.\n\nWhat Improves\n• Sleep becomes more reliable\n• Appetite and energy return\n• Mood steadies as the opioid system re-regulates\n\nCravings can still be triggered by stress or cues, so having a plan for them remains useful.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.kratomMilestone30Title,
        description: l10n.kratomMilestone30Description,
        reference: "Kratom (Mitragyna speciosa) — NIDA",
        link: "https://nida.nih.gov/research-topics/kratom",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nWhere One Month Sits\nThe acute and most of the protracted withdrawal is behind you. The reward system, suppressed by regular opioid-receptor stimulation, is recovering, so ordinary pleasures start to feel rewarding again.\n\nWhat People Notice\n• More stable mood and energy\n• Better sleep\n• Less frequent, more manageable cravings\n\nRelapse risk is lower than in early withdrawal but not gone; ongoing support and avoiding high-risk situations protect your progress.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.kratomMilestone90Title,
        description: l10n.kratomMilestone90Description,
        reference: "Kratom (Mitragyna speciosa) — NIDA",
        link: "https://nida.nih.gov/research-topics/kratom",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nA Steadier Baseline\nBy three months the reward and stress systems have had sustained time without opioid-receptor stimulation to settle toward their natural balance. People commonly report clearer thinking, steadier motivation, and stronger control over cravings.\n\nWhy It Matters\nThe further you get from active use, the more the day-to-day pull of kratom fades — making this milestone a solid foundation for lasting recovery.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.kratomMilestone365Title,
        description: l10n.kratomMilestone365Description,
        reference: "Kratom (Mitragyna speciosa) — NIDA",
        link: "https://nida.nih.gov/research-topics/kratom",
        referenceDate: "June 2026",
        referenceContent:
            "One Year Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nA Year On\nWell past acute and protracted withdrawal, the brain's opioid and reward systems have re-regulated and the routines that sustained use have been replaced. Cravings are infrequent and far easier to manage.\n\nThe Bigger Picture\nA year of abstinence is a profound change in health, finances, and self-direction. Staying connected to support keeps that progress secure.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.kratomPageTitle,
      storageKey: 'kratom',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.kratomHeaderStarted,
      headerNotStarted: l10n.kratomHeaderNotStarted,
      subtitleStarted: l10n.kratomSubtitleStarted,
      subtitleNotStarted: l10n.kratomSubtitleNotStarted,
      infoBoxMessage: l10n.kratomInfoBox,
      initialStarted: started,
    );
  }
}
