import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class MarijuanaPage extends StatelessWidget {
  final bool started;

  const MarijuanaPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.marijuanaMilestone1Title,
        description: l10n.marijuanaMilestone1Description,
        reference: "Cleveland Clinic - Marijuana Withdrawal",
        link:
            "https://my.clevelandclinic.org/health/diseases/marijuana-weed-withdrawal",
        referenceDate: "March 2026",
        referenceContent:
            "Marijuana Withdrawal: Day One\n\n"
            "Source: Cleveland Clinic\n\n"
            "Does Cannabis Cause Withdrawal?\n"
            "Yes — contrary to long-held beliefs, regular cannabis use does cause physical and psychological dependence, and stopping causes a recognisable withdrawal syndrome. The Cleveland Clinic documents Cannabis Withdrawal Syndrome as a well-established medical condition that typically affects people who have used cannabis daily or near-daily for several months or more.\n\n"
            "Why Withdrawal Happens\n"
            "THC (cannabis's primary psychoactive compound) acts on the endocannabinoid system — a network of receptors involved in mood, appetite, sleep, memory, and stress regulation. With regular use, the brain reduces its own endocannabinoid production and receptor sensitivity. When cannabis is stopped, this system is temporarily underactive, producing withdrawal symptoms.\n\n"
            "Day One Symptoms\n"
            "The Cleveland Clinic documents that cannabis withdrawal typically begins within 24 hours of stopping in daily users:\n"
            "• Irritability, anxiety, and restlessness\n"
            "• Difficulty sleeping (insomnia or strange dreams)\n"
            "• Decreased appetite and nausea\n"
            "• Headache\n"
            "• Depressed mood\n"
            "• Sweating and chills\n\n"
            "Severity\n"
            "Cannabis withdrawal is not medically dangerous, and symptoms are typically mild to moderate. However, for heavy long-term users, symptoms can be significant enough to make quitting difficult without support.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.marijuanaMilestone3Title,
        description: l10n.marijuanaMilestone3Description,
        reference: "American Addiction Centers - Marijuana Withdrawal Timeline",
        link:
            "https://americanaddictioncenters.org/withdrawal-timelines-treatments/weed-marijuana",
        referenceDate: "March 2026",
        referenceContent:
            "Cannabis Withdrawal Timeline: Day Three\n\n"
            "Source: American Addiction Centers\n\n"
            "Peak Withdrawal\n"
            "American Addiction Centers document that cannabis withdrawal symptoms typically peak around days 2–4, with day three often being the most challenging. For most people, this is when irritability, anxiety, sleep disruption, and physical discomfort are at their most intense.\n\n"
            "Withdrawal Timeline\n"
            "• Days 1–3: Onset and peak — irritability, anxiety, insomnia, appetite loss, physical discomfort\n"
            "• Days 4–7: Symptoms begin to improve\n"
            "• Days 8–14: Most acute symptoms resolve\n"
            "• Weeks 2–4: Residual mood and sleep issues in some users\n"
            "• Months 1–3: Full recovery for most; some cognitive effects resolve more slowly\n\n"
            "Sleep and Cannabis\n"
            "Cannabis significantly alters sleep architecture — regular users develop dependence on cannabis for sleep onset and experience dramatically increased REM sleep (with vivid dreams) when they stop. This sleep disruption is one of the most reported challenges in early cannabis withdrawal.\n\n"
            "Why People Struggle to Quit\n"
            "The AAC notes that cannabis's slow elimination from the body (THC metabolites are stored in fat and released slowly) means that withdrawal can feel prolonged. Additionally, cannabis is often used to manage anxiety, depression, or insomnia — when it's removed, these underlying conditions can re-emerge.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.marijuanaMilestone7Title,
        description: l10n.marijuanaMilestone7Description,
        reference: "Medical News Today - Weed Withdrawal Symptoms",
        link: "https://www.medicalnewstoday.com/articles/324301",
        referenceDate: "March 2026",
        referenceContent:
            "One Week Without Cannabis: Sleep Patterns Improve\n\n"
            "Source: Medical News Today\n\n"
            "Physical Symptoms Mostly Resolved\n"
            "Medical News Today documents that by the end of the first week, most of the physical symptoms of cannabis withdrawal have resolved or are significantly reduced. Appetite has largely returned, headaches are gone, and the worst of the irritability and anxiety has passed.\n\n"
            "Sleep at One Week\n"
            "Sleep is improving — the severe insomnia and strange, vivid dreams of the first few days are becoming less disruptive. However, sleep may not return to normal for several weeks. Cannabis suppresses REM sleep during use, and the brain overcompensates with excess REM sleep (REM rebound) during early withdrawal. This gradually normalises over the first month.\n\n"
            "Psychological Recovery Ongoing\n"
            "While physical symptoms are largely resolving, psychological symptoms continue:\n"
            "• Mood is still somewhat flat or irritable\n"
            "• Concentration may still be below normal\n"
            "• Cravings, particularly in familiar environments or social situations\n\n"
            "What the Science Shows\n"
            "Research reviewed by Medical News Today confirms that the acute withdrawal syndrome for cannabis is largely resolved within one week, but that subtle cognitive effects (concentration, memory) can persist for weeks to months, particularly in heavy, long-term users.",
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
        link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7483189/",
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
        link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9110555/",
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
        link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3037578/",
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
        reference: "NutritionFacts.org - Cannabis Brain Damage Reversible",
        link:
            "https://nutritionfacts.org/blog/cannabis-brain-damage-reversible-in-adults/",
        referenceDate: "March 2026",
        referenceContent:
            "One Year Without Cannabis: Brain Structure Restoration\n\n"
            "Source: NutritionFacts.org — summarising peer-reviewed MRI research\n\n"
            "Brain Structural Changes from Cannabis\n"
            "Neuroimaging research has documented structural brain changes in heavy cannabis users, including reduced grey matter volume in regions such as the hippocampus, amygdala, and prefrontal cortex. These changes are associated with the cognitive and emotional effects of chronic cannabis use.\n\n"
            "The Key Finding: Reversibility in Adults\n"
            "NutritionFacts.org summarises research using MRI brain imaging showing that in adult-onset cannabis users, these structural brain changes are substantially reversible with sustained abstinence. Studies tracking brain structure over one year of abstinence show meaningful restoration of grey matter volume in affected regions.\n\n"
            "Brain Recovery at One Year\n"
            "At one year:\n"
            "• Hippocampal volume — recovering toward normal, supporting memory function\n"
            "• Prefrontal cortex — structural recovery correlating with improved executive function\n"
            "• Amygdala function — normalising, supporting emotional regulation\n\n"
            "Important Nuance\n"
            "The reversibility finding applies most strongly to adults who began using cannabis in adulthood. For those who began using heavily during adolescence — when the brain was still developing — recovery may be less complete. This research underscores why adolescent cannabis use carries distinct and serious risks.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.marijuanaPageTitle,
      storageKey: 'marijuana',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.marijuanaHeaderStarted,
      headerNotStarted: l10n.marijuanaHeaderNotStarted,
      subtitleStarted: l10n.marijuanaSubtitleStarted,
      subtitleNotStarted: l10n.marijuanaSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
