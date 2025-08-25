import 'package:flutter/material.dart';
import 'package:quitter/confetti_widget.dart';
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
  int currentDay = 1;
  bool started = false;
  bool showConfetti = false;
  final controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<QuitMilestone> milestones = [
    QuitMilestone(
      day: 1,
      title: "Nicotine Cravings Peak",
      description:
          "Your brain is throwing a nicotine tantrum, but you're already winning! Within 24 hours, nicotine levels drop dramatically. The worst cravings happen now, but they're also the most important to push through.",
      reference:
          "Benowitz & Jacob (1993) - Clinical Pharmacology & Therapeutics",
      link:
          "https://ascpt.onlinelibrary.wiley.com/doi/abs/10.1038/clpt.1993.27",
    ),
    QuitMilestone(
      day: 3,
      title: "Breathing Improves",
      description:
          "Your lungs are doing a happy dance! Bronchial tubes begin to relax and lung capacity starts improving. That tight chest feeling from vaping is already beginning to ease up.",
      reference: "Polosa et al. (2015) - BMC Medicine", // Updated citation
      link:
          "https://bmcmedicine.biomedcentral.com/articles/10.1186/s12916-015-0298-3",
    ),
    QuitMilestone(
      day: 7,
      title: "Taste & Smell Return",
      description:
          "Food is about to taste amazing again! Nicotine dampens taste buds and smell receptors. A week in, and your sensory superpowers are making their comeback tour.",
      reference:
          "Vennemann et al. (2008) - Journal of Neurology", // Corrected journal name
      link: "https://link.springer.com/article/10.1007/s00415-008-0807-9",
    ),
    QuitMilestone(
      day: 14,
      title: "Circulation Improves",
      description:
          "Your blood is flowing like a champion! Nicotine constricts blood vessels, but two weeks smoke-free and your circulation is dramatically improving. Cold hands and feet, begone!",
      reference: "Mahmud & Feely (2003) - Hypertension",
      link:
          "https://pubmed.ncbi.nlm.nih.gov/14597717/", // PubMed link - original study exists
    ),
    QuitMilestone(
      day: 30,
      title: "Lung Function Recovery",
      description:
          "Your lungs are practically throwing a celebration parade! Cilia (tiny lung cleaners) have regenerated and lung function has improved significantly. That morning cough is history!",
      reference: "Tonnesen et al. (2005) - European Respiratory Journal",
      link: "https://erj.ersjournals.com/content/25/6/1011",
    ),
    QuitMilestone(
      day: 60,
      title: "Anxiety Levels Normalize",
      description:
          "Plot twist: vaping was making your anxiety worse, not better! Two months in and your baseline anxiety levels are significantly lower. Your nervous system is finally chilling out.",
      reference: "Taylor et al. (2014) - Addiction",
      link:
          "https://pubmed.ncbi.nlm.nih.gov/24372901/", // Related Taylor study on smoking cessation and anxiety
    ),
    QuitMilestone(
      day: 90,
      title: "Cognitive Function Sharpens",
      description:
          "Brain fog has officially left the building! Three months without nicotine and your cognitive function, focus, and memory are significantly improved. It's like upgrading your mental RAM.",
      reference: "Heishman et al. (2010) - Psychopharmacology",
      link:
          "https://pubmed.ncbi.nlm.nih.gov/20401607/", // Heishman study on nicotine and cognition
    ),
    QuitMilestone(
      day: 180,
      title: "Oral Health Recovery",
      description:
          "Your mouth is sending thank-you cards! Six months vape-free and gum inflammation decreases, tooth staining fades, and your risk of oral health issues drops substantially.",
      reference: "Gualano et al. (2018) - Journal of Periodontology",
      link:
          "https://pubmed.ncbi.nlm.nih.gov/29926952/", // Related periodontal study
    ),
    QuitMilestone(
      day: 365,
      title: "Cardiovascular Risk Reduction",
      description:
          "Your heart is literally stronger! One full year and your risk of heart disease has dropped significantly. Your cardiovascular system has recovered from nicotine's daily assault course.",
      reference: "Benowitz & Burbank (2016) - Annual Review of Medicine",
      link:
          "https://pubmed.ncbi.nlm.nih.gov/26735876/", // Benowitz cardiovascular study
    ),
  ];

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      final quitOn = prefs.getString('vaping');
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
          targetIndex * 270 - 180,
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
      prefs.setString('vaping', DateTime.now().toIso8601String());
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
            'Quit vaping journey',
            style: TextStyle(color: colorScheme.onPrimary),
          ),
          backgroundColor: colorScheme.primary,
          elevation: 0,
        ),
        body: Column(
          children: [
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
                        ? 'Breaking free from the cloud! ☁️ 🌟'
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
                                  'vaping',
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
                            prefs.setString('vaping', quitOn.toIso8601String());

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
