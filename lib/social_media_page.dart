import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class SocialMediaPage extends StatelessWidget {
  final bool started;

  const SocialMediaPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.socialMediaMilestone1Title,
        description: l10n.socialMediaMilestone1Description,
        reference:
            "Taking a One-Week Break From Social Media Improves Well-Being: An RCT (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/35512731/",
        referenceDate: "June 2026",
        referenceContent:
            "Stepping Back From Social Media: Day One\n\n"
            "Source: Lambert et al., \"Taking a One-Week Break from Social Media Improves Well-Being, Depression, and Anxiety: A Randomized Controlled Trial,\" Cyberpsychology, Behavior, and Social Networking (2022), on PubMed\n\n"
            "What the Evidence Shows\n"
            "In this strong controlled study, people were randomly assigned either to take a one-week break from Facebook, Instagram, Twitter, and TikTok or to keep using them as usual. The break group showed significant improvements in well-being and reductions in depression and anxiety. That is real, controlled evidence that stepping back helps.\n\n"
            "What the Evidence Shows\n"
            "Compulsive social-media use is strongly linked to lower mood and higher anxiety, and randomized trials show that deliberately cutting back can improve well-being while reducing depression and anxiety within a week.\n\n"
            "Day One: What to Expect\n"
            "• Restlessness and an urge to check\n"
            "• 'Phantom' notifications — feeling a buzz that didn't happen\n"
            "• Boredom as you adjust to less constant stimulation\n"
            "These are normal habit-related sensations, and they are temporary. Recognising the pattern is the first step in changing it.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.socialMediaMilestone3Title,
        description: l10n.socialMediaMilestone3Description,
        reference:
            "Taking a One-Week Break From Social Media Improves Well-Being: An RCT (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/35512731/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Days Without Social Media: Anxiety and Mood\n\n"
            "Source: Lambert et al., \"Taking a One-Week Break from Social Media Improves Well-Being, Depression, and Anxiety: A Randomized Controlled Trial,\" Cyberpsychology, Behavior, and Social Networking (2022), on PubMed\n\n"
            "Why a Break Helps Mood\n"
            "In this controlled trial, people randomly assigned to a one-week break from social media ended the week with lower anxiety and depression and higher well-being than those who kept scrolling. Much of the day-to-day distress of heavy use comes from social comparison — measuring your real life against others' curated highlight reels — and from the low-grade pull of fear-of-missing-out.\n\n"
            "What Happens Around 72 Hours\n"
            "Early in a break, the habit is still loud:\n"
            "• Strong urges to check, often triggered by routine moments (waking, waiting in line)\n"
            "• Some irritability and restlessness\n"
            "• For some people, the first easing of comparison-driven anxiety\n"
            "• The pre-sleep scroll habit starting to loosen\n\n"
            "The Comparison Trap Loosens\n"
            "Without a constant feed of other people's highlights, the comparison that fuels much social-media anxiety has less fuel. The trial's results suggest that by the end of the first week these early shifts add up to a measurable improvement in mood — so the discomfort at three days is the hard part of a change that pays off.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.socialMediaMilestone7Title,
        description: l10n.socialMediaMilestone7Description,
        reference:
            "Taking a One-Week Break From Social Media Improves Well-Being: An RCT (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/35512731/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Without Social Media: The Measured Payoff\n\n"
            "Source: Lambert et al., \"Taking a One-Week Break from Social Media Improves Well-Being, Depression, and Anxiety: A Randomized Controlled Trial,\" Cyberpsychology, Behavior, and Social Networking (2022), on PubMed\n\n"
            "Exactly One Week — and It Worked\n"
            "This is the milestone the research speaks to most directly: the trial's intervention was a one-week break. Compared with people who kept using social media, the break group showed significantly higher well-being and significantly lower depression and anxiety after just seven days. Reaching one week is reaching the point at which a controlled study found real benefit.\n\n"
            "What People Commonly Notice\n"
            "Alongside the measured mood gains, people often report:\n"
            "• More reclaimed time — many are surprised how much they had been spending\n"
            "• Easier focus, as the habit of constant attention-switching loosens\n"
            "• Calmer evenings and easier sleep without the pre-bed scroll\n"
            "These gains fit the broader improvement in well-being measured in the trial.\n\n"
            "Keep Going\n"
            "One week is a genuine, evidence-backed milestone. The mood, time, and attention benefits tend to deepen the longer the healthier pattern holds.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.socialMediaMilestone14Title,
        description: l10n.socialMediaMilestone14Description,
        reference:
            "Effects of a Two-Week Social Media Detox on Health-Related Outcomes (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10740995/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Without Social Media: Two-Week Gains\n\n"
            "Source: Coyne & Woodruff, \"Taking a Break: The Effects of Partaking in a Two-Week Social Media Digital Detox… among Young Adults,\" Behavioral Sciences (2023), on PubMed Central\n\n"
            "About This Study\n"
            "Young adults limited social media to about 30 minutes a day for two weeks, with usage tracked objectively on their phones (it fell by roughly 78%). Participants cut social-media use by roughly 78%, giving this milestone a direct real-world test of what happens when use is sharply reduced for two weeks.\n\n"
            "What Improved\n"
            "Over the two weeks, participants showed improvements in:\n"
            "• Sleep — both duration and quality\n"
            "• Satisfaction with life\n"
            "• Stress\n"
            "• Perceived wellness\n"
            "• Scores on smartphone and social-media addiction scales\n"
            "The measured gains were concrete: longer and better sleep, lower stress, higher life satisfaction and perceived wellness, and lower smartphone/social-media addiction scores.\n\n"
            "Watch for Backsliding\n"
            "The researchers also noticed use creeping back toward previous levels afterwards. Two weeks is a real gain, but it highlights why an intentional plan — not just a temporary break — is what keeps the benefits.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.socialMediaMilestone30Title,
        description: l10n.socialMediaMilestone30Description,
        reference:
            "Effects of a Two-Week Social Media Detox on Health-Related Outcomes (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10740995/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Without Social Media: Real Connection Deepens\n\n"
            "Source: Coyne & Woodruff, \"Taking a Break: The Effects of Partaking in a Two-Week Social Media Digital Detox… among Young Adults,\" Behavioral Sciences (2023), on PubMed Central\n\n"
            "Connection Can Improve When You Step Back\n"
            "It sounds paradoxical — but in this study, cutting social media right back was associated with improvement in supportive relationships, along with better life satisfaction and lower stress. Time and attention that went to the feed became available for the people actually in your life.\n\n"
            "What One Month Tends to Bring\n"
            "By 30 days, with the automatic pull of checking much weaker, many people find:\n"
            "• Conversations are more present and less interrupted\n"
            "• More interest in real-world activities and hobbies\n"
            "• Self-image leaning less on likes, comments, and follower counts\n\n"
            "Recovery Signal\n"
            "By one month, you have sustained the healthier pattern for twice the study's intervention window. The sleep, stress, life-satisfaction, wellness, and relationship gains measured at two weeks have had another two weeks to consolidate into routine.\n\n"
            "Make the Time Count\n"
            "Aim to fill freed time with activities that build genuine connection and fulfilment, rather than simply swapping one screen for another.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.socialMediaMilestone60Title,
        description: l10n.socialMediaMilestone60Description,
        reference:
            "Impacts of Digital Social Media Detox for Mental Health: A Systematic Review and Meta-Analysis (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC11392003/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Months Without Social Media: What the Evidence Supports\n\n"
            "Source: Ramadhan et al., \"Impacts of digital social media detox for mental health: A systematic review and meta-analysis,\" Narra J (2024), on PubMed Central\n\n"
            "The Most Reliable Picture\n"
            "Researchers combined results from 10 studies, including seven controlled trials. The clearest result was a meaningful reduction in depressive symptoms after people stepped back from social media.\n\n"
            "The Strongest Result\n"
            "The combined research found a clear reduction in depressive symptoms. By two months, you are sustaining the same kind of lower digital exposure that produced that mental-health benefit.\n\n"
            "What Two Months Can Look Like\n"
            "With less daily comparison and less feed-driven reinforcement, self-image has far less reason to depend on likes, comments, or follower counts, while the strongest pooled evidence points to lower depressive symptoms.\n\n"
            "The Practical Takeaway\n"
            "The evidence rewards intentional, sustained change. Use the two-month point to keep deliberate limits in place rather than drifting back, and to invest in offline sources of meaning and connection.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.socialMediaMilestone90Title,
        description: l10n.socialMediaMilestone90Description,
        reference:
            "Effects of a Two-Week Social Media Detox on Health-Related Outcomes (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10740995/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Without Social Media: A New Normal\n\n"
            "Source: Coyne & Woodruff, \"Taking a Break: The Effects of Partaking in a Two-Week Social Media Digital Detox… among Young Adults,\" Behavioral Sciences (2023), on PubMed Central\n\n"
            "Sleep Is the Standout\n"
            "Among this study's clearest findings was improved sleep — both duration and quality — when participants cut social media right back. By three months of a sustained healthier pattern, the late-night scroll that used to eat into sleep has long stopped competing with rest, and better sleep tends to lift mood, focus, and energy with it.\n\n"
            "What Else Improved\n"
            "The same study found gains in stress, life satisfaction, perceived wellness, and supportive relationships. At three months these are no longer novelties — they have had time to settle into a new normal.\n\n"
            "Recovery Signal on Mechanism\n"
            "Cutting social media sharply improved both sleep duration and sleep quality in the intervention study. Three months of sustaining that pattern turns the late-night-scroll reduction into a durable sleep habit.\n\n"
            "Presence and Relationships\n"
            "With the reflex to fill every quiet moment with the phone much weaker, being present — in conversations, meals, and downtime — comes more naturally, and the relationships you have invested in over three months tend to feel stronger for it.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.socialMediaMilestone180Title,
        description: l10n.socialMediaMilestone180Description,
        reference:
            "Impacts of Digital Social Media Detox for Mental Health: A Systematic Review and Meta-Analysis (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC11392003/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Without Social Media: Measured Recovery\n\n"
            "Source: Ramadhan et al., \"Impacts of digital social media detox for mental health: A systematic review and meta-analysis,\" Narra J (2024), on PubMed Central\n\n"
            "What Meta-Analysis Adds\n"
            "Combining 10 studies, including seven controlled trials, researchers found a clear reduction in depressive symptoms after people reduced or paused social media.\n\n"
            "What It Actually Found\n"
            "• Depression: a statistically significant reduction (the clearest, most consistent benefit)\n"
            "• Life satisfaction: no significant effect\n"
            "• Stress: no significant effect\n"
            "• Overall mental well-being: no significant effect\n"
            "The strongest pooled result is clear: digital detox significantly reduces depressive symptoms.\n\n"
            "Why You May Still Feel Broad Benefits\n"
            "Six months of reduced feed exposure compounds the practical gains seen in shorter interventions: more available time, less compulsive checking, and a sustained reduction in the digital exposure associated with depressive symptoms.\n\n"
            "Keep Control of the Feed\n"
            "The biggest gains come from breaking heavy, passive, compulsive use. By six months, intentional control over social media is the new default rather than the feed controlling your attention.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.socialMediaMilestone365Title,
        description: l10n.socialMediaMilestone365Description,
        reference:
            "Impacts of Digital Social Media Detox for Mental Health: A Systematic Review and Meta-Analysis (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC11392003/",
        referenceDate: "June 2026",
        referenceContent:
            "One Year Without Social Media: A Renegotiated Relationship\n\n"
            "Source: Ramadhan et al., \"Impacts of digital social media detox for mental health: A systematic review and meta-analysis,\" Narra J (2024), on PubMed Central\n\n"
            "One Year of Sustained Change\n"
            "The strongest combined research shows that stepping back from social media reduces depressive symptoms. A full year means that lower-exposure pattern has become your normal rather than a short break.\n\n"
            "What a Year Builds\n"
            "A full year gives you hundreds of hours back for real relationships, hobbies, skills, reflection, and creativity. Automatic checking has had a full year to weaken while those offline routines have had a full year to strengthen.\n\n"
            "Sustained Benefits\n"
            "The clearest measured mental-health gain is lower depressive symptoms. The practical gains — more time, fewer interruptions, and less compulsive checking — compound every day you keep control of the feed.\n\n"
            "What Comes Next\n"
            "A year of deliberate change has reset the relationship. Whether you return to limited, intentional use or stay off entirely, the compulsive loop has been broken — and that is the durable win.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.socialMediaPageTitle,
      storageKey: 'social_media',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.socialMediaHeaderStarted,
      headerNotStarted: l10n.socialMediaHeaderNotStarted,
      subtitleStarted: l10n.socialMediaSubtitleStarted,
      subtitleNotStarted: l10n.socialMediaSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
