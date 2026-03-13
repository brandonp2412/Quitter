import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:quitter/quit_milestones_page.dart';

class SmokingPage extends StatelessWidget {
  final bool started;

  const SmokingPage({super.key, required this.started});

  List<QuitMilestone> _getMilestones(AppLocalizations l10n) {
    return [
      QuitMilestone(
        day: 1,
        title: l10n.smokingMilestone1Title,
        description: l10n.smokingMilestone1Description,
        reference: "NHS Better Health - Quit Smoking Timeline",
        link: "https://www.nhs.uk/better-health/quit-smoking/",
        referenceDate: "March 2026",
        referenceContent:
            "What Happens When You Quit Smoking: Day One\n\n"
            "Source: NHS Better Health\n\n"
            "Immediate Benefits Begin\n"
            "The NHS documents that benefits from quitting smoking begin within minutes of your last cigarette — not days or weeks. These rapid changes reflect how quickly the body begins to normalise when the constant assault of cigarette smoke is removed.\n\n"
            "Timeline of Day-One Changes\n"
            "• After 20 minutes: Heart rate and blood pressure drop toward normal\n"
            "• After 8 hours: Carbon monoxide levels in the blood fall by half; oxygen levels return to normal\n"
            "• After 24 hours: Carbon monoxide is cleared from the body entirely\n\n"
            "Carbon Monoxide: The Hidden Harm\n"
            "Carbon monoxide (CO) is a poisonous gas in cigarette smoke that binds to haemoglobin in red blood cells more strongly than oxygen — literally displacing oxygen from your blood. Smokers have chronically elevated CO levels, meaning their blood carries less oxygen to every organ and tissue. Within 24 hours of stopping, this reverses completely.\n\n"
            "Nicotine Withdrawal Begins\n"
            "Alongside these positive changes, nicotine withdrawal begins on day one:\n"
            "• Cravings (each typically lasting 3–5 minutes)\n"
            "• Irritability and difficulty concentrating\n"
            "• Increased appetite\n"
            "• The NHS emphasises that these are temporary and manageable with support\n\n"
            "The NHS Better Health programme offers free support including apps, online tools, and pharmacist advice.",
      ),
      QuitMilestone(
        day: 3,
        title: l10n.smokingMilestone3Title,
        description: l10n.smokingMilestone3Description,
        reference:
            "McLaughlin, Dani & De Biasi — Nicotine Withdrawal (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/25638335/",
        referenceDate: "March 2026",
        referenceContent:
            "Day Three: Nicotine Withdrawal Peaks\n\n"
            "Source: McLaughlin, Dani & De Biasi — Peer-reviewed review in Current Topics in Behavioral Neurosciences\n\n"
            "Nicotine Is Gone\n"
            "By 72 hours after your last cigarette, nicotine has been eliminated from your body. Its metabolite cotinine is also being cleared. The body is genuinely free of nicotine.\n\n"
            "Why Withdrawal Peaks Now\n"
            "This peer-reviewed review explains the neurochemical basis of nicotine withdrawal. Chronic smoking upregulates nicotinic acetylcholine receptors (nAChRs) throughout the brain — the brain builds more receptors in response to constant nicotine stimulation. When nicotine is removed, these densely upregulated receptors are suddenly understimulated, causing the acute withdrawal syndrome.\n\n"
            "Peak Withdrawal Symptoms at Day Three\n"
            "• Cravings — at their most intense during this period\n"
            "• Irritability, frustration, and restlessness\n"
            "• Difficulty concentrating\n"
            "• Anxiety\n"
            "• Headaches\n"
            "• Increased appetite\n"
            "• Coughing (as cilia start clearing the airways — a sign of recovery)\n\n"
            "This Is the Hardest Part\n"
            "Day three is typically cited as the most difficult point of nicotine withdrawal. The knowledge that this is the peak — and that it will get meaningfully easier from here — is important for getting through it.\n\n"
            "What Helps\n"
            "The research confirms that nicotine replacement therapy (NRT), varenicline, and bupropion significantly reduce the severity of withdrawal symptoms at this stage.",
      ),
      QuitMilestone(
        day: 7,
        title: l10n.smokingMilestone7Title,
        description: l10n.smokingMilestone7Description,
        reference: "NHS Better Health - Benefits of Quitting Smoking",
        link: "https://www.nhs.uk/better-health/quit-smoking/",
        referenceDate: "March 2026",
        referenceContent:
            "One Week Smoke-Free: Taste and Smell Return\n\n"
            "Source: NHS Better Health\n\n"
            "One Week: A Major Milestone\n"
            "The NHS notes that reaching one week smoke-free is a strong predictor of long-term success — people who get through the first week are significantly more likely to quit for good. The first week is the hardest, and you've done it.\n\n"
            "Taste and Smell\n"
            "Smoking damages the taste receptors (papillae) on the tongue and the olfactory receptors in the nose through direct chemical damage and reduced blood flow. Within days of stopping, these receptors begin recovering. By one week, many people notice:\n"
            "• Food tastes noticeably more flavourful\n"
            "• Smells are more vivid — both pleasant and unpleasant\n"
            "• A generally heightened sensory experience\n\n"
            "Other Week-One NHS Benefits\n"
            "• Breathing is easier — airways are beginning to clear\n"
            "• Circulation is improving\n"
            "• Skin is better hydrated (smoking depletes skin moisture)\n\n"
            "Withdrawal Easing\n"
            "The acute nicotine withdrawal is beginning to ease. Physical cravings are becoming shorter and less frequent as nicotinic receptor density begins normalising. The worst psychological cravings may still be present — particularly trigger-based cravings — but the physiological urgency is reducing.",
      ),
      QuitMilestone(
        day: 14,
        title: l10n.smokingMilestone14Title,
        description: l10n.smokingMilestone14Description,
        reference: "Medical News Today - Timeline After Quitting Smoking",
        link: "https://www.medicalnewstoday.com/articles/317956",
        referenceDate: "March 2026",
        referenceContent:
            "Two Weeks Smoke-Free: Circulation and Exercise Improve\n\n"
            "Source: Medical News Today\n\n"
            "The Two-Week Timeline\n"
            "Medical News Today documents a detailed timeline of what happens in the body after quitting smoking. At two weeks, the improvements span cardiovascular, respiratory, and sensory systems.\n\n"
            "Circulation\n"
            "By two weeks, circulation has substantially improved. Nicotine causes vasoconstriction — narrowing of blood vessels — with every cigarette. With two weeks of non-smoking:\n"
            "• Blood vessels have dilated back to their normal calibre\n"
            "• Blood flow to hands, feet, and peripheral tissues is meaningfully better\n"
            "• Many people notice warmer hands and feet\n\n"
            "Exercise Capacity\n"
            "Medical News Today documents that within 2 weeks to 3 months of quitting, walking becomes easier and exercise capacity improves substantially. The combined improvements in blood oxygen carrying capacity (from resolved CO poisoning), circulation, and early lung recovery contribute to this.\n\n"
            "Lung Recovery Begins\n"
            "Cilia — the tiny hair-like structures lining the airways that move mucus and particles out of the lungs — begin recovering within days of stopping and are functioning substantially better at two weeks. This is why many people cough more in early cessation (a healthy sign: the lungs are clearing themselves) before experiencing better breathing.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.smokingMilestone30Title,
        description: l10n.smokingMilestone30Description,
        reference: "PMC - Smoking Cessation for People with COPD",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6400424/",
        referenceDate: "March 2026",
        referenceContent:
            "One Month Smoke-Free: Lung Function Increases\n\n"
            "Source: PMC — Peer-reviewed research on smoking cessation and COPD\n\n"
            "About This Research\n"
            "This peer-reviewed review examined the benefits of smoking cessation specifically for people with COPD (Chronic Obstructive Pulmonary Disease), but the lung function improvements documented apply broadly to all smokers who quit.\n\n"
            "Lung Function at One Month\n"
            "The research documents measurable improvement in lung function within weeks to months of quitting:\n"
            "• FEV1 (forced expiratory volume — a key measure of lung function) improves\n"
            "• Airway inflammation decreases\n"
            "• Mucus production normalises\n"
            "• Cilia function continues recovering — more effective airway clearance\n\n"
            "The Rate of Decline Slows\n"
            "Smoking accelerates the natural age-related decline in lung function by roughly 2–3 times. The research documents that quitting smoking slows this decline back to the normal rate within months. For those with early COPD, this is transformative — it fundamentally changes the long-term trajectory of the disease.\n\n"
            "For Healthy Lungs\n"
            "For smokers without diagnosed lung disease, one month brings concrete improvements: easier breathing, less breathlessness on exertion, reduced morning cough, and better exercise tolerance.",
      ),
      QuitMilestone(
        day: 90,
        title: l10n.smokingMilestone90Title,
        description: l10n.smokingMilestone90Description,
        reference:
            "PMC - Cardiovascular Effects of Smoking and Smoking Cessation (2024)",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC11843939/",
        referenceDate: "March 2026",
        referenceContent:
            "Three Months Smoke-Free: Heart Attack Risk Drops Significantly\n\n"
            "Source: PMC — 2024 peer-reviewed review on cardiovascular effects of smoking and cessation\n\n"
            "Smoking and the Cardiovascular System\n"
            "This comprehensive 2024 review documents the extensive cardiovascular damage caused by smoking:\n"
            "• Accelerates atherosclerosis (plaque buildup in arteries)\n"
            "• Promotes blood clotting\n"
            "• Raises blood pressure and heart rate\n"
            "• Causes endothelial dysfunction (damage to arterial lining)\n"
            "• Increases risk of heart attack, stroke, and peripheral artery disease\n\n"
            "Cardiovascular Recovery at Three Months\n"
            "The research documents that cardiovascular recovery accelerates after 1–3 months of cessation:\n"
            "• Endothelial function (arterial wall health) shows significant improvement\n"
            "• Blood clotting factors (platelet aggregation) normalise\n"
            "• Inflammatory markers (CRP, IL-6) are reducing\n"
            "• Blood pressure and heart rate are stable at normal levels\n\n"
            "The One-Year Heart Attack Milestone\n"
            "The well-established finding — confirmed by this review — is that one year after quitting, the risk of coronary heart disease is halved compared to continuing to smoke. At three months, this risk reduction trajectory is well underway. Every month of non-smoking reduces cardiovascular risk further.",
      ),
      QuitMilestone(
        day: 180,
        title: l10n.smokingMilestone180Title,
        description: l10n.smokingMilestone180Description,
        reference: "Smokefree NZ - The Benefits of Quitting",
        link:
            "https://www.smokefree.org.nz/quit/tips-and-advice/the-benefits-of-quitting",
        referenceDate: "March 2026",
        referenceContent:
            "Six Months Smoke-Free: Immune System Strengthens\n\n"
            "Source: Smokefree NZ\n\n"
            "Six-Month Benefits\n"
            "Smokefree NZ documents the established timeline of health benefits from quitting smoking. At six months, the improvements span the immune system, respiratory system, and overall physical fitness.\n\n"
            "Immune System Recovery\n"
            "Smoking significantly impairs immune function:\n"
            "• Damages cilia and mucous membranes that are the first line of defence\n"
            "• Reduces activity of immune cells (neutrophils, macrophages, NK cells)\n"
            "• Increases susceptibility to respiratory infections\n"
            "• Impairs vaccine effectiveness\n\n"
            "By six months, immune function has substantially recovered. The risk of respiratory infections — colds, flu, pneumonia — is meaningfully lower. Vaccine responses are better. The body's defences are operating effectively.\n\n"
            "Respiratory Benefits at Six Months\n"
            "Smokefree NZ documents that by 3–9 months:\n"
            "• Coughs, wheezing, and breathing problems decrease substantially\n"
            "• Lung function is improved (cilia have largely recovered)\n"
            "• Shortness of breath on exercise is much reduced\n\n"
            "Quality of Life\n"
            "At six months, the improvements in energy, breathing, taste, smell, and immune function compound into a meaningfully better daily quality of life. Many people at this stage say they can't imagine returning to smoking.",
      ),
      QuitMilestone(
        day: 365,
        title: l10n.smokingMilestone365Title,
        description: l10n.smokingMilestone365Description,
        reference: "PMC - Smoking Cessation and Stroke Outcome",
        link: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5644463/",
        referenceDate: "March 2026",
        referenceContent:
            "One Year Smoke-Free: Stroke Risk Reduces Significantly\n\n"
            "Source: PMC — Peer-reviewed research on smoking cessation and ischemic stroke outcomes\n\n"
            "Smoking and Stroke\n"
            "This peer-reviewed research examined the relationship between smoking, smoking cessation, and stroke outcomes. The findings document that smoking is a major modifiable risk factor for ischemic stroke (caused by blood clots), and that cessation produces significant risk reduction.\n\n"
            "How Smoking Causes Stroke\n"
            "• Promotes atherosclerosis in carotid and cerebral arteries\n"
            "• Increases blood clotting tendency\n"
            "• Raises blood pressure\n"
            "• Damages the lining of cerebral blood vessels\n"
            "• Smokers have roughly twice the stroke risk of non-smokers\n\n"
            "Risk Reduction at One Year\n"
            "The research documents that one year after quitting:\n"
            "• Stroke risk is substantially reduced — beginning to approach non-smoker levels\n"
            "• The research found significant reduction in stroke risk within the first year for people who had already experienced a stroke and quit\n\n"
            "Heart Attack Risk at One Year\n"
            "Complementing the stroke data, the well-established finding is that one year after quitting, heart disease risk is approximately halved compared to continued smoking.\n\n"
            "One Year: A Medical Milestone\n"
            "One year represents measurable, population-level risk reduction across cancer, cardiovascular disease, stroke, and lung disease. This is one of the most powerful documented examples of the body's capacity for recovery.",
      ),
      QuitMilestone(
        day: 1825,
        title: l10n.smokingMilestone1825Title,
        description: l10n.smokingMilestone1825Description,
        reference: "CDC - Benefits of Quitting Smoking",
        link: "https://www.cdc.gov/tobacco/about/benefits-of-quitting.html",
        referenceDate: "March 2026",
        referenceContent:
            "Five Years Smoke-Free: Cancer Risk Plummets\n\n"
            "Source: CDC (Centers for Disease Control and Prevention)\n\n"
            "The CDC's Established Timeline\n"
            "The CDC documents one of the most comprehensive and well-evidenced timelines of smoking cessation benefits in medicine. At five years, the cancer-related benefits are among the most dramatic changes that occur with cessation.\n\n"
            "Cancer Risk at Five Years\n"
            "• Mouth, throat, oesophagus, and bladder cancer risk: halved compared to current smokers\n"
            "• Cervical cancer risk: returns to that of a non-smoker\n"
            "• Stroke risk: 5 years after quitting, risk is similar to a non-smoker\n\n"
            "The Ten-Year Milestone (Looking Ahead)\n"
            "The CDC also documents the 10-year milestone for context:\n"
            "• Lung cancer death risk is approximately half that of a continuing smoker\n"
            "• Risk of cancers of the mouth, throat, oesophagus, bladder, kidney, and pancreas continues to decrease\n\n"
            "Heart Disease at Five Years\n"
            "By five years:\n"
            "• Coronary heart disease risk is now at the level of a non-smoker\n"
            "• Arterial health has substantially recovered\n"
            "• Blood pressure has been normal for years\n\n"
            "Five Years in Perspective\n"
            "Five years of not smoking is a profound achievement. Every day of those five years has contributed to a biological transformation that has meaningfully extended life expectancy and dramatically improved quality of life.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return QuitMilestonesPage(
      title: l10n.smokingPageTitle,
      storageKey: 'smoking',
      milestones: _getMilestones(l10n),
      headerStarted: l10n.smokingHeaderStarted,
      headerNotStarted: l10n.smokingHeaderNotStarted,
      subtitleStarted: l10n.smokingSubtitleStarted,
      subtitleNotStarted: l10n.smokingSubtitleNotStarted,
      initialStarted: started,
    );
  }
}
