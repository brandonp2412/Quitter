import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/custom_quit_entry.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_page_template.dart';

class CustomQuitPage extends StatefulWidget {
  final Entry entry;

  const CustomQuitPage({super.key, required this.entry});

  @override
  State<CustomQuitPage> createState() => _CustomQuitPageState();
}

class _CustomQuitPageState extends State<CustomQuitPage> {
  List<QuitMilestone> _generateMilestones() {
    List<QuitMilestone> miles = [];
    miles.add(
      const QuitMilestone(
        day: 1,
        title: "Sleep Quality Begins to Improve",
        description:
            "Your brain is already starting to heal! Within 24 hours of quitting, sleep patterns begin normalizing as your nervous system starts to recalibrate without the constant disruption of addictive substances.",
        reference:
            "Journal of Clinical Medicine - Sleep and Addiction Recovery",
        link: "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6262292/",
      ),
    );
    miles.add(
      const QuitMilestone(
        day: 3,
        title: "Withdrawal Symptoms Peak",
        description:
            "You're facing the storm head-on! Physical withdrawal symptoms typically peak around day 3, but this means you're getting through the hardest part. Your brain is working to restore natural neurotransmitter balance.",
        reference: "Nature Reviews Neuroscience - Neurobiology of Addiction",
        link: "https://www.nature.com/articles/nrn1539",
      ),
    );
    miles.add(
      const QuitMilestone(
        day: 7,
        title: "Mood and Anxiety Stabilize",
        description:
            "Your emotional world is finding its balance again! After one week, mood swings decrease and anxiety levels begin to normalize as your brain chemistry starts recovering from addiction-induced changes.",
        reference:
            "Psychological Medicine - Mood Changes in Addiction Recovery",
        link: "https://www.cambridge.org/core/journals/psychological-medicine",
      ),
    );
    miles.add(
      const QuitMilestone(
        day: 14,
        title: "Cognitive Function Improves",
        description:
            "Your mental clarity is sharpening! Studies show significant improvements in attention, memory, and decision-making abilities within two weeks of stopping addictive behaviors.",
        reference: "Neuropsychopharmacology - Cognitive Recovery in Addiction",
        link: "https://www.nature.com/articles/npp201767",
      ),
    );
    miles.add(
      const QuitMilestone(
        day: 30,
        title: "Stress Response Normalizes",
        description:
            "Your body's stress system is healing! After 30 days, cortisol levels begin returning to normal ranges, and your natural stress-coping mechanisms start functioning properly again.",
        reference: "Psychoneuroendocrinology - Stress and Addiction Recovery",
        link: "https://www.sciencedirect.com/journal/psychoneuroendocrinology",
      ),
    );
    miles.add(
      const QuitMilestone(
        day: 90,
        title: "Dopamine System Rebalances",
        description:
            "Your brain's reward system is coming back online! Three months of recovery allows significant restoration of dopamine function, making natural pleasures enjoyable again without artificial stimulation.",
        reference: "Journal of Neuroscience - Dopamine Recovery in Abstinence",
        link: "https://www.jneurosci.org/content/21/23/9414",
      ),
    );
    miles.add(
      const QuitMilestone(
        day: 180,
        title: "Immune Function Strengthens",
        description:
            "Your immune system is getting its power back! Six months of recovery leads to measurable improvements in immune function, better infection resistance, and reduced inflammatory markers.",
        reference: "Addiction Biology - Immune System and Addiction Recovery",
        link: "https://onlinelibrary.wiley.com/journal/13691600",
      ),
    );
    miles.add(
      const QuitMilestone(
        day: 365,
        title: "Cardiovascular Health Improves",
        description:
            "Your heart is celebrating one year of freedom! Long-term recovery significantly reduces cardiovascular disease risk, lowers blood pressure, and improves overall heart health markers.",
        reference:
            "Circulation - Cardiovascular Benefits of Addiction Recovery",
        link: "https://www.ahajournals.org/journal/circ",
      ),
    );
    miles.add(
      const QuitMilestone(
        day: 730,
        title: "Brain Structure Recovery",
        description:
            "Your brain is rebuilding itself! Two years of recovery shows measurable restoration of brain gray matter volume and improved connectivity in areas damaged by addiction.",
        reference: "Biological Psychiatry - Neuroplasticity in Recovery",
        link: "https://www.biologicalpsychiatryjournal.com/",
      ),
    );
    return miles;
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AddictionProvider, Entry>(
      selector: (context, addictions) => addictions.entries.firstWhere(
        (e) => e.id == widget.entry.id,
        orElse: () => widget.entry,
      ),
      builder: (context, entry, child) {
        final addictions = context.read<AddictionProvider>();

        return QuitPageTemplate(
          title: entry.title,
          storageKey: entry.id,
          shareTitle: entry.title,
          milestones: _generateMilestones(),
          headerTextStartedBuilder: (day) => '$day Days',
          headerTextNotStarted: 'Not Started',
          headerSubtitleStartedBuilder: (day) => 'You are doing great!',
          headerSubtitleNotStarted: 'Tap "Start" to begin your journey',
          initialStarted: entry.quitDate.isBefore(DateTime.now()),
          customDaysAchieved: entry.daysAchieved,
          quitDateOverride: entry.quitDate.toIso8601String(),
          onQuitDateChanged: (date) async {
            final updated = entry.copyWith(quitDate: date);
            await addictions.updateEntry(updated);
          },
          onResetPressed: (days) async {
            await addictions.resetEntry(entry.id, days);
          },
        );
      },
    );
  }
}
