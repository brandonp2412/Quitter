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
        reference: "Nitrous Oxide — StatPearls (NCBI Bookshelf)",
        link: "https://pubmed.ncbi.nlm.nih.gov/30422517/",
        referenceDate: "July 2026",
        referenceContent:
            "Day One: The Gas Is Gone, but Watch B12\n\n"
            "Source: Knuf & Maani, \"Nitrous Oxide,\" StatPearls (NCBI Bookshelf)\n\n"
            "How Fast It Clears\n"
            "Nitrous oxide has a rapid onset of action — 2 to 5 minutes — and clears from the body just as quickly once you stop inhaling it. By today, none of the gas itself remains in your system.\n\n"
            "The Real Risk Isn't the Gas\n"
            "What matters after stopping is what repeated exposure may have already done. Nitrous oxide inactivates methionine synthase, an enzyme that depends on vitamin B12. StatPearls notes that repeated exposure — occupational or recreational — can lead to megaloblastic anaemia and neurological dysfunction, and in rare cases, degeneration of the spinal cord.\n\n"
            "If You Used Heavily or Often\n"
            "Nitrous oxide isn't documented to cause a physical withdrawal syndrome the way opioids or alcohol do, so day one isn't about your body demanding the drug. It's about starting to pay attention to B12-related symptoms — covered in the next few milestones — and getting checked if any appear.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.nitrousOxideMilestone3Title,
        description: l10n.nitrousOxideMilestone3Description,
        reference: "Nitrous Oxide — StatPearls (NCBI Bookshelf)",
        link: "https://pubmed.ncbi.nlm.nih.gov/30422517/",
        referenceDate: "July 2026",
        referenceContent:
            "72 Hours: No Physical Withdrawal, But Watch for Nerve Symptoms\n\n"
            "Source: Knuf & Maani, StatPearls; Tikaria et al. (2026), Cureus\n\n"
            "Unlike opioids or alcohol, nitrous oxide isn't documented to cause a physical withdrawal syndrome. Urges at this stage are habit and craving, not the body demanding the drug to function.\n\n"
            "Watch for These\n"
            "A systematic review of 1,809 recreational nitrous oxide cases (Tikaria et al., 2026) found neurological symptoms — especially tingling or numbness (paresthesia) — were the most common sign of B12-related harm, often appearing even when standard blood tests looked normal. Gait problems and weakness were also reported.\n\n"
            "If You Notice Any of These\n"
            "Seek medical review. The same review found standard blood tests (haemoglobin, serum B12) missed a meaningful share of affected patients — tests for methylmalonic acid (MMA) and homocysteine are more sensitive and should be requested specifically if you disclose nitrous oxide use.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.nitrousOxideMilestone7Title,
        description: l10n.nitrousOxideMilestone7Description,
        reference:
            "The Toxic Legacy of Recreational Nitrous Oxide Use (Cureus)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC13267259/",
        referenceDate: "July 2026",
        referenceContent:
            "One Week: Get Tested if You Used Heavily\n\n"
            "Source: Tikaria et al. (2026), \"The Toxic Legacy of Recreational Nitrous Oxide Use,\" Cureus\n\n"
            "What the Evidence Shows\n"
            "This systematic review found that vitamin B12 deficiency from nitrous oxide is often \"functional\" — serum B12 looked normal in roughly half of affected patients, even when they had real neurological damage. Homocysteine and MMA were abnormal far more often (84% and 73% of tested patients respectively) and are the more reliable markers.\n\n"
            "What to Do\n"
            "If your use was heavy or frequent, one week off is a reasonable time to see a doctor and ask for homocysteine and MMA testing specifically — not just a standard B12 level — especially if you have any tingling, numbness, balance problems, or unexplained weakness.\n\n"
            "The review doesn't report how quickly symptoms resolve after stopping, but it's clear that delayed diagnosis lets neurological damage progress and become irreversible — which is why testing early matters more than waiting to see if symptoms fade on their own.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.nitrousOxideMilestone14Title,
        description: l10n.nitrousOxideMilestone14Description,
        reference: "Nitrous Oxide — StatPearls (NCBI Bookshelf)",
        link: "https://pubmed.ncbi.nlm.nih.gov/30422517/",
        referenceDate: "July 2026",
        referenceContent:
            "Two Weeks: Neurological Symptoms Deserve Follow-Up\n\n"
            "Source: Tikaria et al. (2026), Cureus; Knuf & Maani, StatPearls\n\n"
            "What's Been Reported\n"
            "Case reports and series reviewed by Tikaria et al. describe nitrous oxide-related nerve damage presenting as sensory loss, gait ataxia, and sometimes weakness affecting walking — findings that can resemble other neurological conditions and are sometimes missed if nitrous oxide use isn't mentioned to a clinician.\n\n"
            "An Honest Note on Timelines\n"
            "Neither source reports how long recovery normally takes once use stops and any deficiency is treated. Case reports describe a wide range of outcomes — from full recovery to lasting deficits — depending largely on how much damage occurred before diagnosis. What's consistent across the literature is that earlier treatment leads to better outcomes.\n\n"
            "If You Haven't Been Checked\n"
            "Two weeks off is still a good time to get bloodwork done, even without symptoms — particularly homocysteine and MMA rather than serum B12 alone.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.nitrousOxideMilestone30Title,
        description: l10n.nitrousOxideMilestone30Description,
        reference: "Nitrous Oxide — StatPearls (NCBI Bookshelf)",
        link: "https://pubmed.ncbi.nlm.nih.gov/30422517/",
        referenceDate: "July 2026",
        referenceContent:
            "One Month: Habit and Craving, Not Physical Dependence\n\n"
            "Source: Knuf & Maani, \"Nitrous Oxide,\" StatPearls (NCBI Bookshelf)\n\n"
            "Where You Stand\n"
            "StatPearls doesn't describe nitrous oxide as producing a physical dependence syndrome, so a month off means any lingering urges are about habit, social context, or boredom rather than a body still adjusting to the drug's absence.\n\n"
            "The B12 Question\n"
            "If you were tested and treated for B12 deficiency, one month is a reasonable point for your doctor to check whether your levels — and any symptoms — have responded. If you weren't tested and used heavily, it's still worth asking.\n\n"
            "What's Protected\n"
            "Every month you don't use is a month you're not adding to any existing methionine synthase inactivation or the neurological risk that comes with it.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.nitrousOxideMilestone90Title,
        description: l10n.nitrousOxideMilestone90Description,
        reference:
            "The Toxic Legacy of Recreational Nitrous Oxide Use (Cureus)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC13267259/",
        referenceDate: "July 2026",
        referenceContent:
            "Three Months: Time to Recheck, if You Haven't\n\n"
            "Source: Tikaria et al. (2026), \"The Toxic Legacy of Recreational Nitrous Oxide Use,\" Cureus\n\n"
            "What We Know — and Don't\n"
            "This research base is built from case reports and case series, not controlled recovery studies, so there's no reliable published timeline for how symptoms resolve by three months specifically. What the evidence does show is that outcomes vary widely — some patients with mild, early-caught deficiency recover fully, while those with delayed diagnosis or more severe nerve damage can have lasting deficits.\n\n"
            "The Actionable Part\n"
            "If you had any neurological symptoms and haven't had follow-up bloodwork or a specialist review, three months off is a sensible point to do so. If you were treated and improving, this is a reasonable time to confirm the trend is continuing with your doctor.\n\n"
            "Staying Off Matters Most\n"
            "The review is consistent about one thing: continued exposure keeps inactivating B12 and adding to the risk. Not using is the single biggest factor in your favour.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.nitrousOxideMilestone365Title,
        description: l10n.nitrousOxideMilestone365Description,
        reference: "Nitrous Oxide — StatPearls (NCBI Bookshelf)",
        link: "https://pubmed.ncbi.nlm.nih.gov/30422517/",
        referenceDate: "July 2026",
        referenceContent:
            "One Year: The Best Protection Is Continued Abstinence\n\n"
            "Source: Knuf & Maani, StatPearls; Tikaria et al. (2026), Cureus\n\n"
            "Where the Evidence Actually Lands\n"
            "Neither source promises a specific recovery timeline, and that's worth being honest about — the literature on nitrous oxide and B12 deficiency is built almost entirely from individual case reports rather than long-term follow-up studies. What is well established is the mechanism: nitrous oxide inactivates vitamin B12 every time it's used, and stopping removes that ongoing harm entirely.\n\n"
            "If You Had Deficiency-Related Symptoms\n"
            "Case reports describe a wide range of outcomes, from full recovery to persistent nerve symptoms, largely tied to how much damage occurred and how early it was treated. If you're still experiencing symptoms a year out, that's a reason to keep working with a neurologist, not a sign nothing can be done — nerve recovery can continue over an extended period.\n\n"
            "What's Certain\n"
            "A year without nitrous oxide is a year without further methionine synthase inactivation. That's the one guarantee both sources support.",
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
