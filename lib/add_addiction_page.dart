import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitter/adderall_page.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/benzodiazepine_page.dart';
import 'package:quitter/cocaine_page.dart';
import 'package:quitter/edit_entry_page.dart';
import 'package:quitter/heroin_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/marijuana_page.dart';
import 'package:quitter/meth_page.dart';
import 'package:quitter/nicotine_pouches.dart';
import 'package:quitter/opioid_page.dart';
import 'package:quitter/pornography_page.dart';
import 'package:quitter/smoking_page.dart';
import 'package:quitter/social_media_page.dart';
import 'package:quitter/vaping_page.dart';

class _AddictionOption {
  final String title;
  final IconData icon;
  final List<Color> gradientColors;
  final Widget destination;

  const _AddictionOption({
    required this.title,
    required this.icon,
    required this.gradientColors,
    required this.destination,
  });
}

class AddAddictionPage extends StatelessWidget {
  const AddAddictionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final addictions = context.watch<AddictionProvider>();

    final options = <_AddictionOption>[];

    if (addictions.quitAdderall == null) {
      options.add(_AddictionOption(
        title: l10n.addictionAdderall,
        icon: Icons.lightbulb_outline,
        gradientColors: [const Color(0xFFFF8C42), const Color(0xFFFF6B35)],
        destination: const AdderallPage(started: false),
      ));
    }
    if (addictions.quitAlcohol == null) {
      options.add(_AddictionOption(
        title: l10n.addictionAlcohol,
        icon: Icons.local_bar,
        gradientColors: [const Color(0xFF6366F1), const Color(0xFF8B5CF6)],
        destination: const AlcoholPage(started: false),
      ));
    }
    if (addictions.quitBenzos == null) {
      options.add(_AddictionOption(
        title: l10n.addictionBenzos,
        icon: Icons.bedtime,
        gradientColors: [const Color(0xFF6D5DD3), const Color(0xFF1E1B4B)],
        destination: const BenzodiazepinePage(started: false),
      ));
    }
    if (addictions.quitCocaine == null) {
      options.add(_AddictionOption(
        title: l10n.addictionCocaine,
        icon: Icons.bolt,
        gradientColors: [const Color(0xFF3B82F6), const Color(0xFF1D4ED8)],
        destination: const CocainePage(started: false),
      ));
    }
    if (addictions.quitHeroin == null) {
      options.add(_AddictionOption(
        title: l10n.addictionHeroin,
        icon: Icons.vaccines,
        gradientColors: [
          const Color.fromARGB(255, 133, 14, 163),
          const Color.fromARGB(255, 201, 5, 250),
        ],
        destination: const HeroinPage(started: false),
      ));
    }
    if (addictions.quitMarijuana == null) {
      options.add(_AddictionOption(
        title: l10n.addictionMarijuana,
        icon: Icons.grass,
        gradientColors: [
          const Color.fromARGB(255, 132, 230, 128),
          const Color.fromARGB(255, 30, 87, 3),
        ],
        destination: const MarijuanaPage(started: false),
      ));
    }
    if (addictions.quitMeth == null) {
      options.add(_AddictionOption(
        title: l10n.addictionMeth,
        icon: Icons.battery_charging_full,
        gradientColors: [const Color(0xFF14B8A6), const Color(0xFF0D9488)],
        destination: const MethPage(started: false),
      ));
    }
    if (addictions.quitPouches == null) {
      options.add(_AddictionOption(
        title: l10n.addictionNicotinePouches,
        icon: Icons.scatter_plot,
        gradientColors: [const Color(0xFFF59E0B), const Color(0xFFEF4444)],
        destination: const NicotinePouchesPage(started: false),
      ));
    }
    if (addictions.quitOpioids == null) {
      options.add(_AddictionOption(
        title: l10n.addictionOpioids,
        icon: Icons.medication,
        gradientColors: [const Color(0xFFEC4899), const Color(0xFFBE185D)],
        destination: const OpioidPage(started: false),
      ));
    }
    if (addictions.quitPornography == null) {
      options.add(_AddictionOption(
        title: l10n.addictionAC,
        icon: Icons.block,
        gradientColors: [const Color(0xFFF43F5E), const Color(0xFFE11D48)],
        destination: const PornographyPage(started: false),
      ));
    }
    if (addictions.quitSmoking == null) {
      options.add(_AddictionOption(
        title: l10n.addictionSmoking,
        icon: Icons.eco,
        gradientColors: [const Color(0xFF10B981), const Color(0xFF059669)],
        destination: const SmokingPage(started: false),
      ));
    }
    if (addictions.quitSocialMedia == null) {
      options.add(_AddictionOption(
        title: l10n.addictionSocialMedia,
        icon: Icons.public,
        gradientColors: [const Color(0xFF8B5CF6), const Color(0xFF7C3AED)],
        destination: const SocialMediaPage(started: false),
      ));
    }
    if (addictions.quitVaping == null) {
      options.add(_AddictionOption(
        title: l10n.addictionVaping,
        icon: Icons.air,
        gradientColors: [const Color(0xFF06B6D4), const Color(0xFF0EA5E9)],
        destination: const VapingPage(started: false),
      ));
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.addAddictionTitle)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          if (options.isEmpty)
            Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                l10n.addAddictionNoneAvailable,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withAlpha(153),
                ),
              ),
            ),
          ...options.map(
            (option) => _AddictionTile(
              option: option,
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => option.destination),
              ),
            ),
          ),
          const Divider(height: 24),
          ListTile(
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
            title: Text(l10n.addAddictionCustom),
            subtitle: Text(l10n.addAddictionCustomSubtitle),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const EditEntryPage()),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddictionTile extends StatelessWidget {
  final _AddictionOption option;
  final VoidCallback onTap;

  const _AddictionTile({required this.option, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: option.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(option.icon, color: Colors.white, size: 24),
      ),
      title: Text(option.title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
