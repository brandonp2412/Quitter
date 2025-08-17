import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/timeline_tile.dart';
import 'package:quitter/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SmokingPage extends StatefulWidget {
  const SmokingPage({super.key});

  @override
  State<SmokingPage> createState() => _SmokingPageState();
}

class _SmokingPageState extends State<SmokingPage> {
  int currentDay = 0;
  final controller = TextEditingController(text: '0');

  final List<QuitMilestone> milestones = [
    QuitMilestone(
      day: 1,
      title: "Carbon Monoxide Clears",
      description:
          "Your blood is breathing again! Within 24 hours, carbon monoxide levels drop to normal and oxygen levels increase. Your heart doesn't have to work overtime anymore to pump poisoned blood around your body.",
      reference: "Benowitz et al. (1982) - New England Journal of Medicine",
    ),
    QuitMilestone(
      day: 3,
      title: "Nicotine Withdrawal Peaks",
      description:
          "The nicotine monster is at its angriest, but you're winning the battle! All nicotine has left your system. The worst cravings happen now, but they're also your ticket to freedom on the other side.",
      reference: "Hughes (2007) - Addiction",
    ),
    QuitMilestone(
      day: 7,
      title: "Taste & Smell Dramatically Improve",
      description:
          "Food is about to become an adventure again! Smoking destroys taste buds and smell receptors. One week in, and you're rediscovering flavors you forgot existed. Prepare for some serious food appreciation!",
      reference: "Vennemann et al. (2008) - Archives of Otolaryngology",
    ),
    QuitMilestone(
      day: 14,
      title: "Circulation & Walking Improve",
      description:
          "Your legs are thanking you with every step! Blood circulation improves dramatically, making walking and exercise noticeably easier. Those stairs aren't looking so intimidating anymore, are they?",
      reference: "Mahmud & Feely (2003) - Hypertension",
    ),
    QuitMilestone(
      day: 30,
      title: "Lung Function Increases 30%",
      description:
          "Your lungs are throwing a comeback party! Cilia have regrown and are sweeping out years of tar and debris. Lung capacity increases up to 30%, and that smoker's cough is history.",
      reference: "Willemse et al. (2004) - Thorax",
    ),
    QuitMilestone(
      day: 90,
      title: "Heart Attack Risk Drops 50%",
      description:
          "Your heart is sending love letters! Three months smoke-free and your risk of heart attack has already dropped by half. Your cardiovascular system is healing faster than you might think possible.",
      reference: "Critchley & Capewell (2003) - Cochrane Reviews",
    ),
    QuitMilestone(
      day: 180,
      title: "Immune System Strengthens",
      description:
          "Your immune system just got a superhero upgrade! Six months without smoking and your white blood cells are back to full strength, fighting infections like the champions they were born to be.",
      reference: "Sopori (2002) - Nature Reviews Immunology",
    ),
    QuitMilestone(
      day: 365,
      title: "Stroke Risk Reduces by 50%",
      description:
          "One full year of freedom! Your risk of stroke has dropped by half, and your blood vessels are healing beautifully. You've officially given your brain the gift of better circulation and protection.",
      reference: "Wolf et al. (1988) - JAMA",
    ),
    QuitMilestone(
      day: 1825,
      title: "Cancer Risk Plummets (5 Years)",
      description:
          "Five years of victory! Your risk of mouth, throat, esophagus, and bladder cancers has dropped by half. Lung cancer risk has decreased significantly too. Your cells have had time to repair and regenerate.",
      reference: "Peto et al. (2000) - British Medical Journal",
    ),
  ];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      final quitOn = prefs.getString('smoking');
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
          color: Colors.white,
        ),
        title: Text(
          'Quit smoking journey',
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
                  'Smoke-free and loving it! ✨',
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
                          hintText: 'Enter your current day',
                          labelText: 'Enter your current day',
                          labelStyle: TextStyle(
                            color: colorScheme.onPrimary.withOpacity(0.7),
                          ),
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
                          prefs.setString('smoking', quitOn.toIso8601String());
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
