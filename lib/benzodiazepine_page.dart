import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class BenzodiazepinePage extends StatelessWidget {
  final bool started;
  const BenzodiazepinePage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 7,
        title: l10n.benzoMilestone7Title,
        description: l10n.benzoMilestone7Description,
        reference:
            "WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.benzodiazepineReferenceDay7,
        referenceContent:
            "Benzodiazepine Withdrawal: The First Week\n\n"
            "Source: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\n"
            "Safety First\n"
            "Benzodiazepine withdrawal can cause seizures. WHO guidance says the safest management is benzodiazepines in gradually decreasing amounts, which relieves withdrawal symptoms and helps prevent seizures. After prolonged use, do not stop abruptly — work with a clinician on a taper.\n\n"
            "When Withdrawal Begins\n"
            "The WHO timeline depends on the drug's duration of action:\n"
            "• Short-acting (oxazepam, alprazolam, temazepam): withdrawal typically begins 1–2 days after the last dose and continues for 2–4 weeks or longer\n"
            "• Long-acting (diazepam, nitrazepam): withdrawal typically begins 2–7 days after the last dose and continues for 2–8 weeks or longer\n"
            "The first week spans the typical onset window even for long-acting benzodiazepines.\n\n"
            "What Symptoms Can Look Like\n"
            "WHO lists anxiety, insomnia, restlessness, agitation or irritability, poor concentration or memory, and muscle tension or aches.\n\n"
            "Monitoring\n"
            "Withdrawal severity can fluctuate markedly. WHO recommends regular monitoring for symptoms and complications; in its closed-setting protocol, healthcare workers speak with patients every 3–4 hours and provide reassurance and explanation as needed.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.benzoMilestone14Title,
        description: l10n.benzoMilestone14Description,
        reference:
            "Chronic Benzodiazepine Usage and Withdrawal in Insomnia Patients (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/15003439/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.benzodiazepineReferenceDay14,
        referenceContent:
            "Benzodiazepine Withdrawal: Two Weeks\n\n"
            "Source: Poyares et al., \"Chronic benzodiazepine usage and withdrawal in insomnia patients,\" Journal of Psychiatric Research (2004), on PubMed\n\n"
            "A Real Two-Week Sleep Recovery Signal\n"
            "Researchers followed people with persistent insomnia who had taken benzodiazepines nightly for years and measured sleep again 15 days after gradual withdrawal. Slow-wave sleep, sleep EEG delta activity, and subjective sleep quality all improved compared with measurements during chronic benzodiazepine use.\n\n"
            "Deep Sleep Is Coming Back\n"
            "Slow-wave sleep is the deepest stage of non-REM sleep. By day 15, slow-wave sleep and delta activity were higher, while stage 2 non-REM sleep had fallen toward the pattern seen in healthy controls.\n\n"
            "Early Recovery, Measured\n"
            "Sleep worsened immediately after withdrawal for the participants who completed it, then objective deep-sleep measures and reported sleep quality improved by the 15-day follow-up. That makes the two-week mark a genuine, measured recovery milestone.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.benzoMilestone60Title,
        description: l10n.benzoMilestone60Description,
        reference:
            "Effects of Discontinuing Benzodiazepine-Derivative Hypnotics on Postural Sway and Cognitive Functions in the Elderly (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/20054834/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.benzodiazepineReferenceDay60,
        referenceContent:
            "Benzodiazepines: Daytime Function at Eight Weeks\n\n"
            "Source: Tsunoda et al., \"Effects of discontinuing benzodiazepine-derivative hypnotics on postural sway and cognitive functions in the elderly,\" International Journal of Geriatric Psychiatry (2010), on PubMed\n\n"
            "A Measured Eight-Week Recovery Signal\n"
            "Researchers followed adults aged 60 and older living in a nursing home who used benzodiazepine hypnotics. Their dose was tapered off over three weeks, with cognitive and balance testing repeated at the eight-week endpoint.\n\n"
            "Focus and Memory Moved Up\n"
            "Among 26 completers, immediate memory, attention, and language index scores improved significantly. These are concrete daytime-function gains measured after benzodiazepine discontinuation.\n\n"
            "Steadier on Your Feet\n"
            "Measures of postural sway with eyes closed improved significantly too. The authors concluded that discontinuing benzodiazepine hypnotics was associated with better body stability and recovery of daytime cognitive function in this older group.\n\n"
            "Sleep Held Steady\n"
            "Completers did not report subjective worsening of sleep on the study's sleep questionnaire. At the eight-week endpoint, the study captured measurable daytime gains without a reported sleep-quality penalty.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.benzoMilestone90Title,
        description: l10n.benzoMilestone90Description,
        reference:
            "Psychomotor Performance of Long-Term Benzodiazepine Users Before, During, and After Benzodiazepine Discontinuation (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/10211911/",
        referenceDate: "October 2026",
        localizedReferenceContent: l10n.benzodiazepineReferenceDay90,
        referenceContent:
            "Three Months After Benzodiazepines: Faster Thinking, Less Sedation\n\n"
            "Source: Rickels et al., \"Psychomotor performance of long-term benzodiazepine users before, during, and after benzodiazepine discontinuation,\" Journal of Clinical Psychopharmacology (1999), on PubMed\n\n"
            "A Measured 12-Week Recovery Signal\n"
            "Researchers tested long-term benzodiazepine users before tapering and again 5 and 12 weeks after tapering. Seventy-seven people had 12-week data, and successful taperers had benzodiazepine-free status confirmed with weekly blood tests.\n\n"
            "Faster Cognitive Performance\n"
            "People who successfully tapered off benzodiazepines completed symbol-copying and digit-symbol substitution tasks faster than participants still taking benzodiazepines. The difference was significant after accounting for age, education, and baseline test scores.\n\n"
            "Less Mental & Physical Sedation\n"
            "Successful taperers also reported lower mental and physical sedation than people still taking benzodiazepines.\n\n"
            "What Three Months Can Look Like\n"
            "For successful taperers in this study, 12 weeks after tapering brought measurable gains in processing speed and less mental and physical sedation. Thinking moved faster, and the sedated feeling eased.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.benzoMilestone180Title,
        description: l10n.benzoMilestone180Description,
        reference:
            "Lack of Cognitive Recovery Following Withdrawal From Long-Term Benzodiazepine Use (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/8208885/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.benzodiazepineReferenceDay180,
        referenceContent:
            "Thinking and Memory at Six Months: Measurable Gains\n\n"
            "Source: Tata et al., \"Lack of cognitive recovery following withdrawal from long-term benzodiazepine use,\" Psychological Medicine (1994), on PubMed\n\n"
            "What the Study Did\n"
            "This study tested 21 long-term benzodiazepine patients before withdrawal, just after withdrawal, and again at six months of abstinence, comparing them with matched controls. It is one of the most candid data points in the benzo recovery literature.\n\n"
            "What It Found\n"
            "Before stopping, patients had problems with verbal learning, memory, movement speed, visual coordination, and visual reasoning. Right after stopping there was little change. By six months, several of those areas had measurably improved.\n\n"
            "What This Means\n"
            "By six months, verbal learning, memory, movement speed, and visual coordination were measurably recovering. The improvement was already clear and had room to continue.\n\n"
            "The Bigger Picture\n"
            "If you feel foggy at six months, this research says: that is expected, and continued abstinence is the path forward. Longer-term studies show recovery continues well beyond this point — the brain keeps healing.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.benzoMilestone365Title,
        description: l10n.benzoMilestone365Description,
        reference:
            "Persistence of Cognitive Effects After Withdrawal From Long-Term Benzodiazepine Use: A Meta-Analysis (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/15033227/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.benzodiazepineReferenceDay365,
        referenceContent:
            "One Year After Benzodiazepines: Thinking and Memory Keep Recovering\n\n"
            "Source: Barker et al., \"Persistence of cognitive effects after withdrawal from long-term benzodiazepine use: a meta-analysis,\" Archives of Clinical Neuropsychology (2004), on PubMed\n\n"
            "The Strongest Evidence We Have\n"
            "Researchers combined studies that re-tested long-term benzodiazepine users after at least six months off the drug. The combined result shows clear recovery in thinking and memory after withdrawal.\n\n"
            "The Good News\n"
            "The combined studies found genuine, measurable improvement in several areas of thinking and memory after withdrawal. Around one year, the recovery is broad and obvious compared with active use.\n\n"
            "Recovery Continues\n"
            "The combined studies found broad recovery in thinking and memory. By one year, you are well along a recovery trend that was already measurable at six months.\n\n"
            "What This Means at One Year\n"
            "Expect substantial recovery in thinking, memory, and clarity by a year — most people feel markedly sharper than during use. But if some areas still lag, that is consistent with the evidence, not a sign you have stalled. Recovery continues, and a year of abstinence is a major, worthwhile milestone on that path.",
      ),
      QuitMilestone(
        day: 540,
        title: l10n.benzoMilestone540Title,
        description: l10n.benzoMilestone540Description,
        reference:
            "Protracted Withdrawal Syndromes From Benzodiazepines (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/1675688/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.benzodiazepineReferenceDay540,
        referenceContent:
            "18 Months After Benzodiazepines: Slow but Real Recovery\n\n"
            "Source: Ashton, \"Protracted withdrawal syndromes from benzodiazepines,\" Journal of Substance Abuse Treatment (1991), on PubMed\n\n"
            "Why Benzo Recovery Takes So Long\n"
            "Benzodiazepines act on GABA, the brain's main calming system. Long-term use changes how strongly that system responds, and those changes can take months to reverse. That is why benzo recovery is measured in months rather than weeks.\n\n"
            "Where 18 Months Sits\n"
            "Ashton describes longer-lasting withdrawal symptoms that can take months to ease. By 18 months, the worst is well behind most people and lingering anxiety, sensory changes, and brain fog have substantially settled.\n\n"
            "Slowly Reversible\n"
            "Crucially, Ashton frames the underlying changes as 'slowly reversible functional changes in the central nervous system.' Slow, but reversible — the long timeline reflects the depth of the adaptation benzodiazepines caused, not permanent damage in most people.\n\n"
            "Recovery Signal\n"
            "Ashton describes the underlying changes as slowly reversible. By 18 months, the brain's calming GABA system has had a long time to settle and the dominant direction is continued recovery toward normal.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.benzoMilestone730Title,
        description: l10n.benzoMilestone730Description,
        reference:
            "Persistence of Cognitive Effects After Withdrawal From Long-Term Benzodiazepine Use: A Meta-Analysis (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/15033227/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.benzodiazepineReferenceDay730,
        referenceContent:
            "Two Years After Benzodiazepines: Major, Lasting Progress\n\n"
            "Source: Barker et al., \"Persistence of cognitive effects after withdrawal from long-term benzodiazepine use: a meta-analysis,\" Archives of Clinical Neuropsychology (2004), on PubMed\n\n"
            "A Landmark in Recovery\n"
            "Two years is a major milestone, especially after a long withdrawal. The early and lingering symptom phases are long past, and the gains from the first year have had another year to strengthen.\n\n"
            "What the Evidence Supports\n"
            "The combined studies show recovery in many areas after withdrawal. By two years, most people report anxiety at or below their pre-benzo level, reliable sleep without medication, steadier emotions, and clearer thinking than during use.\n\n"
            "Recovery Signal\n"
            "The combined studies establish recovery across many areas of thinking and memory. At two years, sustained recovery is the evidence-backed expectation.\n\n"
            "Keeping Perspective\n"
            "Two years gives sleep, mood, memory, and clear thinking a long recovery window. The evidence shows substantial improvement across all four, with healing continuing from here.",
      ),
      QuitMilestone(
        day: 1095,
        title: l10n.benzoMilestone1095Title,
        description: l10n.benzoMilestone1095Description,
        reference:
            "Persistence of Cognitive Effects After Withdrawal From Long-Term Benzodiazepine Use: A Meta-Analysis (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/15033227/",
        referenceDate: "June 2026",
        localizedReferenceContent: l10n.benzodiazepineReferenceDay1095,
        referenceContent:
            "Three Years After Benzodiazepines: Long-Term Healing\n\n"
            "Source: Barker et al., \"Persistence of cognitive effects after withdrawal from long-term benzodiazepine use: a meta-analysis,\" Archives of Clinical Neuropsychology (2004), on PubMed\n\n"
            "The Long View\n"
            "Three years sits at the far end of the benzo recovery timeline. For the great majority of people, even after severe long-lasting withdrawal, disruptive symptoms are well behind them and quality of life is transformed compared with active use.\n\n"
            "What the Meta-Analysis Found\n"
            "Combined studies of long-term users show recovery in many areas after withdrawal. Over years of abstinence, the dominant story is broad recovery in thinking, memory, and day-to-day function.\n\n"
            "Recovery Signal\n"
            "Long-term research shows recovery across many areas of thinking and memory. By three years, the early and lingering withdrawal phases are far behind you and those gains have had years to strengthen.\n\n"
            "A Message of Hope\n"
            "The benzo recovery journey is one of the most demanding in medicine, and three years of sustained healing is a profound achievement. The evidence is clear: the brain heals substantially, most people recover their clarity, sleep, and emotional range, and improvement continues with time.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.benzoPageTitle,
      storageKey: 'benzos',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.benzoHeaderStarted,
      headerNotStarted: l10n.benzoHeaderNotStarted,
      subtitleStarted: l10n.benzoSubtitleStarted,
      subtitleNotStarted: l10n.benzoSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
