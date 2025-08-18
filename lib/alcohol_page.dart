import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/timeline_tile.dart';
import 'package:quitter/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlcoholPage extends StatefulWidget {
  const AlcoholPage({super.key});

  @override
  State<AlcoholPage> createState() => _AlcoholPageState();
}

class _AlcoholPageState extends State<AlcoholPage> {
  int currentDay = 0;
  final controller = TextEditingController(text: '0');

  final List<QuitMilestone> milestones = [
    QuitMilestone(
      day: 1,
      title: "Sleep Quality Improves",
      description:
          "Your REM sleep cycles are already starting to normalize. No more tossing and turning like a rotisserie chicken! While alcohol might knock you out initially, it's terrible for deep sleep quality.",
      reference:
          "Ebrahim et al. (2013) - Alcoholism: Clinical and Experimental Research",
    ),
    QuitMilestone(
      day: 3,
      title: "Hydration Levels Restore",
      description:
          "Your kidneys are finally getting a break from processing alcohol's diuretic effects. Say goodbye to that perpetual hangover thirst and hello to actually glowing skin!",
      reference:
          "Hobson & Maughan (2010) - European Journal of Clinical Nutrition",
    ),
    QuitMilestone(
      day: 7,
      title: "Immune System Strengthens",
      description:
          "Your white blood cells are back on patrol duty! Alcohol suppresses immune function, so after a week, your body's defense system is already getting back to fighting form.",
      reference: "Sarkar et al. (2015) - Alcohol Research: Current Reviews",
    ),
    QuitMilestone(
      day: 14,
      title: "Mental Clarity Returns",
      description:
          "Brain fog, begone! Alcohol affects neurotransmitter balance and cognitive function. Two weeks in, and your mental sharpness is making a comeback worthy of a superhero montage.",
      reference: "Oscar-Berman & Marinković (2007) - Alcohol Research & Health",
    ),
    QuitMilestone(
      day: 30,
      title: "Blood Pressure Normalizes",
      description:
          "Your cardiovascular system is sending thank-you cards. Regular alcohol consumption elevates blood pressure, but a month sober and your heart is already working more efficiently.",
      reference:
          "Roerecke & Rehm (2017) - Cochrane Database of Systematic Reviews",
    ),
    QuitMilestone(
      day: 60,
      title: "Liver Function Improves",
      description:
          "Your liver is practically doing cartwheels! This amazing organ can regenerate, and after two months, liver enzymes and fat accumulation show significant improvement.",
      reference: "Liangpunsakul et al. (2010) - Hepatology",
    ),
    QuitMilestone(
      day: 90,
      title: "Memory Enhancement",
      description:
          "Remember when you couldn't remember things? Your hippocampus is recovering from alcohol's neurotoxic effects. Three months in, and your memory formation is significantly improved.",
      reference: "Zahr & Pfefferbaum (2017) - Neuropsychology Review",
    ),
    QuitMilestone(
      day: 180,
      title: "Neuroplasticity Increases",
      description:
          "Your brain is literally rewiring itself for the better! Six months of sobriety allows for significant neural recovery and increased brain plasticity. It's like a software update for your mind.",
      reference: "Duka et al. (2011) - Addiction Biology",
    ),
    QuitMilestone(
      day: 365,
      title: "Cancer Risk Reduction",
      description:
          "A full year smoke-free from the bottle! Your risk for alcohol-related cancers (liver, breast, colorectal) begins to decrease significantly. Your cells are throwing a celebration party.",
      reference: "Bagnardi et al. (2015) - British Journal of Cancer",
    ),
  ];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      final quitOn = prefs.getString('alcohol');
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.surface,
        ),
        title: Text(
          'Quit alcohol journey',
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(
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
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Every day is a victory! 🎉',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.surface,
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
                          hintStyle: TextStyle(color: Colors.white70),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.surface,
                              width: 2,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) async {
                          setState(() {
                            currentDay = int.tryParse(value) ?? 0;
                          });

                          final quitOn = DateTime.now().subtract(
                            Duration(days: currentDay),
                          );
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setString('alcohol', quitOn.toIso8601String());
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
