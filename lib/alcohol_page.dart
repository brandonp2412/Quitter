import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class AlcoholPage extends StatelessWidget {
  final bool started;

  const AlcoholPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.alcoholMilestone1Title,
        description: l10n.alcoholMilestone1Description,
        reference: "Colrain et al., \"Alcohol and the Sleeping Brain\" (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5821259/",
        referenceDate: "June 2026",
        referenceContent:
            "What Happens to Your Sleep When You Stop Drinking?\n\n"
            "Source: \"Alcohol and the Sleeping Brain\" (Colrain, Nicholas & Baker), Handbook of Clinical Neurology — peer-reviewed, NIH-hosted\n\n"
            "Alcohol and Sleep Architecture\n"
            "Alcohol is sedating, so it shortens the time it takes to fall asleep and increases deep slow-wave sleep in the first half of the night. But it comes at a cost: alcohol suppresses REM (rapid eye movement) sleep — the restorative stage tied to memory consolidation and emotional regulation — and fragments sleep in the second half of the night as it is metabolised.\n\n"
            "The First Night Off Alcohol\n"
            "Because the brain has adapted to alcohol's suppression of REM, the first nights of abstinence often bring a REM 'rebound': vivid or intense dreams and lighter, broken sleep as sleep architecture recalibrates. This is a normal, temporary part of recovery.\n\n"
            "Recovery Begins\n"
            "As the brain readjusts over the following days and weeks, REM and overall sleep quality improve. Sleep disturbance is one of the most persistent withdrawal-related symptoms, but it trends toward normal with sustained abstinence.\n\n"
            "A Note on Heavy Drinking\n"
            "For heavy or long-term daily drinkers, the first 24 hours can also bring withdrawal symptoms (anxiety, sweating, tremor, nausea). Severe withdrawal can be dangerous — if you have been drinking heavily every day, talk to a doctor before stopping abruptly.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.alcoholMilestone3Title,
        description: l10n.alcoholMilestone3Description,
        reference: "StatPearls, \"Alcohol Withdrawal\" (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK441882/",
        referenceDate: "June 2026",
        referenceContent:
            "The Acute Phase and Early Recovery\n\n"
            "Source: \"Alcohol Withdrawal,\" StatPearls — peer-reviewed, NIH National Library of Medicine\n\n"
            "The First 24–72 Hours\n"
            "StatPearls documents that withdrawal symptoms appear within hours of the last drink — tremor, insomnia, agitation, sweating, raised heart rate and blood pressure — and that symptoms typically peak around 72 hours. Most people are over the worst of the acute phase by the end of day three. Severe withdrawal (seizures, or delirium tremens beginning roughly 48–72 hours in) is a medical emergency: heavy daily drinkers should not stop abruptly without medical advice.\n\n"
            "Cravings Come in Waves\n"
            "Cravings often intensify across the first several days, but an individual craving is short-lived — usually passing within minutes. Recognising that each wave subsides on its own makes them easier to ride out.\n\n"
            "Hydration Recovers\n"
            "Alcohol suppresses antidiuretic hormone (ADH), making the kidneys excrete more water and leaving regular drinkers chronically dehydrated. Once drinking stops, this diuretic effect ends and fluid balance begins to recover over the first few days — often noticed as clearer skin and steadier energy.\n\n"
            "Mind and Sleep Begin to Settle\n"
            "As the acute phase passes, the brain chemistry that alcohol disrupted (GABA and glutamate) starts to rebalance. Mental clarity improves and sleep — badly fragmented during early withdrawal — begins trending toward better quality over the first week.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.alcoholMilestone7Title,
        description: l10n.alcoholMilestone7Description,
        reference: "Sarkar et al., \"Alcohol and the Immune System\" (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4590612/",
        referenceDate: "June 2026",
        referenceContent:
            "How the Immune System Recovers\n\n"
            "Source: \"Alcohol and the Immune System\" (Sarkar, Jung & Wang), Alcohol Research: Current Reviews — peer-reviewed, NIH-hosted\n\n"
            "How Alcohol Weakens Immunity\n"
            "The review documents that alcohol disrupts immune defences at every level. Even a single episode of heavy drinking impairs the body's ability to fight infection for up to 24 hours. Chronic use reduces the number and function of white blood cells (including monocytes, neutrophils and T cells), disrupts cytokine signalling — the chemical messengers that coordinate an immune response — and damages the gut barrier and lung defences, leaving drinkers more prone to pneumonia, sepsis and slow wound healing.\n\n"
            "Removing the Insult\n"
            "Many of these effects are driven by ongoing alcohol exposure. When drinking stops, the constant suppression is lifted: white-cell counts and cytokine balance begin to recover, and the gut and airway defences start to repair. Within the first week, your immune system is no longer being knocked down daily and resistance to common infections begins to improve.\n\n"
            "A Gradual Process\n"
            "Full immune recovery takes longer than a week, and the degree of repair depends on how heavy and prolonged the drinking was — but the first week off alcohol is where the rebuilding begins.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.alcoholMilestone14Title,
        description: l10n.alcoholMilestone14Description,
        reference:
            "Bartsch et al., \"Manifestations of early brain recovery...\", Brain (2007)",
        link: "https://pubmed.ncbi.nlm.nih.gov/17178742/",
        referenceDate: "June 2026",
        referenceContent:
            "Early Brain Recovery in Abstinence\n\n"
            "Source: Bartsch AJ et al., \"Manifestations of early brain recovery associated with abstinence from alcoholism,\" Brain (2007) — peer-reviewed\n\n"
            "Measuring Recovery\n"
            "This study used MRI to follow recently detoxified people with alcohol dependence through the first weeks of abstinence, comparing them with healthy controls. It captured the brain physically rebuilding once drinking stopped.\n\n"
            "Brain Volume Rebounds\n"
            "Chronic alcohol use shrinks the brain — partly through reversible reduction in cell size, not only permanent cell loss. With abstinence, the researchers measured an average global brain-volume gain of nearly 2%, concentrated around the cerebellum, midbrain, ventricles and frontal regions. Much of this regrowth happens early, in the first couple of weeks off alcohol.\n\n"
            "Cerebellum and Attention\n"
            "Recovery was especially marked in the cerebellum (motor coordination) — cerebellar choline rose significantly — and gains in frontal N-acetylaspartate (a marker of neuron health) tracked with measurable improvements in attention. In other words, the structural healing came with real cognitive gains.\n\n"
            "A Foundation, Not the Finish\n"
            "Higher functions such as complex reasoning recover more gradually, but the first two weeks establish that the brain begins healing quickly once alcohol is removed.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.alcoholMilestone30Title,
        description: l10n.alcoholMilestone30Description,
        reference:
            "Roerecke et al., alcohol reduction & blood pressure, Lancet Public Health (2017)",
        link: "https://pubmed.ncbi.nlm.nih.gov/29253389/",
        referenceDate: "June 2026",
        referenceContent:
            "Blood Pressure Falls When You Cut Out Alcohol\n\n"
            "Source: Roerecke et al., \"The effect of a reduction in alcohol consumption on blood pressure: a systematic review and meta-analysis,\" Lancet Public Health (2017) — peer-reviewed\n\n"
            "The Evidence\n"
            "This meta-analysis pooled 36 randomised trials (about 2,865 participants) testing what happens to blood pressure when people drink less. It found a clear, dose-dependent effect: the more someone cut back, the more their blood pressure dropped.\n\n"
            "How Big Is the Effect?\n"
            "Among heavier drinkers (more than two drinks a day) who roughly halved their intake, systolic blood pressure fell by about 5.5 mmHg and diastolic by about 4.0 mmHg on average. A reduction of that size is clinically meaningful — comparable to some blood-pressure medications and enough to lower long-term stroke and heart-disease risk.\n\n"
            "Why One Month Matters\n"
            "Alcohol raises blood pressure by activating the stress response, raising cortisol and stiffening blood vessels. The trials in this review show the benefit emerges over weeks of sustained reduction — so by around a month of abstinence, a heavier drinker's blood pressure has had time to settle toward a healthier level.\n\n"
            "A Threshold Effect\n"
            "The review notes the benefit was concentrated in heavier drinkers; for light drinkers the change was smaller. The heavier the prior drinking, the bigger the cardiovascular payoff from stopping.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.alcoholMilestone60Title,
        description: l10n.alcoholMilestone60Description,
        reference: "NIAAA - Alcohol's Effects on the Body",
        link:
            "https://www.niaaa.nih.gov/alcohols-effects-health/alcohols-effects-body",
        referenceDate: "June 2026",
        referenceContent:
            "Liver Recovery After You Stop Drinking\n\n"
            "Source: National Institute on Alcohol Abuse and Alcoholism (NIAAA), \"Alcohol's Effects on the Body\"\n\n"
            "How Alcohol Damages the Liver\n"
            "The liver processes most of the alcohol you drink, and it takes the brunt of the damage. NIAAA describes a progression of alcohol-related liver injury: it begins with fatty liver (steatosis — fat building up in liver cells), can advance to alcoholic hepatitis (inflammation), and with prolonged heavy use to fibrosis and cirrhosis (scarring).\n\n"
            "The Earlier Stages Are Reversible\n"
            "The crucial point is that the liver is highly regenerative, and the early stages of this damage can improve when drinking stops. Fatty liver in particular often resolves with sustained abstinence. By around two months alcohol-free, the liver has had real time to clear fat deposits, calm inflammation, and restore healthier function — typically reflected in falling liver-enzyme levels (ALT and AST).\n\n"
            "Beyond the Liver\n"
            "NIAAA notes alcohol also strains the heart, pancreas and immune system. Giving the body a sustained break from alcohol lets these systems recover too — contributing to the steadier energy and better overall health many people notice by this stage.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.alcoholMilestone90Title,
        description: l10n.alcoholMilestone90Description,
        reference:
            "Recovery of neuropsychological function following abstinence (PMC, 2024)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10760842/",
        referenceDate: "June 2026",
        referenceContent:
            "Cognitive Recovery After Three Months Sober\n\n"
            "Source: Systematic review of neuropsychological recovery following abstinence from alcohol (PubMed Central, 2024) — peer-reviewed\n\n"
            "What the Evidence Shows\n"
            "This systematic review pooled studies tracking how thinking skills recover after people stop drinking. The headline finding: most neurocognitive functions in alcohol use disorder recover toward normal within roughly 6 to 12 months of abstinence — and some domains bounce back earlier.\n\n"
            "What Improves First\n"
            "Basic processing speed and working memory are among the earliest to recover, so by around the three-month mark many people already notice the 'fog' lifting:\n"
            "• Working memory — holding and using information in the moment\n"
            "• Processing speed — how quickly the brain handles information\n"
            "• Attention and concentration\n"
            "• Executive functions — planning, decision-making, impulse control\n\n"
            "What Influences Recovery\n"
            "The review notes recovery is shaped by factors such as age, smoking status and premorbid ability — but, encouragingly, not consistently by the total amount previously drunk. Recovery is the expected trajectory.\n\n"
            "Why It Matters\n"
            "Regaining cognitive function isn't just about feeling sharper — better attention and decision-making support staying in treatment and protecting against relapse.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.alcoholMilestone180Title,
        description: l10n.alcoholMilestone180Description,
        reference:
            "Structural & functional brain recovery during abstinence (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8885813/",
        referenceDate: "June 2026",
        referenceContent:
            "Brain Recovery at Six Months of Sobriety\n\n"
            "Source: Peer-reviewed review of structural and functional brain recovery during abstinence from substance use (PubMed Central)\n\n"
            "Recovery Keeps Going\n"
            "The early brain-volume rebound of the first weeks is only the beginning. This review documents that with sustained abstinence the brain continues to recover structurally and functionally — grey matter recovers and damaged white-matter pathways that coordinate communication between brain regions repair over months.\n\n"
            "The Prefrontal Cortex\n"
            "Recovery is especially relevant for the prefrontal cortex — the seat of judgment, planning and self-control. As it heals, higher-order thinking and impulse control continue to strengthen, which is part of why a period like six months is often when people feel genuinely back in command of their decisions.\n\n"
            "Neuroplasticity and Function\n"
            "Alongside structural repair, the review describes recovery of brain function and connectivity — the basis of neuroplasticity, the brain's capacity to learn and rewire. This makes sustained abstinence a powerful window for therapy and building new habits.\n\n"
            "An Honest Caveat\n"
            "Recovery is real but not always complete, and its extent varies with how heavy and prolonged the use was, and with age. Still, by six months the direction of travel is clearly toward a healthier, better-functioning brain.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.alcoholMilestone365Title,
        description: l10n.alcoholMilestone365Description,
        reference: "National Cancer Institute - Alcohol and Cancer Risk",
        link:
            "https://www.cancer.gov/about-cancer/causes-prevention/risk/alcohol/alcohol-fact-sheet",
        referenceDate: "June 2026",
        referenceContent:
            "Alcohol, Cancer Risk, and Stopping\n\n"
            "Source: National Cancer Institute (NCI), \"Alcohol and Cancer Risk\"\n\n"
            "Alcohol Causes Cancer\n"
            "The NCI states there is a strong scientific consensus that drinking alcohol can cause cancer. Alcohol is linked to cancers of the mouth (oral cavity), pharynx (throat), larynx (voice box), oesophagus, liver, breast, and colon and rectum. The more a person drinks — and the longer they drink — the higher the risk.\n\n"
            "How Alcohol Drives Cancer\n"
            "Mechanisms include acetaldehyde, a toxic breakdown product of alcohol that damages DNA; oxidative stress and inflammation; impaired absorption of protective nutrients; and, for breast cancer, raised oestrogen levels.\n\n"
            "Risk Falls After You Stop\n"
            "Importantly, the NCI reports that quitting drinking is associated with lower risk over time — studies show the elevated risk of cancers of the oral cavity and oesophagus declines after stopping, though it can take years to approach the risk of someone who never drank. One year alcohol-free is a meaningful step on that path.\n\n"
            "Compounding Benefits\n"
            "Reaching a year also locks in the cardiovascular and liver gains of abstinence — lower blood pressure, reduced arrhythmia risk, and continued liver healing — alongside the falling cancer risk.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.alcoholPageTitle,
      storageKey: 'alcohol',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.alcoholHeaderStarted,
      headerNotStarted: l10n.alcoholHeaderNotStarted,
      subtitleStarted: l10n.alcoholSubtitleStarted,
      subtitleNotStarted: l10n.alcoholSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
