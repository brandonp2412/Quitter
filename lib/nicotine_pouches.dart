import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class NicotinePouchesPage extends StatelessWidget {
  final bool started;

  const NicotinePouchesPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.nicotinePouchesMilestone1Title,
        description: l10n.nicotinePouchesMilestone1Description,
        reference:
            "Tomassini et al. (2007) - Long-term effects of nicotine on taste buds (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/17560039/",
        referenceDate: "March 2026",
        referenceContent:
            "Taste & Smell Recovery After Quitting Nicotine Pouches\n\n"
            "Source: Tomassini et al. (2007) — Peer-reviewed research on nicotine's effects on taste\n\n"
            "About This Research\n"
            "This peer-reviewed study examined the effects of long-term nicotine exposure on taste bud cells (fungiform papillae). While conducted in an animal model, the findings provide mechanistic insight into why nicotine users commonly report impaired taste and smell — and why these senses begin recovering when nicotine use stops.\n\n"
            "What the Research Found\n"
            "The study documented that nicotine exposure causes structural changes to taste bud cells and alters their signalling function. This provides a biological basis for the well-documented phenomenon of improved taste and smell perception following nicotine cessation.\n\n"
            "Day One: The Recovery Begins\n"
            "Within hours of stopping nicotine pouches, the nicotine-driven suppression of taste receptor signalling begins to lift. Many people notice changes in taste perception within the first 24–48 hours — food begins to taste more flavourful as receptor sensitivity recovers.\n\n"
            "Nicotine Pouches and Oral Tissue\n"
            "Beyond taste, nicotine pouches cause direct effects on oral mucosa (the tissue lining the mouth). Nicotine is absorbed through the gum tissue and causes local vasoconstriction, reducing blood flow to oral tissues. In the first day after stopping, this local circulation begins to recover.\n\n"
            "Withdrawal on Day One\n"
            "Most people will also experience the onset of nicotine withdrawal on day one:\n"
            "• Cravings — intense urges to use a nicotine pouch\n"
            "• Irritability and difficulty concentrating\n"
            "• Headache\n"
            "• Anxiety and restlessness",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.nicotinePouchesMilestone3Title,
        description: l10n.nicotinePouchesMilestone3Description,
        reference: "McLaughlin, Dani & De Biasi - Nicotine Withdrawal (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/25638335/",
        referenceDate: "March 2026",
        referenceContent:
            "Nicotine Withdrawal: Three Days\n\n"
            "Source: McLaughlin, Dani & De Biasi — Peer-reviewed review of nicotine withdrawal mechanisms\n\n"
            "Nicotine Is Now Cleared\n"
            "By 72 hours after the last nicotine pouch, nicotine itself has been eliminated from the body. Nicotine has a half-life of approximately 2 hours, and its primary metabolite (cotinine) is eliminated within 3–4 days. This is a significant milestone: the body is now truly nicotine-free.\n\n"
            "Why Withdrawal Peaks at Day Three\n"
            "This peer-reviewed review explains the neurochemistry of nicotine withdrawal. Nicotine stimulates nicotinic acetylcholine receptors (nAChRs) throughout the brain — particularly in the ventral tegmental area, producing dopamine release. Chronic use causes upregulation of nAChRs (the brain builds more receptors in response to chronic stimulation). When nicotine is removed, these upregulated receptors are suddenly understimulated, producing the withdrawal syndrome.\n\n"
            "Peak Withdrawal Symptoms at Day Three\n"
            "• Cravings — at their most intense around days 2–4\n"
            "• Irritability, frustration, and anger\n"
            "• Anxiety and restlessness\n"
            "• Difficulty concentrating\n"
            "• Headache\n"
            "• Increased appetite\n\n"
            "It Gets Better\n"
            "The research confirms that peak withdrawal is temporary. The upregulated nAChRs gradually return to normal levels with sustained abstinence, and withdrawal symptoms progressively diminish. Most acute symptoms resolve within 2–4 weeks.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.nicotinePouchesMilestone7Title,
        description: l10n.nicotinePouchesMilestone7Description,
        reference:
            "Muthukrishnan & Warnakulasuriya - Oral Health and Smokeless Tobacco (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6172921/",
        referenceDate: "March 2026",
        referenceContent:
            "One Week Off Nicotine Pouches: Oral Health Improves\n\n"
            "Source: Muthukrishnan & Warnakulasuriya (2018) — Peer-reviewed review of oral health and smokeless tobacco\n\n"
            "Nicotine Pouches and Oral Health\n"
            "This peer-reviewed review examined the oral health consequences of smokeless tobacco (including products similar to nicotine pouches). The findings document a range of oral health effects from sustained nicotine exposure through the oral mucosa.\n\n"
            "Effects of Nicotine on Oral Tissues\n"
            "• Gum recession and gingival irritation at the pouch placement site\n"
            "• Mucosal lesions (white patches) at contact areas in tobacco-containing products\n"
            "• Impaired gum blood flow and tissue health\n"
            "• Elevated risk of periodontal disease\n\n"
            "Recovery at One Week\n"
            "By the end of the first week without nicotine pouches:\n"
            "• Oral mucosal irritation at pouch placement sites is visibly healing\n"
            "• Gum blood flow is improving as nicotine-induced vasoconstriction resolves\n"
            "• Saliva production is normalising (nicotine affects salivary function)\n"
            "• Taste perception continues improving\n\n"
            "Nicotine Withdrawal at One Week\n"
            "Physically, most acute withdrawal symptoms are meaningfully reduced by day seven. The worst of the cravings, irritability, and headaches are past their peak. Psychological cravings remain significant but are becoming more manageable.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.nicotinePouchesMilestone14Title,
        description: l10n.nicotinePouchesMilestone14Description,
        reference:
            "Cardiovascular Toxicity of Nicotine — PMC (Benowitz et al.)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4958544/",
        referenceDate: "March 2026",
        referenceContent:
            "Two Weeks Without Nicotine: Circulation Improves\n\n"
            "Source: Benowitz et al. — Peer-reviewed review on cardiovascular toxicity of nicotine\n\n"
            "Nicotine's Cardiovascular Effects\n"
            "This comprehensive peer-reviewed review documents the cardiovascular effects of nicotine independent of tobacco smoke. Key findings:\n"
            "• Nicotine directly causes acute vasoconstriction (narrowing of blood vessels)\n"
            "• Raises heart rate and blood pressure with each dose\n"
            "• Promotes sympathetic nervous system activation\n"
            "• Contributes to endothelial dysfunction (damage to blood vessel lining)\n"
            "• Promotes platelet aggregation (increasing clotting risk)\n\n"
            "Two-Week Cardiovascular Recovery\n"
            "By 14 days after stopping nicotine pouches, significant cardiovascular recovery has occurred:\n"
            "• Resting heart rate and blood pressure have normalised\n"
            "• Vasoconstriction has fully resolved — blood flow throughout the body improved\n"
            "• Peripheral circulation (hands, feet) noticeably better\n"
            "• Endothelial recovery underway\n\n"
            "What This Feels Like\n"
            "Many people at the two-week mark notice improved circulation concretely: warmer hands and feet, better exercise tolerance, lower resting heart rate, and a general sense of physical ease that wasn't present during nicotine use.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.nicotinePouchesMilestone30Title,
        description: l10n.nicotinePouchesMilestone30Description,
        reference: "Mayo Clinic - Resisting Tobacco Cravings",
        link:
            "https://www.mayoclinic.org/diseases-conditions/nicotine-dependence/in-depth/nicotine-craving/art-20045454",
        referenceDate: "March 2026",
        referenceContent:
            "One Month Without Nicotine: Stress Response Normalises\n\n"
            "Source: Mayo Clinic\n\n"
            "The Nicotine-Stress Paradox\n"
            "Many nicotine pouch users feel that nicotine helps them manage stress. The Mayo Clinic's guidance on nicotine cravings explains the reality: nicotine creates a stress loop. Regular nicotine use raises baseline anxiety and stress levels between doses. Each dose temporarily relieves this nicotine-withdrawal anxiety — which users experience as stress relief. In reality, nicotine is relieving the stress it caused.\n\n"
            "One Month: The Loop Is Broken\n"
            "By one month without nicotine, the stress loop is fully broken. The brain's stress response system — temporarily dysregulated by nicotine dependence — has normalised. Many people report at this stage that their baseline stress level is lower than it ever was during nicotine use.\n\n"
            "Cravings at One Month\n"
            "The Mayo Clinic notes that physical cravings (driven by nicotine receptor upregulation) typically resolve within 2–4 weeks. At one month, most cravings are psychological — triggered by habits, associations, and emotional cues rather than true physiological need. These can still be powerful but are different in character.\n\n"
            "Managing Cravings\n"
            "The Mayo Clinic recommends:\n"
            "• Delay — cravings typically pass within 5–10 minutes\n"
            "• Distraction — physical activity or changing environment\n"
            "• Deep breathing — activates the parasympathetic nervous system\n"
            "• Reminder of reasons for quitting",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.nicotinePouchesMilestone60Title,
        description: l10n.nicotinePouchesMilestone60Description,
        reference: "Sleep Foundation - Nicotine and Sleep",
        link:
            "https://www.sleepfoundation.org/physical-health/nicotine-and-sleep",
        referenceDate: "March 2026",
        referenceContent:
            "Two Months Without Nicotine: Sleep Quality Improves\n\n"
            "Source: Sleep Foundation\n\n"
            "Nicotine and Sleep: A Problematic Relationship\n"
            "The Sleep Foundation documents nicotine's significant disruptive effects on sleep. Nicotine is a stimulant that interferes with sleep by:\n"
            "• Reducing total sleep time\n"
            "• Suppressing REM sleep\n"
            "• Causing nocturnal nicotine withdrawal (as blood levels drop during sleep), which fragments sleep and causes early waking\n"
            "• Activating the sympathetic nervous system, raising arousal\n\n"
            "Many nicotine pouch users are unaware of how significantly nicotine is degrading their sleep, because the pattern becomes normal over time.\n\n"
            "Sleep Recovery Timeline\n"
            "The Sleep Foundation notes that sleep disturbances are common in early nicotine withdrawal (weeks 1–2), as the brain adjusts to functioning without nicotine's stimulation. By 4–8 weeks, sleep typically improves substantially beyond even pre-cessation quality.\n\n"
            "At Two Months\n"
            "By 60 days, sleep architecture has meaningfully normalised:\n"
            "• REM sleep restored to normal proportions\n"
            "• Nocturnal withdrawal-related awakenings gone\n"
            "• Sleep onset more natural\n"
            "• Overall sleep quality meaningfully better than during nicotine use\n\n"
            "The Cascading Benefits\n"
            "Better sleep at two months compounds the benefits of quitting: improved mood, better cognitive function, lower stress, and stronger immune function are all downstream of better sleep.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.nicotinePouchesMilestone90Title,
        description: l10n.nicotinePouchesMilestone90Description,
        reference: "Smokefree Veterans - How to Quit Smokeless Tobacco",
        link:
            "https://veterans.smokefree.gov/quit-dip-vapes/smokeless-tobacco/how-to-quit",
        referenceDate: "March 2026",
        referenceContent:
            "Three Months Without Nicotine: Dopamine Receptors Recover\n\n"
            "Source: Smokefree Veterans (U.S. Department of Health and Human Services)\n\n"
            "The Challenge of Quitting Smokeless Nicotine Products\n"
            "Smokefree Veterans' guidance on quitting smokeless tobacco (which includes nicotine pouches) acknowledges that these products are particularly challenging to quit because of the high nicotine delivery, the oral habit component, and the social associations around use.\n\n"
            "Three Months: A Neurological Turning Point\n"
            "By 90 days, the brain's nicotinic acetylcholine receptors — which were upregulated by chronic nicotine exposure — have substantially returned to their normal density and sensitivity. This normalisation underpins the recovery of the dopamine reward system.\n\n"
            "Dopamine Recovery at 90 Days\n"
            "Nicotine's primary addiction mechanism involves stimulating dopamine release in the brain's reward circuits. With receptor normalisation at three months, natural dopamine release is more effective, and natural rewards (food, connection, achievement) are more rewarding than they were during nicotine use.\n\n"
            "Physical Milestones at 90 Days\n"
            "• Oral health continuing to improve\n"
            "• Circulation fully normalised\n"
            "• Lung function improved (nicotine has systemic effects on respiratory health)\n"
            "• Cardiovascular risk from nicotine largely resolved\n"
            "• Immune function stronger",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.nicotinePouchesMilestone180Title,
        description: l10n.nicotinePouchesMilestone180Description,
        reference: "CDC - Benefits of Quitting Tobacco",
        link: "https://www.cdc.gov/tobacco/about/benefits-of-quitting.html",
        referenceDate: "March 2026",
        referenceContent:
            "Six Months Without Nicotine: Cardiovascular Risk Drops\n\n"
            "Source: CDC (Centers for Disease Control and Prevention)\n\n"
            "CDC's Benefits of Quitting Timeline\n"
            "The CDC documents the well-established health benefits timeline following nicotine cessation. At six months, the cardiovascular benefits are substantial and well-documented.\n\n"
            "Six-Month Cardiovascular Status\n"
            "The CDC documents that by 1–9 months after quitting:\n"
            "• Coughing and shortness of breath decrease\n"
            "• Cilia (tiny hair-like cells that clear the lungs and airways) regain normal function\n"
            "• The lungs' ability to handle mucus and reduce infection risk improves\n"
            "• Energy levels increase\n\n"
            "Heart Disease Risk\n"
            "The CDC confirms that one year after quitting, heart disease risk is reduced by approximately half compared to continued use. At six months, this risk reduction process is well underway — the vascular healing and inflammation reduction that drive this improvement are active.\n\n"
            "Cancer Risk\n"
            "The CDC notes that nicotine itself is not directly carcinogenic, but tobacco-specific nitrosamines (TSNAs), which are present in many smokeless tobacco products, are. For nicotine-only pouches, the cancer risk picture is different from dip/chew — ongoing research continues to characterise long-term risk. Stopping removes any exposure-related risk progression.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.nicotinePouchesMilestone365Title,
        description: l10n.nicotinePouchesMilestone365Description,
        reference: "CDC - Nicotine Pouches Health Information",
        link: "https://www.cdc.gov/tobacco/nicotine-pouches/index.html",
        referenceDate: "March 2026",
        referenceContent:
            "One Year Without Nicotine Pouches: Long-term Health Secured\n\n"
            "Source: CDC — Nicotine Pouches Health Information\n\n"
            "One Year: The Benefits Compound\n"
            "The CDC's health information on nicotine pouches acknowledges that these are relatively new products and that long-term research on their specific health impacts is still emerging. However, the benefits of nicotine cessation broadly — well-documented across decades of research — are clearly applicable.\n\n"
            "One-Year Milestones\n"
            "Based on the established science of nicotine cessation:\n"
            "• Heart disease risk: approximately halved compared to active nicotine use\n"
            "• Blood pressure and heart rate: fully normalised\n"
            "• Circulation: fully restored\n"
            "• Oral health: substantially improved — gum disease progression halted, mucosal healing\n"
            "• Nicotine receptors: fully normalised in density and sensitivity\n"
            "• Neurological function: fully restored — the dopamine and acetylcholine systems operate on natural signals\n\n"
            "What's Unknown\n"
            "The CDC honestly notes that the long-term health effects of nicotine pouches specifically are not yet fully characterised, as they are newer products. What is well-established is that stopping nicotine use removes all nicotine-related health risks and initiates recovery of all nicotine-damaged systems.\n\n"
            "Freedom at One Year\n"
            "One year of freedom from nicotine pouches means freedom from the ritual, the craving cycle, the cost, the oral irritation, and the cardiovascular strain. The brain and body are operating on their own chemistry.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.nicotinePouchesPageTitle,
      storageKey: 'nicotine_pouches',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.nicotinePouchesHeaderStarted,
      headerNotStarted: l10n.nicotinePouchesHeaderNotStarted,
      subtitleStarted: l10n.nicotinePouchesSubtitleStarted,
      subtitleNotStarted: l10n.nicotinePouchesSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
