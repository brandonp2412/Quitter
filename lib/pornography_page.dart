import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class PornographyPage extends StatelessWidget {
  final bool started;

  const PornographyPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.pornographyMilestone1Title,
        description: l10n.pornographyMilestone1Description,
        reference:
            "Compulsive Sexual Behaviour Disorder in the ICD-11 (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/29352554/",
        referenceDate: "June 2026",
        referenceContent:
            "Pornography and the Brain: Day One of Breaking the Cycle\n\n"
            "Source: Kraus et al., \"Compulsive sexual behaviour disorder in the ICD-11,\" World Psychiatry (2018), on PubMed\n\n"
            "What the Diagnosis Actually Is\n"
            "In 2019 the World Health Organization added Compulsive Sexual Behaviour Disorder (CSBD, code 6C72) to the ICD-11. It is defined as a persistent failure to control intense sexual urges, leading to repetitive sexual behaviour over an extended period (6 months or more) that causes marked distress or impairment. Importantly, the WHO classifies CSBD as an impulse-control disorder — not, formally, as an addiction.\n\n"
            "An Honest Word on the Science\n"
            "Whether problematic pornography use is best understood as a 'porn addiction' is genuinely debated among researchers. Popular recovery timelines describing day-by-day 'brain rewiring' go well beyond what studies have actually shown. What the evidence does support is that for people whose use feels out of control and causes distress, deliberately changing the pattern is a recognised, worthwhile goal.\n\n"
            "Day One\n"
            "The first day is the start of changing a compulsive pattern. Expect possible restlessness or urges, and a sharper awareness of the situations and feelings that used to trigger use. None of this means damage is permanent — it reflects a habit loop that can be unlearned.\n\n"
            "Who This Applies To\n"
            "This framing is about compulsive, distressing use. Occasional, non-distressing use does not meet the CSBD definition, and these milestones are written for people who have decided their own use has become a problem.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.pornographyMilestone3Title,
        description: l10n.pornographyMilestone3Description,
        reference:
            "Should Compulsive Sexual Behavior Be Considered an Addiction? (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4990495/",
        referenceDate: "June 2026",
        referenceContent:
            "Day Three: The Truth About \"Withdrawal\"\n\n"
            "Source: Kraus, Voon & Potenza, \"Should compulsive sexual behavior be considered an addiction?\", Addiction (2016), on PubMed Central\n\n"
            "Is There a Withdrawal Syndrome?\n"
            "This is where honesty matters. This peer-reviewed review notes that, unlike substance-use disorders, the criteria for compulsive sexual behaviour do not include tolerance and withdrawal, and whether these truly apply 'is debated.' So a formal porn 'withdrawal syndrome' is not established science.\n\n"
            "What People Do Experience\n"
            "That said, the same review acknowledges that 'dysphoric mood states' may reflect withdrawal-like symptoms for some people who have recently cut back. In the first few days, many people report:\n"
            "• Irritability and restlessness\n"
            "• Strong urges, often triggered by stress, boredom, or loneliness\n"
            "• Difficulty concentrating or low mood\n"
            "These are real and uncomfortable, even if the science is still working out how to classify them.\n\n"
            "Craving Is Relevant\n"
            "The review notes craving 'appears relevant' to compulsive sexual behaviour, while cautioning that its exact role in predicting relapse hasn't yet been established.\n\n"
            "Practical Strategies\n"
            "Identify and plan around triggers, use exercise and real-world social connection, practise riding out urges without acting on them, and seek professional support if distress is severe.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.pornographyMilestone7Title,
        description: l10n.pornographyMilestone7Description,
        reference:
            "Neural Correlates of Sexual Cue Reactivity in Compulsive Sexual Behaviours (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4094516/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Without Pornography: Understanding the Pull\n\n"
            "Source: Voon et al., \"Neural Correlates of Sexual Cue Reactivity in Individuals with and without Compulsive Sexual Behaviours,\" PLoS One (2014), on PubMed Central\n\n"
            "What Drives the Cravings\n"
            "This brain-imaging study compared men with compulsive sexual behaviour to those without. In the compulsive group, sexual cues produced greater activity in the ventral striatum, dorsal anterior cingulate, and amygdala — a reward and motivation network the authors note is also activated by drug cues in addiction.\n\n"
            "Wanting Versus Liking\n"
            "A striking finding: the compulsive group showed greater 'wanting' of the cues but not greater 'liking' — the urge and the actual enjoyment had come apart. This helps explain why, at one week, cravings can still feel strong even when the behaviour no longer brings much pleasure. Each time you ride out a cue without acting, you weaken that learned response.\n\n"
            "About Sleep and Energy\n"
            "Many people report sleeping better in the first week — often simply because late-night use is no longer displacing sleep. This is a practical, behavioural change rather than a proven neurochemical one, but the benefit is real.\n\n"
            "Honest Caveats\n"
            "The authors are careful: this was a small study of heterosexual men, it cannot prove cause and effect, and the findings 'likely do not reflect on the wider population who use such materials in non-harmful manners.' It describes the biology of the pull — not a recovery timetable.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.pornographyMilestone14Title,
        description: l10n.pornographyMilestone14Description,
        reference:
            "Should Compulsive Sexual Behavior Be Considered an Addiction? (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4990495/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Without Pornography: Motivation Returns\n\n"
            "Source: Kraus, Voon & Potenza, \"Should compulsive sexual behavior be considered an addiction?\", Addiction (2016), on PubMed Central\n\n"
            "A Common Turning Point\n"
            "Around two weeks, many people first notice clearer mood, steadier motivation, and more energy for everyday life. These are widely reported improvements when problematic use stops.\n\n"
            "What the Science Does and Doesn't Say\n"
            "It is tempting to explain this as the 'dopamine system resensitising,' but this review is careful: the evidence on compulsive sexual behaviour comes mostly from small, cross-sectional studies of heterosexual men, and 'significant gaps in understanding' remain. The honest position is that the improvements people feel at two weeks are real and commonly reported, while precise claims about dopamine-receptor recovery on a two-week timeline go beyond what has actually been measured.\n\n"
            "Incentive Salience\n"
            "The review discusses how, in addictive-type patterns, cues can drive 'wanting' more than genuine enjoyment. As the pull of cues fades with abstinence, ordinary activities tend to feel more rewarding again by comparison — part of why motivation often returns around now.\n\n"
            "The Psychological Win\n"
            "Two weeks of following through on a hard commitment also builds self-efficacy and a sense of integrity — a benefit that doesn't depend on any contested neuroscience.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.pornographyMilestone30Title,
        description: l10n.pornographyMilestone30Description,
        reference:
            "Compulsive Sexual Behaviour Disorder in the ICD-11 (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/29352554/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Without Pornography: Confidence and Self-Control\n\n"
            "Source: Kraus et al., \"Compulsive sexual behaviour disorder in the ICD-11,\" World Psychiatry (2018), on PubMed\n\n"
            "Working With the Diagnosis\n"
            "The WHO defines CSBD around a 'failure to control intense sexual impulses or urges.' That makes self-control the core skill of recovery — and at one month, repeatedly choosing not to act on urges is direct, daily practice at exactly that skill.\n\n"
            "Psychological Changes at 30 Days\n"
            "• Confidence: following through on a hard commitment for a month builds genuine self-efficacy\n"
            "• Self-regulation: each urge ridden out without acting strengthens your ability to manage the next one\n"
            "• Clarity: as the compulsive urge-and-response loop weakens, day-to-day life feels less preoccupied\n\n"
            "An Honest Note on the Brain\n"
            "Popular timelines claim the prefrontal cortex has measurably 'strengthened' by 30 days. The research doesn't pin recovery to specific dates like this. What's well-grounded is behavioural: practising self-control reliably builds self-control, and reducing distressing, out-of-control use is a recognised clinical goal.\n\n"
            "A Milestone, Not a Finish Line\n"
            "Urges and triggers still exist and need ongoing management. Therapy, accountability, and structure remain valuable — one month is a strong foundation to keep building on.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.pornographyMilestone90Title,
        description: l10n.pornographyMilestone90Description,
        reference:
            "Neural Correlates of Sexual Cue Reactivity in Compulsive Sexual Behaviours (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4094516/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Without Pornography: Loosening the Cue's Grip\n\n"
            "Source: Voon et al., \"Neural Correlates of Sexual Cue Reactivity in Individuals with and without Compulsive Sexual Behaviours,\" PLoS One (2014), on PubMed Central\n\n"
            "What the Imaging Established\n"
            "This study showed that, in people with compulsive sexual behaviour, sexual cues drove heightened activity in reward and motivation circuits (ventral striatum, dorsal anterior cingulate, amygdala) — and that subjective 'wanting' was elevated even when 'liking' was not. This is the core mechanism that makes cues feel so compelling.\n\n"
            "What Three Months Likely Means\n"
            "By 90 days of not acting on those cues, the learned cue-and-craving link has had sustained time to weaken — and most people notice cravings are less frequent and easier to resist, with more attention freed for real life. It's worth being honest, though: this study is a snapshot comparison, not a recovery study, so it does not prove a specific '90-day brain reset.' The improvement people feel is real; the exact neural timeline is not something research has nailed down.\n\n"
            "Quality of Life at 90 Days\n"
            "Commonly reported gains at three months include greater presence in relationships, a stronger sense of integrity, and far less time and mental energy spent on pornography-related thoughts.\n\n"
            "Caveat Worth Repeating\n"
            "The original findings came from a small sample of heterosexual men and, in the authors' words, 'likely do not reflect on the wider population who use such materials in non-harmful manners.'",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.pornographyMilestone180Title,
        description: l10n.pornographyMilestone180Description,
        reference:
            "Compulsive Sexual Behaviour Disorder in the ICD-11 (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/29352554/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Without Pornography: Relationships and Presence\n\n"
            "Source: Kraus et al., \"Compulsive sexual behaviour disorder in the ICD-11,\" World Psychiatry (2018), on PubMed\n\n"
            "Why Relationships Are Central\n"
            "The WHO's definition of CSBD specifically includes 'marked distress or impairment in personal, family, social... or other important areas of functioning.' In other words, harm to relationships is part of what defines problematic use — so easing that harm is a core, recognised aim of recovery.\n\n"
            "What Six Months Tends to Bring\n"
            "With the compulsive pull reduced, many people find at six months that they are more present with real people, less preoccupied, and able to invest attention and energy in genuine connection and intimacy. For those in relationships, partners often notice this shift too.\n\n"
            "An Honest Boundary\n"
            "You may have seen claims that pornography 'damages the brain's empathy and bonding systems' and that these 'recover' on a set schedule. That goes beyond the established evidence. What is well-grounded is simpler and still meaningful: reducing distressing, out-of-control use frees up time, attention, and emotional bandwidth for the relationships that matter — and that improvement is real.\n\n"
            "Keep What's Working\n"
            "Six months in, the habits, boundaries, and support that got you here remain the things that protect and deepen these relational gains.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.pornographyMilestone365Title,
        description: l10n.pornographyMilestone365Description,
        reference:
            "Should Compulsive Sexual Behavior Be Considered an Addiction? (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4990495/",
        referenceDate: "June 2026",
        referenceContent:
            "One Year Without Pornography: Lasting Change\n\n"
            "Source: Kraus, Voon & Potenza, \"Should compulsive sexual behavior be considered an addiction?\", Addiction (2016), on PubMed Central\n\n"
            "A Year of Rewired Habits\n"
            "A full year of not acting on urges is a profound behavioural change. The cue-and-craving loop that once drove the behaviour has been left un-reinforced for twelve months, and for most people the urges are far weaker and easier to manage than at the start.\n\n"
            "Being Honest About 'Neural Reset'\n"
            "You'll see confident claims that one year produces a 'complete neural recalibration.' This peer-reviewed review is the corrective: research on compulsive sexual behaviour is still 'limited by small sample sizes, solely male heterosexual samples, and cross-sectional designs,' with 'significant gaps in understanding.' There is no study establishing a one-year brain reset. What's solid is that sustained change is achievable and that distress and impairment ease — not a precise neural timetable.\n\n"
            "Life at One Year\n"
            "Commonly reported: a stable sense of self that no longer revolves around the behaviour, more genuine relationships, time and energy redirected into meaningful goals, and a healthier overall relationship with digital stimulation.\n\n"
            "The Ongoing Work\n"
            "Relapse risk is lower than early on but never zero. Maintaining habits, boundaries, and support remains worthwhile — recovery is a direction, not a finish line.",
      ),
      QuitMilestone(
        day: 1825,
        title: l10n.pornographyMilestone1825Title,
        description: l10n.pornographyMilestone1825Description,
        reference:
            "Compulsive Sexual Behaviour Disorder in the ICD-11 (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/29352554/",
        referenceDate: "June 2026",
        referenceContent:
            "Five Years Without Pornography: A Different Life\n\n"
            "Source: Kraus et al., \"Compulsive sexual behaviour disorder in the ICD-11,\" World Psychiatry (2018), on PubMed\n\n"
            "What Five Years Really Represents\n"
            "After five years, the change is less about the brain on a scan and more about a life rebuilt. For most people this means a stable identity that no longer revolves around the behaviour, relationships grounded in genuine connection, meaningful pursuits filling the time once lost to compulsive use, and a healthier overall relationship with digital media.\n\n"
            "An Honest Word on 'Brain Rewiring'\n"
            "Popular sources put confident numbers on long-term 'brain rewiring' — three to five years to fully heal. The honest scientific position is that no study has established such a timeline for pornography use specifically. CSBD itself was only formally recognised by the WHO in 2019, classified as an impulse-control disorder, and its underlying biology is still being researched and debated. The transformation people describe at five years is real and well worth celebrating; the precise neuroscience timetable is not something the evidence supports.\n\n"
            "Why It Still Matters\n"
            "Sustained recovery removes the distress and impairment that defined the problem in the first place. Five years is a genuine landmark — and meaningful change accrues at every stage along the way, not only at the end.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.pornographyPageTitle,
      storageKey: 'pornography',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.pornographyHeaderStarted,
      headerNotStarted: l10n.pornographyHeaderNotStarted,
      subtitleStarted: l10n.pornographySubtitleStarted,
      subtitleNotStarted: l10n.pornographySubtitleNotStarted,
      initialStarted: started,
    );
  }
}
