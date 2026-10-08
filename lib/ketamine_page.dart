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
        localizedReferenceContent: l10n.ketamineReferenceDay1,
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
        localizedReferenceContent: l10n.ketamineReferenceDay7,
        referenceContent:
            "One Week Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nThe Psychological Phase\nThe main challenge in early ketamine cessation is psychological: cravings, altered or low mood, and some brain fog. Physical withdrawal, when present, is usually mild.\n\nBrain fog is common at this stage — concentration feels effortful, reaction time is slower, and short-term memory may feel unreliable. These effects on thinking and memory improve with abstinence: a longitudinal study of 114 ketamine users found significant gains in verbal memory, visual memory, processing speed, and planning, focus, and decision-making after 12 weeks without ketamine.\n\nBladder Symptoms\nIf you have ketamine-induced cystitis (urinary urgency, frequency, pain, or blood in urine), stopping now gives the bladder its best chance to heal. Pain can tempt people back to ketamine to self-medicate — a cycle worth breaking with proper pain support instead.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.ketamineMilestone14Title,
        description: l10n.ketamineMilestone14Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.ketamineReferenceDay14,
        referenceContent:
            "Two Weeks Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nClearer Thinking\nWith the drug fully cleared, the mental fog and disconnected thinking associated with regular ketamine use begin to lift. Memory and concentration improve and mood steadies.\n\nBladder Recovery Beginning\nFor early-stage cystitis, the review emphasizes that simply stopping ketamine is the single most important step toward reversing symptoms, and that earlier cessation gives the best odds of recovery before damage becomes permanent. Two weeks of abstinence is the start of that process.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.ketamineMilestone30Title,
        description: l10n.ketamineMilestone30Description,
        reference:
            "Winstock et al., Prevalence and Natural History of Urinary Symptoms Among Recreational Ketamine Users, BJU International (2012)",
        link: "https://pubmed.ncbi.nlm.nih.gov/22416998/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.ketamineReferenceDay30,
        referenceContent:
            "One Month Off Ketamine\n\nSource: \"Prevalence and Natural History of Urinary Symptoms Among Recreational Ketamine Users,\" Winstock et al., BJU International (2012)\n\nBladder Recovery\nThe single most important treatment for ketamine-induced cystitis is stopping ketamine. This study of recreational ketamine users found that 51% of those with urinary symptoms reported improvement after stopping use, while under 4% got worse. Earlier you stop, the better the outcome.\n\nMind and Mood\nCognition and mood continue to clear at one month. Psychological and social support meaningfully improves the odds of staying stopped — cessation works best when it is supported.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.ketamineMilestone90Title,
        description: l10n.ketamineMilestone90Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.ketamineReferenceDay90,
        referenceContent:
            "Three Months Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nContinued Recovery\nBladder recovery after ketamine is often gradual; the review describes symptom severity improving after cessation, though it can be prolonged and variable. Three months gives the urinary tract sustained time to heal in cases that are going to respond.\n\nMind\nClear thinking and mood are markedly clearer than in early abstinence, and cravings are less frequent. Persistent or severe bladder symptoms should be assessed by a urologist.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.ketamineMilestone180Title,
        description: l10n.ketamineMilestone180Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.ketamineReferenceDay180,
        referenceContent:
            "Six Months Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nHalf a Year On\nWith sustained abstinence, bladder symptoms continue to improve in cases that respond to cessation, and thinking and memory and mood are stable. The compulsion to use has weakened considerably.\n\nRecovery Signal\nRecovery of established bladder damage can be incomplete, which is why early cessation matters so much. Whatever stage you stopped at, staying off gives the bladder its best possible outcome.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.ketamineMilestone365Title,
        description: l10n.ketamineMilestone365Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.ketamineReferenceDay365,
        referenceContent:
            "One Year Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nA Year On\nTwelve months of abstinence gives the bladder, in early-caught cases, the fullest chance to recover, and leaves thinking and memory and mood stable and clear. The psychological dependence that made stopping hard has largely faded.\n\nThe Bigger Picture\nA year free is a profound change — in physical health, clarity, and self-direction. Keeping the support that got you here protects it.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.ketamineMilestone730Title,
        description: l10n.ketamineMilestone730Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.ketamineReferenceDay730,
        referenceContent:
            "Two Years Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review of the Urologic Effects of This Psychoactive Drug,\" on PubMed Central\n\nWhat the Evidence Says\nA 2022 review says stopping ketamine is strongly recommended for ketamine-induced cystitis. Early disease often improves after cessation, while recovery can be incomplete when injury is more advanced.\n\nTwo Years\nThe review does not define a universal two-year biological finish line. This milestone celebrates sustained progress and continued distance from renewed ketamine exposure without promising the same medical outcome for everyone.",
      ),
      QuitMilestone(
        day: 1095,
        title: l10n.ketamineMilestone1095Title,
        description: l10n.ketamineMilestone1095Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.ketamineReferenceDay1095,
        referenceContent:
            "Three Years Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review of the Urologic Effects of This Psychoactive Drug,\" on PubMed Central\n\nRecovery Has No Single Clock\nThe review supports ketamine cessation as the foundation of recovery from ketamine-induced cystitis and notes that outcomes depend on how advanced the injury is. It does not identify a special three-year recovery threshold.\n\nThree Years\nThree years is durable progress: another full year maintained away from ketamine. Long-term recovery can continue, but individual outcomes still depend on prior exposure and any existing injury.",
      ),
      QuitMilestone(
        day: 1460,
        title: l10n.ketamineMilestone1460Title,
        description: l10n.ketamineMilestone1460Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.ketamineReferenceDay1460,
        referenceContent:
            "Four Years Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review of the Urologic Effects of This Psychoactive Drug,\" on PubMed Central\n\nLong-Term Progress\nStopping ketamine helps prevent further ketamine-related urinary tract injury, and early ketamine-induced cystitis can improve after cessation. More advanced damage may need additional treatment and can recover incompletely.\n\nFour Years\nThe evidence does not assign a distinct biological event to year four. Four years instead marks a strong, sustained recovery foundation without turning an anniversary into a medical promise.",
      ),
      QuitMilestone(
        day: 1825,
        title: l10n.ketamineMilestone1825Title,
        description: l10n.ketamineMilestone1825Description,
        reference: "Ketamine-Induced Cystitis: A Comprehensive Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9476224/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.ketamineReferenceDay1825,
        referenceContent:
            "Five Years Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review of the Urologic Effects of This Psychoactive Drug,\" on PubMed Central\n\nA Major Long-Term Milestone\nThe review supports continued ketamine cessation because it can improve urinary symptoms and helps prevent further ketamine-related urinary tract damage. Recovery remains individual, especially after severe injury.\n\nFive Years\nFive years is substantial sustained progress. The research does not define it as a universal biological endpoint, so this milestone celebrates the time and recovery foundation built rather than claiming a guaranteed cure.",
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
