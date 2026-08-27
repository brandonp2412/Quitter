import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class AdderallPage extends StatelessWidget {
  final bool started;
  const AdderallPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.adderallMilestone1Title,
        description: l10n.adderallMilestone1Description,
        reference: "MedlinePlus - Substance use - amphetamines",
        link: "https://medlineplus.gov/ency/patientinstructions/000792.htm",
        referenceDate: "June 2026",
        referenceContent:
            "Amphetamine Withdrawal: What Happens Early On\n\n"
            "Source: MedlinePlus (U.S. National Library of Medicine)\n\n"
            "What Are Amphetamines?\n"
            "Amphetamines are stimulant drugs that include both illicit substances (like street speed) and prescription medications used to treat ADHD and narcolepsy (such as Adderall and Vyvanse). They sharply increase dopamine and norepinephrine, which can create intense focus, energy, and euphoria. With regular heavy use, the brain adapts to those repeated surges, so stopping can leave mood, energy, and motivation temporarily low.\n\n"
            "Common Withdrawal Symptoms\n"
            "MedlinePlus lists these as typical when stopping amphetamines:\n"
            "• Strong craving for the drug\n"
            "• Mood swings ranging from depressed to agitated to anxious\n"
            "• Feeling tired all day\n"
            "• Not able to concentrate\n"
            "• Hallucinations (seeing or hearing things that are not there)\n"
            "• Physical reactions such as headaches, aches and pains, increased appetite, and not sleeping well\n\n"
            "Is Withdrawal Dangerous?\n"
            "MedlinePlus does not describe amphetamine withdrawal as medically dangerous in itself, but notes that severe symptoms may call for a live-in treatment program, and that mood and emotional problems from amphetamine use — including depression — can be serious and require support.\n\n"
            "Getting Help\n"
            "MedlinePlus advises contacting your healthcare provider if you or someone you know is addicted to amphetamines and needs help to stop using. If you have thoughts of self-harm, it directs readers to crisis resources such as 988 or 911.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.adderallMilestone3Title,
        description: l10n.adderallMilestone3Description,
        reference:
            "WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
        referenceDate: "June 2026",
        referenceContent:
            "Amphetamine Withdrawal Management: Day 3\n\n"
            "Source: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\n"
            "Where Day 3 Sits\n"
            "The WHO guidelines state that stimulant withdrawal symptoms 'begin within 24 hours of last use of stimulants and last for 3–5 days.' Day three is squarely inside this acute phase — typically among the hardest days before symptoms begin to settle.\n\n"
            "The Symptoms\n"
            "For amphetamine-type stimulants the guidelines list:\n"
            "• Agitation and irritability\n"
            "• Depression\n"
            "• Increased sleeping and appetite\n"
            "• Muscle aches\n"
            "Heavy users may also develop psychotic symptoms such as paranoia, disordered thoughts, or hallucinations.\n\n"
            "Mostly a Psychological Challenge\n"
            "Unlike alcohol or opioid withdrawal, stimulant withdrawal does not bring vomiting, tremors, or seizures. The dominant difficulty is psychological — low mood, loss of pleasure, and craving driven by a dopamine-depleted brain.\n\n"
            "Management Approach\n"
            "The WHO guidelines recommend supportive care:\n"
            "• Drinking at least 2–3 litres of water per day\n"
            "• Multivitamin supplements with B group vitamins and vitamin C\n"
            "• Symptomatic medication for aches and anxiety\n"
            "• For severe agitation, behavioural strategies first, with diazepam sedation only if needed\n\n"
            "Beyond the Acute Phase\n"
            "The guidelines say the hardest withdrawal lasts only a few days, followed by a milder recovery period that can last one to two months.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.adderallMilestone7Title,
        description: l10n.adderallMilestone7Description,
        reference:
            "Clinical Management of Psychostimulant Withdrawal: Review of the Evidence (Addiction)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10069411/",
        referenceDate: "June 2026",
        referenceContent:
            "One Week Without Adderall: The Worst Is Passing\n\n"
            "Source: Li & Shoptaw, \"Clinical Management of Psychostimulant Withdrawal: Review of the Evidence,\" Addiction (2023), on PubMed Central\n\n"
            "The Acute Phase Resolves\n"
            "This evidence review describes psychostimulant withdrawal in phases. In the acute phase, symptoms 'peak after the first 2–3 days,' and the 'major discomfort from these symptoms usually resolves within 4–7 days.' By the end of the first week, the hardest part of the crash is behind most people — energy and appetite begin to steady, and sleep starts to regulate.\n\n"
            "What Comes Next\n"
            "The review says most remaining symptoms continue easing over the next two to three weeks. At day seven, recovery is already well underway.\n\n"
            "What's Still Present at Day 7\n"
            "Psychological symptoms typically outlast the physical crash:\n"
            "• Low motivation and loss of pleasure\n"
            "• Difficulty concentrating\n"
            "• Mood that is still below normal\n"
            "These reflect a dopamine system that is readjusting — a normal, temporary part of recovery.\n\n"
            "Recovery Signal\n"
            "No FDA-approved medication specifically treats stimulant withdrawal, so supportive care, structure, sleep, nutrition, and psychological support are the mainstays through this phase.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.adderallMilestone14Title,
        description: l10n.adderallMilestone14Description,
        reference:
            "WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Off Adderall: Into the Longer Recovery Phase\n\n"
            "Source: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\n"
            "Past the Acute Phase\n"
            "The WHO puts the hardest stimulant withdrawal at about three to five days, followed by a milder recovery period lasting around one to two months. At two weeks, the crash is well behind you.\n\n"
            "What the Longer Recovery Phase Feels Like\n"
            "The heavy sleeping, agitation, and muscle aches have largely settled. What remains is usually milder: low or changing mood, reduced motivation, and on-and-off cravings as the brain's reward system readjusts.\n\n"
            "Sleep and Appetite\n"
            "The increased sleeping and appetite of the acute phase are normalising. As sleep steadies, mood, concentration, and energy tend to follow.\n\n"
            "Relapse Risk and ADHD\n"
            "This is still a higher-risk period, particularly if underlying ADHD symptoms return without medication. The WHO guidelines emphasise psychological support and relapse-prevention skills; for people who took Adderall for ADHD, this is a good time to discuss non-stimulant strategies or alternatives with a doctor.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.adderallMilestone30Title,
        description: l10n.adderallMilestone30Description,
        reference:
            "Clinical Management of Psychostimulant Withdrawal: Review of the Evidence (Addiction)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10069411/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Off Adderall: Most Symptoms Behind You\n\n"
            "Source: Li & Shoptaw, \"Clinical Management of Psychostimulant Withdrawal: Review of the Evidence,\" Addiction (2023), on PubMed Central\n\n"
            "Where One Month Sits\n"
            "The review finds that most withdrawal symptoms fade over the first two to three weeks. By 30 days, the bulk of them have eased and mood and motivation are usually much better than in the first week.\n\n"
            "The Later Recovery Phase\n"
            "From one to six months, memory, planning, focus, and decision-making continue to improve. At one month, the crash is over and those gains are already underway.\n\n"
            "Mood and Motivation\n"
            "The deep loss of pleasure from the crash has largely lifted by now. Activities that felt joyless in the first week start to feel rewarding again as natural dopamine signalling recovers.\n\n"
            "For People With ADHD\n"
            "If Adderall was prescribed for ADHD, underlying symptoms may be more noticeable now. Working with a healthcare provider on non-stimulant strategies or alternatives is important during this stage.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.adderallMilestone60Title,
        description: l10n.adderallMilestone60Description,
        reference:
            "WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK310652/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Months Off Adderall: The Longer Recovery Phase Winds Down\n\n"
            "Source: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\n"
            "Where Two Months Sits\n"
            "The WHO describes a milder recovery period lasting around one to two months after the initial crash. At 60 days, you are at the far end of that window and lingering symptoms are largely resolving.\n\n"
            "What Improves\n"
            "The agitation, depressed mood, and disturbed sleep and appetite the guidelines list for stimulant withdrawal have, for most people, settled substantially:\n"
            "• Usual mood is steadier, with fewer of the swings of early recovery\n"
            "• Sleep and appetite have normalised\n"
            "• The reward system responds more readily to everyday pleasures — food, exercise, connection\n\n"
            "Recovery Signal\n"
            "Higher doses and longer use can make recovery take longer, while staying abstinent keeps mood, motivation, and clear thinking moving toward normal over the following months.\n\n"
            "Physical Health\n"
            "The stimulant effects on heart rate, appetite, and weight ease as the drug clears from daily life, and cardiovascular strain from stimulant use is relieved.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.adderallMilestone90Title,
        description: l10n.adderallMilestone90Description,
        reference:
            "Clinical Management of Psychostimulant Withdrawal: Review of the Evidence (Addiction)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10069411/",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Off Adderall: Through the Worst, Still Healing\n\n"
            "Source: Li & Shoptaw, \"Clinical Management of Psychostimulant Withdrawal: Review of the Evidence,\" Addiction (2023), on PubMed Central\n\n"
            "Where 90 Days Sits\n"
            "At three months, the early symptoms are long gone while memory, planning, focus, decision-making, and the reward system continue to improve.\n\n"
            "Thinking and Memory Keep Recovering\n"
            "The review finds that memory, planning, focus, and risk decisions can keep improving for months. At 90 days, concentration and memory are still moving in the right direction with continued abstinence.\n\n"
            "Why This Window Still Matters\n"
            "No FDA-approved medication specifically targets stimulant withdrawal, so structure, therapy, exercise, sleep, and support are the tools that carry recovery through this phase. Building those habits now is what carries recovery forward.\n\n"
            "The Bigger Picture\n"
            "Three months is a real achievement — the hardest physical and emotional stretches are behind you, and the trajectory from here, with continued abstinence, is one of steady improvement.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.adderallMilestone180Title,
        description: l10n.adderallMilestone180Description,
        reference: "Withdrawal Syndromes — StatPearls (NCBI Bookshelf)",
        link: "https://www.ncbi.nlm.nih.gov/books/NBK459239/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Off Adderall: Well Past the Hard Part\n\n"
            "Source: \"Withdrawal Syndromes,\" StatPearls (NCBI Bookshelf), U.S. National Library of Medicine\n\n"
            "What StatPearls Says About Stimulants\n"
            "This clinical reference describes stimulant recovery as a crash followed by gradual improvement. Common problems include depression, sleeping a lot, increased hunger, low mood, and slower movement and thinking. Depression can last several weeks, with milder recovery continuing beyond that.\n\n"
            "Where Six Months Sits\n"
            "At six months you are far past both the acute period and the several-weeks depressive phase StatPearls describes. The slow recovery it refers to has had substantial time to progress, and for most people usual mood, sleep, appetite, and motivation are steady and reliable by now.\n\n"
            "Recovery Signal\n"
            "StatPearls describes a gradual recovery beyond the initial weeks. By six months, the acute crash and the several-week depressive phase are far behind you, with stable mood, sleep, appetite, and motivation now the dominant pattern.\n\n"
            "Relationship to ADHD\n"
            "For people who took Adderall for ADHD, six months of abstinence is a good point for a clear-headed review with a doctor of current symptoms and whether non-stimulant approaches — exercise, sleep, structure, therapy, or alternative medication — are meeting your needs.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.adderallMilestone365Title,
        description: l10n.adderallMilestone365Description,
        reference:
            "Potential Adverse Effects of Amphetamine Treatment on Brain and Behavior: A Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC2670101",
        referenceDate: "June 2026",
        referenceContent:
            "One Year Off Adderall: Substantial Recovery, Honestly Framed\n\n"
            "Source: Berman et al., \"Potential Adverse Effects of Amphetamine Treatment on Brain and Behavior: A Review,\" Molecular Psychiatry (2008), on PubMed Central\n\n"
            "About This Review\n"
            "This review tracks what high-dose or long-term amphetamine exposure can do to the brain and documents measurable recovery during abstinence.\n\n"
            "What It Says About Recovery\n"
            "The review documents recovery in brain blood flow and in the proteins that recycle dopamine after long-term abstinence. Some brain areas recover faster than others, but the overall direction is clear: the brain heals after use stops.\n\n"
            "Long-Term Recovery\n"
            "The review documents measurable recovery in brain blood flow and dopamine recycling after long-term abstinence. At one year, those brain systems have had a full year to rebuild.\n\n"
            "What This Means at One Year\n"
            "For most people — particularly those who took Adderall at prescribed doses — a year off means reward, attention, and motivation systems are working well day to day. Heavier or longer use can take more time, but recovery continues. Relapse risk is much lower than in early recovery.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return QuitMilestonesPage(
      title: l10n.adderallPageTitle,
      storageKey: 'adderall',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.adderallHeaderStarted,
      headerNotStarted: l10n.adderallHeaderNotStarted,
      subtitleStarted: l10n.adderallSubtitleStarted,
      subtitleNotStarted: l10n.adderallSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
