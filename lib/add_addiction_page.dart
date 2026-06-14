import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitter/adderall_page.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/benzodiazepine_page.dart';
import 'package:quitter/maoi_page.dart';
import 'package:quitter/snri_page.dart';
import 'package:quitter/ssri_page.dart';
import 'package:quitter/tca_page.dart';
import 'package:quitter/cocaine_page.dart';
import 'package:quitter/gabapentinoids_page.dart';
import 'package:quitter/ghb_page.dart';
import 'package:quitter/inhalants_page.dart';
import 'package:quitter/ketamine_page.dart';
import 'package:quitter/kratom_page.dart';
import 'package:quitter/mdma_page.dart';
import 'package:quitter/steroids_page.dart';
import 'package:quitter/synthetic_cannabinoids_page.dart';
import 'package:quitter/edit_entry_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/marijuana_page.dart';
import 'package:quitter/meth_page.dart';
import 'package:quitter/nicotine_pouches.dart';
import 'package:quitter/nitrous_oxide_page.dart';
import 'package:quitter/opioid_page.dart';
import 'package:quitter/pornography_page.dart';
import 'package:quitter/smoking_page.dart';
import 'package:quitter/social_media_page.dart';
import 'package:quitter/vaping_page.dart';
import 'package:quitter/smokeless_tobacco_page.dart';

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
      options.add(
        _AddictionOption(
          title: l10n.addictionAdderall,
          icon: Icons.lightbulb_outline,
          gradientColors: [const Color(0xFFFF8C42), const Color(0xFFFF6B35)],
          destination: const AdderallPage(started: false),
        ),
      );
    }
    if (addictions.quitSsri == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionSsri,
          icon: Icons.psychology,
          gradientColors: [const Color(0xFF7C3AED), const Color(0xFF4F46E5)],
          destination: const SsriPage(started: false),
        ),
      );
    }
    if (addictions.quitSnri == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionSnri,
          icon: Icons.psychology_alt,
          gradientColors: [const Color(0xFF6D28D9), const Color(0xFF7C3AED)],
          destination: const SnriPage(started: false),
        ),
      );
    }
    if (addictions.quitTca == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionTca,
          icon: Icons.medication_liquid,
          gradientColors: [const Color(0xFF5B21B6), const Color(0xFF6D28D9)],
          destination: const TcaPage(started: false),
        ),
      );
    }
    if (addictions.quitMaoi == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionMaoi,
          icon: Icons.science,
          gradientColors: [const Color(0xFF4C1D95), const Color(0xFF5B21B6)],
          destination: const MaoiPage(started: false),
        ),
      );
    }
    if (addictions.quitAlcohol == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionAlcohol,
          icon: Icons.local_bar,
          gradientColors: [const Color(0xFF6366F1), const Color(0xFF8B5CF6)],
          destination: const AlcoholPage(started: false),
        ),
      );
    }
    if (addictions.quitBenzos == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionBenzos,
          icon: Icons.bedtime,
          gradientColors: [const Color(0xFF6D5DD3), const Color(0xFF1E1B4B)],
          destination: const BenzodiazepinePage(started: false),
        ),
      );
    }
    if (addictions.quitCocaine == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionCocaine,
          icon: Icons.bolt,
          gradientColors: [const Color(0xFF3B82F6), const Color(0xFF1D4ED8)],
          destination: const CocainePage(started: false),
        ),
      );
    }
    if (addictions.quitMarijuana == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionMarijuana,
          icon: Icons.grass,
          gradientColors: [
            const Color.fromARGB(255, 132, 230, 128),
            const Color.fromARGB(255, 30, 87, 3),
          ],
          destination: const MarijuanaPage(started: false),
        ),
      );
    }
    if (addictions.quitNitrousOxide == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionNitrousOxide,
          icon: Icons.air_outlined,
          gradientColors: [const Color(0xFF38BDF8), const Color(0xFF7DD3FC)],
          destination: const NitrousOxidePage(started: false),
        ),
      );
    }
    if (addictions.quitMeth == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionMeth,
          icon: Icons.battery_charging_full,
          gradientColors: [const Color(0xFF14B8A6), const Color(0xFF0D9488)],
          destination: const MethPage(started: false),
        ),
      );
    }
    if (addictions.quitPouches == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionNicotinePouches,
          icon: Icons.scatter_plot,
          gradientColors: [const Color(0xFFF59E0B), const Color(0xFFEF4444)],
          destination: const NicotinePouchesPage(started: false),
        ),
      );
    }
    if (addictions.quitHeroin == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionHeroin,
          icon: Icons.medication,
          gradientColors: [const Color(0xFFEC4899), const Color(0xFFBE185D)],
          destination: const OpioidPage(started: false, storageKey: 'heroin'),
        ),
      );
    }
    if (addictions.quitOpioids == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionOpioids,
          icon: Icons.medication,
          gradientColors: [const Color(0xFFEC4899), const Color(0xFFBE185D)],
          destination: const OpioidPage(started: false),
        ),
      );
    }
    if (addictions.quitPornography == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionAC,
          icon: Icons.block,
          gradientColors: [const Color(0xFFF43F5E), const Color(0xFFE11D48)],
          destination: const PornographyPage(started: false),
        ),
      );
    }
    if (addictions.quitSmoking == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionSmoking,
          icon: Icons.eco,
          gradientColors: [const Color(0xFF10B981), const Color(0xFF059669)],
          destination: const SmokingPage(started: false),
        ),
      );
    }
    if (addictions.quitSocialMedia == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionSocialMedia,
          icon: Icons.public,
          gradientColors: [const Color(0xFF8B5CF6), const Color(0xFF7C3AED)],
          destination: const SocialMediaPage(started: false),
        ),
      );
    }
    if (addictions.quitVaping == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionVaping,
          icon: Icons.air,
          gradientColors: [const Color(0xFF06B6D4), const Color(0xFF0EA5E9)],
          destination: const VapingPage(started: false),
        ),
      );
    }

    if (addictions.quitKratom == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionKratom,
          icon: Icons.local_florist,
          gradientColors: [const Color(0xFF6D9F4E), const Color(0xFF3F6B2E)],
          destination: const KratomPage(started: false),
        ),
      );
    }
    if (addictions.quitGabapentinoids == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionGabapentinoid,
          icon: Icons.medication_outlined,
          gradientColors: [const Color(0xFF94A3B8), const Color(0xFF475569)],
          destination: const GabapentinoidPage(started: false),
        ),
      );
    }
    if (addictions.quitGhb == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionGhb,
          icon: Icons.water_drop,
          gradientColors: [const Color(0xFF60A5FA), const Color(0xFF1E3A8A)],
          destination: const GhbPage(started: false),
        ),
      );
    }
    if (addictions.quitKetamine == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionKetamine,
          icon: Icons.vaccines,
          gradientColors: [const Color(0xFF818CF8), const Color(0xFF4338CA)],
          destination: const KetaminePage(started: false),
        ),
      );
    }
    if (addictions.quitInhalants == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionInhalants,
          icon: Icons.local_gas_station,
          gradientColors: [const Color(0xFF9CA3AF), const Color(0xFF4B5563)],
          destination: const InhalantsPage(started: false),
        ),
      );
    }
    if (addictions.quitSyntheticCannabinoids == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionSyntheticCannabinoids,
          icon: Icons.whatshot,
          gradientColors: [const Color(0xFFA3E635), const Color(0xFF4D7C0F)],
          destination: const SyntheticCannabinoidsPage(started: false),
        ),
      );
    }
    if (addictions.quitMdma == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionMdma,
          icon: Icons.favorite,
          gradientColors: [const Color(0xFFF472B6), const Color(0xFFA855F7)],
          destination: const MdmaPage(started: false),
        ),
      );
    }
    if (addictions.quitSteroids == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionSteroids,
          icon: Icons.fitness_center,
          gradientColors: [const Color(0xFFEF4444), const Color(0xFF7F1D1D)],
          destination: const SteroidsPage(started: false),
        ),
      );
    }

    if (addictions.quitFentanyl == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionFentanyl,
          icon: Icons.medication,
          gradientColors: [const Color(0xFF7C3AED), const Color(0xFF3B0764)],
          destination: const OpioidPage(started: false, storageKey: 'fentanyl'),
        ),
      );
    }

    if (addictions.quitSmokelessTobacco == null) {
      options.add(
        _AddictionOption(
          title: l10n.addictionSmokelessTobacco,
          icon: Icons.grass,
          gradientColors: [const Color(0xFF78350F), const Color(0xFF451A03)],
          destination: const SmokelessTobaccoPage(started: false),
        ),
      );
    }

    options.sort(
      (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.addAddictionTitle)),
      body: SafeArea(
        child: ListView(
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
            const Divider(height: 32),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
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
      ),
    );
  }
}
