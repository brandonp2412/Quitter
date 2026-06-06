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
        reference: "McLaughlin, Dani & De Biasi — Nicotine Withdrawal (PubMed)",
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
        reference: "NHS - Quit Smoking Timeline",
        link: "https://www.nhs.uk/better-health/quit-smoking/",
        referenceDate: "June 2026",
        referenceContent:
            "Two to Twelve Weeks Smoke-Free: Circulation Improves\n\n"
            "Source: NHS Better Health\n\n"
            "The NHS Timeline\n"
            "The NHS documents that within 2 to 12 weeks of stopping, your blood circulation improves. This is one of the clearest measurable benefits of the first weeks off cigarettes.\n\n"
            "Why Circulation Improves\n"
            "Nicotine causes vasoconstriction — narrowing of the blood vessels — with every cigarette. Once nicotine is gone, the vessels relax back toward their normal calibre and blood flows more freely:\n"
            "• Blood vessels dilate back toward their normal width\n"
            "• Blood flow to the hands, feet and peripheral tissues improves\n"
            "• Many people notice warmer hands and feet\n\n"
            "What This Means for Activity\n"
            "Better circulation, combined with carbon monoxide already cleared from the blood in the first day, means oxygen reaches muscles more effectively. Everyday physical activity — walking, climbing stairs — starts to feel easier over this period.\n\n"
            "Airways Recovering\n"
            "The cilia — the tiny hair-like structures lining the airways that sweep mucus and particles out of the lungs — recover over these weeks. Many people cough more in early cessation as the lungs clear themselves; this is a normal sign of recovery, not a setback.",
      ),
      QuitMilestone(
        day: 30,
        title: l10n.smokingMilestone30Title,
        description: l10n.smokingMilestone30Description,
        reference: "NHS - Quit Smoking Timeline",
        link: "https://www.nhs.uk/better-health/quit-smoking/",
        referenceDate: "June 2026",
        referenceContent:
            "One Month Smoke-Free: Lung Function Climbs\n\n"
            "Source: NHS Better Health\n\n"
            "The NHS Timeline\n"
            "The NHS documents that as you move through the first months of stopping, breathing becomes easier and lung function improves — increasing by up to 10% across the 3-to-9-month window. By one month you are well into that recovery curve.\n\n"
            "What Is Happening in the Lungs\n"
            "• The cilia lining the airways have regrown and are clearing mucus and trapped debris more effectively\n"
            "• Airway inflammation is settling\n"
            "• Breathing feels easier and morning cough is reducing\n"
            "• Exercise tolerance improves as more oxygen reaches the muscles\n\n"
            "Why the Cough Eases\n"
            "Many people cough more in the first days and weeks as the recovering cilia push out built-up tar and mucus. By one month this clearing is well underway, and the persistent smoker's cough typically begins to fade.\n\n"
            "The Bigger Picture\n"
            "The NHS notes that any coughs, wheezing and breathing problems improve as lung function increases. One month is a meaningful marker on the way to that recovery.",
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
        reference:
            "Smoke-free period and recovery of alveolar immune-cell function (PubMed)",
        link: "https://pubmed.ncbi.nlm.nih.gov/11465626/",
        referenceDate: "June 2026",
        referenceContent:
            "Six Months Smoke-Free: Immune Defences Recover\n\n"
            "Source: Peer-reviewed study of alveolar immune-cell function after a tobacco-free period\n\n"
            "About This Research\n"
            "This study measured the microbicidal and inflammatory functions of alveolar immune cells (the front-line defenders deep in the lungs) in former smokers across abstinence periods of 2 months, 3–5 months, and 6–12 months.\n\n"
            "Immune Recovery Is Progressive\n"
            "Smoking suppresses the lung's immune cells — impairing their ability to engulf and kill bacteria. The research found that recovery of these defences is gradual: those abstinent only 2 months showed the most impairment, while function improved progressively with longer abstinence. Around the 6-month mark, pulmonary immune defences have substantially recovered compared with the early weeks after quitting.\n\n"
            "Why It Matters\n"
            "As alveolar immune-cell function returns, the lungs are better able to clear inhaled bacteria and particles, lowering susceptibility to respiratory infections such as colds, flu and pneumonia.\n\n"
            "Recovery Continues\n"
            "The study is a useful reminder that healing is not instant — immune defences keep improving well beyond six months — but by this stage the body's protection is markedly stronger than it was in the first weeks of quitting.",
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
