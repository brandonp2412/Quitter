import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class KetaminePage extends StatelessWidget {
  final bool started;

  const KetaminePage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.ketamineMilestone1Title,
        description: l10n.ketamineMilestone1Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "June 2026",
        referenceContent:
            "Stopping Ketamine: Day One\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review of the Urologic Effects of This Psychoactive Drug,\" on PubMed Central\n\nWithdrawal Is Mainly Psychological\nUnlike opioids or alcohol, ketamine rarely produces severe physical withdrawal. Discontinuation is generally safe; people more often struggle with cravings and psychological dependence than physical illness.\n\nWhat You May Feel\n• Mood swings and low mood\n• Cravings\n• Occasional sweating or palpitations\n\nThe Key Step\nFor anyone with bladder symptoms, immediate and complete cessation is the obligatory starting point for recovery — so day one is the most important decision of all.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.ketamineMilestone7Title,
        description: l10n.ketamineMilestone7Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nThe Psychological Phase\nThe main challenge in early ketamine cessation is psychological: cravings, altered or low mood, and some cognitive fog. Physical withdrawal, when present, is usually mild.\n\nCognitive fog is common at this stage — concentration feels effortful, reaction time is slower, and short-term memory may feel unreliable. These effects are temporary and typically clear substantially within the next week or two.\n\nBladder Symptoms\nIf you have ketamine-induced cystitis (urinary urgency, frequency, pain, or blood in urine), stopping now gives the bladder its best chance to heal. Pain can tempt people back to ketamine to self-medicate — a cycle worth breaking with proper pain support instead.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.ketamineMilestone14Title,
        description: l10n.ketamineMilestone14Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nClearer Thinking\nWith the drug fully cleared, the mental fog and disconnected thinking associated with regular ketamine use begin to lift. Memory and concentration improve and mood steadies.\n\nBladder Recovery Beginning\nFor early-stage cystitis, the review notes that simply stopping is often enough — and symptoms reverse in about half of early cases. Two weeks of abstinence is the start of that process.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.ketamineMilestone30Title,
        description: l10n.ketamineMilestone30Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nBladder Recovery\nThe single most important treatment for ketamine-induced cystitis is stopping ketamine. The review reports that in early cases, cessation alone reverses symptoms and improves bladder function in about 51% of patients. Earlier you stop, the better the outcome.\n\nMind and Mood\nCognition and mood continue to clear at one month. Psychological and social support meaningfully improves the odds of staying stopped — cessation works best when it is supported.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.ketamineMilestone90Title,
        description: l10n.ketamineMilestone90Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nContinued Recovery\nBladder recovery after ketamine is often gradual; the review describes symptom severity improving after cessation, though it can be prolonged and variable. Three months gives the urinary tract sustained time to heal in cases that are going to respond.\n\nMind\nCognitive function and mood are markedly clearer than in early abstinence, and cravings are less frequent. Persistent or severe bladder symptoms should be assessed by a urologist.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.ketamineMilestone180Title,
        description: l10n.ketamineMilestone180Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nHalf a Year On\nWith sustained abstinence, bladder symptoms continue to improve in cases that respond to cessation, and cognition and mood are stable. The compulsion to use has weakened considerably.\n\nAn Honest Note\nRecovery of established bladder damage can be incomplete, which is why early cessation matters so much. Whatever stage you stopped at, staying off gives the bladder its best possible outcome.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.ketamineMilestone365Title,
        description: l10n.ketamineMilestone365Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "June 2026",
        referenceContent:
            "One Year Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nA Year On\nTwelve months of abstinence gives the bladder, in early-caught cases, the fullest chance to recover, and leaves cognition and mood stable and clear. The psychological dependence that made stopping hard has largely faded.\n\nThe Bigger Picture\nA year free is a profound change — in physical health, clarity, and self-direction. Keeping the support that got you here protects it.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.ketaminePageTitle,
      storageKey: 'ketamine',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.ketamineHeaderStarted,
      headerNotStarted: l10n.ketamineHeaderNotStarted,
      subtitleStarted: l10n.ketamineSubtitleStarted,
      subtitleNotStarted: l10n.ketamineSubtitleNotStarted,
      infoBoxMessage: l10n.ketamineInfoBox,
      initialStarted: started,
    );
  }
}
