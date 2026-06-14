import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/smoking_page.dart';

class SmokelessTobaccoPage extends StatelessWidget {
  final bool started;

  const SmokelessTobaccoPage({super.key, required this.started});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SmokingPage(
      started: started,
      storageKey: 'smokeless_tobacco',
      pageTitle: l10n.smokelessTobaccoPageTitle,
      headerStarted: l10n.smokelessTobaccoHeaderStarted,
      headerNotStarted: l10n.smokelessTobaccoHeaderNotStarted,
      subtitleStarted: l10n.smokelessTobaccoSubtitleStarted,
      subtitleNotStarted: l10n.smokelessTobaccoSubtitleNotStarted,
    );
  }
}
