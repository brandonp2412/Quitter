import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/timeline_tile.dart';
import 'package:quitter/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OpioidPage extends StatefulWidget {
  const OpioidPage({super.key});

  @override
  State<OpioidPage> createState() => _OpioidPageState();
}

class _OpioidPageState extends State<OpioidPage> {
  int currentDay = 0;
  final controller = TextEditingController(text: '0');

  final List<QuitMilestone> milestones = [
    QuitMilestone(
      day: 1,
      title: "Acute Withdrawal Begins",
      description:
          "The hardest part starts now, but you're not alone. Acute withdrawal symptoms peak in the first 24-72 hours. This is your body beginning the healing process. Professional medical support is crucial during this phase.",
      reference: "Kosten & O'Connor (2003) - New England Journal of Medicine",
    ),
    QuitMilestone(
      day: 7,
      title: "Physical Symptoms Peak & Begin Declining",
      description:
          "You've made it through the storm! The worst physical withdrawal symptoms typically peak around days 3-5 and start declining by day 7. Your body is working hard to restore its natural balance.",
      reference: "Weiss et al. (2011) - Addiction Science & Clinical Practice",
    ),
    QuitMilestone(
      day: 14,
      title: "Sleep Patterns Start Improving",
      description:
          "Sweet dreams are making a comeback! Two weeks in, your natural sleep architecture begins to restore. Opioids disrupt REM sleep, but your brain is learning to dream naturally again.",
      reference: "Dimsdale et al. (2007) - Sleep Medicine Reviews",
    ),
    QuitMilestone(
      day: 30,
      title: "Cognitive Function Begins Recovery",
      description:
          "Brain fog is starting to lift! One month clean and your cognitive function, decision-making, and memory are beginning to improve. Your prefrontal cortex is healing from opioid-induced changes.",
      reference: "Baldacchino et al. (2012) - Neuropsychology Review",
    ),
    QuitMilestone(
      day: 60,
      title: "Emotional Regulation Improves",
      description:
          "Your emotions are finding their natural rhythm again. Two months in recovery and your brain's reward system is starting to respond to everyday pleasures. The emotional rollercoaster is stabilizing.",
      reference: "Koob & Volkow (2016) - Neuropsychopharmacology",
    ),
    QuitMilestone(
      day: 90,
      title: "Dopamine Function Significantly Recovers",
      description:
          "Your brain's reward system is throwing a welcome-back party! Three months clean and dopamine function has significantly improved. Natural activities start feeling rewarding again - food, music, relationships.",
      reference: "Volkow et al. (2004) - Journal of Neuroscience",
    ),
    QuitMilestone(
      day: 180,
      title: "Immune System Strengthens",
      description:
          "Your immune system is back on patrol duty! Six months of recovery and your body's natural defenses have significantly strengthened. You're better equipped to fight off infections and illness.",
      reference: "Roy et al. (2011) - Neuroimmunomodulation",
    ),
    QuitMilestone(
      day: 365,
      title: "Neural Plasticity & Brain Structure Improve",
      description:
          "Your brain has been busy renovating! One full year of recovery shows significant improvements in brain structure and neural plasticity. The changes from chronic opioid use are healing beautifully.",
      reference: "Upadhyay et al. (2010) - Journal of Neuroscience",
    ),
    QuitMilestone(
      day: 730,
      title: "Long-term Recovery Stability (2 Years)",
      description:
          "Two years of strength and resilience! You've built new neural pathways, coping strategies, and life patterns. Research shows that reaching this milestone dramatically reduces relapse risk. You're a recovery warrior!",
      reference: "Dennis et al. (2007) - Evaluation Review",
    ),
  ];

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      final quitOn = prefs.getString('opioids');
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
          'Recovery journey',
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
                  'Healing one day at a time 💜',
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
                            color: colorScheme.onPrimary.withOpacity(0.7),
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
                          prefs.setString('opioids', quitOn.toIso8601String());
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.onPrimary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.health_and_safety,
                        size: 16,
                        color: colorScheme.onPrimary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Recovery is a medical process. Always consult healthcare professionals.',
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
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
