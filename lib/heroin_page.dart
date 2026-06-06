import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class HeroinPage extends StatelessWidget {
  final bool started;
  const HeroinPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.heroinMilestone1Title,
        description: l10n.heroinMilestone1Description,
        reference:
            "WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
        referenceDate: "June 2026",
        referenceContent:
            "Heroin Withdrawal: Day One\n\n"
            "Source: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\n"
            "Important Safety Note\n"
            "The WHO guidelines advise supportive care during opioid withdrawal — including drinking at least 2–3 litres of water per day to replace fluids lost through perspiration and diarrhoea, and monitoring 3–4 times daily. Relapse after a period of abstinence is especially dangerous because tolerance falls quickly, so a previously normal dose can cause fatal overdose. Medical supervision is strongly recommended.\n\n"
            "When Withdrawal Begins\n"
            "Heroin is a short-acting opioid. The WHO withdrawal timetable puts onset of opioid withdrawal at 8–24 hours after the last use, with a duration of 4–10 days.\n\n"
            "Day One Symptoms\n"
            "The WHO guidelines list the features that emerge, tracked with the Short Opioid Withdrawal Scale (SOWS):\n"
            "• Anxiety, restlessness, and agitation\n"
            "• Muscle cramps and aches\n"
            "• Yawning, watery discharge from eyes and nose\n"
            "• Perspiration, hot and cold flushes ('cold turkey')\n"
            "• Insomnia despite exhaustion\n"
            "• Developing nausea, with GI upset\n\n"
            "Why It Feels So Bad\n"
            "The opioid system regulates pain, reward, and basic comfort. Chronic use suppresses the body's own endorphin system, so when the drug is removed the nervous system is left over-excited — producing pain and distress until it re-regulates. This is temporary; the system recovers.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.heroinMilestone3Title,
        description: l10n.heroinMilestone3Description,
        reference:
            "WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
        referenceDate: "June 2026",
        referenceContent:
            "Heroin Detox: Day Three — Peak Withdrawal\n\n"
            "Source: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\n"
            "Peak Intensity\n"
            "For short-acting opioids like heroin, withdrawal builds over the first days after the 8–24 hour onset. By around days 2–3 the syndrome — scored with the Short Opioid Withdrawal Scale — is typically at its most intense.\n\n"
            "Peak Symptoms at Day Three\n"
            "The features the WHO guidelines list reflect what peaks now:\n"
            "• Severe muscle cramps and aches, restless legs ('kicking the habit')\n"
            "• Nausea, vomiting, and diarrhoea — the main cause of dangerous dehydration\n"
            "• Profuse perspiration, hot and cold flushes\n"
            "• Near-total insomnia\n"
            "• Marked anxiety and agitation\n"
            "• Intense cravings\n\n"
            "Medical Management\n"
            "The WHO guidelines call for supportive care with monitoring 3–4 times daily, drinking 2–3 litres of water per day, and vitamin B and C supplementation. Symptomatic medications are used for specific complaints, and opioid agonist treatment such as methadone or buprenorphine substantially reduces withdrawal severity.\n\n"
            "It Gets Better\n"
            "Day three is the worst day for most people. Knowing the acute syndrome resolves over roughly 4–10 days makes it easier to get through.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.heroinMilestone7Title,
        description: l10n.heroinMilestone7Description,
        reference:
            "WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Off Heroin: Acute Symptoms Subside\n\n"
            "Source: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\n"
            "End of Acute Withdrawal\n"
            "The WHO withdrawal timetable puts the duration of short-acting opioid withdrawal at roughly 4–10 days. By the end of the first week, the acute physical syndrome is largely over — vomiting, diarrhoea, and the worst muscle cramps have typically resolved, and the body is out of acute physiological crisis.\n\n"
            "What Remains at Day 7\n"
            "Even as the acute syndrome resolves, the harder-to-measure symptoms persist:\n"
            "• Fatigue and depletion\n"
            "• Insomnia — sleep takes longer to normalise\n"
            "• Depressed mood and emotional flatness\n"
            "• Persistent cravings\n"
            "• Anxiety and restlessness\n\n"
            "The High-Risk Window\n"
            "This is a dangerous point for relapse, and it is especially hazardous because tolerance falls quickly during abstinence — returning to a previous dose can cause fatal overdose. Continued support matters most here.\n\n"
            "Nutrition and Physical Recovery\n"
            "Appetite typically returns by day seven. The WHO supportive-care guidance — generous fluids, vitamin B and C, and rest — applies: nutritious food, hydration, and light movement help the body recover from the depletion of acute withdrawal.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.heroinMilestone30Title,
        description: l10n.heroinMilestone30Description,
        reference:
            "WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Off Heroin: Past Acute Withdrawal\n\n"
            "Source: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\n"
            "Where One Month Sits\n"
            "The WHO timetable puts acute short-acting opioid withdrawal at about 4–10 days. At one month that acute syndrome — the autonomic storm of perspiration, GI upset, aches, and flushing — is well behind you, and the body is no longer in physiological crisis.\n\n"
            "Physical Recovery Underway\n"
            "With the acute disturbance resolved and appetite and hydration restored (the WHO guidelines emphasise fluids, vitamins, and nutrition in withdrawal), the body steadily rebuilds:\n"
            "• Weight and nutrition recovering toward healthy levels\n"
            "• Heart rate and blood pressure settled\n"
            "• Sleep gradually normalising\n"
            "• Skin and general condition improving\n\n"
            "The Protracted Phase\n"
            "Not everything resolves with the acute syndrome. Lingering low mood, anhedonia, disturbed sleep, and episodic cravings — often called post-acute withdrawal — are commonly reported for weeks to months. At one month these are usually milder than in early withdrawal, and the reward system is recovering so that ordinary pleasures become more accessible.\n\n"
            "Why Support Still Matters\n"
            "Because relapse during this stage carries a heightened overdose risk from reduced tolerance, ongoing treatment and support remain important well past the acute phase.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.heroinMilestone90Title,
        description: l10n.heroinMilestone90Description,
        reference:
            "Immune Function During 12 Weeks of Heroin Abstinence (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/26789146/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Off Heroin: The Immune System Is Changing\n\n"
            "Source: \"Immune Function Alterations during 12 Weeks of Abstinence in Heroin Users,\" Folia Biologica (2015), on PubMed\n\n"
            "Heroin and the Immune System\n"
            "Opioids suppress and dysregulate immune function. This peer-reviewed study tracked immune markers (IL-2, IFN-γ, and immunoglobulins IgA, IgG, IgM) at five time points across 12 weeks of abstinence in 65 men.\n\n"
            "What Changed by Day 84\n"
            "• IL-2 rose by the 12-week point\n"
            "• IFN-γ was elevated early (days 0–28) and then declined by day 84\n"
            "• IgG and IgM remained higher than in non-users throughout, correlating with route of use, duration of dependence, and daily intake\n\n"
            "An Honest Finding\n"
            "Importantly, the authors concluded the immune system was NOT yet normalised — their data showed it \"was not restored during the 12 weeks of heroin withdrawal.\" In other words, at three months the immune system is actively shifting and beginning to recover, but it has not fully returned to a non-user's baseline. Recovery of immune function continues beyond this point.\n\n"
            "The Wider Picture\n"
            "Three months nonetheless brings broad gains elsewhere — nutrition, weight, sleep, and general physical condition are meaningfully better than at one month, even as deeper systems like immunity keep healing.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.heroinMilestone180Title,
        description: l10n.heroinMilestone180Description,
        reference:
            "Neuroimaging & Neuropsychology in Opioid Use Disorder Abstinence (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5382168/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Off Heroin: Cognitive Improvements\n\n"
            "Source: \"Resting-State Neuroimaging and Neuropsychological Findings in Opioid Use Disorder during Abstinence: A Review,\" on PubMed Central\n\n"
            "What Opioid Use Disorder Does to the Brain\n"
            "This review documents that opioid use disorder disrupts reward-system connectivity, dysregulates circuits tied to emotion and stress, and is associated with high impulsivity and altered brain oscillations.\n\n"
            "Recovery With Prolonged Abstinence\n"
            "Crucially, the review reports that some signs of cognitive recovery appear in people with OUD after prolonged abstinence. By the six-month range, abstinence is associated with improvements in cognitive control and a settling of the brain-activity patterns disrupted by chronic opioid use — supporting better memory, attention, and decision-making.\n\n"
            "The Role of Treatment\n"
            "The review adds an important nuance: these cognitive recovery signs were seen with prolonged abstinence, and the picture differs under methadone maintenance — methadone helped normalise certain brain oscillations over roughly six months, but cognitive recovery patterns were not identical to those of medication-free abstinence.\n\n"
            "An Honest Caveat\n"
            "The authors stress the field's limits — small, mostly male samples and some inconsistent findings. The overall direction at six months is genuine recovery, even if the exact pace and completeness vary between individuals.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.heroinMilestone365Title,
        description: l10n.heroinMilestone365Description,
        reference:
            "Brain Recovery of Frontostriatal Circuits After Heroin Abstinence (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/35785575/",
        referenceDate: "June 2026",
        referenceContent:
            "One Year Off Heroin: Brain Circuits Recovering\n\n"
            "Source: \"Potential brain recovery of frontostriatal circuits in heroin users after prolonged abstinence: A preliminary study,\" on PubMed\n\n"
            "What Heroin Disrupts\n"
            "Heroin damages the frontostriatal circuits that link the prefrontal cortex to the brain's reward centres — pathways for self-control and motivation. At baseline, this study found heroin users had reduced white-matter integrity in prefrontal-to-caudate and orbitofrontal-to-accumbens tracts, and weaker resting-state connectivity in reward circuits, compared with healthy controls.\n\n"
            "Recovery With Prolonged Abstinence\n"
            "Participants were scanned twice — at baseline and after about eight months of abstinence. The follow-up showed reduced craving and enhanced cognitive control, alongside recovery in the dorsal and ventral frontostriatal circuits. The authors concluded this provides scientific evidence for brain recovery of these circuits after prolonged abstinence, with the circuits tracking the improvements in cognition and craving.\n\n"
            "Around One Year\n"
            "At twelve months you are well past the eight-month window in which this recovery was measured: the control circuitry is rebuilding, cravings are weaker, and decision-making is stronger — changes people experience as a genuinely more rewarding, self-directed life.\n\n"
            "An Honest Caveat\n"
            "The authors describe this as a preliminary study with a modest sample. Recovery is real but continues to be characterised, and its pace varies — particularly for long-term heavy users.",
      ),
      QuitMilestone(
        day: 540,
        title: l10n.heroinMilestone540Title,
        description: l10n.heroinMilestone540Description,
        reference:
            "Structural & Functional Brain Recovery During Abstinence (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8885813/",
        referenceDate: "June 2026",
        referenceContent:
            "18 Months Off Heroin: The Slow Repair of Reward Chemistry\n\n"
            "Source: \"Structural and Functional Brain Recovery in Individuals with Substance Use Disorders During Abstinence: A Review of Longitudinal Neuroimaging Studies,\" Drug and Alcohol Dependence (2022), on PubMed Central\n\n"
            "What the Long-Term Evidence Shows\n"
            "This review gathered every longitudinal neuroimaging study that re-scanned the same people over abstinence. For opioids the longest-running measure is dopamine-transporter imaging: heroin users started about 30% below healthy controls in the striatum, and across 6–12 months of abstinence that level rose by roughly 20% — a clear, measurable recovery of the brain's dopamine machinery, even though it had not fully returned to baseline.\n\n"
            "Where 18 Months Sits\n"
            "By a year and a half you are past the window most studies were able to measure. The honest position is that the dopamine system keeps recovering on the trajectory seen through the first year, while direct imaging evidence this far out is still sparse. Earlier structural work found some heroin-related frontal abnormalities were no longer detectable after just one month of abstinence, suggesting parts of the cortex normalise early and the slower reward chemistry continues to mend over the following months.\n\n"
            "What This Means Day to Day\n"
            "A dopamine system that is closer to normal supports what people report in long-term recovery — ordinary pleasures feel rewarding again, motivation returns, and cravings keep fading.\n\n"
            "An Honest Caveat\n"
            "The authors stress how limited opioid recovery data still is — only a handful of longitudinal studies, small samples, high drop-out, and some studies using added treatments that make abstinence alone hard to isolate. The direction is genuine recovery; the exact pace varies between individuals.",
      ),
      QuitMilestone(
        day: 730,
        title: l10n.heroinMilestone730Title,
        description: l10n.heroinMilestone730Description,
        reference:
            "Structural & Functional Brain Recovery During Abstinence (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8885813/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Years Off Heroin: What the Brain-Recovery Science Supports\n\n"
            "Source: \"Structural and Functional Brain Recovery in Individuals with Substance Use Disorders During Abstinence: A Review of Longitudinal Neuroimaging Studies,\" Drug and Alcohol Dependence (2022), on PubMed Central\n\n"
            "The Brain Heals — and the Evidence Says So\n"
            "This review of longitudinal neuroimaging concluded that, across substances, abstinence is associated with genuine structural and functional brain recovery. For heroin specifically, several lines of evidence point the same way:\n"
            "• Dopamine-transporter levels in the striatum, about 30% below normal at baseline, rose by roughly 20% over 6–12 months of abstinence\n"
            "• Some frontal grey-matter and white-matter abnormalities seen in early withdrawal were no longer detectable after a month of abstinence\n"
            "• Disrupted resting-state activity in frontal and reward regions began to re-normalise within the first month\n\n"
            "Why Two Years Matters\n"
            "Recovery in these studies is gradual and continues for as long as it was tracked — and most studies stopped well before two years. By the two-year mark you are far beyond the measured window, on a trajectory where the dopamine system and frontal circuits have had the longest possible time to keep mending. The reasonable, evidence-based message is not that the brain is 'fully restored,' but that real, ongoing healing is exactly what the long-term data predict.\n\n"
            "An Honest Caveat\n"
            "The authors are candid about the limits: opioid recovery has been studied in only a few small, mostly male samples, with high drop-out and some confounding treatments. Recovery is real and well-supported in direction; its completeness and pace differ from person to person, especially after long, heavy use.\n\n"
            "Two Years in Life\n"
            "Beyond the scans, two years of heroin-free living is a profound change — health, relationships, cognition, and a sense of self rebuilt. Many people describe reaching this milestone as one of the hardest and most meaningful things they have done.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.heroinPageTitle,
      storageKey: 'heroin',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.heroinHeaderStarted,
      headerNotStarted: l10n.heroinHeaderNotStarted,
      subtitleStarted: l10n.heroinSubtitleStarted,
      subtitleNotStarted: l10n.heroinSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
