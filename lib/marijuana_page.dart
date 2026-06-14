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
            "This peer-reviewed review establishes that Cannabis Withdrawal Syndrome (CWS) is a well-validated clinical condition, occurring in roughly half of regular, dependent users after they stop. Its average peak severity is comparable to that of a tobacco withdrawal syndrome.\n\n"
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
        reference: "Harvard Health - Effects of Marijuana on Memory",
        link:
            "https://www.health.harvard.edu/mind-and-mood/the-effects-of-marijuana-on-your-memory",
        referenceDate: "March 2026",
        referenceContent:
            "One Month Without Cannabis: Memory Function Improves\n\n"
            "Source: Harvard Health Publishing\n\n"
            "Cannabis and Memory: The Problem\n"
            "Harvard Health documents that cannabis has well-established effects on memory — particularly short-term memory and the ability to form new memories. THC disrupts hippocampal function (the brain region central to memory formation) by binding to CB1 receptors in the hippocampus. Chronic heavy users show measurable impairments in verbal memory, working memory, and learning.\n\n"
            "The Good News: Recovery\n"
            "Harvard Health's review of the evidence indicates that memory impairments caused by cannabis use are substantially reversible with abstinence. Studies show that memory performance begins improving within days of stopping, with continued improvement over weeks and months.\n\n"
            "Memory Recovery at 30 Days\n"
            "At one month of abstinence, memory function has typically improved significantly compared to active use:\n"
            "• Verbal learning and recall improving toward normal\n"
            "• Short-term memory meaningfully better\n"
            "• Working memory recovering\n\n"
            "Harvard's Nuanced View\n"
            "Harvard Health notes that recovery is most complete in adults and in those who began using cannabis as adults. Early-onset use (adolescence) is associated with more persistent effects, highlighting why early use is particularly concerning.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.marijuanaMilestone60Title,
        description: l10n.marijuanaMilestone60Description,
        reference: "NCBI - Impact of Abstinence on Cannabis-Related Cognition",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC7483189/",
        referenceDate: "March 2026",
        referenceContent:
            "Two Months Without Cannabis: Concentration Sharpens\n\n"
            "Source: NCBI/PMC — Peer-reviewed research on cannabis abstinence and cognition\n\n"
            "The Research Question\n"
            "This meta-analysis examined studies on the cognitive effects of cannabis and how they change with abstinence. The results provide a comprehensive picture of cognitive recovery over time.\n\n"
            "Key Findings\n"
            "The research found that cognitive impairments associated with cannabis use are predominantly reversible with sustained abstinence. The domains showing the most significant improvement with abstinence include:\n"
            "• Attention and concentration — significant improvement documented\n"
            "• Processing speed — recovering toward non-user levels\n"
            "• Executive function — measurably improved\n"
            "• Memory consolidation — substantially better\n\n"
            "At Two Months\n"
            "By the 60-day mark, concentration and attention are typically near normal for most users. The experience many people describe as being able to 'focus' and 'think clearly' again is well-supported by this research. The cannabis-induced blunting of cognitive sharpness is largely reversed.\n\n"
            "Important Caveat\n"
            "The research notes that heavy adolescent-onset users may show slower and less complete cognitive recovery than adult-onset users, consistent with cannabis's greater impact on the developing brain.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.marijuanaMilestone90Title,
        description: l10n.marijuanaMilestone90Description,
        reference: "NCBI - Clinical Management of Cannabis Withdrawal",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC9110555/",
        referenceDate: "March 2026",
        referenceContent:
            "Three Months Without Cannabis: Mood Stability Returns\n\n"
            "Source: NCBI/PMC — Peer-reviewed research on cannabis withdrawal management\n\n"
            "The Mood–Cannabis Relationship\n"
            "This research examines the clinical management of cannabis withdrawal with particular attention to mood. The relationship between cannabis and mood is complex: cannabis is often used to manage anxiety and depression, but chronic use worsens both conditions over time through endocannabinoid system dysregulation.\n\n"
            "Mood at Three Months\n"
            "By the three-month mark, mood stability has typically improved substantially beyond what it was during active use and certainly beyond early withdrawal:\n"
            "• Baseline anxiety is typically lower than it was during heavy cannabis use\n"
            "• Depression, if present, is usually less severe and more manageable\n"
            "• Emotional regulation — the ability to tolerate distress without using cannabis — has improved\n"
            "• The endocannabinoid system has largely recovered its natural function\n\n"
            "The Endocannabinoid System Recovery\n"
            "The endocannabinoid system regulates mood, stress response, appetite, sleep, and pain. Three months of cannabis abstinence allows substantial recovery of endocannabinoid receptor sensitivity and natural endocannabinoid production, which underlies the mood improvements observed at this stage.\n\n"
            "Therapeutic Engagement\n"
            "The research emphasises that three months is an excellent time for therapeutic intervention — the brain is neurologically capable of learning and adopting new coping strategies, and the distress of acute withdrawal is well past.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.marijuanaMilestone180Title,
        description: l10n.marijuanaMilestone180Description,
        reference: "NCBI - Cannabis Effects on Executive Function",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC3037578/",
        referenceDate: "March 2026",
        referenceContent:
            "Six Months Without Cannabis: Executive Function Recovery\n\n"
            "Source: NCBI/PMC — Peer-reviewed research on cannabis and executive function\n\n"
            "Executive Function and Cannabis\n"
            "This research reviewed the evidence on cannabis's impact on executive function — the set of cognitive abilities that include planning, decision-making, impulse control, cognitive flexibility, and working memory. These functions are primarily governed by the prefrontal cortex, which has a high density of cannabinoid receptors.\n\n"
            "What the Research Found\n"
            "Heavy cannabis users show measurable deficits in executive function compared to non-users, including:\n"
            "• Impaired planning and problem-solving\n"
            "• Reduced cognitive flexibility (difficulty shifting between tasks or perspectives)\n"
            "• Impaired impulse control\n"
            "• Working memory deficits\n\n"
            "Recovery at Six Months\n"
            "The research documents that executive function shows substantial recovery with sustained abstinence. By six months, most executive function domains have largely normalised in adult-onset users. People at this stage report being able to:\n"
            "• Plan and execute complex tasks effectively\n"
            "• Make clear-headed decisions\n"
            "• Manage impulses and delay gratification\n"
            "• Think flexibly and creatively\n\n"
            "The Broader Picture\n"
            "Six months of cannabis-free living typically brings a quality-of-life transformation: clearer thinking, better decision-making, more productive work or study, and a stronger sense of self-direction.",
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
            "An Honest Caveat\n"
            "The authors caution that structural recovery may not fully extend to cognition — some functional deficits can persist even after the hippocampus appears to recover. Other research also finds that very heavy or adolescent-onset use can leave changes detectable after six or more months of abstinence. The trajectory is toward recovery, but its completeness varies between individuals.",
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
