import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class MethPage extends StatelessWidget {
  final bool started;
  const MethPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.methMilestone1Title,
        description: l10n.methMilestone1Description,
        reference: "Orlando Recovery Center - Withdrawal Timeline",
        link:
            "https://www.orlandorecovery.com/drug-addiction-resources/meth/withdrawal-timeline/",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.methMilestone3Title,
        description: l10n.methMilestone3Description,
        reference: "The Recovery Village - Withdrawal and Detox",
        link:
            "https://www.therecoveryvillage.com/meth-addiction/withdrawal-detox/",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.methMilestone7Title,
        description: l10n.methMilestone7Description,
        reference: "Greenhouse Treatment - Withdrawal Information",
        link:
            "https://greenhousetreatment.com/stimulants/crystal-meth-addiction/withdrawal/",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.methMilestone30Title,
        description: l10n.methMilestone30Description,
        reference: "Clearhaven Recovery - Stages of Recovery",
        link:
            "https://www.clearhavenrecovery.com/what-are-the-stages-of-meth-recovery/",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.methMilestone90Title,
        description: l10n.methMilestone90Description,
        reference: "DrugRehab.com - Recovery Stages",
        link: "https://psychiatryonline.org/doi/10.1176/appi.ajp.161.2.242",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.methMilestone180Title,
        description: l10n.methMilestone180Description,
        reference: "American College of Cardiology - Heart Recovery",
        link:
            "https://www.acc.org/about-acc/press-releases/2017/05/30/09/59/stopping-drug-abuse-can-reverse-related-heart-damage",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.methMilestone365Title,
        description: l10n.methMilestone365Description,
        reference: "Recovery Research Institute - Brain in Recovery",
        link: "https://www.recoveryanswers.org/recovery-101/brain-in-recovery/",
      ),
      QuitMilestone(
        day: 420,
        title: l10n.methMilestone420Title,
        description: l10n.methMilestone420Description,
        reference: "Journal of Neuroscience - Dopamine Transporter Recovery",
        link: "https://www.jneurosci.org/content/21/23/9414",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.methMilestone730Title,
        description: l10n.methMilestone730Description,
        reference: "Better Addiction Care - Dopamine Receptor Recovery",
        link:
            "https://betteraddictioncare.com/addiction/dopamine-receptor-recovery/",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.methPageTitle,
      storageKey: 'meth',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.methHeaderStarted,
      headerNotStarted: l10n.methHeaderNotStarted,
      subtitleStarted: l10n.methSubtitleStarted,
      subtitleNotStarted: l10n.methSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
