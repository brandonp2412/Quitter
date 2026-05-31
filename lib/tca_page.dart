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
        link: "https://pubmed.ncbi.nlm.nih.gov/6138731/",
        referenceDate: "May 2026",
        referenceContent:
            "TCA Discontinuation: The First Days — Cholinergic Rebound\n\n"
            "Source: Dilsaver & Greden (1984), Psychopharmacology — 'Antidepressant withdrawal phenomena'\n\n"
            "What Makes TCA Discontinuation Different\n"
            "Tricyclic antidepressants differ fundamentally from SSRIs and SNRIs in their mechanism. In addition to blocking serotonin and norepinephrine reuptake, TCAs have very strong anticholinergic effects — they block muscarinic acetylcholine receptors. When TCAs are discontinued, the acetylcholine system rebounds.\n\n"
            "Cholinergic Rebound Symptoms\n"
            "Unlike the FINISH syndrome of SSRI discontinuation, TCA discontinuation produces cholinergic rebound:\n"
            "• Nausea, vomiting, and diarrhoea — gastrointestinal hypermotility\n"
            "• Excessive salivation and sweating\n"
            "• Headache and muscle aches\n"
            "• Insomnia with vivid or disturbing dreams\n"
            "• Anxiety and restlessness\n\n"
            "Common TCAs and Their Profiles\n"
            "Amitriptyline and imipramine have the strongest anticholinergic effects and typically produce the most pronounced cholinergic rebound. Nortriptyline has somewhat milder anticholinergic effects. Clomipramine also has significant serotonergic effects alongside its anticholinergic profile.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.tcaMilestone7Title,
        description: l10n.tcaMilestone7Description,
        reference: "NHS - Stopping or coming off antidepressants",
        link:
            "https://www.nhs.uk/mental-health/talking-therapies-medicine-treatments/medicines-and-psychiatry/antidepressants/coming-off-antidepressants/",
        referenceDate: "May 2026",
        referenceContent:
            "One Week After TCAs: Cholinergic Symptoms Easing\n\n"
            "The Cholinergic Recovery\n"
            "The cholinergic rebound typically reaches its peak within the first few days and begins to ease substantially by one week. As the acetylcholine system returns toward its natural baseline:\n\n"
            "What's Improving\n"
            "• Gastrointestinal symptoms (nausea, cramping, diarrhoea) are reducing\n"
            "• Sweating and flu-like symptoms are easing\n"
            "• Sleep, though still disrupted, is beginning to stabilise\n"
            "• The excessive salivation from cholinergic rebound is resolving\n\n"
            "Autonomic Nervous System\n"
            "TCAs powerfully affect the autonomic nervous system through both their anticholinergic and noradrenergic properties. By one week, the most acute autonomic instability — including postural hypotension and rapid heart rate changes — is beginning to resolve as the nervous system readjusts.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.tcaMilestone14Title,
        description: l10n.tcaMilestone14Description,
        reference: "PubMed - Tricyclic antidepressant discontinuation",
        link: "https://pubmed.ncbi.nlm.nih.gov/7717091/",
        referenceDate: "May 2026",
        referenceContent:
            "Two Weeks After TCAs: Anticholinergic Effects Reversing\n\n"
            "The Anticholinergic Burden Lifts\n"
            "TCAs impose a significant anticholinergic burden on the body that affects multiple systems. As this burden lifts over the first two weeks:\n\n"
            "Physical Benefits\n"
            "• Dry mouth resolving — salivary gland function returning to normal\n"
            "• Constipation resolving — bowel motility naturally restored\n"
            "• Urinary function normalising — the urinary retention that TCAs can cause is resolving\n"
            "• Blurred vision clearing — pupillary response and accommodation returning to normal\n\n"
            "Cognitive Benefits\n"
            "The cholinergic system is critically important for memory, attention, and learning. The acetylcholine pathways suppressed by TCAs are recovering:\n"
            "• Working memory improving\n"
            "• Processing speed increasing\n"
            "• Mental clarity returning\n\n"
            "Many people are surprised to discover how much cognitive impairment they had adapted to while on TCAs.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.tcaMilestone30Title,
        description: l10n.tcaMilestone30Description,
        reference: "PubMed - Antidepressant discontinuation syndrome: a review",
        link: "https://pubmed.ncbi.nlm.nih.gov/16390895/",
        referenceDate: "May 2026",
        referenceContent:
            "One Month After TCAs: Autonomic Nervous System Stabilising\n\n"
            "Cardiac Recovery\n"
            "TCAs significantly affect the cardiovascular system through their sodium-channel blocking and anticholinergic properties. At one month:\n"
            "• QTc interval prolongation caused by TCAs has resolved\n"
            "• Heart rate variability is returning to natural levels\n"
            "• Blood pressure regulation, previously affected by norepinephrine reuptake blockade, is stabilising\n\n"
            "Sleep Architecture Restoration\n"
            "TCAs are powerful REM sleep suppressors. As the anticholinergic effect wears off (cholinergic activity is essential for REM sleep):\n"
            "• REM sleep is returning, often producing a 'REM rebound' with vivid dreams\n"
            "• Slow-wave (deep) sleep is improving\n"
            "• Overall sleep quality and restoration is meaningfully better than during TCA use",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.tcaMilestone90Title,
        description: l10n.tcaMilestone90Description,
        reference:
            "PubMed - Long-term cognitive effects of tricyclic antidepressants",
        link: "https://pubmed.ncbi.nlm.nih.gov/9347394/",
        referenceDate: "May 2026",
        referenceContent:
            "Three Months After TCAs: Multiple Neurotransmitter Systems Normalising\n\n"
            "The Multi-System Recovery\n"
            "TCAs affect a broader range of neurotransmitter systems than SSRIs or SNRIs:\n"
            "• Serotonin system: reuptake blockade resolving\n"
            "• Norepinephrine system: reuptake blockade resolving\n"
            "• Acetylcholine system: muscarinic receptor sensitivity normalising\n"
            "• Histamine system: H1 blockade resolving, reducing sedation\n\n"
            "At three months, all of these systems have had substantial time to recover. The combination typically produces:\n"
            "• Significantly improved cognitive function — particularly memory and attention\n"
            "• Better mood stability\n"
            "• Improved energy and motivation\n"
            "• Reduced sedation and improved alertness",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.tcaMilestone180Title,
        description: l10n.tcaMilestone180Description,
        reference: "PubMed - Cognitive recovery after antidepressant treatment",
        link: "https://pubmed.ncbi.nlm.nih.gov/25481391/",
        referenceDate: "May 2026",
        referenceContent:
            "Six Months After TCAs: Cardiac and Cognitive Recovery\n\n"
            "Cardiovascular Recovery\n"
            "The sodium-channel blocking and adrenergic effects of TCAs on the heart have fully resolved by six months. Research shows:\n"
            "• Normal QTc interval maintained without pharmacological influence\n"
            "• Heart rate variability (a marker of cardiac autonomic health) substantially improved\n"
            "• Orthostatic hypotension (dizziness on standing) fully resolved\n\n"
            "Cognitive Recovery\n"
            "The cognitive burden of long-term TCA-induced anticholinergic effects can be significant, particularly in older adults. Research on anticholinergic cognitive burden suggests:\n"
            "• Memory consolidation substantially improved\n"
            "• Processing speed normalised\n"
            "• Executive function — planning, working memory, cognitive flexibility — meaningfully recovered",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.tcaMilestone365Title,
        description: l10n.tcaMilestone365Description,
        reference:
            "PubMed - Antidepressant use and discontinuation in primary care",
        link: "https://pubmed.ncbi.nlm.nih.gov/24680484/",
        referenceDate: "May 2026",
        referenceContent:
            "One Year After TCAs: Recovery Achieved\n\n"
            "One Year: Complete Multi-System Recovery\n"
            "One year after completing a TCA taper, all affected neurotransmitter systems — serotonergic, noradrenergic, cholinergic, and histaminergic — have had a complete cycle to normalise.\n\n"
            "The Significance of TCA Recovery\n"
            "TCAs impose a broader pharmacological burden than newer antidepressants, affecting more receptor systems simultaneously. Successful discontinuation represents the recovery of multiple systems:\n"
            "• Complete reversal of anticholinergic cognitive impairment\n"
            "• Full cardiac autonomic recovery\n"
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
