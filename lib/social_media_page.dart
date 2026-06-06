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
            "What the Evidence Actually Shows\n"
            "This randomized controlled trial — a strong study design — asked people to take a one-week break from Facebook, Instagram, Twitter, and TikTok, and compared them with people who used social media as usual. The break group showed significant improvements in well-being and reductions in depression and anxiety. That is real, controlled evidence that stepping back helps.\n\n"
            "An Honest Framing\n"
            "'Social media addiction' is not a formal diagnosis in the DSM-5, and popular claims about day-by-day 'dopamine receptor recalibration' go beyond the evidence. What is well-supported is simpler: for many people, compulsive use is linked to lower mood and higher anxiety, and deliberately cutting back measurably improves how they feel.\n\n"
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
            "These last few are commonly reported rather than the trial's primary measured outcomes, but they line up with the improvement in well-being it documented.\n\n"
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
            "Two Weeks Without Social Media: What Was Actually Measured\n\n"
            "Source: Coyne & Woodruff, \"Taking a Break: The Effects of Partaking in a Two-Week Social Media Digital Detox… among Young Adults,\" Behavioral Sciences (2023), on PubMed Central\n\n"
            "About This Study\n"
            "Young adults limited social media to about 30 minutes a day for two weeks, with usage tracked objectively on their phones (it fell by roughly 78%). It is an honest fit for this milestone — but it was a small, exploratory study (about 31 people, no control group), so its authors caution against over-weighting the results.\n\n"
            "What Improved\n"
            "Over the two weeks, participants showed improvements in:\n"
            "• Sleep — both duration and quality\n"
            "• Satisfaction with life\n"
            "• Stress\n"
            "• Perceived wellness\n"
            "• Scores on smartphone and social-media addiction scales\n"
            "Notably, anxiety, depression, and self-esteem were not measured here — so this study supports the sleep, stress, and life-satisfaction gains rather than mood-disorder claims.\n\n"
            "Watch for Backsliding\n"
            "The researchers also noticed use creeping back toward baseline afterwards. Two weeks is a real gain, but it highlights why an intentional plan — not just a temporary break — is what keeps the benefits.",
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
            "An Honest Caveat\n"
            "The study behind this was small and exploratory, and it tracked two weeks rather than a month — so treat the one-month picture as a reasonable extension of short-term findings, not a precisely measured result. It also found use can drift back toward old levels, which is exactly why the month mark is a good time to lock in replacement habits.\n\n"
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
            "This meta-analysis pooled 10 studies (7 of them randomized controlled trials) of social media detox. Its honest, headline finding: detox 'significantly reduce[s] depressive symptoms.' That is the outcome with the most consistent support — and a meaningful one to have working in your favour by two months.\n\n"
            "Being Straight About the Rest\n"
            "The same analysis did not find statistically significant effects on life satisfaction, stress, or overall mental well-being, with results varying a lot between studies. So claims that stepping back from social media reliably overhauls 'identity and self-worth' aren't supported by the strongest evidence. The dependable benefit is on low mood.\n\n"
            "What Two Months Can Look Like\n"
            "Many people do report a steadier sense of self and less anxiety about how they appear online — genuine, but individual experiences rather than guaranteed, measured outcomes. With less daily comparison, self-image often leans less on likes and followers.\n\n"
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
            "Three Months Without Social Media: A New Baseline\n\n"
            "Source: Coyne & Woodruff, \"Taking a Break: The Effects of Partaking in a Two-Week Social Media Digital Detox… among Young Adults,\" Behavioral Sciences (2023), on PubMed Central\n\n"
            "Sleep Is the Standout\n"
            "Among this study's clearest findings was improved sleep — both duration and quality — when participants cut social media right back. By three months of a sustained healthier pattern, the late-night scroll that used to eat into sleep has long stopped competing with rest, and better sleep tends to lift mood, focus, and energy with it.\n\n"
            "What Else Improved\n"
            "The same study found gains in stress, life satisfaction, perceived wellness, and supportive relationships. At three months these are no longer novelties — they have had time to settle into a new normal.\n\n"
            "An Honest Note on Mechanism\n"
            "You'll see claims that three months 'resets sleep architecture' or 'melatonin.' That specific neuroscience wasn't measured here. What the study actually shows is more grounded and just as useful: cutting back on social media is followed by people sleeping better and feeling better.\n\n"
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
            "Six Months Without Social Media: An Honest Look at the Evidence\n\n"
            "Source: Ramadhan et al., \"Impacts of digital social media detox for mental health: A systematic review and meta-analysis,\" Narra J (2024), on PubMed Central\n\n"
            "What Meta-Analysis Adds\n"
            "Pooling 10 studies (7 randomized controlled trials), this is among the most reliable evidence available — and it paints a 'nuanced and selective' picture rather than a sweeping one.\n\n"
            "What It Actually Found\n"
            "• Depression: a statistically significant reduction (the clearest, most consistent benefit)\n"
            "• Life satisfaction: no significant effect\n"
            "• Stress: no significant effect\n"
            "• Overall mental well-being: no significant effect\n"
            "Results for the last three varied widely between studies, so the honest summary is: detox helps depressive symptoms, while its effect on other measures is uncertain.\n\n"
            "Why You May Still Feel Broad Benefits\n"
            "Group averages can hide real individual gains. Plenty of people experience better sleep, focus, and presence — the meta-analysis simply can't confirm those as reliable across-the-board effects, and the authors note short study durations and quality limits may have masked some benefits.\n\n"
            "The Balanced Goal\n"
            "Social media isn't uniformly harmful; the problems concentrate in heavy, passive, compulsive use. By six months, the aim is an intentional, sustainable relationship with it — not necessarily permanent abstinence.",
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
            "Where the Evidence Reaches\n"
            "It's worth being upfront: the controlled research on social media breaks covers days to a few weeks, not a year. So a one-year claim is an extension of that evidence, not a directly measured result. The most reliable finding from the pooled trials is that stepping back from social media significantly reduces depressive symptoms — a benefit that, sustained over a year, is well worth having.\n\n"
            "What a Year Builds\n"
            "Beyond the measured outcomes, a full year lets new patterns become who you are: more time and attention for real relationships, hobbies and skills filling hours the feed once took, and mental space for reflection and creativity. These are the changes people consistently describe, even where group-level studies can't pin them down.\n\n"
            "An Honest, Balanced View\n"
            "The same meta-analysis found effects on life satisfaction, stress, and overall well-being were not statistically reliable across studies — a reminder that outcomes vary by person and that social media isn't uniformly harmful. The harm concentrates in heavy, passive, compulsive use.\n\n"
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
