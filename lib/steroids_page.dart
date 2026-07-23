import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class SteroidsPage extends StatelessWidget {
  final bool started;

  const SteroidsPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.steroidsMilestone1Title,
        description: l10n.steroidsMilestone1Description,
        reference:
            "Common symptoms associated with usage and cessation of anabolic androgenic steroids in men (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/35999138/",
        referenceDate: "July 2026",
        referenceContent:
            "Stopping Anabolic Steroids: The First Days\n\nSource: \"Common symptoms associated with usage and cessation of anabolic androgenic steroids in men,\" Best Practice & Research Clinical Endocrinology & Metabolism (2022)\n\nThe Acute Phase\nThis review describes AAS withdrawal as unfolding in two phases. The first, driven by sympathetic nervous system activation rather than hormone levels, appears within 1–2 days of stopping and can include:\n• Headache\n• Tremors\n• Palpitations\n• Nausea\n\nWhy Symptoms Appear\nAnabolic steroids also suppress the body's own testosterone production — the brain detects the steroids and shuts off the hormonal signals that normally drive it. That suppression persists after stopping, setting up the second, longer-lasting phase of withdrawal described in later milestones.\n\nA Safety Note\nDepression can emerge during steroid withdrawal and become serious. Seek medical care, and urgent help for any thoughts of self-harm. Clinicians often guide recovery; some use medications to support it.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.steroidsMilestone14Title,
        description: l10n.steroidsMilestone14Description,
        reference:
            "Common symptoms associated with usage and cessation of anabolic androgenic steroids in men (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/35999138/",
        referenceDate: "July 2026",
        referenceContent:
            "Two Weeks Off Anabolic Steroids\n\nSource: \"Common symptoms associated with usage and cessation of anabolic androgenic steroids in men,\" Best Practice & Research Clinical Endocrinology & Metabolism (2022)\n\nThe Chronic Phase Sets In\nBy two weeks, the brief sympathetic symptoms of the first days have typically passed, and the review's second phase — driven by ongoing testosterone deficiency — is more prominent:\n• Fatigue and low mood\n• Muscle aches (myalgia)\n• Reduced libido\n• Insomnia and cravings\n\nStill at Low Ebb\nNatural testosterone production takes far longer than two weeks to reset, so this phase is expected rather than a sign something is wrong.\n\nA Known Trap\nSome men return to using specifically to escape this gap — a cycle that resets the recovery clock rather than ending it. Support from a doctor or counsellor helps bridge this phase rather than medicating it with more steroids.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.steroidsMilestone30Title,
        description: l10n.steroidsMilestone30Description,
        reference:
            "Recovery from anabolic steroid-induced hypogonadism: a scoping review (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/37855241/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Off Anabolic Steroids\n\nSource: \"Physical, psychological and biochemical recovery from anabolic steroid-induced hypogonadism: a scoping review,\" on PubMed\n\nRecovery Begins\nAfter stopping, the hormonal signals that drive testosterone production gradually switch back on. Research suggests it takes 3–6 months for the body's testosterone-driving signals to recover, with testosterone itself following over a similar window — so at one month the process has begun but is far from finished.\n\nWhat to Expect\nLow mood, libido, and energy commonly persist while hormones climb back. Recovery depends on age and how heavy and prolonged the use was.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.steroidsMilestone90Title,
        description: l10n.steroidsMilestone90Description,
        reference:
            "Recovery from anabolic steroid-induced hypogonadism: a scoping review (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/37855241/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Off Anabolic Steroids\n\nSource: \"Physical, psychological and biochemical recovery from anabolic steroid-induced hypogonadism: a scoping review,\" on PubMed\n\nA Good Time for a Blood Test\nBy three months the hormonal system has had time to show meaningful recovery — but how much only a blood test will confirm. This is a reasonable point to ask your GP to check testosterone and the pituitary hormones that drive it.\n\nWhat to Expect\nFor many men at three months, levels are climbing but not fully normalised. Mood and libido often improve before testosterone fully catches up. Testicular size and sperm production recover more slowly — sometimes taking the better part of a year or more. Breast tissue growth (gynaecomastia), where it occurred, is unlikely to reverse without specific treatment.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.steroidsMilestone180Title,
        description: l10n.steroidsMilestone180Description,
        reference:
            "Recovery from anabolic steroid-induced hypogonadism: a scoping review (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/37855241/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Off Anabolic Steroids\n\nSource: \"Physical, psychological and biochemical recovery from anabolic steroid-induced hypogonadism: a scoping review,\" on PubMed\n\nWhere the Evidence Points\nThe review reports that LH and FSH — the pituitary signals that drive testosterone production — are typically expected to recover within about 3–6 months, so six months sits at the edge of that window for most men. Testosterone itself tends to follow on a vaguer, generally longer timeline, so it may still be catching up even once those signals have normalised.\n\nIf You're Not There Yet\nA meaningful minority of long-term users develop low testosterone that does not resolve on its own. Six months is a reasonable point to escalate if symptoms persist: an endocrinologist can assess what's happening and discuss options, rather than leaving you to wait indefinitely.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.steroidsMilestone365Title,
        description: l10n.steroidsMilestone365Description,
        reference:
            "AAS-induced hypogonadism: a reversible condition? Systematic review (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/33887077/",
        referenceDate: "June 2026",
        referenceContent:
            "One Year Off Anabolic Steroids\n\nSource: \"Anabolic androgenic steroid-induced hypogonadism, a reversible condition in male individuals? A systematic review,\" on PubMed\n\nA Year Free\nFor most men who stop, a year brings full recovery — hormone levels stable, body composition reflecting natural metabolism again, cardiovascular risk returning toward baseline, and the mood and psychological stability that sustained steroid use can undermine genuinely settling.\n\nThe Long-Term Picture\nThe systematic review is sobering: among cases with known outcomes, full recovery was confirmed in only a minority, and some men have prolonged or possibly permanent low testosterone — occasionally with persistent symptoms even when levels normalise. At a year out and still symptomatic, specialist endocrine assessment is warranted rather than more waiting.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.steroidsMilestone730Title,
        description: l10n.steroidsMilestone730Description,
        reference:
            "AAS-induced hypogonadism: a reversible condition? Systematic review (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/33887077/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Years Off Anabolic Steroids\n\nSource: \"Anabolic androgenic steroid-induced hypogonadism, a reversible condition in male individuals? A systematic review,\" on PubMed\n\nA New Baseline\nBy two years your hormone levels reflect your body's own recovered baseline. For most men who recover, mood, libido, strength, and motivation are stable without steroids.\n\nThe Honest Long View\nThe evidence shows recovery is not guaranteed for everyone — prolonged hypogonadism is a real, underestimated outcome of long-term use. Reaching two years with normalised hormones is a genuine success; if a deficit remains, it is a medical condition to manage with a specialist, not to treat by returning to steroids.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.steroidsPageTitle,
      storageKey: 'steroids',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.steroidsHeaderStarted,
      headerNotStarted: l10n.steroidsHeaderNotStarted,
      subtitleStarted: l10n.steroidsSubtitleStarted,
      subtitleNotStarted: l10n.steroidsSubtitleNotStarted,
      infoBoxMessage: l10n.steroidsInfoBox,
      initialStarted: started,
    );
  }
}
