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
            "Kratom Withdrawal: The First Day\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nWhy Withdrawal Happens\nKratom's active compounds work on the same brain receptors as opioids. With regular use the body adapts, so stopping produces an opioid-like withdrawal. NIDA notes that people who use kratom regularly can develop dependence and report withdrawal symptoms when they stop.\n\nDay One Symptoms\nEarly withdrawal typically begins within 6–12 hours and resembles a milder opioid withdrawal:\n• Restlessness, anxiety, and irritability\n• Muscle aches and runny nose\n• Sweating and watery eyes\n• Cravings\n\nA Note on Severity\nWithdrawal is more intense if kratom was used at high doses or alongside opioids. In those cases, supervised medical support is worth seeking — treatments like buprenorphine can be used to manage it.",
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
            "One Week Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nPast the Peak\nThe acute physical symptoms — muscle aches, sweating, nausea — have mostly settled. What remains is largely psychological: fatigue, disrupted sleep, and a low mood that comes from the opioid receptors adjusting back to running on the body's own natural signals.\n\nA Real Risk\nThis is one of the most common points for relapse — not because symptoms are at their worst, but because tolerance has dropped sharply. Returning to a previous dose, particularly if opioids are involved, is now genuinely dangerous. Getting through this week intact is a significant step.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.kratomMilestone14Title,
        description: l10n.kratomMilestone14Description,
        reference: "Kratom (Mitragyna speciosa) — NIDA",
        link: "https://nida.nih.gov/research-topics/kratom",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nRecalibrating\nThe opioid receptors that kratom was stimulating are gradually restoring their sensitivity to the body's own natural signals. That recalibration is the source of both the improving mood and the lingering flatness — the brain is learning to run without artificial stimulation again.\n\nWhat Improves\n• Appetite and energy return noticeably in week two\n• Sleep becomes more reliable\n• Mood steadies, though still variable\n\nCravings are still triggered by stress and familiar cues. Having a plan for them — particularly in the evenings or after poor sleep — remains useful.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.kratomMilestone30Title,
        description: l10n.kratomMilestone30Description,
        reference: "Kratom (Mitragyna speciosa) — NIDA",
        link: "https://nida.nih.gov/research-topics/kratom",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nThings Start Feeling Good Again\nThe clearest marker of a month off is hedonic — the return of ordinary pleasure. Food tastes better, activities are more enjoyable, company feels more rewarding. That is the brain's reward system recovering from sustained opioid stimulation.\n\nA Month Builds Structure\nA month of not using has replaced a month of using with something else. Sleep, meals, and routine are more consistent. Cravings arrive less often and feel more manageable when they do. Relapse risk is lower than in early weeks, but high-stress moments remain the most vulnerable ones.",
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
