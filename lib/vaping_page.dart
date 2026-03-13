import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class VapingPage extends StatelessWidget {
  final bool started;

  const VapingPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.vapingMilestone1Title,
        description: l10n.vapingMilestone1Description,
        reference: "Cleveland Clinic - Nicotine Withdrawal Guide",
        link:
            "https://my.clevelandclinic.org/health/diseases/21587-nicotine-withdrawal",
        referenceDate: "March 2026",
        referenceContent:
            "Quitting Vaping: The First 24 Hours of Nicotine Withdrawal\n\n"
            "Source: Cleveland Clinic\n\n"
            "Nicotine Withdrawal Is Real\n"
            "The Cleveland Clinic documents that nicotine withdrawal is a clinically recognised syndrome with both physical and psychological symptoms. Modern vapes deliver nicotine with high efficiency — often more than traditional cigarettes, particularly with nicotine salt formulations — which can produce significant physical dependence.\n\n"
            "Day One Symptoms\n"
            "• Nicotine cravings — often intense in the first hours\n"
            "• Irritability, frustration, and anxiety\n"
            "• Difficulty concentrating\n"
            "• Headache (as blood vessels, previously constricted by nicotine, begin to dilate)\n"
            "• Increased appetite\n"
            "• Restlessness\n\n"
            "What Is Also Happening (The Good)\n"
            "The Cleveland Clinic documents that positive changes begin within minutes of stopping:\n"
            "• Within 20 minutes: heart rate and blood pressure begin dropping toward normal\n"
            "• Within 8 hours: carbon monoxide from any combustion products clears from blood\n"
            "• Within 24 hours: risk of heart attack is already beginning to decrease\n\n"
            "The Scale of Nicotine in Vapes\n"
            "Many modern vapes (particularly pod-based systems using nicotine salts) deliver nicotine concentrations of 20–50mg/mL — significantly higher than cigarettes. The Cleveland Clinic notes this can make vaping harder to quit than cigarettes for some users because the physical dependence can be more intense.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.vapingMilestone3Title,
        description: l10n.vapingMilestone3Description,
        reference: "Healthline - What Are the Benefits of Quitting Vaping?",
        link: "https://www.healthline.com/health/benefits-of-quitting-vaping",
        referenceDate: "March 2026",
        referenceContent:
            "Three Days Without Vaping: Nicotine Peaks and Begins to Clear\n\n"
            "Source: Healthline\n\n"
            "The 72-Hour Peak\n"
            "Healthline documents that nicotine withdrawal peaks around 72 hours after quitting — by which time nicotine has been eliminated from the body. This is typically the most difficult period of vaping cessation.\n\n"
            "Peak Withdrawal Symptoms\n"
            "• Cravings at their most intense\n"
            "• Irritability and mood swings\n"
            "• Difficulty concentrating\n"
            "• Anxiety\n"
            "• Headaches\n"
            "• Increased appetite and cravings for food\n"
            "• Possible nausea\n\n"
            "What Benefits Are Beginning\n"
            "Healthline also documents the simultaneous benefits beginning at this stage:\n"
            "• Sense of taste and smell are beginning to recover (damaged by vaping aerosol)\n"
            "• Airways are beginning to clear from vaping-related irritation\n"
            "• The body's nicotine receptors are beginning to downregulate back to normal\n\n"
            "This Is the Hardest Part\n"
            "Day three is the peak. Understanding that this is the worst it gets — and that symptoms will become meaningfully less intense from here — is important for getting through it. Each craving passes within 3–5 minutes whether you vape or not.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.vapingMilestone7Title,
        description: l10n.vapingMilestone7Description,
        reference: "Medical News Today - Timeline After Quitting Smoking",
        link: "https://www.medicalnewstoday.com/articles/317956",
        referenceDate: "March 2026",
        referenceContent:
            "One Week Without Vaping: Taste, Smell, and Breathing Improve\n\n"
            "Source: Medical News Today\n\n"
            "The Timeline After Quitting\n"
            "Medical News Today documents the well-established timeline of health improvements after stopping nicotine use. While originally compiled for smoking cessation, the timeline is applicable to vaping — both deliver nicotine and chemical aerosols that cause the same systemic effects.\n\n"
            "One Week: Sensory Recovery\n"
            "Vaping aerosol damages the taste receptors on the tongue and olfactory receptors in the nose through direct chemical irritation. By one week of abstinence:\n"
            "• Taste is noticeably more vivid — food tastes better\n"
            "• Smell is sharper and more differentiated\n"
            "• The sensory dullness caused by constant aerosol exposure is lifting\n\n"
            "Respiratory Improvements at One Week\n"
            "• Cilia — tiny hair-like structures in the airways that clear mucus — are recovering function\n"
            "• Airways are less inflamed and irritated\n"
            "• Breathing is noticeably easier for many people\n"
            "• Coughing may temporarily increase as cilia clear accumulated residue from airways (a positive sign)\n\n"
            "One Week: A Predictor of Success\n"
            "Medical News Today notes that reaching one week smoke or vape-free is a strong predictor of long-term success. Getting through the first week — the hardest week — means the acute physical withdrawal has largely passed.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.vapingMilestone14Title,
        description: l10n.vapingMilestone14Description,
        reference: "Truth Initiative - Benefits of Quitting Smoking or Vaping",
        link:
            "https://truthinitiative.org/research-resources/quitting-smoking-vaping/breath-fresh-air-immediate-benefits-quitting-smoking-or",
        referenceDate: "March 2026",
        referenceContent:
            "Two Weeks Without Vaping: Circulation and Lung Function Improve\n\n"
            "Source: Truth Initiative\n\n"
            "About Truth Initiative\n"
            "Truth Initiative is a major US public health non-profit dedicated to tobacco and vaping prevention. Their benefits timeline applies directly to vaping cessation, and they explicitly address vaping as well as smoking.\n\n"
            "Cardiovascular Recovery at Two Weeks\n"
            "Nicotine causes vasoconstriction — narrowing of blood vessels — with every hit. After two weeks without:\n"
            "• Blood vessels have dilated back to their normal calibre\n"
            "• Circulation to hands, feet, and peripheral tissues is substantially better\n"
            "• Blood pressure and heart rate have stabilised at normal levels\n"
            "• Many people notice warmer extremities and improved wound healing\n\n"
            "Lung Recovery at Two Weeks\n"
            "Truth Initiative documents that within 2 weeks to 3 months of quitting:\n"
            "• Walking and mild exercise become noticeably easier\n"
            "• Lung capacity and function are measurably improving\n"
            "• Cilia recovery means the lungs are more effectively clearing themselves\n\n"
            "Vaping-Specific Note\n"
            "While vaping aerosol is less damaging than cigarette smoke, it still causes measurable lung injury. Truth Initiative notes that former vapers experience genuine lung recovery when they stop — not merely a halting of additional harm, but actual tissue repair and functional improvement.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.vapingMilestone30Title,
        description: l10n.vapingMilestone30Description,
        reference: "Medical News Today - Can your lungs heal from vaping?",
        link:
            "https://www.medicalnewstoday.com/articles/effects-of-vaping-on-lungs",
        referenceDate: "March 2026",
        referenceContent:
            "One Month Without Vaping: Can Your Lungs Heal?\n\n"
            "Source: Medical News Today\n\n"
            "The Question of Lung Healing\n"
            "Medical News Today addresses the critical question former vapers ask: can the lungs actually heal? The answer, documented by research, is yes — with meaningful recovery occurring within weeks to months of stopping.\n\n"
            "What Vaping Does to the Lungs\n"
            "• Vaping aerosol causes direct airway inflammation\n"
            "• Chemical compounds (diacetyl, formaldehyde, acrolein, heavy metals) damage airway tissue\n"
            "• Flavour compounds have been associated with conditions like 'popcorn lung' (bronchiolitis obliterans)\n"
            "• EVALI (e-cigarette or vaping product use-associated lung injury) can occur, particularly with vitamin E acetate-containing products\n"
            "• Reduced cilia function impairs the lungs' self-cleaning ability\n\n"
            "Lung Recovery at One Month\n"
            "At 30 days, meaningful lung recovery is underway:\n"
            "• Airway inflammation is substantially reduced\n"
            "• Cilia function has largely recovered — the lungs are clearing themselves more effectively\n"
            "• Breathing is easier and exercise tolerance is improved\n"
            "• Risk of acute vaping-related lung events is eliminated\n\n"
            "The Honest Picture\n"
            "Medical News Today notes that some vaping-related lung damage may take longer to heal, and severe or long-term damage may not fully reverse. However, the research is clear that stopping is always the right choice — the trajectory of damage reverses immediately upon cessation.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.vapingMilestone60Title,
        description: l10n.vapingMilestone60Description,
        reference: "Charlie Health - The Vaping Withdrawal Timeline",
        link: "https://www.charliehealth.com/post/vaping-withdrawal-timeline",
        referenceDate: "March 2026",
        referenceContent:
            "Two Months Without Vaping: Psychological Recovery\n\n"
            "Source: Charlie Health\n\n"
            "The Full Vaping Withdrawal Timeline\n"
            "Charlie Health documents the complete withdrawal timeline from vaping, noting that while physical withdrawal from nicotine typically resolves within 1–4 weeks, the psychological component of the habit can persist considerably longer.\n\n"
            "Physical Withdrawal (Weeks 1–4)\n"
            "• Days 1–3: Peak physical symptoms — cravings, irritability, anxiety, headache\n"
            "• Days 4–7: Physical symptoms begin easing\n"
            "• Weeks 2–4: Physical withdrawal largely resolved for most people\n\n"
            "Psychological Withdrawal (Weeks 4–12+)\n"
            "The habit loop — the automatic reach for a device in response to stress, boredom, meals, or social situations — persists longer than the physical craving. At two months:\n"
            "• Most trigger-based urges have weakened significantly\n"
            "• The habitual hand-to-mouth motion is no longer automatic\n"
            "• Emotional regulation without vaping is becoming established\n\n"
            "Two Months: Genuine Wellbeing Returns\n"
            "Charlie Health notes that at 8 weeks, the combination of resolved physical withdrawal and substantially reduced psychological craving means genuine wellbeing is returning. Energy is up, breathing is better, skin is clearer, and the mental load of managing addiction is lifted.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.vapingMilestone90Title,
        description: l10n.vapingMilestone90Description,
        reference: "WebMD - Understanding Nicotine Withdrawal Symptoms",
        link:
            "https://www.webmd.com/smoking-cessation/understanding-nicotine-withdrawal-symptoms",
        referenceDate: "March 2026",
        referenceContent:
            "Three Months Without Vaping: Nicotine Dependence Resolved\n\n"
            "Source: WebMD\n\n"
            "Nicotine Withdrawal: How Long Does It Last?\n"
            "WebMD documents the complete timeline of nicotine withdrawal symptoms. At three months, the question 'when will this end?' has been answered: the acute withdrawal ended in week one; the subacute phase ended around weeks 3–4; at 90 days, nicotine dependence is resolved.\n\n"
            "What Has Resolved by 90 Days\n"
            "WebMD documents that most nicotine withdrawal symptoms resolve within weeks to months:\n"
            "• Physical cravings: resolved (the nicotinic acetylcholine receptors have downregulated to normal density)\n"
            "• Irritability and anxiety: resolved\n"
            "• Concentration difficulties: fully resolved\n"
            "• Headaches: resolved\n"
            "• Increased appetite: largely settled (though weight management may remain a consideration)\n\n"
            "The 90-Day Mark\n"
            "Three months is the milestone at which the vast majority of former vapers feel they have broken the addiction. The dopamine pathways that nicotine hijacked have recalibrated. Natural rewards — food, exercise, social connection, achievement — produce normal levels of satisfaction without competition from the artificially elevated dopamine spikes that vaping provided.\n\n"
            "What Remains at 90 Days\n"
            "Some trigger-based cravings may still occur at 90 days — particularly in situations strongly associated with past vaping (stress, specific social contexts, alcohol). These are psychological, not physical, and they are manageable and continue to weaken.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.vapingMilestone180Title,
        description: l10n.vapingMilestone180Description,
        reference:
            "Hobsonville Point Dental - The Effects of Vaping on Your Oral Health",
        link:
            "https://www.hobsonvillepointdental.co.nz/blog/news/the-effects-vaping-has-on-your-oral-health.html",
        referenceDate: "March 2026",
        referenceContent:
            "Six Months Without Vaping: Oral Health Recovers\n\n"
            "Source: Hobsonville Point Dental\n\n"
            "Vaping and Oral Health\n"
            "Hobsonville Point Dental documents the significant but often underappreciated effects of vaping on oral health. Vaping aerosol causes direct damage to the mouth, gums, and teeth that parallels — and in some ways differs from — the effects of smoking.\n\n"
            "How Vaping Harms Oral Health\n"
            "• Nicotine reduces blood flow to gum tissue, causing gum recession and increasing periodontal disease risk\n"
            "• Aerosol dries the mouth (xerostomia), reducing saliva's protective effect on teeth — saliva neutralises acid and washes away bacteria\n"
            "• Vaping increases harmful bacteria in the mouth associated with tooth decay and gum disease\n"
            "• Propylene glycol in vaping aerosol converts to acetic and lactic acid, which damages tooth enamel\n"
            "• Flavouring compounds further damage enamel in many formulations\n\n"
            "Oral Health Recovery at Six Months\n"
            "At six months without vaping:\n"
            "• Saliva production and mouth hydration have normalised\n"
            "• Gum blood flow has recovered — gum tissue is healthier and more resilient\n"
            "• Risk of new decay from vaping-related acid exposure is eliminated\n"
            "• The oral microbiome is shifting back toward a healthier balance\n"
            "• Gum inflammation is substantially reduced\n\n"
            "What a Dentist Will Notice\n"
            "At a six-month check-up, a dentist will typically observe healthier, less inflamed gum tissue and improved oral hygiene conditions compared to during active vaping.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.vapingMilestone365Title,
        description: l10n.vapingMilestone365Description,
        reference:
            "American Cancer Society - Health Benefits of Quitting Over Time",
        link:
            "https://www.cancer.org/cancer/risk-prevention/tobacco/guide-quitting-smoking/benefits-of-quitting-smoking-over-time.html",
        referenceDate: "March 2026",
        referenceContent:
            "One Year Without Vaping: Long-Term Health Restored\n\n"
            "Source: American Cancer Society\n\n"
            "The Long-Term Benefits Timeline\n"
            "The American Cancer Society documents the established long-term health benefits of quitting nicotine use. While originally developed for cigarette cessation, the nicotine-related cardiovascular and cancer risk reductions apply to vaping cessation as well.\n\n"
            "One Year: Heart Disease Risk Halved\n"
            "The ACS documents that one year after quitting:\n"
            "• Risk of coronary heart disease is approximately half that of a continuing user\n"
            "• This is one of the most powerful and well-evidenced health benefits of cessation\n"
            "• Blood vessels have fully recovered from nicotine-induced vasoconstriction\n"
            "• Heart rate and blood pressure have been normal for months\n\n"
            "Vaping-Specific Cancer Risk\n"
            "While vaping's long-term cancer risk is less well-established than cigarettes (due to shorter history), vaping aerosol contains known carcinogens including formaldehyde, acetaldehyde, and acrolein. At one year without vaping:\n"
            "• Exposure to these carcinogens has completely ceased for a full year\n"
            "• The body's DNA repair mechanisms have had a year of uninterrupted recovery\n"
            "• Respiratory tract tissue exposed to aerosol has had a full year to heal\n\n"
            "One Year: A Genuine Transformation\n"
            "The ACS emphasises that quitting nicotine — whether from cigarettes or vaping — is one of the single most impactful health decisions a person can make. One year in, the cardiovascular, respiratory, and cancer risk benefits are all measurable and significant.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.vapingPageTitle,
      storageKey: 'vaping',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.vapingHeaderStarted,
      headerNotStarted: l10n.vapingHeaderNotStarted,
      subtitleStarted: l10n.vapingSubtitleStarted,
      subtitleNotStarted: l10n.vapingSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
