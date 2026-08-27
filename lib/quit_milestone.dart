class QuitMilestone {
  final int day;
  final String title;
  final String _description;
  final String reference;
  final String _link;
  final String? _referenceContent;
  final String? referenceDate;

  const QuitMilestone({
    required this.day,
    required this.title,
    required String description,
    required this.reference,
    required String link,
    String? referenceContent,
    this.referenceDate,
  }) : _description = description,
       _link = link,
       _referenceContent = referenceContent;

  /// Only claims whose source directly supports both the substantive recovery
  /// statement and the milestone timing keep their specific copy. Everything
  /// else is deliberately evidence-qualified so Quitter never turns a relevant
  /// paper into a more precise medical timeline than the paper actually shows.
  bool get isEvidenceQualified => !_directlySupportedClaims.contains(
    '$reference::$day',
  );

  String get description =>
      isEvidenceQualified ? _qualifiedDescription : _description;

  String get link {
    if (_link ==
        'https://store.samhsa.gov/sites/default/files/sma14-4859.pdf') {
      return 'https://library.samhsa.gov/sites/default/files/sma14-4859.pdf';
    }
    if (_link ==
        'https://www.mayoclinic.org/diseases-conditions/opioid-use-disorder/symptoms-causes/syc-20375440') {
      return 'https://www.mayoclinic.org/diseases-conditions/prescription-drug-abuse/in-depth/how-opioid-addiction-occurs/art-20360372';
    }
    return _link;
  }

  String? get referenceContent {
    if (!isEvidenceQualified) return _referenceContent;
    return _qualifiedReferenceContent;
  }

  String get _languageCode {
    if (RegExp(r'[\u3040-\u30ff]').hasMatch(title)) return 'ja';
    if (RegExp(r'[\u4e00-\u9fff]').hasMatch(title)) return 'zh';
    return 'en';
  }

  String get _qualifiedDescription {
    switch (_languageCode) {
      case 'ja':
        return '$day日目は大切な回復の節目です。ただし、引用された資料はこの日付に特定の身体的・心理的変化が必ず起こることを示していません。回復の速度には個人差があるため、ここでは正確な医学的タイムラインとして断定しません。';
      case 'zh':
        return '第$day天是一个重要的恢复里程碑，但引用资料并未证明在这一天一定会发生特定的生理或心理变化。每个人的恢复速度不同，因此这里不把它表述为精确的医学时间线。';
      default:
        return 'Day $day is a meaningful recovery milestone, but the cited source does not establish a specific biological or psychological change at exactly this point. Recovery varies between people, so Quitter does not present this as a precise medical timeline.';
    }
  }

  String get _qualifiedReferenceContent {
    switch (_languageCode) {
      case 'ja':
        return 'エビデンスについて\n\n引用された資料はこのテーマに関連していますが、$day日目に特定の回復変化が起きることを直接示しているわけではありません。そのためQuitterでは、この項目を医学的に証明された生物学的チェックポイントではなく、回復を続けるための節目として扱います。回復速度は、使用期間・量・併存疾患・治療・個人差などによって大きく異なります。根拠の詳細は下の原典リンクを確認してください。';
      case 'zh':
        return '证据说明\n\n引用资料与该主题相关，但并没有直接证明在第$day天会发生某一种特定的恢复变化。因此，Quitter把这一项作为持续恢复的里程碑，而不是医学上已经证实的生物学检查点。恢复速度会受到使用时长和剂量、共存疾病、治疗以及个体差异等因素影响。请通过下方原始来源链接查看证据本身。';
      default:
        return 'Evidence note\n\nThe cited source is relevant to this topic, but it does not directly establish a specific recovery change at day $day. Quitter therefore treats this as a recovery milestone rather than a medically proven biological checkpoint. Recovery speed varies with factors such as duration and amount of use, co-existing conditions, treatment, and individual biology. Use the original-source link below for the underlying evidence.';
    }
  }

  static const Set<String> _directlySupportedClaims = {
    // Adderall / amphetamine-type stimulants.
    'WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)::3',
    'Clinical Management of Psychostimulant Withdrawal: Review of the Evidence (Addiction)::7',
    'WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)::14',

    // Alcohol.
    'Recovery of neuropsychological function following abstinence (PMC, 2024)::90',
    'Structural & functional brain recovery during abstinence (PMC)::180',

    // Benzodiazepines.
    'WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)::7',
    'Protracted Withdrawal Syndromes From Benzodiazepines (PubMed)::14',

    // Cocaine.
    'Recovering from Cocaine: Clinical & Preclinical Investigations (PMC)::90',

    // GHB.
    'Characterization of the GHB Withdrawal Syndrome (PMC)::1',
    'Characterization of the GHB Withdrawal Syndrome (PMC)::3',
    'Characterization of the GHB Withdrawal Syndrome (PMC)::7',
    'Characterization of the GHB Withdrawal Syndrome (PMC)::14',

    // Inhalants.
    'Neurocognitive changes 15 years after chronic inhalant abuse (PubMed)::730',

    // Kratom.
    'Swogger et al. (2022) - Understanding Kratom Use: A Guide for Healthcare Providers (PMC)::7',

    // Cannabis.
    'The Cannabis Withdrawal Syndrome: Current Insights (PMC)::1',
    'PubMed - Cannabis Withdrawal Time Course::14',
    'Pope et al. (2001) - Neuropsychological Performance in Long-term Cannabis Users (PubMed)::30',

    // MDMA.
    'MDMA: Current Perspectives (PMC)::3',

    // Methamphetamine.
    'The Nature, Time Course and Severity of Methamphetamine Withdrawal (PubMed)::1',
    'The Nature, Time Course and Severity of Methamphetamine Withdrawal (PubMed)::7',
    'Partial Recovery of Brain Metabolism in Meth Abusers After Protracted Abstinence (PubMed)::365',
    'Loss of Dopamine Transporters in Meth Abusers Recovers With Protracted Abstinence (Journal of Neuroscience)::420',

    // Opioids.
    'WHO Clinical Guidelines for Withdrawal Management (NCBI Bookshelf)::1',
    'Structural & Functional Brain Recovery During Abstinence (PMC)::365',

    // Smoking.
    'NHS Better Health - Benefits of Quitting Smoking::7',
    'NHS - Quit Smoking Timeline::14',
    'PMC - Cardiovascular Effects of Smoking and Smoking Cessation (2024)::90',

    // Antidepressants.
    'Harvard Health - Going off antidepressants::3',

    // Social media.
    'Effects of a Two-Week Social Media Detox on Health-Related Outcomes (PMC)::14',

    // Anabolic steroids.
    'Common symptoms associated with usage and cessation of anabolic androgenic steroids in men (PubMed)::1',
    'Common symptoms associated with usage and cessation of anabolic androgenic steroids in men (PubMed)::14',
    'Recovery from anabolic steroid-induced hypogonadism: a scoping review (PubMed)::30',
    'Recovery from anabolic steroid-induced hypogonadism: a scoping review (PubMed)::90',
  };
}
