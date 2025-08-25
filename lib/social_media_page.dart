import 'package:flutter/material.dart';
import 'package:quitter/confetti_widget.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/timeline_tile.dart';
import 'package:quitter/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SocialMediaPage extends StatefulWidget {
  const SocialMediaPage({super.key});

  @override
  State<SocialMediaPage> createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<SocialMediaPage> {
  int currentDay = 1;
  bool started = false;
  bool showConfetti = false;
  final controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<QuitMilestone> milestones = [
    QuitMilestone(
      day: 1,
      title: "Digital Detox Day One! 🎯",
      description:
          "You've officially started rewiring your brain! Research shows that even thinking about checking social media triggers the same neural pathways as addiction. But you're already breaking the cycle - go you!",
      reference: "Haynes et al. (2012) - Internet addiction in students",
      link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3480687/",
    ),
    QuitMilestone(
      day: 3,
      title: "FOMO? More Like FO-NO! 😎",
      description:
          "Three days in and those anxious 'what am I missing?' thoughts are already fading. You're training your brain that real life is way more interesting than curated feeds!",
      reference: "University of Pennsylvania self-monitoring benefits study",
      link: "https://guilfordjournals.com/doi/10.1521/jscp.2018.37.10.751",
    ),
    QuitMilestone(
      day: 7,
      title: "Attention Span: Goldfish → Human 🧠",
      description:
          "Week one complete! Your ability to focus without checking your phone every few minutes is already improving. Studies show our brains crave the dopamine hits from notifications - but you're teaching yours to find rewards elsewhere!",
      reference: "Ward et al. (2017) - Brain drain hypothesis",
      link: "https://www.journals.uchicago.edu/doi/abs/10.1086/691462",
    ),
    QuitMilestone(
      day: 14,
      title: "Sleep Like a Baby (Not a Zombie) 😴",
      description:
          "Two weeks without scrolling before bed = better sleep quality! The blue light from screens suppresses melatonin production, but your natural sleep rhythms are bouncing back beautifully.",
      reference: "Woods & Scott (2016) - #Sleepyteens study",
      link:
          "https://onlinelibrary.wiley.com/doi/abs/10.1016/j.adolescence.2016.05.008",
    ),
    QuitMilestone(
      day: 30,
      title: "Real Friends > Fake Likes 💝",
      description:
          "One month offline = significant reductions in loneliness and depression! The University of Pennsylvania proved that limiting social media to just 30 minutes a day creates major mental health improvements. You've gone even further!",
      reference: "Hunt, Marx & Lipson (2018) - No More FOMO study",
      link: "https://guilfordjournals.com/doi/10.1521/jscp.2018.37.10.751",
    ),
    QuitMilestone(
      day: 60,
      title: "Comparison Trap: ESCAPED! ✨",
      description:
          "Two months without constant social comparison = confidence through the roof! Research consistently shows that social media use correlates with decreased self-esteem, especially from upward social comparisons. You've broken free from the comparison trap!",
      reference: "Nesi & Prinstein (2015) - Social media and self-esteem",
      link: "https://onlinelibrary.wiley.com/doi/abs/10.1111/jora.12146",
    ),
    QuitMilestone(
      day: 90,
      title: "Hobby Collector Level: Expert 🎨",
      description:
          "Three months = roughly 270+ hours reclaimed! That's enough time to learn a new skill, read 15+ books, or master that hobby you always said you'd try 'someday.' Neuroplasticity research shows your brain is literally rewiring for these new awesome habits!",
      reference: "Lally et al. (2010) - How long to form a habit",
      link: "https://onlinelibrary.wiley.com/doi/abs/10.1002/ejsp.674",
    ),
    QuitMilestone(
      day: 180,
      title: "Mental Health Glow-Up Complete 🌟",
      description:
          "Six months offline and you're officially thriving! Long-term studies show that reducing social media use leads to sustained improvements in wellbeing, self-esteem, and life satisfaction. You're living proof that life's better in the real world!",
      reference:
          "Shakya & Christakis (2017) - Facebook use and life satisfaction",
      link:
          "https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0185501",
    ),
    QuitMilestone(
      day: 365,
      title: "Digital Zen Master Achieved 🏆",
      description:
          "One full year of intentional living! You've reclaimed 1,000+ hours, formed deeper relationships, and proved that the best moments in life aren't meant for sharing - they're meant for experiencing. You're officially a digital wellness legend!",
      reference:
          "Twenge & Campbell (2018) - Screen time and psychological well-being",
      link: "https://journals.sagepub.com/doi/10.1177/0956797617741719",
    ),
  ];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      final quitOn = prefs.getString('social_media');
      if (quitOn == null) return;

      setState(() {
        started = true;
        currentDay = daysCeil(quitOn);
        controller.text = currentDay.toString();
      });

      final index = milestones.indexWhere((m) => currentDay < m.day);
      final targetIndex = index == -1 ? milestones.length - 1 : index;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          targetIndex * 270 - 197,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  void _handleStartPressed() {
    setState(() {
      currentDay = 1;
      started = true;
      showConfetti = true;
      controller.text = '0';
    });

    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('social_media', DateTime.now().toIso8601String());
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
            color: Theme.of(context).colorScheme.surface,
          ),
          title: Text(
            'Quit social media journey',
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
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    started
                        ? 'Social media-free and thriving! ✨'
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
                                  'social_media',
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
                              color: colorScheme.onPrimary.withAlpha(
                                (255 * 0.7).round(),
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: colorScheme.onPrimary.withAlpha(
                                (255 * 0.7).round(),
                              ),
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
                              started = true;
                            });

                            final quitOn = DateTime.now().subtract(
                              Duration(days: currentDay),
                            );
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString(
                              'social_media',
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
