import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class MarijuanaPage extends StatelessWidget {
  final bool started;
  final String storageKey;
  final String? pageTitle;
  final String? headerStarted;
  final String? headerNotStarted;
  final String? subtitleStarted;
  final String? subtitleNotStarted;
  final String? infoBoxMessage;

  const MarijuanaPage({
    super.key,
    required this.started,
    this.storageKey = 'marijuana',
    this.pageTitle,
    this.headerStarted,
    this.headerNotStarted,
    this.subtitleStarted,
    this.subtitleNotStarted,
    this.infoBoxMessage,
  });

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.marijuanaMilestone1Title,
        description: l10n.marijuanaMilestone1Description,
        reference: "The Cannabis Withdrawal Syndrome: Current Insights (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5414724/",
        referenceDate: "June 2026",
        referenceContent:
            "Marijuana Withdrawal: Day One\n\n"
            "Source: \"The cannabis withdrawal syndrome: current insights,\" Substance Abuse and Rehabilitation (2017), on PubMed Central\n\n"
            "Cannabis Withdrawal Is Real\n"
            "This peer-reviewed review establishes that Cannabis Withdrawal Syndrome (CWS) is a well-validated clinical condition, occurring in roughly 90% of people diagnosed with cannabis dependence after they stop. Its average peak severity is comparable to that of a tobacco withdrawal syndrome.\n\n"
            "Why Withdrawal Happens\n"
            "THC acts on the endocannabinoid system — CB1 receptors involved in mood, appetite, sleep, memory, and stress. With chronic use the brain downregulates this system; when cannabis stops, it is temporarily underactive. The review notes CB1 receptors return to normal functioning within about four weeks of abstinence.\n\n"
            "Onset on Day One\n"
            "The review documents that physical symptoms tend to appear first — within 1–3 days of the last use — while psychological symptoms emerge over 2–10 days. Early symptoms include:\n"
            "• Irritability, anxiety, and restlessness\n"
            "• Difficulty sleeping\n"
            "• Decreased appetite\n"
            "• Physical tension, sweating, or chills\n"
            "• Depressed mood\n\n"
            "Severity\n"
            "CWS is not medically dangerous and symptoms are typically mild to moderate, but the review notes they can be distressing enough to drive relapse — which is why understanding the timeline matters.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.marijuanaMilestone3Title,
        description: l10n.marijuanaMilestone3Description,
        reference: "Time-Course of DSM-5 Cannabis Withdrawal Symptoms (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4015312/",
        referenceDate: "June 2026",
        referenceContent:
            "Cannabis Withdrawal Timeline: The Early Days\n\n"
            "Source: \"Time-course of the DSM-5 cannabis withdrawal symptoms in poly-substance abusers,\" BMC Psychiatry (2013), on PubMed Central\n\n"
            "A Measured Time-Course\n"
            "This study tracked DSM-5 cannabis withdrawal symptoms in 90 patients over four weeks, producing one of the clearest pictures of how symptoms rise and fall. Overall severity followed a curve: rising, then declining over the following weeks.\n\n"
            "What Peaks Early\n"
            "Several of the most physically disruptive symptoms peak within the first few days of stopping:\n"
            "• Insomnia — peaks around day 1\n"
            "• Nervousness — peaks around day 4\n"
            "• Depressed mood and physical symptoms — peak around day 5\n"
            "• Restlessness — peaks around day 6\n\n"
            "What Peaks Later\n"
            "The study found that some symptoms emerge and peak later than the first week:\n"
            "• Vivid, unpleasant dreams — peak around day 11\n"
            "• Irritability and anger — peak around day 14\n\n"
            "Sleep and Cannabis\n"
            "The delayed, vivid dreams reflect REM rebound: cannabis suppresses REM sleep during use, and the brain overcompensates once it stops. The authors argue this symptom is common enough to belong among formal withdrawal criteria.\n\n"
            "The Takeaway for Day Three\n"
            "By day three you are in the thick of the early physical peak — insomnia, nervousness, and restlessness are near their worst. The consistent, predictable curve is itself reassuring: these symptoms have a known course and they decline from here.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.marijuanaMilestone7Title,
        description: l10n.marijuanaMilestone7Description,
        reference: "The Cannabis Withdrawal Syndrome: Current Insights (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5414724/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Without Cannabis: Through the Worst\n\n"
            "Source: \"The cannabis withdrawal syndrome: current insights,\" Substance Abuse and Rehabilitation (2017), on PubMed Central\n\n"
            "Where One Week Sits in the Syndrome\n"
            "This review documents that the cannabis withdrawal syndrome usually lasts up to about three weeks, with the most distressing period falling between the first and third week. At one week, the earliest physical symptoms — insomnia, appetite loss, restlessness — have typically passed their peak and are easing.\n\n"
            "What Is Still Settling\n"
            "The review distinguishes early-peaking physical symptoms from later-peaking psychological ones. At one week:\n"
            "• Physical discomfort and appetite are largely improving\n"
            "• Sleep is still disrupted for many, with vivid dreams (REM rebound) often peaking around now\n"
            "• Irritability and mood can remain elevated, as these tend to peak later in the first two weeks\n\n"
            "The Neurobiology of Recovery\n"
            "Underlying these changes, the review notes that downregulated CB1 receptors return toward normal functioning within about four weeks of abstinence. One week in, that re-regulation is well underway — the system is recovering even while some symptoms linger.\n\n"
            "The Takeaway\n"
            "Reaching one week means the acute physical peak is behind you. The remaining sleep and mood symptoms are part of a syndrome with a known, finite course that continues to resolve over the next couple of weeks.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.marijuanaMilestone14Title,
        description: l10n.marijuanaMilestone14Description,
        reference: "PubMed - Cannabis Withdrawal Time Course",
        link: "https://pubmed.ncbi.nlm.nih.gov/12943018/",
        referenceDate: "March 2026",
        referenceContent:
            "Two Weeks Without Cannabis: Acute Withdrawal Ends\n\n"
            "Source: Budney, AJ et al. (2003) — peer-reviewed study on cannabis withdrawal time course\n\n"
            "Research Findings\n"
            "This peer-reviewed study systematically documented the time course of cannabis withdrawal symptoms in regular users. The findings showed that the acute withdrawal syndrome peaks within the first week and largely resolves within 2 weeks of stopping for most symptoms.\n\n"
            "What Resolves by 2 Weeks\n"
            "The study documented that by 14 days, the following symptoms had largely resolved in study participants:\n"
            "• Physical discomfort and bodily symptoms\n"
            "• Appetite disturbance\n"
            "• Most sleep disruption\n"
            "• Peak irritability and anxiety\n\n"
            "What May Persist Beyond 2 Weeks\n"
            "The research also identified symptoms that persisted beyond the two-week mark in some users:\n"
            "• Depressed mood\n"
            "• Concentration difficulties\n"
            "• Sleep quality (though improving)\n\n"
            "The Significance of the 2-Week Mark\n"
            "Passing the two-week mark is significant because it means the acute withdrawal syndrome is largely complete. The challenges beyond this point are primarily related to longer-term neurological recovery and managing the underlying reasons for cannabis use, rather than the acute physiological response to stopping.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.marijuanaMilestone30Title,
        description: l10n.marijuanaMilestone30Description,
        reference:
            "Pope et al. (2001) - Neuropsychological Performance in Long-term Cannabis Users (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/11576028/",
        referenceDate: "July 2026",
        referenceContent:
            "One Month Without Cannabis: Memory Function Improves\n\n"
            "Source: Pope et al. (2001), Archives of General Psychiatry\n\n"
            "Cannabis and Memory: The Problem\n"
            "This study monitored heavy, long-term cannabis users through 28 days of confirmed abstinence and compared their neuropsychological performance with light users and non-users. At the start of abstinence, and again at days 1 and 7, heavy users performed worse than controls on recall of word lists — a deficit that tracked with their urinary THC metabolite levels, reflecting recent drug exposure rather than lifetime use.\n\n"
            "The Good News: Recovery by Day 28\n"
            "By day 28 of monitored abstinence, the study found virtually no significant differences between heavy users, light users, and non-users on any of the neuropsychological tests. There was also no significant relationship between total lifetime cannabis use and test performance at that point.\n\n"
            "What This Means at 30 Days\n"
            "• Verbal learning and recall have returned to control-group levels\n"
            "• The residual deficits seen in the first week have resolved\n"
            "• The remaining deficit earlier on was tied to recent exposure, not permanent damage\n\n"
            "What the Evidence Shows\n"
            "By day 28, heavy users were virtually indistinguishable from light users and non-users across the study's neuropsychological battery. Verbal-learning and recall deficits seen in the first week had recovered to control-group levels.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.marijuanaMilestone60Title,
        description: l10n.marijuanaMilestone60Description,
        reference:
            "Roten et al. (2015) - Cognitive performance in a placebo-controlled pharmacotherapy trial for youth with marijuana dependence (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/25661990/",
        referenceDate: "July 2026",
        referenceContent:
            "Two Months Without Cannabis: Concentration Sharpens\n\n"
            "Source: Roten et al. (2015), Addictive Behaviors\n\n"
            "The Research Question\n"
            "This secondary analysis of a placebo-controlled cannabis-cessation trial in youth tracked cognitive test scores against urine cannabinoid testing over the roughly two-month treatment course, comparing participants who were not abstinent, recently abstinent, and consistently abstinent.\n\n"
            "Key Findings\n"
            "Consistent abstinence was associated with significant improvement in:\n"
            "• Composite memory score\n"
            "• Verbal memory specifically — the most affected domain\n"
            "• Psychomotor performance\n\n"
            "At Two Months\n"
            "By roughly eight weeks of consistent abstinence, memory and psychomotor performance scores had climbed measurably above where they sat during active use, tracking closely with confirmed non-use rather than time alone.\n\n"
            "What the Study Shows\n"
            "In adolescents and young adults with cannabis dependence, consistent abstinence produced significant gains in composite memory, verbal memory, and psychomotor performance across the roughly two-month treatment window.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.marijuanaMilestone90Title,
        description: l10n.marijuanaMilestone90Description,
        reference:
            "Connor et al. (2022) - Clinical management of cannabis withdrawal (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9110555/",
        referenceDate: "July 2026",
        referenceContent:
            "Three Months Without Cannabis: Mood Stability Returns\n\n"
            "Source: Connor et al. (2022), Addiction — a clinical review of cannabis withdrawal\n\n"
            "What the Withdrawal Timeline Actually Looked Like\n"
            "This review describes cannabis withdrawal symptoms typically starting 24–48 hours after cessation and peaking around days 2–6. Anger, aggression, and depressed mood can appear as early as one week but typically peak after about two weeks of abstinence; sleep disturbance in particular can persist longer than other symptoms.\n\n"
            "Where Three Months Sits\n"
            "By three months, you are far beyond the documented withdrawal course: symptoms typically start within 24–48 hours, peak around days 2–6, and even slower mood and sleep symptoms peak within the following weeks. Ninety days gives those withdrawal-driven mood and sleep effects months to settle.\n\n"
            "A Note on the Endocannabinoid System\n"
            "Cannabis-withdrawal research also shows downregulated CB1 receptors returning toward normal functioning within about four weeks of abstinence. At 90 days, you are well beyond that receptor-recovery window.\n\n"
            "Looking Ahead\n"
            "The review also discusses post-detoxification prognosis and relapse prevention, underlining that ongoing support and coping strategies matter well beyond the acute withdrawal window.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.marijuanaMilestone180Title,
        description: l10n.marijuanaMilestone180Description,
        reference:
            "Crean et al. (2011) - An Evidence Based Review of Acute and Long-Term Effects of Cannabis Use on Executive Cognitive Functions (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC3037578/",
        referenceDate: "July 2026",
        referenceContent:
            "Six Months Without Cannabis: Executive Function Recovery\n\n"
            "Source: Crean, Crane & Mason (2011), Journal of Addiction Medicine\n\n"
            "Executive Function and Cannabis\n"
            "This review examined cannabis's impact on executive cognitive functions — attention, decision-making, inhibition, working memory, and verbal fluency — across three windows: acute effects (0–6 hours), residual effects (7 hours to 20 days), and long-term effects (21+ days and beyond). It doesn't define a six-month benchmark specifically, but by that point you are well into its 'long-term' window.\n\n"
            "What the Research Found\n"
            "Several deficits linked to heavy use recede with sustained abstinence, and some cited studies found recovery on certain measures by 28 days off cannabis. But the review is careful to flag deficits that don't reliably resolve, including:\n"
            "• Decision-making and risk-taking — specifically flagged as domains where deficits can persist long-term in heavy, chronic users\n"
            "• Abstract reasoning and verbal skills — particularly impaired in adults who began using before age 17\n\n"
            "Early-Onset Recovery\n"
            "Six months is far beyond the acute and residual-effect windows in this review. Many executive deficits recede with sustained abstinence, while early-onset heavy users can retain longer-lived decision-making and reasoning effects — making abstinence the strongest available route to continued cognitive recovery.\n\n"
            "The Broader Picture\n"
            "For adult-onset, lighter use, the outlook is more favourable — many people at six months report clearer thinking, steadier decision-making, and a stronger sense of self-direction. The review's caution is mainly aimed at heavy, early-onset users.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.marijuanaMilestone365Title,
        description: l10n.marijuanaMilestone365Description,
        reference:
            "Hippocampal Harms, Protection and Recovery After Cannabis Use (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5068875/",
        referenceDate: "June 2026",
        referenceContent:
            "One Year Without Cannabis: Brain Structure Recovers\n\n"
            "Source: \"Hippocampal harms, protection and recovery following regular cannabis use,\" Translational Psychiatry (2016), on PubMed Central\n\n"
            "Structural Changes from Cannabis\n"
            "This neuroimaging study examined the hippocampus — a memory-critical, CB1-receptor-dense region — in cannabis users, former users, and non-users. Current users not exposed to CBD had roughly 11% smaller hippocampal volumes and 15% lower NAA (a marker of neuronal integrity) than controls.\n\n"
            "The Key Finding: Recovery With Abstinence\n"
            "Curve-fitting analyses supported a \"protection and recovery\" model. Crucially, former users — abstinent for an average of around 29 months — did not differ from non-using controls on any integrity measure. The authors conclude that THC-related hippocampal harms \"can be recovered with extended periods of abstinence.\"\n\n"
            "Brain Recovery Over a Year and Beyond\n"
            "At one year cannabis-free, you are well into this recovery trajectory: hippocampal volume and neuronal integrity move back toward normal, supporting memory and emotional regulation.\n\n"
            "Recovery Signal\n"
            "Former users abstinent for an average of roughly 29 months did not differ from non-using controls on hippocampal integrity measures. At one year, hippocampal volume and neuronal integrity are already moving along that documented protection-and-recovery trajectory toward normal.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: pageTitle ?? l10n.marijuanaPageTitle,
      storageKey: storageKey,
      milestones: _getMilestones(l10n),
      headerStarted: headerStarted ?? l10n.marijuanaHeaderStarted,
      headerNotStarted: headerNotStarted ?? l10n.marijuanaHeaderNotStarted,
      subtitleStarted: subtitleStarted ?? l10n.marijuanaSubtitleStarted,
      subtitleNotStarted:
          subtitleNotStarted ?? l10n.marijuanaSubtitleNotStarted,
      infoBoxMessage: infoBoxMessage,
      initialStarted: started,
    );
  }
}
