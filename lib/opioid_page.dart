import 'package:flutter/material.dart';
import 'package:quitter/confetti_widget.dart';
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
  int currentDay = 1;
  bool started = true;
  bool showConfetti = false;
  final controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<QuitMilestone> milestones = [
    QuitMilestone(
      day: 1,
      title: "Acute Withdrawal Begins",
      description:
          "The hardest part starts now, but you're not alone. Acute withdrawal symptoms peak in the first 24-72 hours. This is your body beginning the healing process. Professional medical support is crucial during this phase.",
      reference: "NCBI Bookshelf - Opioid Withdrawal (2023)",
      link: "https://www.ncbi.nlm.nih.gov/books/NBK526012/",
    ),
    QuitMilestone(
      day: 7,
      title: "Physical Symptoms Peak & Begin Declining",
      description:
          "You've made it through the storm! The worst physical withdrawal symptoms typically peak around days 3-5 and start declining by day 7. Your body is working hard to restore its natural balance.",
      reference:
          "NCBI Bookshelf - Clinical Guidelines for Withdrawal Management (2023)",
      link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
    ),
    QuitMilestone(
      day: 14,
      title: "Sleep Patterns Start Improving",
      description:
          "Sweet dreams are making a comeback! Two weeks in, your natural sleep architecture begins to restore. Opioids disrupt REM sleep, but your brain is learning to dream naturally again.",
      reference:
          "PMC - New Directions in Treatment of Opioid Withdrawal (2020)",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC7385662/",
    ),
    QuitMilestone(
      day: 30,
      title: "Cognitive Function Begins Recovery",
      description:
          "Brain fog is starting to lift! One month clean and your cognitive function, decision-making, and memory are beginning to improve. Your prefrontal cortex is healing from opioid-induced changes.",
      reference:
          "NCBI Bookshelf - The Neurobiology of Substance Use, Misuse, and Addiction",
      link: "https://www.ncbi.nlm.nih.gov/books/NBK424849/",
    ),
    QuitMilestone(
      day: 60,
      title: "Emotional Regulation Improves",
      description:
          "Your emotions are finding their natural rhythm again. Two months in recovery and your brain's reward system is starting to respond to everyday pleasures. The emotional rollercoaster is stabilizing.",
      reference: "PMC - The Neurobiology of Opioid Dependence (2010)",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC2851054/",
    ),
    QuitMilestone(
      day: 90,
      title: "Dopamine Function Significantly Recovers",
      description:
          "Your brain's reward system is throwing a welcome-back party! Three months clean and dopamine function has significantly improved. Natural activities start feeling rewarding again - food, music, relationships.",
      reference:
          "PMC - Dopamine, Opioids, and PET Imaging of Human Brain (2019)",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6892395/",
    ),
    QuitMilestone(
      day: 180,
      title: "Immune System Strengthens",
      description:
          "Your immune system is back on patrol duty! Six months of recovery and your body's natural defenses have significantly strengthened. You're better equipped to fight off infections and illness.",
      reference:
          "PMC - Effective Management of Opioid Withdrawal Symptoms (2019)",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6590307/",
    ),
    QuitMilestone(
      day: 365,
      title: "Neural Plasticity & Brain Structure Improve",
      description:
          "Your brain has been busy renovating! One full year of recovery shows significant improvements in brain structure and neural plasticity. The changes from chronic opioid use are healing beautifully.",
      reference:
          "PMC - Allostatic Changes in cAMP System Drive Opioid-Induced Adaptation (2019)",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6871051/",
    ),
    QuitMilestone(
      day: 730,
      title: "Long-term Recovery Stability (2 Years)",
      description:
          "Two years of strength and resilience! You've built new neural pathways, coping strategies, and life patterns. Research shows that reaching this milestone dramatically reduces relapse risk. You're a recovery warrior!",
      reference:
          "NIDA - Drugs, Brains, and Behavior: The Science of Addiction (2025)",
      link:
          "https://nida.nih.gov/publications/drugs-brains-behavior-science-addiction/drugs-brain",
    ),
  ];

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      final quitOn = prefs.getString('opioids');
      if (quitOn == null)
        return setState(() {
          started = false;
        });

      setState(() {
        currentDay = daysCeil(quitOn);
        controller.text = currentDay.toString();
      });

      final index = milestones.indexWhere((m) => currentDay < m.day);
      final targetIndex = index == -1 ? milestones.length - 1 : index;

      _scrollController.jumpTo(targetIndex * 270 - 180);
    });
  }

  void _handleStartPressed() {
    setState(() {
      currentDay = 1;
      started = true;
      showConfetti = true;
      controller.text = '1';
    });

    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('opioids', DateTime.now().toIso8601String());
    });

    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() {
          showConfetti = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ConfettiWidget(
      isActive: showConfetti,
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back),
            color: colorScheme.surface,
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
                    started ? 'Day $currentDay' : 'This is just the Beginning',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    started
                        ? 'Healing one day at a time 💜'
                        : 'Your journey starts with a single step! 🌟',
                    style: TextStyle(
                      fontSize: 16,
                      color: colorScheme.onPrimary,
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
                              color: colorScheme.onPrimary.withAlpha(180),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                final current = DateTime.now().subtract(
                                  Duration(days: currentDay),
                                );
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: current,
                                  firstDate: DateTime(0),
                                  lastDate: DateTime.now(),
                                );
                                if (date == null) return;
                                setState(() {
                                  currentDay = daysCeil(date.toIso8601String());
                                });
                                controller.text = currentDay.toString();

                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString(
                                  'opioids',
                                  date.toIso8601String(),
                                );
                              },
                              icon: Icon(
                                currentDay > 7
                                    ? Icons.calendar_month
                                    : Icons.calendar_today,
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: colorScheme.onPrimary,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: colorScheme.onPrimary,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
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
                              started = true;
                            });

                            final quitOn = DateTime.now().subtract(
                              Duration(days: currentDay),
                            );
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString(
                              'opioids',
                              quitOn.toIso8601String(),
                            );

                            final index = milestones.indexWhere(
                              (m) => currentDay < m.day,
                            );
                            final targetIndex = index == -1
                                ? milestones.length - 1
                                : index;

                            _scrollController.animateTo(
                              targetIndex * 150.0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.onPrimary.withAlpha(
                        (255 * 0.1).round(),
                      ),
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
                controller: _scrollController,
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
        floatingActionButton: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: started
              ? null
              : FloatingActionButton.extended(
                  key: ValueKey('start_fab'),
                  onPressed: _handleStartPressed,
                  label: Text("Start Your Journey"),
                  icon: Icon(Icons.rocket_launch),
                ),
        ),
      ),
    );
  }
}
