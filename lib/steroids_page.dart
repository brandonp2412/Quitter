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
        reference: "Prolonged Hypogonadism Following AAS Withdrawal (PMC)",
        link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4398624/",
        referenceDate: "June 2026",
        referenceContent:
            "Stopping Anabolic Steroids: The First Days\n\nSource: \"Prolonged Hypogonadism in Males Following Withdrawal from Anabolic-Androgenic Steroids,\" on PubMed Central\n\nWhy Symptoms Appear\nExogenous anabolic-androgenic steroids (AAS) suppress the hypothalamic-pituitary-testicular (HPTA) axis through negative feedback, shutting down natural testosterone production. When you stop, the body is left in a temporary hormone deficit — anabolic steroid-induced hypogonadism (ASIH).\n\nEarly Symptoms\n• Fatigue and low mood\n• Reduced libido and erectile difficulty\n• Low motivation\n\nA Safety Note\nDepression during steroid withdrawal can be serious. Seek medical care, and urgent help for any thoughts of self-harm. Clinicians often guide recovery; some use medications to support it.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.steroidsMilestone14Title,
        description: l10n.steroidsMilestone14Description,
        reference: "Prolonged Hypogonadism Following AAS Withdrawal (PMC)",
        link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4398624/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Off Anabolic Steroids\n\nSource: \"Prolonged Hypogonadism in Males Following Withdrawal from Anabolic-Androgenic Steroids,\" on PubMed Central\n\nThe Adjustment Phase\nWith natural testosterone still suppressed, the first weeks bring the most noticeable symptoms — fatigue, low mood, reduced libido, and physical weakness compared with being “on.”\n\nA Known Trap\nThe literature notes that some men resume AAS specifically to escape these withdrawal symptoms, entering a cycle of dependence. Knowing the dip is temporary — and getting medical and psychological support — helps break that pattern.",
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
            "One Month Off Anabolic Steroids\n\nSource: \"Physical, psychological and biochemical recovery from anabolic steroid-induced hypogonadism: a scoping review,\" on PubMed\n\nThe Axis Restarts\nAfter cessation the HPTA begins to reactivate. The scoping review describes complete gonadotropin recovery as expected over 3–6 months and near-complete testosterone recovery over months — so at one month the process is underway but far from finished.\n\nWhat to Expect\nLow mood, libido, and energy commonly persist while hormones climb back. Recovery depends on age and how heavy and prolonged the use was.",
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
            "Three Months Off Anabolic Steroids\n\nSource: \"Physical, psychological and biochemical recovery from anabolic steroid-induced hypogonadism: a scoping review,\" on PubMed\n\nHormones Recovering\nThe review places complete gonadotropin recovery in the 3–6 month range, with testosterone recovering over months. By three months many people are well into that window, and mood, energy, and libido begin to follow the hormonal recovery.\n\nAn Honest Caveat\nThe trajectory is highly individual. Testicular size and sperm production can take months to years, and recovery from gynaecomastia is unlikely without specific treatment.",
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
            "Six Months Off Anabolic Steroids\n\nSource: \"Physical, psychological and biochemical recovery from anabolic steroid-induced hypogonadism: a scoping review,\" on PubMed\n\nWhere Six Months Sits\nThe review expects complete gonadotropin recovery and near-complete testosterone recovery over roughly 3–6 months. For many men, six months is the point where bloodwork and symptoms have substantially normalised.\n\nIf You're Not There Yet\nRecovery is immensely variable. A meaningful minority of long-term users have prolonged hypogonadism, so if symptoms persist, ask an endocrinologist or urologist to check your hormone levels rather than assuming it will sort itself out.",
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
            "One Year Off Anabolic Steroids\n\nSource: \"Anabolic androgenic steroid-induced hypogonadism, a reversible condition in male individuals? A systematic review,\" on PubMed\n\nA Year On\nClassic teaching is that ASIH resolves within 6–12 months, and for most men a year brings normalised hormones, mood, libido, and energy.\n\nAn Honest Caveat\nThe systematic review is sobering: among cases with known outcomes, full HPTA recovery was confirmed in only a minority, and some men have prolonged or possibly permanent hypogonadism — occasionally with persistent symptoms even when testosterone normalises. If you still have low testosterone or hypogonadal symptoms at a year, get specialist endocrine assessment.",
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
