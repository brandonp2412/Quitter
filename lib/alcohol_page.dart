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
        reference: "WebMD - What Happens When You Quit Drinking",
        link:
            "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
        referenceDate: "March 2026",
        referenceContent:
            "What Happens to Your Body When You Stop Drinking?\n\n"
            "Within the first 24 hours of quitting alcohol, your body begins a remarkable recovery process — though it can also be a challenging time as withdrawal sets in.\n\n"
            "Sleep & REM Cycles\n"
            "Although alcohol may help you fall asleep faster, it suppresses REM (rapid eye movement) sleep — the restorative stage responsible for memory consolidation and emotional regulation. Chronic drinkers spend significantly less time in REM sleep, leading to daytime fatigue and cognitive impairment. Within the first day of stopping, your brain begins working to restore normal sleep architecture. Expect disrupted sleep at first as your body recalibrates; over the coming days and weeks, sleep quality will improve substantially.\n\n"
            "Blood Sugar Stabilization\n"
            "Alcohol interferes with the liver's ability to release glucose into the bloodstream, causing blood sugar swings. Within hours of your last drink, blood sugar begins stabilizing, which can relieve shakiness, irritability, and energy crashes associated with drinking.\n\n"
            "Withdrawal Symptoms\n"
            "For heavy or long-term drinkers, the first 24 hours may bring withdrawal symptoms: anxiety, sweating, tremors, headache, and nausea. These occur because alcohol suppresses the central nervous system over time, and the brain overcompensates when alcohol is removed. Mild withdrawal is uncomfortable but manageable; severe withdrawal (including seizures or delirium tremens) requires medical supervision. If you have been drinking heavily and daily, speak to a doctor before stopping abruptly.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.alcoholMilestone3Title,
        description: l10n.alcoholMilestone3Description,
        reference: "The Retreat NZ - What Happens When You Stop Drinking",
        link:
            "https://www.theretreatnz.org.nz/what-happens-when-you-stop-drinking-alcohol/",
        referenceDate: "March 13, 2026",
        referenceContent:
            "What Happens When You Stop Drinking Alcohol\n\n"
            "Source: The Retreat NZ\n\n"
            "The First 24–72 Hours: Acute Withdrawal Phase\n"
            "During this period, individuals may experience withdrawal symptoms including shaking, anxiety, and nausea. In severe cases, seizures or delirium tremens can occur as the body adjusts to alcohol's absence and brain chemistry stabilizes. The Retreat NZ includes a medical warning that abrupt cessation for heavy, long-term drinkers can be dangerous and may require emergency care.\n\n"
            "Cravings\n"
            "Intense cravings typically emerge around day three and may intensify by days five to seven. Individual cravings generally last only 3–5 minutes before subsiding. Recognising this brief window can help you ride out each craving rather than acting on it.\n\n"
            "Hydration Restores\n"
            "Alcohol is a diuretic — it suppresses antidiuretic hormone (ADH), causing the kidneys to excrete far more water than normal. This leads to chronic dehydration that affects skin elasticity, kidney function, and immune response. By day three, your body's fluid balance is improving significantly, which you may notice as clearer skin and better energy levels.\n\n"
            "Mental Clarity\n"
            "Alcohol negatively affects neurotransmitters, impairing memory, concentration, and cognitive function. These begin improving upon cessation. Mood enhancement and anxiety reduction also begin, despite alcohol initially appearing to calm anxiety — in reality it worsens anxiety over time.\n\n"
            "Sleep\n"
            "Sleep patterns, initially disrupted during withdrawal, begin improving as alcohol's sleep-disrupting effects fade. Most people report noticeably better quality sleep within the first week.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.alcoholMilestone7Title,
        description: l10n.alcoholMilestone7Description,
        reference: "WebMD - What Happens When You Quit Drinking",
        link:
            "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
        referenceDate: "March 2026",
        referenceContent:
            "What Happens at One Week Sober\n\n"
            "By the end of the first week without alcohol, significant physical and mental changes are underway.\n\n"
            "Immune System Recovery\n"
            "Alcohol impairs the immune system in multiple ways. Even a single episode of heavy drinking can suppress immune function for up to 24 hours. Chronic alcohol use reduces white blood cell count and impairs the body's ability to produce cytokines — the proteins that coordinate immune responses. After one week of abstinence, white blood cells begin recovering their normal function and your immune defenses start strengthening. You become measurably more resistant to common infections.\n\n"
            "Improved Sleep\n"
            "Many people reach the end of the first week and notice dramatically better sleep. REM sleep cycles are normalising, and the lighter, fragmented sleep caused by alcohol is being replaced with deeper, more restorative rest. Vivid dreams are common as your brain makes up for lost REM time.\n\n"
            "Skin & Hydration\n"
            "With alcohol's diuretic effects no longer depleting your body's water, hydration improves visibly. Skin often appears clearer and more radiant. Redness and puffiness associated with alcohol's effects on blood vessels begin subsiding.\n\n"
            "Reduced Anxiety\n"
            "Although alcohol is often used to manage anxiety, it actually worsens it over time by altering GABA and glutamate systems in the brain. After the initial withdrawal period, anxiety levels typically fall below where they were when drinking — often markedly so.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.alcoholMilestone14Title,
        description: l10n.alcoholMilestone14Description,
        reference: "Priory Group - Brain Recovery After Alcohol Abuse",
        link:
            "https://www.priorygroup.com/blog/how-long-does-brain-recovery-take-after-alcohol-abuse",
        referenceDate: "March 13, 2026",
        referenceContent:
            "How Long Does Brain Recovery Take After Alcohol Abuse?\n\n"
            "Source: Priory Group\n\n"
            "Grey Matter Recovery\n"
            "Chronic alcohol use causes the brain's grey matter to shrink — the tissue responsible for processing information, memory, and emotion. This happens through two mechanisms: permanent cell death and reversible cell size reduction. Research shows that when individuals stop drinking, cells that had shrunk begin returning to normal volume. Studies demonstrate 'a rather rapid recovery of the brain from alcohol-induced volume loss within the initial 14 days' of abstinence.\n\n"
            "Motor Function Improvements\n"
            "The cerebellum — the brain region responsible for motor coordination and fine motor skills — is particularly affected by alcohol and also recovers relatively quickly. Research shows 'obvious improvement of motor skills soon after cessation of drinking, which is paralleled by rapid volume recovery' in the cerebellum. People report improvements in coordination and steadiness of hands within the first two weeks.\n\n"
            "Cognitive Functions Recover More Slowly\n"
            "Higher cognitive functions such as divided attention, executive function, and complex reasoning recover more slowly than motor skills. Specific cortical areas show 'slower recovery of brain volumes' corresponding to the delayed restoration of these abilities. This is normal and expected — it doesn't mean recovery isn't happening.\n\n"
            "Alcohol Brain Fog Begins Lifting\n"
            "Short-term cognitive impairments — difficulty concentrating, confusion, and unclear thinking — begin improving as the brain's cognitive capacity restores after the initial two-week period.\n\n"
            "Treatment Implications\n"
            "Research suggests alcohol recovery programs should last a minimum of two weeks to allow neurological healing to begin before discontinuing support.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.alcoholMilestone30Title,
        description: l10n.alcoholMilestone30Description,
        reference: "WebMD - What Happens When You Quit Drinking",
        link:
            "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
        referenceDate: "March 2026",
        referenceContent:
            "What Happens at One Month Sober\n\n"
            "After 30 days without alcohol, the body's cardiovascular and metabolic systems show substantial, measurable improvement.\n\n"
            "Blood Pressure Normalizes\n"
            "Regular alcohol consumption is a well-established cause of elevated blood pressure (hypertension). Alcohol raises blood pressure through multiple mechanisms: activating the stress response system, increasing cortisol, and causing blood vessel constriction. After about one month of abstinence, blood pressure often returns to healthier levels. For people with alcohol-related hypertension, this reduction can be significant — sometimes comparable to blood pressure medication.\n\n"
            "Cardiovascular Risk Decreases\n"
            "Lowered blood pressure reduces strain on the heart and blood vessels. The risk of cardiovascular events decreases as these systems recover from the sustained stress of regular alcohol consumption.\n\n"
            "Liver Health Improving\n"
            "The liver, which processes about 90% of consumed alcohol, is already showing signs of recovery. Alcohol-induced liver inflammation (alcoholic hepatitis) and fat accumulation (alcoholic fatty liver disease) begin reversing. The liver is remarkably regenerative when given the chance.\n\n"
            "Weight Loss\n"
            "Alcohol is calorie-dense with no nutritional value — a typical drink contains 100–200 calories from ethanol alone, which the body prioritises metabolising over fat. Eliminating these 'empty calories' combined with improved metabolism and stabilised appetite often results in meaningful weight loss by the 30-day mark.\n\n"
            "Mental Health\n"
            "Mood stabilises significantly. The cycle of alcohol temporarily relieving anxiety/depression then worsening it upon withdrawal is broken. Many people report a sustained improvement in emotional wellbeing and overall outlook.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.alcoholMilestone60Title,
        description: l10n.alcoholMilestone60Description,
        reference: "WebMD - What Happens When You Quit Drinking",
        link:
            "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
        referenceDate: "March 2026",
        referenceContent:
            "What Happens at Two Months Sober\n\n"
            "At the 60-day mark, liver recovery is one of the most significant and measurable changes occurring in the body.\n\n"
            "Liver Function Measurably Improved\n"
            "The liver is the body's primary detoxification organ and one of the few organs capable of regenerating itself. Chronic alcohol use causes a progression of liver damage: first fatty liver disease, then alcoholic hepatitis, and potentially cirrhosis with long-term heavy use. By two months of abstinence, liver enzymes (ALT and AST) — which become elevated when liver cells are damaged — show measurable improvement. Fat accumulation in liver cells decreases substantially.\n\n"
            "Fatty Liver Disease Reversing\n"
            "Alcoholic fatty liver disease (steatosis) is often completely reversible with sustained abstinence. At the two-month mark, the liver has had significant time to clear fat deposits and begin restoring normal cell function.\n\n"
            "Digestive System Recovery\n"
            "Alcohol irritates the lining of the stomach and oesophagus, reduces production of digestive enzymes, and disrupts gut bacteria balance. By two months, digestive health shows substantial improvement: acid reflux diminishes, the gut microbiome begins restoring balance, and nutrient absorption improves.\n\n"
            "Sustained Energy & Appearance\n"
            "With the liver processing nutrients more efficiently and sleep quality continuing to improve, energy levels are substantially higher than during active drinking. Skin, hair, and eyes often show visible improvement from sustained hydration and better nutrient uptake.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.alcoholMilestone90Title,
        description: l10n.alcoholMilestone90Description,
        reference: "Rehabs.com - Alcohol and Brain Fog Treatment",
        link: "https://rehabs.com/alcohol/effects/brain-fog/",
        referenceDate: "March 2026",
        referenceContent:
            "Alcohol Brain Fog: Cognitive Recovery at 3 Months\n\n"
            "Brain fog is one of the most commonly reported symptoms of alcohol use disorder and one of the most dramatic areas of recovery during sobriety.\n\n"
            "What Is Alcohol Brain Fog?\n"
            "Alcohol brain fog refers to a cluster of cognitive symptoms: difficulty concentrating, mental fatigue, memory lapses, confused thinking, and slowed information processing. These occur because alcohol is a central nervous system depressant that disrupts neurotransmitter function, damages white matter in the brain (which coordinates communication between brain regions), and causes chronic inflammation of brain tissue.\n\n"
            "Cognitive Recovery at 90 Days\n"
            "Research shows that people who maintain abstinence continue to recover cognitive function over the first several months. By three months, significant improvements are typically measurable in:\n"
            "• Working memory — the ability to hold and use information in the short term\n"
            "• Executive function — planning, decision-making, impulse control\n"
            "• Processing speed — how quickly the brain handles information\n"
            "• Concentration and sustained attention\n\n"
            "Many people describe a qualitative shift around the 90-day mark where the 'mental fog' they had grown accustomed to during drinking is clearly gone — thinking feels sharper and more reliable.\n\n"
            "Social & Relationship Benefits\n"
            "With improved cognitive function and emotional regulation, relationships typically improve significantly. Studies show the majority of individuals in recovery report improved connections with friends, family, and colleagues by this stage.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.alcoholMilestone180Title,
        description: l10n.alcoholMilestone180Description,
        reference: "Rehabs.com - Alcohol and Brain Fog Treatment",
        link: "https://rehabs.com/alcohol/effects/brain-fog/",
        referenceDate: "March 2026",
        referenceContent:
            "Brain Recovery at Six Months of Sobriety\n\n"
            "Six months of sobriety represents a major neurological milestone. The brain continues to heal and adapt in ways that are increasingly measurable.\n\n"
            "Continued Brain Volume Recovery\n"
            "Research demonstrates that brain volume continues to increase during sustained abstinence well beyond the initial two-week recovery period. Grey matter density, particularly in the prefrontal cortex (responsible for judgment, planning, and self-control), continues improving at the six-month mark. This corresponds directly with continued improvements in higher-order thinking.\n\n"
            "Neural Plasticity\n"
            "The brain's ability to form new neural connections — neuroplasticity — is impaired by chronic alcohol use. By six months of abstinence, neuroplasticity is substantially restored. This means the brain is more capable of learning, adapting, and rewiring unhealthy patterns, which is why this period is often described as a critical window for therapy and habit formation.\n\n"
            "Cognitive Abilities Continue Improving\n"
            "Areas that recover more slowly — such as divided attention, complex reasoning, and verbal learning — show significant gains at the six-month mark. Many people find they are able to engage in complex work, creative projects, or academic study in ways that felt impossible while drinking.\n\n"
            "Emotional Regulation\n"
            "The brain's limbic system (emotional processing) and its regulation by the prefrontal cortex become increasingly balanced. Emotional reactivity decreases, and the ability to tolerate stress without alcohol improves markedly.\n\n"
            "Overall Wellbeing\n"
            "At six months, the compounding benefits of better sleep, improved nutrition, restored organ function, and neural recovery often produce a profound sense of physical and mental wellbeing that motivates continued sobriety.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.alcoholMilestone365Title,
        description: l10n.alcoholMilestone365Description,
        reference: "WebMD - What Happens When You Quit Drinking",
        link:
            "https://www.webmd.com/mental-health/addiction/ss/slideshow-quit-alcohol-effects",
        referenceDate: "March 2026",
        referenceContent:
            "What Happens at One Year Sober\n\n"
            "One year without alcohol is a profound milestone. The compounding effects of sustained sobriety are now measurable across virtually every body system.\n\n"
            "Cancer Risk Reduction\n"
            "Alcohol is classified as a Group 1 carcinogen by the World Health Organization — the highest risk category. It increases risk for cancers of the mouth, throat, oesophagus, liver, colon, and breast. The mechanisms include: acetaldehyde (a toxic byproduct of alcohol metabolism) damaging DNA, alcohol increasing oestrogen levels (linked to breast cancer), and chronic inflammation promoting tumour growth. While research on the exact timeline of risk reduction is still developing and varies by cancer type, sustained abstinence is associated with meaningful reductions in risk. The liver in particular shows strong evidence of risk reduction with prolonged sobriety.\n\n"
            "Liver Health\n"
            "For those with alcohol-related fatty liver disease or alcoholic hepatitis (without cirrhosis), one year of abstinence gives the liver substantial opportunity to heal. Liver enzyme levels often normalise completely. The liver's regenerative capacity is extraordinary when alcohol is consistently absent.\n\n"
            "Cardiovascular Health\n"
            "The cardiovascular benefits accumulate over the year: sustained lower blood pressure, reduced risk of irregular heart rhythms (arrhythmias), and improved cholesterol levels all contribute to meaningfully lower cardiovascular disease risk.\n\n"
            "Life Quality\n"
            "At one year, the psychological benefits of sobriety — clearer thinking, emotional stability, improved relationships, financial savings, restored self-esteem — are often described as transformative. Many people reflect that their sense of who they are has fundamentally changed for the better.",
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
