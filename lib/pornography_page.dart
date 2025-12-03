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
        reference: "Neuroscience News - Pornography Brain Effects",
        link:
            "https://neurosciencenews.com/neuroscience-pornography-brain-15354/",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.pornographyMilestone3Title,
        description: l10n.pornographyMilestone3Description,
        reference: "Optimum Joy - Porn Withdrawal Symptoms Guide",
        link:
            "https://optimumjoy.com/blog/recognizing-porn-withdrawal-symptoms/",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.pornographyMilestone7Title,
        description: l10n.pornographyMilestone7Description,
        reference: "Tech Lockdown - Recovery Timeline Guide",
        link:
            "https://www.techlockdown.com/guides/porn-addiction-recovery-timeline",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.pornographyMilestone14Title,
        description: l10n.pornographyMilestone14Description,
        reference: "Addiction Help - Recovery Process",
        link: "https://www.addictionhelp.com/porn/recovery/",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.pornographyMilestone30Title,
        description: l10n.pornographyMilestone30Description,
        reference: "Still Mind Florida - Recovery Timeline",
        link:
            "https://stillmindflorida.com/mental-health/porn-addiction-recovery-timeline/",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.pornographyMilestone90Title,
        description: l10n.pornographyMilestone90Description,
        reference: "Mental Health - Brain Changes Research",
        link: "https://www.mentalhealth.com/library/the-brains-of-porn-addicts",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.pornographyMilestone180Title,
        description: l10n.pornographyMilestone180Description,
        reference: "Culture Reframed - Neuroscience Research",
        link: "https://culturereframed.org/neuroscience-of-pornography/",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.pornographyMilestone365Title,
        description: l10n.pornographyMilestone365Description,
        reference: "Rehab Support - Long-term Recovery",
        link: "https://therehabsupport.com/porn-addiction-recovery-timeline/",
      ),
      QuitMilestone(
        day: 1825,
        title: l10n.pornographyMilestone1825Title,
        description: l10n.pornographyMilestone1825Description,
        reference: "Simcoe Addiction - Brain Rewiring Timeline",
        link:
            "https://www.simcoerehab.ca/2024/02/09/how-long-to-rewire-your-brain-from-addiction/",
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
