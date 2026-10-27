import 'package:flutter/material.dart';
import 'package:quitter/home_page.dart';
import 'package:quitter/journal_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/settings_page.dart';
import 'package:quitter/stats_page.dart';

class DesktopShell extends StatelessWidget {
  const DesktopShell({
    super.key,
    required this.controller,
    required this.showJournal,
  });

  final TabController controller;
  final bool showJournal;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Scaffold(
        backgroundColor: colors.surfaceContainerLow,
        body: SafeArea(
          child: Row(
            children: [
              SizedBox(
                width: 240,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28, 32, 24, 40),
                      child: Text(
                        l10n.appTitle,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                    Expanded(
                      child: NavigationRail(
                        extended: true,
                        backgroundColor: Colors.transparent,
                        selectedIndex: controller.index,
                        onDestinationSelected: controller.animateTo,
                        destinations: [
                          NavigationRailDestination(
                            icon: const Icon(Icons.track_changes_outlined),
                            selectedIcon: const Icon(Icons.track_changes),
                            label: Text(l10n.tabQuitter),
                          ),
                          NavigationRailDestination(
                            icon: const Icon(Icons.insights_outlined),
                            selectedIcon: const Icon(Icons.insights),
                            label: Text(l10n.tabStats),
                          ),
                          if (showJournal)
                            NavigationRailDestination(
                              icon: const Icon(Icons.menu_book_outlined),
                              selectedIcon: const Icon(Icons.menu_book),
                              label: Text(l10n.tabJournal),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          alignment: AlignmentDirectional.centerStart,
                          padding: const EdgeInsets.all(16),
                        ),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SettingsPage(),
                          ),
                        ),
                        icon: const Icon(Icons.settings_outlined),
                        label: Text(l10n.tabSettings),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 24, 24, 24),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Material(
                            color: colors.surface,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 1280,
                                ),
                                child: TabBarView(
                                  controller: controller,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    const HomePage(),
                                    const StatsPage(),
                                    if (showJournal)
                                      const Align(
                                        alignment: Alignment.topCenter,
                                        child: SizedBox(
                                          width: 800,
                                          child: JournalPage(),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
