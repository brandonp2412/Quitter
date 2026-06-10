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
        reference: "McLaughlin, Dani & De Biasi — Nicotine Withdrawal (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/25638335/",
        referenceDate: "June 2026",
        referenceContent:
            "Day One: Withdrawal Begins\n\n"
            "Source: McLaughlin, Dani & De Biasi\n\n"
            "Nicotine withdrawal is a well-characterised syndrome. The brain built extra nicotine receptors during your vaping years; without nicotine, those receptors produce withdrawal symptoms. Vaping delivers nicotine efficiently — pod systems allow high concentrations — so physical dependence can be substantial.\n\n"
            "Day one symptoms\n"
            "• Craving for nicotine\n"
            "• Irritability, frustration, and anger\n"
            "• Anxiety\n"
            "• Difficulty concentrating\n"
            "• Restlessness\n"
            "• Increased appetite\n\n"
            "Symptoms follow a predictable course: they begin within hours, peak over the first days, then steadily resolve over the following weeks. Day one is the start of recovery, not a permanent state.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.vapingMilestone3Title,
        description: l10n.vapingMilestone3Description,
        reference: "McLaughlin, Dani & De Biasi — Nicotine Withdrawal (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/25638335/",
        referenceDate: "June 2026",
        referenceContent:
            "Day Three: Peak Withdrawal\n\n"
            "Source: McLaughlin, Dani & De Biasi\n\n"
            "By 72 hours, nicotine and its metabolite cotinine have largely cleared the body. The receptor systems that adapted to constant nicotine are at their most destabilised — this is the hardest day.\n\n"
            "Peak symptoms\n"
            "• Craving at its most intense\n"
            "• Irritability, frustration, and anger\n"
            "• Anxiety and restlessness\n"
            "• Difficulty concentrating\n"
            "• Depressed mood\n"
            "• Increased appetite\n\n"
            "Withdrawal is self-limiting. The receptors return toward their pre-nicotine state over the following weeks, and symptom intensity falls accordingly. Day three is the summit — from here the trajectory is downhill.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.vapingMilestone7Title,
        description: l10n.vapingMilestone7Description,
        reference: "CDC — About E-Cigarettes (Vaping)",
        link: "https://www.cdc.gov/tobacco/e-cigarettes/about.html",
        referenceDate: "June 2026",
        referenceContent:
            "One Week: Airways Beginning to Settle\n\n"
            "Source: CDC\n\n"
            "E-cigarette aerosol is not harmless water vapour. After one week, your airways have had a full week free of:\n"
            "• Ultrafine particles inhaled deep into the lungs\n"
            "• Flavouring chemicals such as diacetyl, linked to serious lung disease\n"
            "• Heavy metals including nickel, tin, and lead\n"
            "• Volatile organic compounds and cancer-causing chemicals\n\n"
            "With the irritation removed, airway inflammation begins to subside. Many people notice easier breathing and a sharper sense of taste and smell within the first week.\n\n"
            "The acute physical nicotine withdrawal has largely passed.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.vapingMilestone14Title,
        description: l10n.vapingMilestone14Description,
        reference:
            "Vaping & Vascular Function — Randomized Crossover Trial (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6039507/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Weeks Without Vaping: Circulation Recovers\n\n"
            "Source: \"Differential Effects of E-Cigarette on Microvascular Endothelial Function, Arterial Stiffness and Oxidative Stress: A Randomized Crossover Trial,\" Scientific Reports (2018), on PubMed Central\n\n"
            "Isolating What Vaping Does to Blood Vessels\n"
            "This randomised crossover trial compared vaping with nicotine, vaping without nicotine, and sham-vaping in the same participants. By separating the nicotine from the propylene glycol/glycerol carrier, it pinpointed exactly which cardiovascular harms nicotine causes — and therefore what reverses when you stop.\n\n"
            "What Nicotine Vaping Did\n"
            "Compared with the nicotine-free vehicle, vaping with nicotine produced:\n"
            "• A sustained rise in blood pressure (systolic ~109 → 121 mm Hg, diastolic ~68 → 78 mm Hg)\n"
            "• A large increase in heart rate (~59 → 77 bpm), lasting around two hours\n"
            "• Increased arterial stiffness (higher augmentation index and pulse-wave velocity)\n"
            "• Impaired endothelium-dependent vasodilation — blood vessels less able to relax and widen\n\n"
            "The Key Finding\n"
            "The nicotine-free vehicle did not alter blood pressure, heart rate, arterial stiffness, or endothelial function. The authors concluded these effects are \"solely attributable to nicotine.\"\n\n"
            "Why Two Weeks Matters\n"
            "Because these are acute, nicotine-driven effects, removing the nicotine removes the driver. After two weeks without vaping, the repeated spikes in blood pressure and heart rate are gone, arterial stiffness eases, and endothelial function — the blood vessels' ability to dilate — recovers. Circulation to the hands, feet, and peripheral tissues improves accordingly.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.vapingMilestone60Title,
        description: l10n.vapingMilestone60Description,
        reference: "McLaughlin, Dani & De Biasi — Nicotine Withdrawal (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/25638335/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Without Vaping: Anxiety Settles\n\n"
            "Source: McLaughlin, Dani & De Biasi, \"Nicotine Withdrawal\" (Current Topics in Behavioral Neurosciences), peer-reviewed review on PubMed\n\n"
            "Physical Versus Psychological\n"
            "This review distinguishes the two halves of nicotine dependence: the physical withdrawal syndrome driven by receptor neuroadaptation, and the learned, cue-driven behaviour that outlasts it. The physical syndrome is time-limited — symptoms peak early and resolve over a few weeks as nicotinic receptors return toward normal density. By one month, the physical component is largely behind you.\n\n"
            "What Has Resolved by Now\n"
            "• Craving driven by nicotine deficit has faded\n"
            "• Irritability, anxiety, and restlessness have settled\n"
            "• Concentration and mood have normalised as dopamine signalling recalibrates\n"
            "• Appetite changes have largely stabilised\n\n"
            "The Nicotine-Anxiety Trap\n"
            "Many vapers believed nicotine calmed their anxiety. The reality is that nicotine created a withdrawal anxiety between doses — each vape temporarily relieved the very anxiety it caused. At one month, that cycle is broken. Baseline anxiety is lower than it was during active use.\n\n"
            "What Can Linger\n"
            "The review notes that conditioned associations — the automatic urge to vape in response to stress, boredom, meals, or particular social settings — are learned cues that can persist after the physical withdrawal is over. At one month these are weakening but may still surface.",
      ),
      QuitMilestone(
        day: 60,
        title: l10n.vapingMilestone30Title,
        description: l10n.vapingMilestone30Description,
        reference:
            "Short-Term Benefits of Cessation on Respiratory Function (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC10697086/",
        referenceDate: "June 2026",
        referenceContent:
            "Two Months Without Vaping: Measurable Lung Recovery\n\n"
            "Source: \"Short-Term Benefits of Smoking Cessation Improve Respiratory Function and Metabolism in Smokers,\" International Journal of COPD (2023), on PubMed Central\n\n"
            "Recovery You Can Measure\n"
            "This study measured lung function and symptoms at baseline and again after stopping inhaled nicotine. Because vaping and smoking both deliver nicotine and an inflammatory aerosol to the airways, the recovery pattern is directly relevant to quitting vaping.\n\n"
            "What Improves\n"
            "• FEV1 (the volume you can forcibly exhale in one second) rose by ~200 mL\n"
            "• Small-airway flow (FEF 25–75%) improved, reflecting reduced inflammation\n"
            "• Gas transfer (DLCO) improved\n"
            "• Breathlessness scores (mMRC) fell, and symptom burden (CAT) dropped markedly\n"
            "• Six-minute walking distance increased from ~350 to ~400 metres, with a lower heart rate\n"
            "• Exhaled carbon monoxide fell sharply\n\n"
            "Both Large and Small Airways\n"
            "The authors concluded that quitting produced \"an improvement of all considered parameters … in both large and small airways\" — evidence that the lungs begin genuine functional repair, not merely a pause in damage.\n\n"
            "The Honest Picture\n"
            "Long-standing or severe airway damage may take longer to recover, and some changes can persist. But by two months the trajectory has clearly reversed: inflammation is down, airflow is up, and exercise tolerance is measurably better.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.vapingMilestone90Title,
        description: l10n.vapingMilestone90Description,
        reference: "CDC — Benefits of Quitting",
        link: "https://www.cdc.gov/tobacco/about/benefits-of-quitting.html",
        referenceDate: "June 2026",
        referenceContent:
            "Three Months Without Vaping: Breathing Easier\n\n"
            "Source: U.S. Centers for Disease Control and Prevention (CDC)\n\n"
            "The Cessation Timeline\n"
            "The CDC's benefits-of-quitting timeline tracks how the body recovers after stopping nicotine. The early milestones it lists apply to anyone ending nicotine and inhaled-aerosol exposure, including former vapers:\n"
            "• Within minutes: heart rate drops\n"
            "• Within 24 hours: nicotine level in the blood falls to zero\n"
            "• Within several days: carbon monoxide in the blood returns to a non-user's level\n"
            "• Within 1 to 12 months: coughing and shortness of breath decrease\n\n"
            "Where 90 Days Sits\n"
            "At three months you are well inside the window in which the CDC reports coughing and shortness of breath easing. With nicotine long cleared and the airways no longer exposed to aerosol, breathing and stamina are noticeably better than at quit day.\n\n"
            "Dependence Has Broken\n"
            "By 90 days the nicotine that once drove daily cravings has been absent for months, and the receptor systems that adapted to it have re-regulated. The vast majority of people reach this point feeling they have broken the addiction itself — natural rewards like food, exercise, and social connection feel satisfying again without nicotine.\n\n"
            "What Remains\n"
            "Occasional cue-triggered urges — tied to stress, certain social settings, or alcohol — can still appear. These are psychological habit, not physical dependence, and they keep weakening the longer you stay vape-free.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.vapingMilestone180Title,
        description: l10n.vapingMilestone180Description,
        reference:
            "Impact of E-Cigarettes on Oral Health — Narrative Review (PMC)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC11675017/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Without Vaping: Oral Health Recovers\n\n"
            "Source: \"The Impact of E-Cigarettes on Oral Health — A Narrative Review,\" Dentistry Journal (2024), on PubMed Central\n\n"
            "How Vaping Affects the Mouth\n"
            "This peer-reviewed review summarises the evidence on vaping and oral health. Documented effects include:\n"
            "• Reduced antibacterial and antioxidant properties of saliva, with raised markers of cell damage and inflammation (IL-6, IL-1β, TNF-α)\n"
            "• Higher clinical attachment loss, pocket depth, and marginal bone loss versus non-users in several studies\n"
            "• A shift in the oral microbiome that suppresses protective bacteria and favours disease-associated species\n"
            "• Tooth discoloration and enamel demineralisation, with glycerin and flavourings promoting biofilm formation\n"
            "• Suppression of gum bleeding — which can mask disease and delay diagnosis\n\n"
            "Recovery After Stopping\n"
            "Removing the aerosol removes these ongoing insults. With saliva's protective antibacterial and antioxidant function restored, the mouth better neutralises acid and clears bacteria; gum inflammation subsides; and the microbiome can shift back toward a healthier balance. By six months, a dentist is likely to see healthier, less inflamed gum tissue than during active vaping.\n\n"
            "An Honest Caveat\n"
            "The review notes that effects are often less severe than those of conventional cigarettes, that some studies show mixed results, and that long-term longitudinal data are still limited. Stopping removes a documented source of oral-health risk — which is reason enough to quit.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.vapingMilestone365Title,
        description: l10n.vapingMilestone365Description,
        reference: "CDC — Benefits of Quitting",
        link: "https://www.cdc.gov/tobacco/about/benefits-of-quitting.html",
        referenceDate: "June 2026",
        referenceContent:
            "One Year Without Vaping: Long-Term Health Restored\n\n"
            "Source: U.S. Centers for Disease Control and Prevention (CDC)\n\n"
            "The Long-Term Timeline\n"
            "The CDC's benefits-of-quitting timeline tracks how risk falls the longer you stay off nicotine. The cardiovascular milestones apply directly to former vapers, because nicotine is the shared driver of raised heart rate, blood pressure, and arterial strain:\n"
            "• Within 1 to 2 years: risk of heart attack drops sharply\n"
            "• Within 3 to 6 years: added risk of coronary heart disease drops by half\n"
            "• Over 5 to 20 years: risks of stroke and several cancers continue to decline toward non-user levels\n\n"
            "One Year In\n"
            "At twelve months your heart rate and blood pressure have been free of nicotine's repeated spikes for a year, and your blood vessels have had that long to recover endothelial function. You are entering the window in which the CDC reports heart-attack risk falling sharply.\n\n"
            "Aerosol Exposure: A Full Year Gone\n"
            "Vaping aerosol contains cancer-causing chemicals, heavy metals, and volatile organic compounds. One year without it means a full year in which none of those have been deposited in your airways, giving respiratory tissue and DNA-repair processes uninterrupted time to recover.\n\n"
            "The Bigger Picture\n"
            "Ending nicotine use — whether from cigarettes or vaping — is among the most impactful health decisions a person can make. One year in, the cardiovascular and respiratory benefits are real and compounding.",
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
