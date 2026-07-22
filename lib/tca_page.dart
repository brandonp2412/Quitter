import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

/// Tricyclic antidepressant (TCA) discontinuation recovery timeline.
///
/// Always taper under medical supervision. TCAs (e.g. amitriptyline,
/// nortriptyline, imipramine, clomipramine) produce cholinergic rebound
/// on cessation, distinct from SSRI/SNRI discontinuation syndrome.
class TcaPage extends StatelessWidget {
  final bool started;
  const TcaPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 3,
        title: l10n.tcaMilestone3Title,
        description: l10n.tcaMilestone3Description,
        reference: "PubMed - Cholinergic rebound and tricyclic antidepressants",
        link: "https://pubmed.ncbi.nlm.nih.gov/6849449/",
        referenceDate: "May 2026",
        referenceContent:
            "TCA Discontinuation: The First Days — Cholinergic Rebound\n\n"
            "Source: Dilsaver, Feinberg & Greden (1983), American Journal of Psychiatry — 'Antidepressant withdrawal symptoms treated with anticholinergic agents' (case report, 3 patients)\n\n"
            "What Makes TCA Discontinuation Different\n"
            "Tricyclic antidepressants differ fundamentally from SSRIs and SNRIs in their mechanism. In addition to blocking serotonin and norepinephrine reuptake, TCAs strongly block the body's acetylcholine system. When you stop, that system bounces back.\n\n"
            "Cholinergic Rebound Symptoms\n"
            "Unlike SSRI discontinuation, TCA withdrawal produces an acetylcholine rebound:\n"
            "• Nausea, vomiting, and diarrhoea\n"
            "• Excessive salivation and sweating\n"
            "• Headache and muscle aches\n"
            "• Insomnia with vivid or disturbing dreams\n"
            "• Anxiety and restlessness\n\n"
            "Common TCAs and Their Profiles\n"
            "Amitriptyline and imipramine have the strongest acetylcholine-blocking effects and typically produce the most pronounced rebound. Nortriptyline has somewhat milder effects. Clomipramine also has significant serotonin-related effects alongside its acetylcholine-blocking profile.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.tcaMilestone7Title,
        description: l10n.tcaMilestone7Description,
        reference: "NHS - Stopping or coming off antidepressants",
        link: "https://www.nhs.uk/medicines/antidepressants/",
        referenceDate: "May 2026",
        referenceContent:
            "One Week After TCAs: Cholinergic Symptoms Easing\n\n"
            "The Cholinergic Recovery\n"
            "The acetylcholine rebound typically reaches its peak within the first few days and begins to ease substantially by one week. As the acetylcholine system returns toward its natural baseline:\n\n"
            "What's Improving\n"
            "• Gastrointestinal symptoms (nausea, cramping, diarrhoea) are reducing\n"
            "• Sweating and flu-like symptoms are easing\n"
            "• Sleep, though still disrupted, is beginning to stabilise\n"
            "• The excessive salivation is resolving\n\n"
            "Autonomic Nervous System\n"
            "TCAs affect the body's automatic functions — heart rate, blood pressure, digestion — through several mechanisms. By one week, the most intense autonomic symptoms — including dizziness when standing and rapid heart rate changes — is beginning to resolve as the nervous system readjusts.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.tcaMilestone14Title,
        description: l10n.tcaMilestone14Description,
        reference:
            "PubMed - Garner et al. (1993), Annals of Pharmacotherapy — 'Tricyclic antidepressant withdrawal syndrome'",
        link: "https://pubmed.ncbi.nlm.nih.gov/8219442/",
        referenceDate: "May 2026",
        referenceContent:
            "Two Weeks After TCAs: Anticholinergic Effects Reversing\n\n"
            "The Anticholinergic Burden Lifts\n"
            "TCAs impose significant acetylcholine-blocking effects on the body that affect multiple systems. As this burden lifts over the first two weeks:\n\n"
            "Physical Benefits\n"
            "• Dry mouth resolving — salivary gland function returning to normal\n"
            "• Constipation resolving — bowel motility naturally restored\n"
            "• Urinary function normalising — the urinary retention that TCAs can cause is resolving\n"
            "• Blurred vision clearing — eyes adjusting normally to light again\n\n"
            "Cognitive Benefits\n"
            "Acetylcholine is essential for memory, attention, and learning. The acetylcholine pathways suppressed by TCAs are recovering:\n"
            "• Working memory improving\n"
            "• Processing speed increasing\n"
            "• Mental clarity returning\n\n"
            "Many people are surprised to discover how much cognitive impairment they had adapted to while on TCAs.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.tcaMilestone30Title,
        description: l10n.tcaMilestone30Description,
        reference: "PubMed - Warner et al. (2006), American Family Physician — 'Antidepressant discontinuation syndrome'",
        link: "https://pubmed.ncbi.nlm.nih.gov/16913164/",
        referenceDate: "May 2026",
        referenceContent:
            "One Month After TCAs: Autonomic Nervous System Stabilising\n\n"
            "Cardiac Recovery\n"
            "TCAs affect heart rhythm during use through their action on both the cholinergic and adrenergic nervous systems. The clinical literature on TCA discontinuation confirms that acute withdrawal symptoms — including the autonomic effects driven by this 'cholinergic and adrenergic overdrive' — are typically mild and resolve within one to two weeks of stopping. By one month, most people are well past this acute window, and can expect:\n"
            "• Heart rhythm settling back toward its pre-medication baseline\n"
            "• Heart rate variability trending toward natural levels\n"
            "• Blood pressure regulation, previously affected by the drug's action on adrenaline pathways, continuing to stabilise\n\n"
            "Sleep Architecture Restoration\n"
            "TCAs strongly suppress dream sleep. As the anticholinergic effect wears off (acetylcholine is needed for dream sleep):\n"
            "• REM sleep is returning, often producing a surge of vivid dreams as dream sleep returns\n"
            "• Slow-wave (deep) sleep is improving\n"
            "• Overall sleep quality and restoration is meaningfully better than during TCA use",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.tcaMilestone90Title,
        description: l10n.tcaMilestone90Description,
        reference:
            "PubMed - Jakobsen et al. (2024), BMJ Mental Health — 'Benefits and harms of tricyclic antidepressants'",
        link: "https://pubmed.ncbi.nlm.nih.gov/39093721/",
        referenceDate: "May 2026",
        referenceContent:
            "Three Months After TCAs: Leaving the Real Risks Behind\n\n"
            "What the Evidence Actually Shows\n"
            "A 2024 meta-analysis of 103 randomised trials (10,590 participants) found that, compared with placebo, TCAs do reduce depressive symptoms — but also come with nearly triple the odds of a serious adverse event (odds ratio 2.78). The trials themselves only followed people for up to 12 weeks on-treatment, so there's no controlled long-term data on what happens after stopping. Everything below reflects general clinical understanding of TCA pharmacology, not a specific finding from this trial evidence.\n\n"
            "The Multi-System Recovery\n"
            "TCAs affect a broader range of neurotransmitter systems than SSRIs or SNRIs:\n"
            "• Serotonin system: adjusting\n"
            "• Noradrenaline system: adjusting\n"
            "• Acetylcholine system: settling back to normal\n"
            "• Histamine system: the antihistamine-like sedation has resolved\n\n"
            "At three months, all of these systems have had substantial time to recover, and — just as importantly — the elevated serious-adverse-event risk that comes with active TCA treatment is behind you. Many people notice:\n"
            "• Improved cognitive function — particularly memory and attention\n"
            "• Better mood stability\n"
            "• Improved energy and motivation\n"
            "• Reduced sedation and improved alertness",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.tcaMilestone180Title,
        description: l10n.tcaMilestone180Description,
        reference: "PubMed - Warner et al. (2006), American Family Physician — 'Antidepressant discontinuation syndrome'",
        link: "https://pubmed.ncbi.nlm.nih.gov/16913164/",
        referenceDate: "May 2026",
        referenceContent:
            "Six Months After TCAs: Cardiac and Cognitive Recovery\n\n"
            "An Honest Note on Long-Term Data\n"
            "The clinical literature on TCA discontinuation is clear that the acute withdrawal syndrome — including the cholinergic and adrenergic overdrive behind autonomic symptoms — is usually mild and resolves within one to two weeks. There isn't a dedicated study tracking cardiac or cognitive markers specifically at six months post-TCA; what follows reflects general clinical understanding for someone this far past a completed, medically supervised taper.\n\n"
            "Cardiovascular Recovery\n"
            "By six months, TCAs' direct effects on heart rhythm should be long resolved:\n"
            "• Normal heart rhythm maintained without pharmacological influence\n"
            "• Heart rate variability (a measure of how well your heart adapts) expected to be substantially improved\n"
            "• Dizziness on standing fully resolved\n\n"
            "Cognitive Recovery\n"
            "The cognitive burden of TCAs' anticholinergic effect on the brain can be significant, particularly in older adults, and case reports document meaningful improvement once the drug is stopped. At six months out:\n"
            "• Memory consolidation substantially improved\n"
            "• Processing speed normalised\n"
            "• Executive function — planning, working memory, cognitive flexibility — meaningfully recovered",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.tcaMilestone365Title,
        description: l10n.tcaMilestone365Description,
        reference:
            "PubMed - Haddad (2001), Drug Safety — 'Antidepressant discontinuation syndromes'",
        link: "https://pubmed.ncbi.nlm.nih.gov/11347722/",
        referenceDate: "May 2026",
        referenceContent:
            "One Year After TCAs: Recovery Achieved\n\n"
            "One Year: Complete Multi-System Recovery\n"
            "This review of antidepressant discontinuation syndromes — covering TCAs, MAOIs, SSRIs, and others — found that withdrawal symptoms typically begin within days of stopping and, left untreated, resolve on their own within days to a couple of weeks. There's no study that specifically re-measures TCA-affected systems a year out, but a year after completing a taper is many months beyond even the longest reported discontinuation symptoms, so all affected neurotransmitter systems — serotonin, noradrenaline, acetylcholine, and histamine — can be expected to have had a complete cycle to normalise.\n\n"
            "The Significance of TCA Recovery\n"
            "TCAs impose a broader pharmacological burden than newer antidepressants, affecting more receptor systems simultaneously. Successful discontinuation represents the recovery of multiple systems:\n"
            "• Complete reversal of the memory and thinking impairment caused by TCAs' acetylcholine blocking\n"
            "• Full cardiac recovery\n"
            "• Natural neurotransmitter regulation restored across all affected pathways\n\n"
            "One year of successful self-regulation after TCA discontinuation represents a genuine achievement — both in the management of the discontinuation process and in the maintenance of wellbeing without pharmacological support.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.tcaPageTitle,
      storageKey: 'tca',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.tcaHeaderStarted,
      headerNotStarted: l10n.tcaHeaderNotStarted,
      subtitleStarted: l10n.tcaSubtitleStarted,
      subtitleNotStarted: l10n.tcaSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
