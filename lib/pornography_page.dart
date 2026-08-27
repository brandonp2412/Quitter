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
            'Compulsive Sexual Behaviour Disorder in the ICD-11 (PubMed)',
        link: 'https://pubmed.ncbi.nlm.nih.gov/29352554/',
        referenceDate: 'August 2026',
        referenceContent:
            'Day One: Taking Back Control\n\n'
            'Source: Kraus et al., Compulsive sexual behaviour disorder in the ICD-11, World Psychiatry (2018).\n\n'
            'The clinically important problem is not pornography use by itself. Compulsive Sexual Behaviour Disorder is defined around persistent difficulty controlling repetitive sexual behaviour when that pattern causes significant distress or impairment. Problematic pornography use can be one presentation of that broader problem.\n\n'
            'That makes day one concrete rather than mystical: you have interrupted a behaviour you had decided was out of control. One completed day does not prove a neurological reset, but it does give you the first real observation of when urges appear, what situations trigger them, and what you can do instead.\n\n'
            'If your use was not distressing, impairing, or difficult to control, the clinical CSBD framework may not apply to you. These milestones are aimed at people who are deliberately changing problematic or compulsive use.',
      ),
      QuitMilestone(
        day: 3,
        title: l10n.pornographyMilestone3Title,
        description: l10n.pornographyMilestone3Description,
        reference:
            'Withdrawal and tolerance in CSBD and problematic pornography use (PMC)',
        link: 'https://pmc.ncbi.nlm.nih.gov/articles/PMC9881655/',
        referenceDate: 'August 2026',
        referenceContent:
            'Day Three: Know What an Urge Can Look Like\n\n'
            'Source: Lewczuk et al., Withdrawal and tolerance as related to compulsive sexual behavior disorder and problematic pornography use, Journal of Behavioral Addictions (2022).\n\n'
            'In a preregistered nationally representative Polish sample of 1,541 adults, stronger self-reported withdrawal-like experiences were associated with greater CSBD and problematic-pornography-use severity. Among participants with problematic pornography use, commonly reported experiences included difficult-to-stop sexual thoughts, difficult-to-control desire, increased arousal, irritability, mood changes, and sleep problems.\n\n'
            'The study was cross-sectional, so it does not establish that symptoms peak on day three or that everyone who stops will experience them. The useful claim is more specific: these experiences are documented in people with more severe problematic use, so noticing them in yourself is plausible and gives you something concrete to manage.\n\n'
            'Write down which urges are actually happening, what preceded them, and what response helped. Recovery gets easier to steer when the trigger is named rather than treated as a mysterious brain event.',
      ),
      QuitMilestone(
        day: 7,
        title: l10n.pornographyMilestone7Title,
        description: l10n.pornographyMilestone7Description,
        reference:
            '7-day pornography abstinence randomized controlled study (PMC)',
        link: 'https://pmc.ncbi.nlm.nih.gov/articles/PMC9847461/',
        referenceDate: 'August 2026',
        referenceContent:
            'One Week: What a Randomized Abstinence Study Found\n\n'
            'Source: Effects of a 7-Day Pornography Abstinence Period on Withdrawal-Related Symptoms in Regular Pornography Users, Archives of Sexual Behavior (2023).\n\n'
            'Researchers randomized 176 regular pornography users either to attempt seven days of abstinence or to continue as usual. Across the full sample, abstinence did not produce a significant overall increase in craving, negative mood, or withdrawal symptoms.\n\n'
            'An exploratory analysis did find increased craving among people who combined high problematic-use scores with daily pornography use before the study. That result needs replication, but it is useful: a difficult first week can be real for heavier problematic users, while a universal pornography withdrawal syndrome is not supported by this trial.\n\n'
            'If you have made it through a week, you now have better evidence about your own pattern than any generic internet timeline can provide.',
      ),
      QuitMilestone(
        day: 14,
        title: l10n.pornographyMilestone14Title,
        description: l10n.pornographyMilestone14Description,
        reference:
            'Biopsychosocial determinants of problematic pornography use - systematic review (PubMed)',
        link: 'https://pubmed.ncbi.nlm.nih.gov/38026725/',
        referenceDate: 'August 2026',
        referenceContent:
            'Two Weeks: Map the Triggers That Actually Matter\n\n'
            'Source: Biopsychosocial Determinants of Problematic Pornography Use: A Systematic Review (2023).\n\n'
            'This review synthesized 66 studies and found that problematic pornography use is associated with a mix of factors rather than one simple dopamine mechanism. Repeatedly identified psychological and social factors included craving, stress, avoidance, loneliness, self-esteem, negative beliefs, and coping style.\n\n'
            'Two weeks gives you repeated exposure to weekdays, weekends, boredom, stress, privacy, devices, and other contexts that may have cued the old behaviour. Use that data. If stress is the trigger, design a stress response. If loneliness is the trigger, add contact. If easy access is the trigger, change the environment.\n\n'
            'The evidence supports working on the drivers of problematic use; it does not require pretending that every person follows the same biological countdown.',
      ),
      QuitMilestone(
        day: 30,
        title: l10n.pornographyMilestone30Title,
        description: l10n.pornographyMilestone30Description,
        reference:
            'Problematic pornography use and sexual functioning - large community study (PubMed)',
        link: 'https://pubmed.ncbi.nlm.nih.gov/32810799/',
        referenceDate: 'August 2026',
        referenceContent:
            'One Month: Control Matters More Than a Simple Frequency Count\n\n'
            'Source: Bőthe et al., Are sexual functioning problems associated with frequent pornography use and/or problematic pornography use?, Addictive Behaviors (2021).\n\n'
            'In a community sample of 14,581 adults, problematic pornography use had a moderate positive association with sexual-functioning problems in both men and women. Pornography-use frequency by itself showed a weak negative association with those problems.\n\n'
            'That distinction matters. The evidence does not support telling every pornography user that viewing frequency alone damages sexual function. The more clinically relevant target is loss of control and the problems surrounding that pattern.\n\n'
            'At one month, compare your own baseline with now: preoccupation, time lost, ability to stop, sexual functioning, relationship conflict, and distress. Those outcomes are more informative than waiting for a mythical day-30 neurological switch.',
      ),
      QuitMilestone(
        day: 90,
        title: l10n.pornographyMilestone90Title,
        description: l10n.pornographyMilestone90Description,
        reference:
            'Acceptance and Commitment Therapy for problematic pornography use - RCT (PubMed)',
        link: 'https://pubmed.ncbi.nlm.nih.gov/27157029/',
        referenceDate: 'August 2026',
        referenceContent:
            'Three Months: Durable Change Is Possible\n\n'
            'Source: Crosby & Twohig, Acceptance and Commitment Therapy for Problematic Internet Pornography Use: A Randomized Trial, Behavior Therapy (2016).\n\n'
            'This small randomized trial compared a 12-session ACT program with a waitlist in 28 adult men. Pornography viewing fell much more in the ACT group at the end of treatment, and substantial reductions remained at the three-month follow-up.\n\n'
            'The study does not prove that 90 days of abstinence alone causes the same result, and its sample was small and demographically narrow. What it does demonstrate is important: problematic pornography use is modifiable, and structured skills can produce changes that persist beyond the immediate treatment period.\n\n'
            'If your progress still depends mostly on white-knuckling, three months is a good point to strengthen the system around it: trigger plans, acceptance of urges without acting, environmental friction, accountability, and therapy when needed.',
      ),
      QuitMilestone(
        day: 180,
        title: l10n.pornographyMilestone180Title,
        description: l10n.pornographyMilestone180Description,
        reference:
            'Group CBT for hypersexual disorder - randomized controlled study (PubMed)',
        link: 'https://pubmed.ncbi.nlm.nih.gov/30956109/',
        referenceDate: 'August 2026',
        referenceContent:
            'Six Months: Long-Term Symptom Control Can Hold\n\n'
            'Source: Hallberg et al., A Randomized Controlled Study of Group-Administered Cognitive Behavioral Therapy for Hypersexual Disorder in Men, Journal of Sexual Medicine (2019).\n\n'
            'In 137 men with out-of-control sexual behaviour, seven weeks of group CBT produced greater reductions in hypersexual symptoms and sexual compulsivity than a waitlist, along with improved psychiatric well-being. The treatment gains remained stable at both three- and six-month follow-up.\n\n'
            'This study covered hypersexual disorder more broadly rather than pornography abstinence alone, so it should not be turned into a claim that every person is biologically recovered at six months. It does support a stronger and more useful statement: sustained improvement in compulsive sexual behaviour can remain stable over this length of time.\n\n'
            'Six months is therefore a maintenance milestone. Keep the routines that made control easier instead of treating the date as permission to dismantle them.',
      ),
      QuitMilestone(
        day: 365,
        title: l10n.pornographyMilestone365Title,
        description: l10n.pornographyMilestone365Description,
        reference:
            'One-year follow-up of acceptance-based treatment for hypersexuality (PMC)',
        link: 'https://pmc.ncbi.nlm.nih.gov/articles/PMC12894211/',
        referenceDate: 'August 2026',
        referenceContent:
            'One Year: Evidence for Durable Behaviour Change\n\n'
            'Source: One-year follow-up effects of an acceptance-based treatment for hypersexuality (2026).\n\n'
            'At one-year follow-up, participants in this acceptance-based treatment study had not returned to their pretreatment levels of hypersexuality. The authors described the findings as preliminary evidence of durable, clinically meaningful benefits, with perceived control over craving among the processes followed over time.\n\n'
            'This is treatment follow-up evidence, not proof of a one-year brain reset. The meaningful claim is better anyway: clinically relevant control can persist for a year rather than disappearing as soon as the initial intervention ends.\n\n'
            'A year of your own maintained change is also a large personal dataset. Compare current control, distress, functioning, relationships, and time use with where you started; those are the outcomes that matter clinically.',
      ),
      QuitMilestone(
        day: 1825,
        title: l10n.pornographyMilestone1825Title,
        description: l10n.pornographyMilestone1825Description,
        reference:
            'Current expert review of CSBD and problematic pornography use (PubMed)',
        link: 'https://pubmed.ncbi.nlm.nih.gov/41879870/',
        referenceDate: 'August 2026',
        referenceContent:
            'Five Years: Long-Term Control Is the Outcome\n\n'
            'Source: Compulsive sexual behavior disorder and problematic pornography use: a comprehensive interdisciplinary expert-informed review (2026).\n\n'
            'Modern reviews treat CSBD and problematic pornography use as complex problems involving control, distress, functioning, context, and individual differences. There is no validated five-year neurological reset threshold.\n\n'
            'But five years is not an empty milestone. It is 1,825 days of maintaining the behavioural direction you chose. Because the clinical problem is persistent loss of control with distress or impairment, sustained control and restored functioning over years are meaningful outcomes in their own right.\n\n'
            'At this stage, the useful question is no longer whether your brain has reached a fictional percentage of rewiring. It is whether the old pattern still controls your choices or disrupts the life you want. If it does not, that is a substantive long-term success.',
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
