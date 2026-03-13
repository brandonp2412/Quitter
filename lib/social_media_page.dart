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
        reference: "Cleveland Clinic - Social Media Addiction",
        link:
            "https://health.clevelandclinic.org/is-it-possible-to-become-addicted-to-social-media",
        referenceDate: "March 2026",
        referenceContent:
            "Is Social Media Addictive? What Happens When You Stop\n\n"
            "Source: Cleveland Clinic\n\n"
            "Can You Be Addicted to Social Media?\n"
            "The Cleveland Clinic documents that social media can produce dependency-like patterns in the brain that mirror features of substance addiction. While not formally classified as an addiction in the DSM-5, compulsive social media use activates the same dopamine reward circuits involved in gambling and drug use.\n\n"
            "The Dopamine Loop\n"
            "Every notification, like, comment, or new post triggers a small dopamine release. This unpredictable reward pattern — sometimes called a 'variable ratio reinforcement schedule' — is the same mechanism that makes slot machines so compelling. The unpredictability is what drives the compulsive checking behaviour.\n\n"
            "Signs of Problematic Use\n"
            "• Spending more time than intended on social media\n"
            "• Feeling anxious or irritable when unable to check\n"
            "• Using social media to escape negative feelings\n"
            "• Neglecting real-world relationships and responsibilities\n"
            "• Repeatedly trying to cut back and failing\n\n"
            "Day One: What to Expect\n"
            "The first day without social media typically involves:\n"
            "• Restlessness and an urge to check\n"
            "• Phantom notifications (feeling like your phone buzzed when it didn't)\n"
            "• Boredom as the brain adjusts to lower stimulation\n"
            "• The beginning of dopamine receptor recalibration\n\n"
            "The Cleveland Clinic emphasises that recognising the pattern is the first step. The discomfort of day one is real — but it is also temporary, and it is the brain beginning to reset.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.socialMediaMilestone3Title,
        description: l10n.socialMediaMilestone3Description,
        reference: "Cleveland Clinic - Social Media Effects on Youth",
        link:
            "https://health.clevelandclinic.org/dangers-of-social-media-for-youth",
        referenceDate: "March 2026",
        referenceContent:
            "Three Days Without Social Media: Anxiety and Mood\n\n"
            "Source: Cleveland Clinic\n\n"
            "Social Media and Mental Health\n"
            "The Cleveland Clinic documents the extensive research linking heavy social media use to anxiety, depression, and poor self-image — particularly through the mechanisms of social comparison and the curated highlight-reel nature of online profiles.\n\n"
            "How Social Media Harms Mental Health\n"
            "• Constant exposure to others' curated best moments fuels feelings of inadequacy\n"
            "• Cyberbullying and social exclusion are uniquely persistent and public online\n"
            "• Social comparison with filtered, idealised images drives body image distress\n"
            "• The fear of missing out (FOMO) creates persistent low-grade anxiety\n"
            "• Displacement of sleep and face-to-face social time disrupts wellbeing\n\n"
            "What Happens at 72 Hours\n"
            "At three days, the acute phase of social media withdrawal is peaking for many people:\n"
            "• Strong urges to check — often triggered by habitual situations (waking up, waiting, etc.)\n"
            "• Possible irritability and restlessness\n"
            "• Some people notice their anxiety is already beginning to reduce\n"
            "• Sleep quality often begins improving as the pre-sleep scroll habit breaks\n\n"
            "The Comparison Trap Begins to Dissolve\n"
            "Without a daily feed of others' highlight reels, the constant social comparison that fuels anxiety begins to reduce. Three days in, some people already notice they are feeling more comfortable in their own life.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.socialMediaMilestone7Title,
        description: l10n.socialMediaMilestone7Description,
        reference: "WebMD - Digital Detox Benefits",
        link: "https://www.webmd.com/balance/what-is-digital-detox",
        referenceDate: "March 2026",
        referenceContent:
            "One Week Without Social Media: Sleep and Focus Return\n\n"
            "Source: WebMD\n\n"
            "What Is a Digital Detox?\n"
            "WebMD describes a digital detox as a deliberate period of abstinence from digital devices and platforms — particularly social media — to allow the mind to recover from the constant stimulation, comparison, and notification-checking that characterises heavy use.\n\n"
            "Benefits at One Week\n"
            "WebMD documents that many people notice meaningful improvements within the first week of a digital detox:\n"
            "• Better sleep: the absence of late-night scrolling removes both the blue light disruption and the mental stimulation that delays sleep\n"
            "• Improved focus: the habit of switching attention every few minutes begins reversing; sustained concentration improves\n"
            "• Reduced anxiety: the constant background hum of social comparison and FOMO begins to quiet\n"
            "• More time: people are frequently surprised how much time they had been spending on social media\n\n"
            "Attention Span Recovery\n"
            "Heavy social media use trains the brain to expect constant novelty and short content bursts. One week without begins reversing this — the capacity for sustained attention on longer, deeper tasks starts recovering. Reading, conversations, and work all benefit.\n\n"
            "Physical Benefits\n"
            "WebMD notes that reduced screen time is associated with:\n"
            "• Less eye strain and headache\n"
            "• More physical activity (time previously spent scrolling redirected)\n"
            "• Better posture (less hunching over screens)",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.socialMediaMilestone14Title,
        description: l10n.socialMediaMilestone14Description,
        reference: "PMC - Two-Week Social Media Detox Study",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10740995/",
        referenceDate: "March 2026",
        referenceContent:
            "Two Weeks Without Social Media: Wellbeing Measurably Improves\n\n"
            "Source: PMC — Peer-reviewed study on social media detox and wellbeing\n\n"
            "About This Research\n"
            "This peer-reviewed study published on PubMed Central examined the effects of a social media detox on psychological wellbeing. The study measured outcomes including anxiety, depression, self-esteem, and life satisfaction before and after a structured period of social media abstinence.\n\n"
            "Key Findings at Two Weeks\n"
            "The research found statistically significant improvements across multiple wellbeing measures after two weeks of reduced or eliminated social media use:\n"
            "• Anxiety scores decreased meaningfully\n"
            "• Depression symptoms reduced\n"
            "• Self-esteem improved\n"
            "• Life satisfaction increased\n"
            "• Participants reported feeling more present in their daily lives\n\n"
            "Why Two Weeks Matters\n"
            "Two weeks is enough time for the habitual dopamine-seeking loop to substantially weaken. The automatic urge to check — which drives so much of social media use — is becoming less automatic. The brain is recalibrating its baseline stimulation needs downward.\n\n"
            "Real-World Connection\n"
            "At two weeks, many people notice they are more present in face-to-face interactions. The mental bandwidth previously consumed by social media is available for real conversations, creative work, and activities that produce genuine satisfaction rather than the shallow reward of a scroll.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.socialMediaMilestone30Title,
        description: l10n.socialMediaMilestone30Description,
        reference: "HelpGuide.org - Social Media and Mental Health",
        link:
            "https://www.helpguide.org/mental-health/wellbeing/social-media-and-mental-health",
        referenceDate: "March 2026",
        referenceContent:
            "One Month Without Social Media: Real Connection Deepens\n\n"
            "Source: HelpGuide.org\n\n"
            "Social Media's Effect on Relationships\n"
            "HelpGuide documents the paradox at the heart of social media: designed to connect people, it often produces loneliness. The curated, performative nature of online interaction is a poor substitute for the authentic, reciprocal connection of real relationships. Heavy social media use frequently crowds out the deeper connection it promises.\n\n"
            "What the Research Shows\n"
            "• Time on social media is associated with increased loneliness, not reduced loneliness\n"
            "• Passive scrolling (viewing others' content without engaging) is particularly harmful\n"
            "• Social media triggers social comparison that damages self-worth\n"
            "• Face-to-face social interaction produces meaningfully better wellbeing outcomes\n\n"
            "One Month: The Depth of Connection Shifts\n"
            "At 30 days, with the habitual pull of social media substantially weakened:\n"
            "• Conversations with real people are longer, more present, and more meaningful\n"
            "• Interest in real-world activities and hobbies has increased\n"
            "• The sense of connection from real relationships feels more genuine and nourishing\n"
            "• Self-image is less dependent on external validation (likes, comments, followers)\n\n"
            "HelpGuide's Guidance\n"
            "HelpGuide recommends using freed time for activities that produce real social connection and personal fulfilment — rather than simply replacing social media with other screen time. The month-one position is ideal for establishing these habits before the novelty of quitting fades.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.socialMediaMilestone60Title,
        description: l10n.socialMediaMilestone60Description,
        reference: "McLean Hospital - How Social Media Affects Mental Health",
        link: "https://www.mcleanhospital.org/essential/social-media",
        referenceDate: "March 2026",
        referenceContent:
            "Two Months Without Social Media: Identity and Self-Worth\n\n"
            "Source: McLean Hospital (Harvard Medical School affiliate)\n\n"
            "McLean Hospital on Social Media\n"
            "McLean Hospital — a leading psychiatric hospital affiliated with Harvard Medical School — documents the substantial body of research linking social media use to identity disturbance, poor self-image, and mental health difficulties, particularly in young people.\n\n"
            "Social Media and Identity\n"
            "Social media encourages users to construct and maintain a public identity — an online persona shaped by what generates engagement. This performative self-presentation can:\n"
            "• Disconnect people from their authentic values and interests\n"
            "• Create anxiety about maintaining an image\n"
            "• Make self-worth dependent on external metrics (likes, followers, views)\n"
            "• Drive comparison with others' constructed identities\n\n"
            "Two Months: Who Are You Without It?\n"
            "At 60 days, something significant has happened: the identity that was partly constructed around social media has begun dissolving, and a more authentic sense of self is emerging. People at this stage often report:\n"
            "• Clearer sense of their actual values and interests (not what they performed online)\n"
            "• Self-esteem that is more stable and internally grounded\n"
            "• Less anxiety about how they appear to others\n"
            "• Greater comfort with quiet moments and solitude\n\n"
            "McLean Hospital emphasises that protecting mental health in the digital age requires active, deliberate choices about technology use — not passive consumption driven by platform design.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.socialMediaMilestone90Title,
        description: l10n.socialMediaMilestone90Description,
        reference: "Cleveland Clinic - 4 Reasons to Do a Digital Detox",
        link: "https://health.clevelandclinic.org/digital-detox",
        referenceDate: "March 2026",
        referenceContent:
            "Three Months Without Social Media: A New Baseline\n\n"
            "Source: Cleveland Clinic\n\n"
            "Why Do a Digital Detox?\n"
            "The Cleveland Clinic identifies four core reasons to step back from social media: to reduce stress and anxiety, to improve sleep, to be more present in real life, and to improve real-world relationships. At three months, all four of these benefits are well established.\n\n"
            "Stress and Anxiety\n"
            "The Cleveland Clinic documents that social media is a significant source of stress for many users — through negative news, conflict, comparison, and the pressure to engage. At three months without, chronic low-grade social media anxiety has resolved. The baseline level of ambient stress is meaningfully lower.\n\n"
            "Sleep\n"
            "Three months of no pre-sleep scrolling has reset sleep architecture. Melatonin production is no longer being suppressed by late-night blue light and mental stimulation. Sleep quality at 90 days is substantially better than when social media use was at its peak.\n\n"
            "Presence in Real Life\n"
            "The habit of reaching for a phone to fill any moment of stillness has weakened substantially. Being present — in conversations, in meals, in moments of quiet — is no longer in constant competition with the pull of the feed.\n\n"
            "Relationships\n"
            "Real relationships have deepened as the time and attention that social media consumed has been redirected. Three months of genuine presence with real people produces meaningfully stronger connections than anything social media offered.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.socialMediaMilestone180Title,
        description: l10n.socialMediaMilestone180Description,
        reference: "PMC - Digital Social Media Detox Meta-Analysis",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC11392003/",
        referenceDate: "March 2026",
        referenceContent:
            "Six Months Without Social Media: What the Research Shows\n\n"
            "Source: PMC — Peer-reviewed meta-analysis of social media detox studies\n\n"
            "About This Research\n"
            "This meta-analysis published on PubMed Central synthesised findings across multiple studies examining the effects of social media detox interventions on mental health outcomes. Meta-analyses pool data across studies to identify the most reliable effects.\n\n"
            "Overall Findings\n"
            "The meta-analysis found consistent, statistically significant benefits from social media detox across studies:\n"
            "• Reduced anxiety and depression symptoms\n"
            "• Improved life satisfaction\n"
            "• Better sleep quality\n"
            "• Improved self-esteem\n"
            "• Greater sense of autonomy and control over technology use\n\n"
            "What Improves Over Longer Durations\n"
            "The meta-analysis found that longer-duration detox interventions produced stronger benefits. At six months, all the short-term improvements are deeply consolidated:\n"
            "• A new normal has been established without social media as a coping mechanism\n"
            "• Alternative sources of social connection, entertainment, and fulfilment are well-established\n"
            "• The pull of social media has substantially weakened as the habit dissolves\n\n"
            "An Important Note\n"
            "The research also highlights that social media isn't uniformly harmful — the harms are concentrated in heavy, passive, compulsive use. The goal of a six-month detox is not permanent abstinence but developing a healthy, intentional relationship with technology rather than a compulsive one.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.socialMediaMilestone365Title,
        description: l10n.socialMediaMilestone365Description,
        reference: "Mayo Clinic Press - Social Media on Mental Health",
        link:
            "https://mcpress.mayoclinic.org/mental-health/the-pros-and-cons-of-social-media-on-mental-health/",
        referenceDate: "March 2026",
        referenceContent:
            "One Year Without Social Media: Long-Term Mental Health\n\n"
            "Source: Mayo Clinic Press\n\n"
            "Mayo Clinic's Assessment\n"
            "Mayo Clinic Press provides a balanced assessment of social media's effects on mental health, documenting both the genuine harms of heavy use and the potential benefits of intentional connection. One year without social media represents a complete renegotiation of the relationship with technology.\n\n"
            "Documented Harms That Have Now Resolved\n"
            "The harms Mayo Clinic documents from heavy social media use — that have now had a full year to resolve:\n"
            "• Anxiety fuelled by social comparison: gone\n"
            "• Sleep disruption from late-night use: resolved\n"
            "• Depression linked to passive scrolling: substantially improved\n"
            "• Self-esteem dependent on social media validation: replaced with internal self-worth\n"
            "• Attention fragmentation from constant notifications: largely reversed\n\n"
            "One Year: A Different Life\n"
            "At one year, the life that has been built without social media is qualitatively different:\n"
            "• Deeper, more authentic relationships built on real presence\n"
            "• Hobbies, skills, and interests that fill the hours social media once consumed\n"
            "• Mental space for genuine reflection, creativity, and meaning-making\n"
            "• A fundamentally different relationship with technology — intentional rather than compulsive\n\n"
            "Mayo Clinic's Conclusion\n"
            "Mayo Clinic emphasises that the key is not technology itself but the relationship with it. One year of deliberate abstinence has reset that relationship. Whatever comes next — whether returning to limited social media use or continuing without — the compulsive loop has been broken.",
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
