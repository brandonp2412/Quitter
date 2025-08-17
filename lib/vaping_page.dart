import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/timeline_tile.dart';
import 'package:quitter/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VapingPage extends StatefulWidget {
  const VapingPage({super.key});

  @override
  State<VapingPage> createState() => _VapingPageState();
}

class _VapingPageState extends State<VapingPage> {
  int currentDay = 0;
  final controller = TextEditingController(text: '0');

  final List<QuitMilestone> milestones = [
    QuitMilestone(
      day: 1,
      title: "Nicotine Cravings Peak",
      description:
          "Your brain is throwing a nicotine tantrum, but you're already winning! Within 24 hours, nicotine levels drop dramatically. The worst cravings happen now, but they're also the most important to push through.",
      reference:
          "Benowitz & Jacob (1993) - Clinical Pharmacology & Therapeutics",
    ),
    QuitMilestone(
      day: 3,
      title: "Breathing Improves",
      description:
          "Your lungs are doing a happy dance! Bronchial tubes begin to relax and lung capacity starts improving. That tight chest feeling from vaping is already beginning to ease up.",
      reference: "Polosa et al. (2013) - Internal and Emergency Medicine",
    ),
    QuitMilestone(
      day: 7,
      title: "Taste & Smell Return",
      description:
          "Food is about to taste amazing again! Nicotine dampens taste buds and smell receptors. A week in, and your sensory superpowers are making their comeback tour.",
      reference: "Vennemann et al. (2008) - Archives of Otolaryngology",
    ),
    QuitMilestone(
      day: 14,
      title: "Circulation Improves",
      description:
          "Your blood is flowing like a champion! Nicotine constricts blood vessels, but two weeks smoke-free and your circulation is dramatically improving. Cold hands and feet, begone!",
      reference: "Mahmud & Feely (2003) - Hypertension",
    ),
    QuitMilestone(
      day: 30,
      title: "Lung Function Recovery",
      description:
          "Your lungs are practically throwing a celebration parade! Cilia (tiny lung cleaners) have regenerated and lung function has improved significantly. That morning cough is history!",
      reference:
          "Regan et al. (2012) - American Journal of Respiratory Medicine",
    ),
    QuitMilestone(
      day: 60,
      title: "Anxiety Levels Normalize",
      description:
          "Plot twist: vaping was making your anxiety worse, not better! Two months in and your baseline anxiety levels are significantly lower. Your nervous system is finally chilling out.",
      reference: "Taylor et al. (2014) - Addiction",
    ),
    QuitMilestone(
      day: 90,
      title: "Cognitive Function Sharpens",
      description:
          "Brain fog has officially left the building! Three months without nicotine and your cognitive function, focus, and memory are significantly improved. It's like upgrading your mental RAM.",
      reference: "Heishman et al. (2010) - Psychopharmacology",
    ),
    QuitMilestone(
      day: 180,
      title: "Oral Health Recovery",
      description:
          "Your mouth is sending thank-you cards! Six months vape-free and gum inflammation decreases, tooth staining fades, and your risk of oral health issues drops substantially.",
      reference: "Gualano et al. (2018) - Journal of Periodontology",
    ),
    QuitMilestone(
      day: 365,
      title: "Cardiovascular Risk Reduction",
      description:
          "Your heart is literally stronger! One full year and your risk of heart disease has dropped significantly. Your cardiovascular system has recovered from nicotine's daily assault course.",
      reference: "Benowitz & Burbank (2016) - Annual Review of Medicine",
    ),
  ];

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      final quitOn = prefs.getString('vaping');
      if (quitOn == null) return;

      final quitDate = DateTime.parse(quitOn);
      final now = DateTime.now();

      setState(() {
        currentDay = now.difference(quitDate).inDays;
        controller.text = currentDay.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(currentDay),
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.surface,
        ),
        title: Text(
          'Quit vaping journey',
          style: TextStyle(color: colorScheme.onPrimary),
        ),
        backgroundColor: colorScheme.primary,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Progress Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Day $currentDay',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Breaking free from the cloud! ☁️ 🌟',
                  style: TextStyle(
                    fontSize: 16,
                    color: colorScheme.onPrimary.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onTap: () => selectAll(controller),
                        controller: controller,
                        decoration: InputDecoration(
                          labelText: 'Enter your current day',
                          labelStyle: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimary.withOpacity(0.7),
                          ),
                          hintText: 'Enter your current day',
                          hintStyle: TextStyle(
                            color: colorScheme.onPrimary.withOpacity(0.7),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide(
                              color: colorScheme.onPrimary,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide(
                              color: colorScheme.onPrimary,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide(
                              color: colorScheme.onPrimary,
                              width: 2,
                            ),
                          ),
                        ),
                        style: TextStyle(color: colorScheme.onPrimary),
                        keyboardType: TextInputType.number,
                        onChanged: (value) async {
                          setState(() {
                            currentDay = int.tryParse(value) ?? 0;
                          });

                          final quitOn = DateTime.now().subtract(
                            Duration(days: currentDay),
                          );
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setString('vaping', quitOn.toIso8601String());
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Timeline
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: milestones.length,
              itemBuilder: (context, index) {
                final milestone = milestones[index];
                final isCompleted = currentDay >= milestone.day;
                final isNext =
                    !isCompleted &&
                    (index == 0 || currentDay >= milestones[index - 1].day);

                return TimelineTile(
                  milestone: milestone,
                  isCompleted: isCompleted,
                  isNext: isNext,
                  isLast: index == milestones.length - 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: const VapingPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    ),
  );
}
