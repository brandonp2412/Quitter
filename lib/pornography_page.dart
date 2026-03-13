import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class PornographyPage extends StatelessWidget {
  final bool started;

  const PornographyPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.pornographyMilestone1Title,
        description: l10n.pornographyMilestone1Description,
        reference: "Neuroscience News - Pornography and Brain Effects",
        link:
            "https://neurosciencenews.com/neuroscience-pornography-brain-15354/",
        referenceDate: "March 2026",
        referenceContent:
            "Pornography and the Brain: Day One of Breaking the Cycle\n\n"
            "Source: Neuroscience News\n\n"
            "The Neuroscience of Pornography\n"
            "Research covered by Neuroscience News documents how habitual pornography use affects the brain in ways similar to other addictive behaviours. The key mechanisms involve the brain's dopamine reward system — the same system implicated in substance addictions.\n\n"
            "How Pornography Affects the Brain\n"
            "• Each viewing session triggers dopamine release in the brain's reward circuits\n"
            "• Over time, the brain adapts — requiring more novel or stimulating content to produce the same response (tolerance)\n"
            "• The prefrontal cortex (responsible for impulse control and decision-making) shows reduced grey matter in heavy users in some studies\n"
            "• Reward system sensitivity to natural stimuli (real-world intimacy, relationships) can decrease\n\n"
            "Day One: Breaking the Pattern\n"
            "The first day without pornography is the beginning of a neural pattern change. The brain has become accustomed to a particular type of artificial dopamine stimulation. Day one involves:\n"
            "• Possible restlessness and urges (withdrawal-like discomfort)\n"
            "• Increased awareness of triggers — situations that previously led to pornography use\n"
            "• The beginning of dopamine receptor sensitivity recovery\n\n"
            "Important Note on the Research\n"
            "The neuroscience of pornography is an active and somewhat debated field. The brain effects vary significantly by individual, viewing habits, and whether use meets clinical criteria for problematic behaviour. What is well-established is that deliberate reduction or cessation produces neurological benefits in those who feel their use has become problematic.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.pornographyMilestone3Title,
        description: l10n.pornographyMilestone3Description,
        reference: "Optimum Joy - Recognising Porn Withdrawal Symptoms",
        link:
            "https://optimumjoy.com/blog/recognizing-porn-withdrawal-symptoms/",
        referenceDate: "March 2026",
        referenceContent:
            "Day Three: Recognising Withdrawal Symptoms\n\n"
            "Source: Optimum Joy (clinical mental health counselling)\n\n"
            "Do Withdrawal Symptoms Occur?\n"
            "For people whose pornography use has become habitual or compulsive, stopping can produce a recognisable pattern of withdrawal-like discomfort. Optimum Joy's clinical guidance documents that these symptoms peak in the first 3–7 days.\n\n"
            "Common Withdrawal-Like Symptoms at Day 3\n"
            "• Irritability and mood swings\n"
            "• Anxiety and restlessness\n"
            "• Difficulty concentrating\n"
            "• Strong urges and cravings, often triggered by stress or boredom\n"
            "• Sleep disturbances\n"
            "• Possible depression or emotional flatness\n\n"
            "Why This Happens\n"
            "These symptoms reflect the brain adjusting to reduced artificial dopamine stimulation. The dopaminergic reward circuits that were frequently activated by pornography viewing are now in a lower-stimulation state. This produces dysphoria — a general feeling of unease — that is temporary and will resolve as the brain recalibrates.\n\n"
            "Strategies for Day Three\n"
            "Optimum Joy recommends:\n"
            "• Identifying and avoiding triggers\n"
            "• Physical exercise to boost natural dopamine\n"
            "• Social engagement and connection\n"
            "• Mindfulness and distress tolerance\n"
            "• Professional support if distress is severe",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.pornographyMilestone7Title,
        description: l10n.pornographyMilestone7Description,
        reference: "Tech Lockdown - Porn Addiction Recovery Timeline Guide",
        link:
            "https://www.techlockdown.com/guides/porn-addiction-recovery-timeline",
        referenceDate: "March 2026",
        referenceContent:
            "One Week Without Pornography: Sleep Improves\n\n"
            "Source: Tech Lockdown\n\n"
            "The First Week\n"
            "Tech Lockdown's recovery timeline guide documents the common experiences of the first week without pornography. By day seven, the most acute withdrawal-like discomfort has typically passed, and the first meaningful changes are becoming noticeable.\n\n"
            "Sleep Improvements\n"
            "Sleep quality often improves within the first week of stopping pornography use. This is because:\n"
            "• Pornography is frequently used late at night, displacing sleep\n"
            "• The arousal and stimulation from pornography viewing disrupts sleep onset\n"
            "• Cortisol and adrenaline responses to highly stimulating content interfere with the parasympathetic state needed for sleep\n\n"
            "At one week, many people notice they're falling asleep more easily and waking with more energy.\n\n"
            "Mood and Energy\n"
            "The initial flatness and irritability of the first few days is beginning to lift. Energy levels are improving as the brain's natural dopamine balance begins recovering.\n\n"
            "Cravings and Triggers\n"
            "Cravings are still present at day seven — often triggered by specific times of day, emotions (stress, boredom, loneliness), or digital environments. Identifying and planning around these triggers is the key practical task of this phase.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.pornographyMilestone14Title,
        description: l10n.pornographyMilestone14Description,
        reference: "Addiction Help - Porn Recovery Process",
        link: "https://www.addictionhelp.com/porn/recovery/",
        referenceDate: "March 2026",
        referenceContent:
            "Two Weeks Without Pornography: Motivation and Energy Return\n\n"
            "Source: Addiction Help\n\n"
            "Two Weeks: A Meaningful Threshold\n"
            "Addiction Help documents that the two-week mark is when many people first notice meaningful positive changes in their mood, motivation, and energy that they can clearly attribute to stopping pornography use.\n\n"
            "Dopamine Sensitivity Recovery\n"
            "The dopamine system, which was being frequently stimulated by pornography's supranormal reward signals, begins recovering its natural sensitivity to lower-intensity real-world stimuli. At two weeks, people often notice:\n"
            "• Greater interest in and enjoyment of real-world activities\n"
            "• More motivation to pursue goals, hobbies, and social connection\n"
            "• Increased energy and engagement with life\n"
            "• Improved focus and concentration\n\n"
            "The Flatness Is Lifting\n"
            "The anhedonia (flatness, difficulty enjoying normal things) that characterised the first week is substantially reduced by day fourteen. The brain's reward circuits are becoming more responsive to natural stimuli.\n\n"
            "Relationship With Self\n"
            "Many people at this stage report improved self-esteem and a sense of integrity from following through on their intention to quit. This psychological benefit compounds the neurological ones.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.pornographyMilestone30Title,
        description: l10n.pornographyMilestone30Description,
        reference: "Still Mind Florida - Porn Addiction Recovery Timeline",
        link:
            "https://stillmindflorida.com/mental-health/porn-addiction-recovery-timeline/",
        referenceDate: "March 2026",
        referenceContent:
            "One Month Without Pornography: Confidence and Self-Control\n\n"
            "Source: Still Mind Florida\n\n"
            "One Month: Establishing the Foundation\n"
            "Still Mind Florida's recovery timeline documents the one-month mark as when the foundational changes of recovery are becoming established. The neurological recalibration is well underway, and the lifestyle changes that support sustained recovery are becoming habits.\n\n"
            "Psychological Changes at 30 Days\n"
            "• Confidence: The self-efficacy that comes from 30 days of following through on a difficult commitment produces genuine confidence improvement\n"
            "• Self-control: The prefrontal cortex — which governs impulse control — is strengthening through repeated practice of resisting urges\n"
            "• Clarity: Mental clarity and presence in daily life are improved as the compulsive urge-response cycle weakens\n\n"
            "Social and Relational Changes\n"
            "Many people at the one-month mark notice improvements in their relationships:\n"
            "• Greater presence and engagement with real people\n"
            "• Reduced social anxiety\n"
            "• More authentic connection\n"
            "• Improved intimacy (for those in relationships)\n\n"
            "The Work of Recovery\n"
            "Still Mind Florida emphasises that one month is a milestone, not a finish line. The urges and triggers that drove pornography use still exist and require ongoing management. Therapy, accountability, and lifestyle structure remain important.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.pornographyMilestone90Title,
        description: l10n.pornographyMilestone90Description,
        reference: "MentalHealth.com - Brain Changes in Porn Addiction",
        link: "https://www.mentalhealth.com/library/the-brains-of-porn-addicts",
        referenceDate: "March 2026",
        referenceContent:
            "Three Months Without Pornography: Brain Function Stabilises\n\n"
            "Source: MentalHealth.com — Research on brain changes in pornography addiction\n\n"
            "What the Research Shows\n"
            "Research reviewed by MentalHealth.com examined brain changes in people with compulsive pornography use, including prefrontal cortex activity, reward circuit sensitivity, and grey matter changes. The findings parallel research on other behavioural addictions.\n\n"
            "Brain Recovery at 90 Days\n"
            "Three months is generally cited in the recovery community as a significant milestone for neurological stabilisation. At this point:\n"
            "• Prefrontal cortex function has substantially recovered — impulse control and decision-making are much stronger\n"
            "• The dopamine reward system has recalibrated — natural rewards feel genuinely rewarding again\n"
            "• The neural pathways associated with pornography-seeking behaviour have weakened through non-activation\n"
            "• Anxiety and depression (often elevated during early recovery) have typically improved significantly\n\n"
            "Quality of Life at 90 Days\n"
            "Most people at three months report a qualitative shift in how they experience life:\n"
            "• Greater presence and engagement in real relationships\n"
            "• Stronger sense of personal integrity and self-respect\n"
            "• More authentic pursuit of meaningful goals\n"
            "• Significantly reduced time and mental energy spent on pornography-related thoughts",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.pornographyMilestone180Title,
        description: l10n.pornographyMilestone180Description,
        reference: "Culture Reframed - Neuroscience of Pornography",
        link: "https://culturereframed.org/neuroscience-of-pornography/",
        referenceDate: "March 2026",
        referenceContent:
            "Six Months Without Pornography: Relationship and Social Skills\n\n"
            "Source: Culture Reframed\n\n"
            "Pornography and Social Connection\n"
            "Culture Reframed's neuroscience resource documents how pornography use affects social and relational functioning. Research shows that heavy pornography use can:\n"
            "• Reduce empathy and perspective-taking ability\n"
            "• Create distorted expectations about intimacy and relationships\n"
            "• Reduce social confidence and real-world social engagement\n"
            "• Impair the brain's natural bonding systems\n\n"
            "Six-Month Recovery\n"
            "At six months, the neural systems underlying healthy social connection — particularly the oxytocin and dopamine systems involved in bonding and empathy — have had substantial time to recover and strengthen through engagement with real-world relationships.\n\n"
            "Relationship Improvements at 180 Days\n"
            "• Genuine intimacy is more accessible and fulfilling\n"
            "• Empathy and attunement to others has improved\n"
            "• Social confidence is stronger\n"
            "• The ability to be present with real people — without the distraction of pornography-related thoughts — is much better\n\n"
            "For Those in Relationships\n"
            "Culture Reframed notes that six months is often when partners in recovery and their significant others begin experiencing meaningful improvements in relationship quality, as the neural systems that support healthy bonding continue recovering.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.pornographyMilestone365Title,
        description: l10n.pornographyMilestone365Description,
        reference: "The Rehab Support - Long-term Porn Addiction Recovery",
        link: "https://therehabsupport.com/porn-addiction-recovery-timeline/",
        referenceDate: "March 2026",
        referenceContent:
            "One Year Without Pornography: Neural Pathway Reset\n\n"
            "Source: The Rehab Support\n\n"
            "One Year: A Complete Neural Recalibration\n"
            "The Rehab Support documents the one-year mark as representing the most comprehensive reset of the neural pathways associated with compulsive pornography use. One year of sustained non-activation weakens the pornography-associated circuits significantly while strengthening the natural reward and social bonding circuits.\n\n"
            "Neural Pathway Changes at One Year\n"
            "• Pornography-associated dopamine pathways: substantially weakened\n"
            "• Natural reward pathways: restored and strengthened\n"
            "• Prefrontal cortex: functioning at a high level — strong impulse control and decision-making\n"
            "• Social brain systems: fully recovered and responsive to real human connection\n\n"
            "Life at One Year\n"
            "At one year, the psychological and relational benefits of sustained recovery are profound:\n"
            "• A stable, authentic sense of self and identity\n"
            "• Deep, meaningful relationships built on genuine connection\n"
            "• Pursuits of goals, creativity, and purpose that fill the time and energy once consumed by pornography\n"
            "• A significantly different relationship with technology and digital stimulation generally\n\n"
            "The ongoing Work\n"
            "Relapse risk, while lower than at earlier stages, is never zero. The Rehab Support emphasises that maintaining healthy habits, boundaries, and support structures remains important even at one year.",
      ),
      QuitMilestone(
        day: 1825,
        title: l10n.pornographyMilestone1825Title,
        description: l10n.pornographyMilestone1825Description,
        reference: "Simcoe Addiction & Mental Health - Brain Rewiring Timeline",
        link:
            "https://www.simcoerehab.ca/2024/02/09/how-long-to-rewire-your-brain-from-addiction/",
        referenceDate: "March 2026",
        referenceContent:
            "Five Years Without Pornography: Lasting Life Transformation\n\n"
            "Source: Simcoe Addiction & Mental Health\n\n"
            "Five Years: Beyond Recovery, Into Transformation\n"
            "Simcoe Addiction & Mental Health's research on brain rewiring timelines in addiction recovery documents that for deeply entrenched behavioural addictions, the most complete neurological healing occurs over a 3–5 year timeframe. At five years, the brain has undergone extraordinary transformation.\n\n"
            "What Five Years Represents\n"
            "Five years is not just the absence of pornography use — it is the presence of a fundamentally different life:\n"
            "• A robust, healthy identity that does not include pornography\n"
            "• Relationships built on authentic intimacy and genuine connection\n"
            "• Hobbies, skills, passions, and creative pursuits that fill life with meaning\n"
            "• A different relationship with technology and digital media generally\n\n"
            "Neurological Status at Five Years\n"
            "Research on long-term behavioural addiction recovery shows that at 5 years:\n"
            "• The brain's reward circuits are fully calibrated to natural stimuli\n"
            "• Pornography-associated neural pathways have been substantially dismantled\n"
            "• Prefrontal cortex regulation is strong and habitual\n"
            "• The capacity for genuine human bonding and intimacy is fully operational\n\n"
            "A Note on Variation\n"
            "The timeline to full recovery varies enormously based on the duration and intensity of use, the age at which use began, underlying mental health factors, and the quality of support received. Five years is a landmark, but meaningful transformation occurs at every stage of the journey.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.pornographyPageTitle,
      storageKey: 'pornography',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.pornographyHeaderStarted,
      headerNotStarted: l10n.pornographyHeaderNotStarted,
      subtitleStarted: l10n.pornographySubtitleStarted,
      subtitleNotStarted: l10n.pornographySubtitleNotStarted,
      initialStarted: started,
    );
  }
}
