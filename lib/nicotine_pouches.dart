import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/smoking_page.dart';

class NicotinePouchesPage extends StatelessWidget {
  final bool started;

  const NicotinePouchesPage({super.key, required this.started});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SmokingPage(
      started: started,
      storageKey: 'nicotine_pouches',
      pageTitle: l10n.nicotinePouchesPageTitle,
      headerStarted: l10n.nicotinePouchesHeaderStarted,
      headerNotStarted: l10n.nicotinePouchesHeaderNotStarted,
      subtitleStarted: l10n.nicotinePouchesSubtitleStarted,
      subtitleNotStarted: l10n.nicotinePouchesSubtitleNotStarted,
    );
  }
}
