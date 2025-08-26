import 'package:flutter/material.dart';
import 'package:quitter/confetti_widget.dart';
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
  int currentDay = 1;
  bool started = true;
  bool showConfetti = false;
  final controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<QuitMilestone> milestones = [
    QuitMilestone(
      day: 1,
      title: "Carbon Monoxide Clears",
      description:
          "Your blood is breathing again! Within 24 hours, carbon monoxide levels drop to normal and oxygen levels increase. Your heart doesn't have to work overtime anymore to pump poisoned blood around your body.",
      reference: "NHS Better Health - Quit Smoking Timeline",
      link: "https://www.nhs.uk/better-health/quit-smoking/",
    ),
    QuitMilestone(
      day: 3,
      title: "Nicotine Withdrawal Peaks",
      description:
          "The nicotine monster is at its angriest, but you're winning the battle! All nicotine has left your system. The worst cravings happen now, but they're also your ticket to freedom on the other side.",
      reference:
          "PMC - Optimal Carbon Monoxide Criteria for 24-hr Smoking Abstinence",
      link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3733388/",
    ),
    QuitMilestone(
      day: 7,
      title: "Taste & Smell Dramatically Improve",
      description:
          "Food is about to become an adventure again! Smoking destroys taste buds and smell receptors. One week in, and you're rediscovering flavors you forgot existed. Prepare for some serious food appreciation!",
      reference: "NHS Better Health - Quit Smoking Benefits",
      link: "https://www.nhs.uk/better-health/quit-smoking/",
    ),
    QuitMilestone(
      day: 14,
      title: "Circulation & Walking Improve",
      description:
          "Your legs are thanking you with every step! Blood circulation improves dramatically, making walking and exercise noticeably easier. Those stairs aren't looking so intimidating anymore, are they?",
      reference: "Medical News Today - Timeline After Quitting Smoking",
      link: "https://www.medicalnewstoday.com/articles/317956",
    ),
    QuitMilestone(
      day: 30,
      title: "Lung Function Increases",
      description:
          "Your lungs are throwing a comeback party! Cilia have regrown and are sweeping out years of tar and debris. Lung capacity increases significantly, and that smoker's cough is history.",
      reference: "PMC - Smoking Cessation for People with COPD",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6400424/",
    ),
    QuitMilestone(
      day: 90,
      title: "Heart Attack Risk Drops Significantly",
      description:
          "Your heart is sending love letters! Three months smoke-free and your cardiovascular risk has already dropped substantially. Your cardiovascular system is healing faster than you might think possible.",
      reference:
          "PMC - Cardiovascular Effects of Smoking and Smoking Cessation (2024)",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC11843939/",
    ),
    QuitMilestone(
      day: 180,
      title: "Immune System Strengthens",
      description:
          "Your immune system just got a superhero upgrade! Six months without smoking and your white blood cells are back to full strength, fighting infections like the champions they were born to be.",
      reference:
          "American Cancer Society - Health Benefits of Quitting Smoking",
      link:
          "https://www.cancer.org/cancer/risk-prevention/tobacco/guide-quitting-smoking/benefits-of-quitting-smoking-over-time.html",
    ),
    QuitMilestone(
      day: 365,
      title: "Stroke Risk Reduces Significantly",
      description:
          "One full year of freedom! Your stroke risk has decreased substantially, and your blood vessels are healing beautifully. You've officially given your brain the gift of better circulation and protection.",
      reference: "PMC - Smoking Cessation and Outcome After Ischemic Stroke",
      link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5644463/",
    ),
    QuitMilestone(
      day: 1825,
      title: "Cancer Risk Plummets (5 Years)",
      description:
          "Five years of victory! Your risk of mouth, throat, esophagus, and bladder cancers has dropped by half. Lung cancer risk has decreased significantly too. Your cells have had time to repair and regenerate.",
      reference: "CDC - Benefits of Quitting Smoking",
      link: "https://www.cdc.gov/tobacco/about/benefits-of-quitting.html",
    ),
  ];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      final quitOn = prefs.getString('smoking');
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
      prefs.setString('smoking', DateTime.now().toIso8601String());
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
                    started ? 'Day $currentDay' : 'This is just the Beginning',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    started
                        ? 'Smoke-free and loving it! ✨'
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
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Enter your current day',
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
                                  'smoking',
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
                            labelStyle: TextStyle(
                              color: colorScheme.onPrimary.withAlpha(180),
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
                              'smoking',
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
