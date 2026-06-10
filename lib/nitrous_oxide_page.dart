import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class NitrousOxidePage extends StatelessWidget {
  final bool started;

  const NitrousOxidePage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.nitrousOxideMilestone1Title,
        description: l10n.nitrousOxideMilestone1Description,
        reference: "Nitrous Oxide — NHS",
        link: "https://www.nhs.uk/conditions/recreational-drugs/nitrous-oxide/",
        referenceDate: "June 2026",
        referenceContent:
            "Day One: Clearing Your System\n\n"
            "Source: NHS — Nitrous Oxide\n\n"
            "Nitrous oxide leaves your body very quickly — within minutes of your last use, the gas itself is gone. But the effects of regular use linger longer than the high.\n\n"
            "What Happens on Day One\n"
            "• Dizziness and light-headedness settle within a few hours\n"
            "• Headaches are common — partly from oxygen displacement, partly dehydration\n"
            "• Ears may ring for a short time (temporary hearing effects are documented)\n"
            "• Mood may feel flat or irritable as the dopamine boost fades\n\n"
            "The B12 Problem\n"
            "The NHS highlights that nitrous oxide inactivates vitamin B12. A single session causes temporary B12 inactivation; repeated or heavy use causes a significant and lasting deficiency. B12 is essential for nerve function, red blood cell production, and brain health — its depletion is the main long-term risk from regular use.\n\n"
            "What to Do\n"
            "The NHS recommends starting B12 supplementation promptly if you've been using regularly. Speaking to a GP is advisable — a blood test can check your B12 level and a doctor can prescribe injections if needed.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.nitrousOxideMilestone3Title,
        description: l10n.nitrousOxideMilestone3Description,
        reference: "Nitrous Oxide Toxicity — StatPearls (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK532957/",
        referenceDate: "June 2026",
        referenceContent:
            "72 Hours: The Cravings Are Psychological\n\n"
            "Source: \"Nitrous Oxide Toxicity,\" StatPearls, U.S. National Library of Medicine\n\n"
            "Unlike opioids or alcohol, nitrous oxide does not cause a physical withdrawal syndrome. The urges at three days are psychological — habit, boredom, and association — not the body demanding a substance to function.\n\n"
            "What the Research Says\n"
            "StatPearls documents that the acute toxicity of nitrous oxide comes from oxygen displacement (causing hypoxia with very heavy use), direct B12 inactivation, and, with chronic use, subacute combined degeneration of the spinal cord (damage to nerve pathways). These risks are stopping now that use has stopped.\n\n"
            "Neurological Symptoms — Know the Signs\n"
            "StatPearls lists symptoms of B12-related neurological injury to watch for:\n"
            "• Tingling or numbness in hands or feet\n"
            "• Weakness in legs\n"
            "• Balance or coordination problems\n"
            "• Memory difficulty\n\n"
            "If any of these are present, seek medical attention — early B12 treatment can halt and often reverse nerve damage.\n\n"
            "The Good News\n"
            "Three days in, no new damage is being done. The recovery process has begun.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.nitrousOxideMilestone7Title,
        description: l10n.nitrousOxideMilestone7Description,
        reference: "Nitrous Oxide Misuse and Vitamin B12 Deficiency — NCBI PMC",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10580073/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week: B12 Recovery Underway\n\n"
            "Source: Review of nitrous oxide misuse and vitamin B12 deficiency, PMC (2023)\n\n"
            "A week without nitrous oxide is a meaningful milestone, particularly for B12 recovery. This review documents the mechanism by which nitrous oxide destroys B12: it oxidises the cobalt atom in cobalamin, permanently inactivating B12 molecules. Since the body cannot reactivate them, recovery depends on absorbing new B12 — either from food or supplements.\n\n"
            "The B12 Timeline\n"
            "• Dietary B12 alone takes months to replenish stores in deficient individuals\n"
            "• Oral high-dose supplements (1000 mcg/day) can restore levels over weeks\n"
            "• Intramuscular injections (prescribed by a doctor) are the fastest route\n\n"
            "By one week without use, no further B12 is being destroyed. If you are supplementing, levels are already starting to climb.\n\n"
            "Who Is Most at Risk\n"
            "The review identifies those at highest risk of serious deficiency: people who used heavily or frequently, vegans (who start with lower B12), and those with absorption problems. All should have blood levels checked.\n\n"
            "Mental Health\n"
            "Cravings are typically manageable at one week. Mood may still feel somewhat flat — this is normal and lifts as B12 and general health recover.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.nitrousOxideMilestone14Title,
        description: l10n.nitrousOxideMilestone14Description,
        reference: "Nitrous Oxide Toxicity — StatPearls (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK532957/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks: Nervous System Recovery\n\n"
            "Source: \"Nitrous Oxide Toxicity,\" StatPearls, U.S. National Library of Medicine\n\n"
            "Two weeks without nitrous oxide and with B12 supplementation is when many people begin to notice early neurological improvements — or, importantly, when tingling or numbness that was previously masked by continued use becomes apparent.\n\n"
            "Subacute Combined Degeneration — What It Is\n"
            "StatPearls explains that B12 deficiency from heavy nitrous oxide use can damage the spinal cord's myelin sheath (the protective coating on nerve fibres). This is called subacute combined degeneration. Symptoms range from tingling to weakness to loss of coordination.\n\n"
            "The Critical Window\n"
            "StatPearls emphasises that early B12 treatment can halt progression and often reverse these symptoms — but delays worsen outcomes. If any neurological symptoms are present at two weeks, medical assessment is important.\n\n"
            "What Is Improving\n"
            "For those without severe deficiency:\n"
            "• Mood is stabilising as dopamine function normalises\n"
            "• Energy is returning\n"
            "• Sleep quality improving\n"
            "• Cravings becoming less frequent and easier to manage",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.nitrousOxideMilestone30Title,
        description: l10n.nitrousOxideMilestone30Description,
        reference: "Nitrous Oxide — NHS",
        link: "https://www.nhs.uk/conditions/recreational-drugs/nitrous-oxide/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month: B12 Levels Climbing\n\n"
            "Source: NHS — Nitrous Oxide\n\n"
            "One month is a significant milestone in B12 recovery. The NHS explains that regular nitrous oxide use can lead to serious B12 deficiency — and that once use stops, levels can be restored with supplementation.\n\n"
            "What Should Be Improving at One Month\n"
            "• Energy levels: B12 is essential for red blood cell production; better B12 means better oxygen delivery and less fatigue\n"
            "• Nerve function: tingling and numbness should be fading if B12 supplementation was started early\n"
            "• Mood: B12 is involved in producing serotonin and dopamine; mood typically improves as levels recover\n"
            "• Concentration and memory: cognitive effects of B12 deficiency lift as levels restore\n\n"
            "Financial and Lifestyle Benefits\n"
            "The NHS notes that the costs of regular nitrous oxide use are significant. At one month, the money saved is real and can be redirected.\n\n"
            "Cravings at One Month\n"
            "Psychological cravings are present but manageable for most people at this stage. Identifying and planning for trigger situations (social settings, stress, boredom) remains important.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.nitrousOxideMilestone90Title,
        description: l10n.nitrousOxideMilestone90Description,
        reference: "Nitrous Oxide Misuse and Vitamin B12 Deficiency — NCBI PMC",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10580073/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months: Neurological Healing\n\n"
            "Source: Review of nitrous oxide misuse and vitamin B12 deficiency, PMC (2023)\n\n"
            "Three months is the point at which B12 supplementation has had time to make a meaningful difference to neurological function. This review documents cases of significant — and sometimes complete — recovery from nitrous oxide-related nerve damage following sustained B12 treatment.\n\n"
            "What the Research Shows\n"
            "The review documents that with early and consistent B12 treatment:\n"
            "• Tingling and numbness typically resolve or substantially improve\n"
            "• Motor strength returns in most cases\n"
            "• Balance and coordination improve\n"
            "• Cognitive symptoms (brain fog, memory difficulty) lift\n\n"
            "Recovery Takes Time\n"
            "The review is honest that recovery depends on the severity of deficiency and how quickly treatment started. Mild deficiency with early treatment often resolves fully. Severe or long-standing damage may only partially recover — which is why stopping use and starting B12 promptly is so important.\n\n"
            "At Three Months Without Nitrous Oxide\n"
            "B12 stores should be substantially restored. Energy, mood, and cognitive function are typically much improved. The nervous system continues to heal — and that process accelerates as each day without nitrous oxide passes.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.nitrousOxideMilestone365Title,
        description: l10n.nitrousOxideMilestone365Description,
        reference: "Nitrous Oxide Toxicity — StatPearls (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK532957/",
        referenceDate: "June 2026",
        referenceContent:
            "One Year: Long-Term Health Secured\n\n"
            "Source: \"Nitrous Oxide Toxicity,\" StatPearls, U.S. National Library of Medicine\n\n"
            "One year without nitrous oxide means one year without B12 destruction, one year of neurological recovery, and one year of the brain and nervous system healing.\n\n"
            "Where You Are at One Year\n"
            "• B12 levels: fully restored (and should be maintained with diet or ongoing supplementation)\n"
            "• Nervous system: significant healing has occurred; for most people with B12-related symptoms, the worst is behind them\n"
            "• Bone marrow: blood cell production normalised — no more macrocytic anaemia\n"
            "• Mood and energy: operating at full capacity without the dopamine loop of regular use\n"
            "• Cardiovascular: nitrous oxide causes elevated homocysteine (a cardiovascular risk marker) via B12 depletion — at one year, homocysteine has normalised\n\n"
            "What StatPearls Confirms\n"
            "StatPearls documents that outcomes for nitrous oxide-related toxicity are generally good with cessation and B12 treatment, particularly when intervention is not delayed. One year represents the completion of the acute recovery phase.\n\n"
            "The Best Protection\n"
            "Continued abstinence is the only guarantee against future B12 destruction. A year in, that protection is firmly in place.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.nitrousOxidePageTitle,
      storageKey: 'nitrous_oxide',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.nitrousOxideHeaderStarted,
      headerNotStarted: l10n.nitrousOxideHeaderNotStarted,
      subtitleStarted: l10n.nitrousOxideSubtitleStarted,
      subtitleNotStarted: l10n.nitrousOxideSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
