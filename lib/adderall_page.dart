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
            "Amphetamines are stimulant drugs that include both illicit substances (like street speed) and prescription medications used to treat ADHD and narcolepsy (such as Adderall and Vyvanse). They work by flooding the brain with dopamine and norepinephrine, producing intense focus, energy, and euphoria. With regular use, the brain adapts by reducing its own dopamine production and receptor sensitivity — meaning the drug becomes necessary just to feel normal.\n\n"
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
            "Unlike alcohol or opioid withdrawal, stimulant withdrawal does not bring vomiting, tremors, or seizures. The dominant difficulty is psychological — low mood, anhedonia, and craving driven by a dopamine-depleted brain.\n\n"
            "Management Approach\n"
            "The WHO guidelines recommend supportive care:\n"
            "• Drinking at least 2–3 litres of water per day\n"
            "• Multivitamin supplements with B group vitamins and vitamin C\n"
            "• Symptomatic medication for aches and anxiety\n"
            "• For severe agitation, behavioural strategies first, with diazepam sedation only if needed\n\n"
            "Beyond the Acute Phase\n"
            "The guidelines note that acute stimulant withdrawal is 'followed by a protracted withdrawal phase of 1–2 months duration' — milder, but a reminder that recovery continues past these first hard days.",
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
            "The review describes an early protracted phase in which, 'over a period of 2–3 weeks, the intensity of most withdrawal symptoms resolves.' So while you are improving at day seven, some milder symptoms are expected to continue easing over the next couple of weeks.\n\n"
            "What's Still Present at Day 7\n"
            "Psychological symptoms typically outlast the physical crash:\n"
            "• Low motivation and anhedonia\n"
            "• Difficulty concentrating\n"
            "• Mood that is still below baseline\n"
            "These reflect a dopamine system that is recalibrating — a normal, temporary part of recovery.\n\n"
            "An Honest Note\n"
            "The review is candid that the evidence base is limited and there are no FDA-approved medications for stimulant withdrawal; supportive care, structure, and psychological support remain the mainstays through this phase.",
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
            "Two Weeks Off Adderall: Into the Protracted Phase\n\n"
            "Source: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\n"
            "Past the Acute Phase\n"
            "The WHO guidelines put the acute stimulant withdrawal phase at 3–5 days, 'followed by a protracted withdrawal phase of 1–2 months duration.' At two weeks the acute crash is well behind you, and you are in this milder but longer protracted phase.\n\n"
            "What the Protracted Phase Feels Like\n"
            "The intense early symptoms — the heavy sleeping, agitation, and muscle aches the guidelines describe for acute withdrawal — have largely settled. What lingers is gentler: low or fluctuating mood, reduced motivation, and on-and-off cravings as the brain's reward system slowly recalibrates.\n\n"
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
            "This review describes an early protracted phase in which, 'over a period of 2–3 weeks, the intensity of most withdrawal symptoms resolves.' By 30 days you are past that window — the bulk of withdrawal symptoms have eased, and baseline mood and motivation are usually noticeably better than in the first week.\n\n"
            "The Late Protracted Phase\n"
            "The review is honest that recovery is not always finished at a month. It describes a late protracted phase that can 'extend from 1 to 6 months after initial abstinence,' sometimes linked to mild cognitive dysfunction — particularly memory and executive function (planning, focus, decision-making). If thinking still feels a step slow at one month, that is consistent with the evidence and expected to keep improving.\n\n"
            "Mood and Motivation\n"
            "The profound anhedonia of the crash has largely lifted by now. Activities that felt joyless in the first week start to feel rewarding again as natural dopamine signalling recovers.\n\n"
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
            "Two Months Off Adderall: The Protracted Phase Winds Down\n\n"
            "Source: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\n"
            "Where Two Months Sits\n"
            "The WHO guidelines describe a protracted stimulant withdrawal phase of '1–2 months duration' following the acute phase. At 60 days you are at the far end of that window — for many people the lingering withdrawal symptoms are largely resolving by now.\n\n"
            "What Improves\n"
            "The agitation, depressed mood, and disturbed sleep and appetite the guidelines list for stimulant withdrawal have, for most people, settled substantially:\n"
            "• Baseline mood is steadier, with fewer of the swings of early recovery\n"
            "• Sleep and appetite have normalised\n"
            "• The reward system responds more readily to everyday pleasures — food, exercise, connection\n\n"
            "An Honest Note\n"
            "Recovery timelines vary with how long and how heavily the drug was used. Some people — especially after high-dose or long-term use — notice milder cognitive or mood symptoms persisting a little longer; this is normal and continues to improve with sustained abstinence.\n\n"
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
            "This review describes a late protracted phase that can 'extend from 1 to 6 months after initial abstinence.' At three months you are within that window: the acute and early symptoms are long resolved, but recovery is not necessarily finished — and that is normal.\n\n"
            "An Honest Word on Cognition\n"
            "The review links the late protracted phase to 'mild cognitive dysfunction,' especially memory and executive function, and notes 'continued deficits when making decisions about risk.' If concentration, memory, or planning still feel a little off at 90 days, the evidence says that can be part of this phase rather than a permanent state — and it continues to improve with sustained abstinence.\n\n"
            "Why This Window Still Matters\n"
            "The review is frank that no medications are FDA-approved for stimulant withdrawal and that sustained-abstinence rates are modest, so this is a period to lean on what works: structure, therapy, exercise, sleep, and support. Building those habits now is what carries recovery forward.\n\n"
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
            "This clinical reference notes that stimulants like amphetamine 'do not produce withdrawal symptoms by definition' in the way alcohol or opioids do — vital functions are preserved. Instead, stopping brings a recovery period marked by marked depression, excessive sleep, increased hunger, dysphoria, and psychomotor slowing. It describes this recovery as 'generally slow,' with depression that can last 'several weeks,' and a protracted or 'extinction' phase beyond that.\n\n"
            "Where Six Months Sits\n"
            "At six months you are far past both the acute period and the several-weeks depressive phase StatPearls describes. The slow recovery it refers to has had substantial time to progress, and for most people baseline mood, sleep, appetite, and motivation are steady and reliable by now.\n\n"
            "An Honest Note\n"
            "StatPearls is clear that this recovery is gradual and that a protracted phase can include low mood — even, in some, suicidal thoughts — so ongoing support still matters. Recovery is real and well underway at six months, even if its exact pace varies between individuals.\n\n"
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
            "This is a cautionary review of what high-dose or long-term amphetamine exposure can do to the brain. It is careful not to overstate recovery, which makes its evidence for healing all the more meaningful.\n\n"
            "What It Says About Recovery\n"
            "The review notes that 'some degree of recovery after protracted abstinence has been noted' — for example, partial recovery in cingulate blood flow and in striatal dopamine transporters. It cites work finding recovery in thalamic, but not striatal, deficits — the same region-specific, partial pattern seen across stimulant research.\n\n"
            "The Honest Caveats\n"
            "The review is candid that recovery can be incomplete: terminal deficits 'can persist for years following cessation,' and it even raises the possibility of some changes emerging early in abstinence. In other words, a year of abstinence brings real, measurable healing, but not necessarily a complete reset — especially after heavy or prolonged high-dose use.\n\n"
            "What This Means at One Year\n"
            "For most people — particularly those who took Adderall at prescribed doses — a year of abstinence means natural reward, attention, and motivation systems functioning well day to day. The science simply asks us to be honest: recovery is substantial and continues, while some deeper changes from heavy use may take longer or remain. Relapse risk is much lower than in early recovery, though never zero.",
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
