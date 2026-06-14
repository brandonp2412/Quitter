import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/smoking_page.dart';

class VapingPage extends StatelessWidget {
  final bool started;

  const VapingPage({super.key, required this.started});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SmokingPage(
      started: started,
      storageKey: 'vaping',
      pageTitle: l10n.vapingPageTitle,
      headerStarted: l10n.vapingHeaderStarted,
      headerNotStarted: l10n.vapingHeaderNotStarted,
      subtitleStarted: l10n.vapingSubtitleStarted,
      subtitleNotStarted: l10n.vapingSubtitleNotStarted,
    );
  }
}
