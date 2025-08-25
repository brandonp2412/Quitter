import 'package:flutter/material.dart';
import 'package:quitter/confetti_widget.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/timeline_tile.dart';
import 'package:quitter/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NicotinePouchesPage extends StatefulWidget {
  const NicotinePouchesPage({super.key});

  @override
  State<NicotinePouchesPage> createState() => _NicotinePouchesPageState();
}

class _NicotinePouchesPageState extends State<NicotinePouchesPage> {
  int currentDay = 1;
  bool started = false;
  bool showConfetti = false;
  final controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<QuitMilestone> milestones = [
    QuitMilestone(
      day: 1,
      title: "Taste & Smell Begin Recovery",
      description:
          "Nicotine dulls your taste buds and smell receptors. After just 24 hours without pouches, these senses start their comeback tour! Food is about to taste amazing again.",
      reference: "Vennemann et al. (2008) - Chemical Senses",
      link: "https://pubmed.ncbi.nlm.nih.gov/18595826/",
    ),
    QuitMilestone(
      day: 3,
      title: "Nicotine Completely Cleared",
      description:
          "Your body has officially evicted all nicotine! While withdrawal symptoms might peak around now, remember - this is your brain rewiring itself for freedom. The hardest part is almost over.",
      reference: "Hukkanen et al. (2005) - Pharmacological Reviews",
      link: "https://pubmed.ncbi.nlm.nih.gov/16968945/",
    ),
    QuitMilestone(
      day: 7,
      title: "Oral Health Improves",
      description:
          "Your gums are throwing a celebration! Nicotine pouches can cause gum irritation and recession. After a week, blood flow to your gums normalizes and healing begins.",
      reference: "Caraway et al. (2020) - Tobacco Control",
      link: "https://pubmed.ncbi.nlm.nih.gov/32354768/",
    ),
    QuitMilestone(
      day: 14,
      title: "Circulation Enhancement",
      description:
          "Your blood vessels are doing a happy dance! Nicotine constricts blood vessels, but two weeks free and your circulation is significantly improved. Hello, warmer hands and feet!",
      reference: "Benowitz & Burbank (2016) - Annual Review of Pharmacology",
      link: "https://pubmed.ncbi.nlm.nih.gov/26514203/",
    ),
    QuitMilestone(
      day: 30,
      title: "Stress Response Normalizes",
      description:
          "Plot twist: nicotine actually increases stress between uses! Your cortisol levels and stress response are now returning to baseline. Real relaxation, not the nicotine fake-out.",
      reference: "Parrott (1999) - Addiction",
      link: "https://pubmed.ncbi.nlm.nih.gov/10605870/",
    ),
    QuitMilestone(
      day: 60,
      title: "Sleep Quality Improves",
      description:
          "Sweet dreams are made of... no nicotine! While nicotine seems relaxing, it actually disrupts sleep architecture. Two months in, and your REM cycles are beautifully restored.",
      reference: "Zhang et al. (2006) - Sleep Medicine Reviews",
      link: "https://pubmed.ncbi.nlm.nih.gov/16564189/",
    ),
    QuitMilestone(
      day: 90,
      title: "Dopamine Receptors Recover",
      description:
          "Your brain's reward system is back online! Nicotine hijacks dopamine pathways, making normal pleasures seem dull. Three months free, and life's natural joys are vibrant again.",
      reference: "Koob & Volkow (2016) - Neuropsychopharmacology",
      link: "https://pubmed.ncbi.nlm.nih.gov/26482517/",
    ),
    QuitMilestone(
      day: 180,
      title: "Cardiovascular Risk Drops",
      description:
          "Your heart is sending love letters! Six months without nicotine significantly reduces cardiovascular disease risk. Your blood pressure and heart rate variability are vastly improved.",
      reference:
          "Benowitz & Fraiman (2017) - Journal of the American College of Cardiology",
      link: "https://pubmed.ncbi.nlm.nih.gov/28302290/",
    ),
    QuitMilestone(
      day: 365,
      title: "Long-term Health Secured",
      description:
          "One year of freedom! Your risk of nicotine-related health issues continues to plummet. You've broken the addiction cycle and reclaimed your autonomy. That's genuinely heroic! 🏆",
      reference: "West & Shiffman (2016) - Addiction",
      link: "https://pubmed.ncbi.nlm.nih.gov/27264552/",
    ),
  ];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      final quitOn = prefs.getString('nicotine_pouches');
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
          targetIndex * 270 - 230,
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
      prefs.setString('nicotine_pouches', DateTime.now().toIso8601String());
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
    return ConfettiWidget(
      isActive: showConfetti,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back),
            color: Theme.of(context).colorScheme.surface,
          ),
          title: Text(
            'Quit pouches journey',
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
                    started ? 'Day $currentDay' : 'This is just the Beginning',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    started
                        ? 'Breaking free, one day at a time! 💪'
                        : 'Your journey starts with a single step! 🌟',
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
                              color: Theme.of(context).colorScheme.onPrimary
                                  .withAlpha((255 * 0.7).round()),
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
                                  'nicotine_pouches',
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
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
                            prefs.setString(
                              'nicotine_pouches',
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
