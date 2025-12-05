// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Quitter';

  @override
  String get tabQuitter => '戒瘾';

  @override
  String get tabJournal => '日记';

  @override
  String get tabSettings => '设置';

  @override
  String get homeAddButton => '添加';

  @override
  String get homeAddTooltip => '创建自定义戒瘾项目';

  @override
  String get quitStartButton => '开始';

  @override
  String get quitResetButton => '重置';

  @override
  String get quitCardSubtitle => '点击开始';

  @override
  String quitCardKeepDays(int days) {
    return ' 天';
  }

  @override
  String newVersionToast(String version) {
    return '新版本 $version';
  }

  @override
  String get changesAction => '变更';

  @override
  String hideDialogTitle(String title) {
    return '隐藏 $title?';
  }

  @override
  String hideDialogMessage(String title) {
    return '这将从主屏幕隐藏 $title 选项。您可以在设置中再次显示它。';
  }

  @override
  String get cancel => '取消';

  @override
  String get hide => '隐藏';

  @override
  String get addictionAlcohol => '酒精';

  @override
  String get addictionVaping => '电子烟';

  @override
  String get addictionSmoking => '吸烟';

  @override
  String get addictionMarijuana => '大麻';

  @override
  String get settingsLocaleUnsupported => '不支持';

  @override
  String get settingsLocaleJapanese => '日语';

  @override
  String get settingsLocaleEnglish => '英语';

  @override
  String get settingsLocaleSimplifiedChinese => '简体中文';

  @override
  String get settingsLocaleSystem => '跟随系统';

  @override
  String get settingsLocale => '语言';

  @override
  String get addictionNicotinePouches => '尼古丁袋';

  @override
  String get addictionOpioids => '阿片类药物';

  @override
  String get addictionSocialMedia => '社交媒体';

  @override
  String get addictionAC => '成人内容';

  @override
  String get addictionAdultContent => '成人内容';

  @override
  String get settingsSearchHint => '搜索...';

  @override
  String get settingsSectionAppearance => '外观';

  @override
  String get settingsSectionSecurity => '安全';

  @override
  String get settingsSectionMainScreenItems => '主屏幕项目';

  @override
  String get settingsSectionNotifications => '通知';

  @override
  String get settingsSectionSystem => '系统';

  @override
  String get settingsPinLock => 'PIN 锁定';

  @override
  String get settingsPinLockSubtitle => '打开应用需要 PIN 码';

  @override
  String get settingsPinTimeout => 'PIN 超时 (秒)';

  @override
  String get settingsPinTimeoutHint => '15';

  @override
  String get settingsTheme => '主题';

  @override
  String get settingsColorScheme => '配色方案';

  @override
  String get settingsDynamicColorScheme => '动态';

  @override
  String get settingsBlueColorScheme => '蓝色';

  @override
  String get settingsGreenColorScheme => '绿色';

  @override
  String get settingsRedColorScheme => '红色';

  @override
  String get settingsPurpleColorScheme => '紫色';

  @override
  String get settingsOrangeColorScheme => '橙色';

  @override
  String get settingsResetButtons => '重置按钮';

  @override
  String get settingsResetButtonsSubtitle => '在戒瘾页面显示重置按钮';

  @override
  String get settingsShowJournal => '显示日记';

  @override
  String get settingsShowJournalSubtitle => '启用日记标签页以记录您的想法';

  @override
  String get settingsSwipeBetweenTabs => '标签页之间滑动';

  @override
  String get settingsSwipeBetweenTabsSubtitle => '手指滑动可在日记、主页和设置之间切换';

  @override
  String get settingsShowAlcoholTracking => '显示酒精追踪';

  @override
  String get settingsShowVapingTracking => '显示电子烟追踪';

  @override
  String get settingsShowSmokingTracking => '显示吸烟追踪';

  @override
  String get settingsShowMarijuanaTracking => '显示大麻追踪';

  @override
  String get settingsShowNicotinePouchesTracking => '显示尼古丁袋追踪';

  @override
  String get settingsShowOpioidsTracking => '显示阿片类药物追踪';

  @override
  String get settingsShowSocialMediaTracking => '显示社交媒体追踪';

  @override
  String get settingsShowAdultContentTracking => '显示成人内容追踪';

  @override
  String get settingsNotificationFrequency => '通知频率';

  @override
  String settingsNotificationFrequencySubtitle(int days, String time) {
    return '每 $days 天 $time';
  }

  @override
  String get settingsNotifyAlcohol => '通知戒酒进度';

  @override
  String get settingsNotifyVaping => '通知戒电子烟进度';

  @override
  String get settingsNotifySmoking => '通知戒烟进度';

  @override
  String get settingsNotifyMarijuana => '通知戒大麻进度';

  @override
  String get settingsNotifyNicotinePouches => '通知戒尼古丁袋进度';

  @override
  String get settingsNotifyOpioids => '通知戒阿片类药物进度';

  @override
  String get settingsNotifySocialMedia => '通知戒社交媒体进度';

  @override
  String get settingsNotifyAdultContent => '通知戒成人内容进度';

  @override
  String get settingsResetMessages => '重置消息';

  @override
  String get settingsResetMessagesSubtitle => '复发后显示积极强化消息';

  @override
  String get settingsAbout => '关于';

  @override
  String get settingsWhatsNew => '新功能';

  @override
  String get settingsEnjoyingApp => '喜欢这个应用吗？';

  @override
  String get settingsReportBug => '报告错误';

  @override
  String get settingsExportData => '导出数据';

  @override
  String get settingsImportData => '导入数据';

  @override
  String get settingsDeleteEverything => '删除所有数据';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get themeSystem => '系统';

  @override
  String get themePureBlack => '纯黑';

  @override
  String get themeMode => '主题模式';

  @override
  String get pinDialogSetTitle => '设置 PIN';

  @override
  String get pinDialogEnterPIN => '输入 PIN';

  @override
  String get pinDialogConfirmPIN => '确认 PIN';

  @override
  String get pinDialogSet => '设置';

  @override
  String get pinDialogPINsDoNotMatch => 'PIN 不匹配';

  @override
  String get pinDialogPIN => 'PIN';

  @override
  String get pinDialogOK => '确定';

  @override
  String get notificationFrequencyDialogTitle => '通知频率';

  @override
  String get notificationFrequencyNotifyEvery => '通知间隔';

  @override
  String get notificationFrequencyDays => '天';

  @override
  String get notificationFrequencyAt => '时间';

  @override
  String get notificationFrequencySave => '保存';

  @override
  String get notificationTestTitle => '积极肯定';

  @override
  String notificationTestBody(int days, String plural) {
    return '您将每 $days 天看到这样一条通知，祝贺您的进步！';
  }

  @override
  String get deleteEverythingDialogTitle => '删除所有数据';

  @override
  String get deleteEverythingDialogMessage => '确定要删除所有数据吗？此操作无法撤销。';

  @override
  String get deleteEverythingConfirm => '删除！';

  @override
  String get dataExported => '数据已导出！';

  @override
  String get dataImported => '数据导入成功！';

  @override
  String get journalHowWasYourDay => '今天过得怎么样？';

  @override
  String get journalPlaceholder => '写下您的一天、想法、感受或任何您想记住的事情...';

  @override
  String journalWordCount(int count) {
    return '$count 字';
  }

  @override
  String get journalPreviousMonth => '上个月';

  @override
  String get journalNextMonth => '下个月';

  @override
  String get quitMilestonesStart => '开始';

  @override
  String get quitMilestonesReset => '重置';

  @override
  String get quitMilestonesQuitDate => '戒除日期';

  @override
  String quitMilestonesClearTitle(int days) {
    return '清除 $days 天的里程碑？';
  }

  @override
  String quitMilestonesClearMessage(int days) {
    return '这将清除您过去所有达到 $days 天里程碑的记录。';
  }

  @override
  String get quitMilestonesClear => '清除';

  @override
  String quitMilestonesShareMessage(int days, String plural, String title) {
    return '我已经戒除 $title $days 天了！';
  }

  @override
  String get entryPageHeaderStarted => '更进一步';

  @override
  String get entryPageHeaderNotStarted => '未开始';

  @override
  String get entryPageSubtitleStarted => '你做得很好！';

  @override
  String get entryPageSubtitleNotStarted => '点击“开始”开启您的旅程';

  @override
  String get editEntryAddTitle => '添加条目';

  @override
  String get editEntryEditTitle => '编辑条目';

  @override
  String get editEntryTitle => '标题';

  @override
  String get editEntryTitleError => '请输入标题';

  @override
  String get editEntryColor => '颜色';

  @override
  String get editEntryIcon => '图标';

  @override
  String get editEntrySave => '保存';

  @override
  String get editEntryDeleteDialogTitle => '确定吗？';

  @override
  String get editEntryDeleteDialogMessage => '您真的要删除此条目吗？';

  @override
  String get editEntryDeleteNo => '不';

  @override
  String get editEntryDeleteYes => '是';

  @override
  String get pinPageEnterPIN => '输入 PIN';

  @override
  String get pinPageIncorrectPIN => 'PIN 错误';

  @override
  String get pinPageTooManyAttempts => '尝试次数过多。请等待 30 秒。';

  @override
  String get aboutPageTitle => '关于';

  @override
  String get aboutVersion => '版本';

  @override
  String get aboutAuthor => '作者';

  @override
  String get aboutAuthorName => 'Brandon Dick';

  @override
  String get aboutLicense => '许可证';

  @override
  String get aboutLicenseMIT => 'MIT';

  @override
  String get aboutDonate => '捐赠';

  @override
  String get aboutDonateSubtitle => '帮助支持此项目';

  @override
  String get aboutSourceCode => '源代码';

  @override
  String get whatsNewTitle => '新功能？';

  @override
  String get whatsNewSearchHint => '搜索...';

  @override
  String get whatsNewEnjoyingButton => '喜欢这个应用吗？';

  @override
  String get enjoyingPageTitle => '喜欢这个应用吗？';

  @override
  String get enjoyingLeaveReview => '留下评论';

  @override
  String get enjoyingLeaveReviewSubtitle => '告诉我们您的想法！';

  @override
  String get enjoyingGiveStar => '给我们点星';

  @override
  String get enjoyingGiveStarSubtitle => '在 GitHub 上支持我们';

  @override
  String get enjoyingDonate => '捐赠';

  @override
  String get enjoyingDonateSubtitle => '支持开发';

  @override
  String get alcoholPageTitle => '清醒与闪耀';

  @override
  String alcoholPageQuitDateDisplay(DateTime quitDate, int days) {
    final intl.DateFormat quitDateDateFormat = intl.DateFormat.yMMMd(
      localeName,
    );
    final String quitDateString = quitDateDateFormat.format(quitDate);

    return '$quitDateString（共$days天）';
  }

  @override
  String get alcoholHeaderStarted => '为你喝彩！';

  @override
  String get alcoholHeaderNotStarted => '清醒之旅就在前方！';

  @override
  String get alcoholSubtitleStarted => '每一天都是胜利 🥳';

  @override
  String get alcoholSubtitleNotStarted => '准备好迎接更光明的自己了吗？ ✨';

  @override
  String get vapingPageTitle => '无烟胜利';

  @override
  String get vapingHeaderStarted => '前方晴空万里！';

  @override
  String get vapingHeaderNotStarted => '无烟生活！';

  @override
  String get vapingSubtitleStarted => '呼吸顺畅，自由生活 🌬️';

  @override
  String get vapingSubtitleNotStarted => '准备好戒掉电子烟了吗？ ✨';

  @override
  String get smokingPageTitle => '无烟飞翔';

  @override
  String get smokingHeaderStarted => '呼吸顺畅！';

  @override
  String get smokingHeaderNotStarted => '无烟之旅！';

  @override
  String get smokingSubtitleStarted => '每一天不吸烟都是胜利 🚭';

  @override
  String get smokingSubtitleNotStarted => '准备好重获健康了吗？ ✨';

  @override
  String get marijuanaPageTitle => '无大麻之旅';

  @override
  String get marijuanaHeaderStarted => '头脑清醒！';

  @override
  String get marijuanaHeaderNotStarted => '无大麻生活！';

  @override
  String get marijuanaSubtitleStarted => '建立清晰的头脑，一天接一天 🧠';

  @override
  String get marijuanaSubtitleNotStarted => '准备好迎接更清晰的明天了吗？ 🌱';

  @override
  String get nicotinePouchesPageTitle => '无袋力量';

  @override
  String get nicotinePouchesHeaderStarted => '清新自由！';

  @override
  String get nicotinePouchesHeaderNotStarted => '无袋进步！';

  @override
  String get nicotinePouchesSubtitleStarted => '拥抱更光明、更健康的自己 ✨';

  @override
  String get nicotinePouchesSubtitleNotStarted => '准备好丢掉尼古丁袋了吗？ 🚀';

  @override
  String get opioidsPageTitle => '通往和平之路';

  @override
  String get opioidsHeaderStarted => '每天都在变强！';

  @override
  String get opioidsHeaderNotStarted => '康复之路！';

  @override
  String get opioidsSubtitleStarted => '拥抱你的力量 💪';

  @override
  String get opioidsSubtitleNotStarted => '准备好重获新生了吗？ 💖';

  @override
  String get opioidsInfoBox => '康复是一个医疗过程。请务必咨询医疗专业人员。';

  @override
  String get socialMediaPageTitle => '数字排毒的快乐';

  @override
  String get socialMediaHeaderStarted => '拔掉插头，尽情玩耍！';

  @override
  String get socialMediaHeaderNotStarted => '数字排毒之旅！';

  @override
  String get socialMediaSubtitleStarted => '现实生活是最好的动态 💖';

  @override
  String get socialMediaSubtitleNotStarted => '准备好重获时间了吗？ 🚀';

  @override
  String get pornographyPageTitle => '纯净与强大';

  @override
  String get pornographyHeaderStarted => '重获思想！';

  @override
  String get pornographyHeaderNotStarted => '开始你的旅程！';

  @override
  String get pornographySubtitleStarted => '建立真实的连接 🧠✨';

  @override
  String get pornographySubtitleNotStarted => '准备好挣脱束缚并重建自我了吗？ 💪';

  @override
  String get relapseMessage1 => '康复不是线性的。每一步前进都很重要，包括这一步。';

  @override
  String get relapseMessage2 => '你在这里，你在尝试，这需要真正的勇气。';

  @override
  String get relapseMessage3 => '挫折不会抹去你的进步。你在学习和成长。';

  @override
  String get relapseMessage4 => '每一次重新开始都是你力量的证明，而不是软弱的迹象。';

  @override
  String get relapseMessage5 => '明天是一个新的开始。你能行的。';

  @override
  String get relapseMessage6 => '你的价值不是由完美的连胜定义的。你很重要。';

  @override
  String get relapseMessage7 => '康复是一段有起有落的旅程。继续前行。';

  @override
  String get relapseMessage8 => '你以前有力量开始，现在你依然拥有。';

  @override
  String get relapseMessage9 => '一瞬间并不能定义你未来的整个旅程。';

  @override
  String get relapseMessage10 => '在这里表明你没有放弃。这很有力量。';

  @override
  String get relapseMessage11 => '进步不在于完美，而在于坚持。';

  @override
  String get relapseMessage12 => '每一次尝试都在建立韧性。继续建立。';

  @override
  String get relapseMessage13 => '你再次尝试的承诺本身就是一种胜利。';

  @override
  String get relapseMessage14 => '治愈不是瞬间的，而是伴随着你做出的每一个选择发生的。';

  @override
  String get relapseMessage15 => '你不是从头开始——你是带着更多的智慧继续。';

  @override
  String get relapseMessage16 => '每一位专家都曾是初学者。每一位职业选手都曾是业余爱好者。';

  @override
  String get relapseMessage17 => '康复是一天一天发生的，有时是一小时一小时发生的。';

  @override
  String get relapseMessage18 => '你正在书写一个东山再起的故事。这只是其中一章。';

  @override
  String get relapseMessage19 => '你在这里这一事实意味着你在乎自己。坚持住。';

  @override
  String get relapseMessage20 => '朝着正确方向迈出的一小步仍然是前进。';

  @override
  String get undo => '撤销';

  @override
  String get ok => '确定';

  @override
  String get alcoholMilestone1Title => '睡眠质量开始改善';

  @override
  String get alcoholMilestone1Description =>
      '您的快速眼动睡眠周期在第一天内开始正常化。虽然酒精最初可能帮助您入睡，但它会扰乱整晚的深度睡眠和快速眼动周期，导致睡眠碎片化。';

  @override
  String get alcoholMilestone3Title => '水分水平恢复';

  @override
  String get alcoholMilestone3Description =>
      '您的肾脏正在从酒精的利尿作用中恢复。酒精会抑制抗利尿激素，导致排尿增加和脱水。到第3天，您体内的液体平衡将显著改善。';

  @override
  String get alcoholMilestone7Title => '免疫系统增强';

  @override
  String get alcoholMilestone7Description =>
      '您的白细胞正在恢复其功能。即使是一次大量饮酒也会损害免疫功能长达24小时，而长期饮酒会严重削弱身体抵抗感染的能力。';

  @override
  String get alcoholMilestone14Title => '脑容量开始恢复';

  @override
  String get alcoholMilestone14Description =>
      '在戒酒的前两周内，脑容量开始迅速恢复。研究表明，脑组织恢复的迹象始于14天左右，尽管完全的认知功能会在数月内持续改善。';

  @override
  String get alcoholMilestone30Title => '血压正常化';

  @override
  String get alcoholMilestone30Description =>
      '您的心血管系统显示出显著改善。经常饮酒会升高血压，但戒酒一个月左右有助于将血压恢复到更健康的水平。';

  @override
  String get alcoholMilestone60Title => '肝功能改善';

  @override
  String get alcoholMilestone60Description =>
      '您的肝功能显示出可测量的改善。这个再生器官可以从酒精引起的损伤中显著恢复，肝酶和脂肪堆积在戒酒2个月内显示出改善。';

  @override
  String get alcoholMilestone90Title => '认知功能显著改善';

  @override
  String get alcoholMilestone90Description =>
      '在前3个月内发生显著的认知恢复。研究表明，保持戒酒的人在几个月内认知功能继续恢复，记忆力、注意力和决策能力有可测量的改善。';

  @override
  String get alcoholMilestone180Title => '脑容量和功能继续恢复';

  @override
  String get alcoholMilestone180Description =>
      '六个月的清醒允许持续的神经恢复。研究表明，在这段持续戒酒期间，脑容量继续增加，认知能力继续显著提高。';

  @override
  String get alcoholMilestone365Title => '癌症风险可能开始降低';

  @override
  String get alcoholMilestone365Description =>
      '戒酒一年可能开始降低癌症风险。虽然酒精明显增加几种癌症（肝癌、乳腺癌、结直肠癌、食道癌）的风险，但关于风险降低时间表的研究仍在进行中，并因癌症类型而异。';

  @override
  String get smokingMilestone1Title => '一氧化碳清除';

  @override
  String get smokingMilestone1Description =>
      '您的血液再次呼吸了！在24小时内，一氧化碳水平降至正常，氧气水平增加。您的心脏不再需要加班加点地将中毒的血液泵送到全身。';

  @override
  String get smokingMilestone3Title => '尼古丁戒断达到顶峰';

  @override
  String get smokingMilestone3Description =>
      '尼古丁怪兽最愤怒的时候，但您正在赢得战斗！所有尼古丁都已离开您的系统。最强烈的渴望现在发生，但它们也是您通往另一边自由的门票。';

  @override
  String get smokingMilestone7Title => '味觉和嗅觉显著改善';

  @override
  String get smokingMilestone7Description =>
      '食物将再次成为一种冒险！吸烟会破坏味蕾和嗅觉受体。一周后，您正在重新发现您忘记存在的味道。准备好认真欣赏食物吧！';

  @override
  String get smokingMilestone14Title => '血液循环和行走能力改善';

  @override
  String get smokingMilestone14Description =>
      '您的双腿每走一步都在感谢您！血液循环显著改善，使行走和锻炼变得明显更容易。那些楼梯看起来不再那么令人生畏了，是吗？';

  @override
  String get smokingMilestone30Title => '肺功能增加';

  @override
  String get smokingMilestone30Description =>
      '您的肺正在举行复出派对！纤毛已经再生，正在扫除多年的焦油和碎片。肺活量显著增加，吸烟者的咳嗽已成为历史。';

  @override
  String get smokingMilestone90Title => '心脏病发作风险显著降低';

  @override
  String get smokingMilestone90Description =>
      '您的心脏正在发送情书！三个月无烟，您的心血管风险已经大幅下降。您的心血管系统愈合速度比您想象的要快。';

  @override
  String get smokingMilestone180Title => '免疫系统增强';

  @override
  String get smokingMilestone180Description =>
      '您的免疫系统刚刚获得了超级英雄升级！六个月不吸烟，您的白细胞恢复了全部力量，像天生的冠军一样对抗感染。';

  @override
  String get smokingMilestone365Title => '中风风险显著降低';

  @override
  String get smokingMilestone365Description =>
      '整整一年的自由！您的中风风险已大幅降低，您的血管正在美丽地愈合。您正式给了您的大脑更好的循环和保护的礼物。';

  @override
  String get smokingMilestone1825Title => '癌症风险骤降（5年）';

  @override
  String get smokingMilestone1825Description =>
      '五年的胜利！您患口腔癌、喉癌、食道癌和膀胱癌的风险降低了一半。肺癌风险也显著降低。您的细胞有时间进行修复和再生。';

  @override
  String get vapingMilestone1Title => '尼古丁渴望达到顶峰';

  @override
  String get vapingMilestone1Description =>
      '您的大脑正在发尼古丁脾气，但您已经赢了！在24小时内，尼古丁水平急剧下降。最糟糕的渴望现在发生，但它们也是最需要克服的。';

  @override
  String get vapingMilestone3Title => '呼吸改善';

  @override
  String get vapingMilestone3Description =>
      '您的肺正在跳快乐的舞蹈！支气管开始放松，肺活量开始改善。吸电子烟引起的胸闷感已经开始缓解。';

  @override
  String get vapingMilestone7Title => '味觉和嗅觉恢复';

  @override
  String get vapingMilestone7Description =>
      '食物的味道又要变得美妙了！尼古丁会抑制味蕾和嗅觉受体。一周后，您的感官超能力正在巡回回归。';

  @override
  String get vapingMilestone14Title => '血液循环改善';

  @override
  String get vapingMilestone14Description =>
      '您的血液像冠军一样流动！尼古丁收缩血管，但两周无烟，您的循环显著改善。手脚冰凉，走开！';

  @override
  String get vapingMilestone30Title => '肺功能恢复';

  @override
  String get vapingMilestone30Description =>
      '您的肺实际上正在举行庆祝游行！纤毛（微小的肺部清洁工）已经再生，肺功能显著改善。那早晨的咳嗽已成为历史！';

  @override
  String get vapingMilestone60Title => '焦虑水平正常化';

  @override
  String get vapingMilestone60Description =>
      '剧情反转：吸电子烟实际上让您的焦虑问题变得更糟，而不是更好！两个月后，您的基线焦虑水平显著降低。您的神经系统终于冷静下来了。';

  @override
  String get vapingMilestone90Title => '认知功能变得敏锐';

  @override
  String get vapingMilestone90Description =>
      '脑雾已正式离场！三个月没有尼古丁，您的认知功能、注意力和记忆力显著改善。这就像升级了您的心理内存。';

  @override
  String get vapingMilestone180Title => '口腔健康恢复';

  @override
  String get vapingMilestone180Description =>
      '您的嘴巴正在发送感谢卡！六个月无电子烟，牙龈炎症减少，牙齿染色消退，口腔健康问题的风险大幅下降。';

  @override
  String get vapingMilestone365Title => '心血管风险降低';

  @override
  String get vapingMilestone365Description =>
      '您的心脏真的变强了！整整一年，您患心脏病的风险显著下降。您的心血管系统已经从尼古丁的日常攻击中恢复过来。';

  @override
  String get marijuanaMilestone1Title => '戒断症状开始';

  @override
  String get marijuanaMilestone1Description =>
      '您的大脑正在适应没有 THC 的生活！在24-48小时内，您可能会经历易怒、焦虑或睡眠困难。这是完全正常的——您的大麻素受体正在开始重置。';

  @override
  String get marijuanaMilestone3Title => '身体症状达到顶峰';

  @override
  String get marijuanaMilestone3Description =>
      '您正处于最艰难的时刻，但从现在开始都是上坡路！第2-6天通常会出现戒断症状的高峰，包括头痛、出汗和情绪变化。您的身体正在努力重新平衡自己。';

  @override
  String get marijuanaMilestone7Title => '睡眠模式改善';

  @override
  String get marijuanaMilestone7Description =>
      '美梦正在回归！在没有大麻的一周后，您的自然睡眠结构开始正常化。快速眼动睡眠反弹，导致更生动的梦境和更好的休息质量。';

  @override
  String get marijuanaMilestone14Title => '急性戒断结束';

  @override
  String get marijuanaMilestone14Description =>
      '风暴已经过去！大多数身体戒断症状在两周后显著减少。您的情绪正在稳定，日常功能变得更容易管理。最难的部分已经过去了。';

  @override
  String get marijuanaMilestone30Title => '记忆功能改善';

  @override
  String get marijuanaMilestone30Description =>
      '您的脑雾正在消散！研究表明，停止使用大麻后，语言学习和记忆力开始显著改善。对记忆形成至关重要的海马体开始更好地运作。';

  @override
  String get marijuanaMilestone60Title => '注意力变得敏锐';

  @override
  String get marijuanaMilestone60Description =>
      '专注模式：已激活！两个月没有大麻，您的注意力和保持注意力的能力显示出明显的改善。工作任务和学习变得明显更容易管理。';

  @override
  String get marijuanaMilestone90Title => '情绪稳定性恢复';

  @override
  String get marijuanaMilestone90Description =>
      '情绪平衡恢复！三个月的禁欲带来了情绪调节的显著改善，焦虑水平降低，压力管理更好。您的情绪基线正在正常化。';

  @override
  String get marijuanaMilestone180Title => '执行功能恢复';

  @override
  String get marijuanaMilestone180Description =>
      '您的心理 CEO 回来了！六个月没有大麻显示出执行功能的实质性改善——计划、决策和解决问题的能力显著增强。';

  @override
  String get marijuanaMilestone365Title => '脑结构修复';

  @override
  String get marijuanaMilestone365Description =>
      '神经架构重建！一年的禁欲允许受长期大麻使用影响的大脑区域显著恢复。认知改善成为您的新常态，对学习和记忆有持久的好处。';

  @override
  String get opioidMilestone1Title => '急性戒断开始';

  @override
  String get opioidMilestone1Description =>
      '最艰难的部分现在开始，但您并不孤单。急性戒断症状在前24-72小时内达到顶峰。这是您的身体开始愈合过程。在此阶段，专业的医疗支持至关重要。';

  @override
  String get opioidMilestone7Title => '身体症状达到顶峰并开始下降';

  @override
  String get opioidMilestone7Description =>
      '您已经度过了风暴！最严重的身体戒断症状通常在第3-5天达到顶峰，并在第7天开始下降。您的身体正在努力恢复其自然平衡。';

  @override
  String get opioidMilestone14Title => '睡眠模式开始改善';

  @override
  String get opioidMilestone14Description =>
      '美梦正在回归！两周后，您的自然睡眠结构开始恢复。阿片类药物会扰乱快速眼动睡眠，但您的大脑正在学习再次自然地做梦。';

  @override
  String get opioidMilestone30Title => '认知功能开始恢复';

  @override
  String get opioidMilestone30Description =>
      '脑雾开始消散！清醒一个月，您的认知功能、决策和记忆力开始改善。您的前额叶皮层正在从阿片类药物引起的变化中愈合。';

  @override
  String get opioidMilestone60Title => '情绪调节改善';

  @override
  String get opioidMilestone60Description =>
      '您的情绪再次找到自然的节奏。康复两个月，您的大脑奖励系统开始对日常快乐做出反应。情绪过山车正在稳定下来。';

  @override
  String get opioidMilestone90Title => '多巴胺功能显著恢复';

  @override
  String get opioidMilestone90Description =>
      '您的大脑奖励系统正在举行欢迎回归派对！清醒三个月，多巴胺功能显著改善。自然活动开始感觉有回报——食物、音乐、人际关系。';

  @override
  String get opioidMilestone180Title => '免疫系统增强';

  @override
  String get opioidMilestone180Description =>
      '您的免疫系统重新开始巡逻！六个月的康复，您身体的自然防御能力显著增强。您更有能力抵抗感染和疾病。';

  @override
  String get opioidMilestone365Title => '神经可塑性和脑结构改善';

  @override
  String get opioidMilestone365Description =>
      '您的大脑一直在忙着装修！整整一年的康复显示出脑结构和神经可塑性的显著改善。长期使用阿片类药物带来的变化正在美丽地愈合。';

  @override
  String get opioidMilestone730Title => '长期康复稳定性（2年）';

  @override
  String get opioidMilestone730Description =>
      '两年的力量和韧性！您已经建立了新的神经通路、应对策略和生活模式。研究表明，达到这一里程碑会大大降低复发风险。您是康复战士！';

  @override
  String get socialMediaMilestone1Title => '数字排毒第一天！ 🎯';

  @override
  String get socialMediaMilestone1Description =>
      '您已正式开始重新连接您的大脑！研究表明，即使想查看社交媒体也会触发与成瘾相同的神经通路。但您已经在打破循环——加油！';

  @override
  String get socialMediaMilestone3Title => '错失恐惧症？不存在的！ 😎';

  @override
  String get socialMediaMilestone3Description =>
      '三天过去了，那些焦虑的“我错过了什么？”的想法已经开始消退。您正在训练您的大脑，现实生活比精心策划的动态更有趣！';

  @override
  String get socialMediaMilestone7Title => '注意力跨度：金鱼 → 人类 🧠';

  @override
  String get socialMediaMilestone7Description =>
      '第一周完成！您不每隔几分钟检查手机就能集中注意力的能力已经在提高。研究表明，我们的大脑渴望来自通知的多巴胺冲击——但您正在教您的脑在其他地方寻找回报！';

  @override
  String get socialMediaMilestone14Title => '睡得像个婴儿（而不是僵尸） 😴';

  @override
  String get socialMediaMilestone14Description =>
      '睡前两周不刷屏 = 更好的睡眠质量！屏幕发出的蓝光会抑制褪黑激素的产生，但您的自然睡眠节律正在美丽地反弹。';

  @override
  String get socialMediaMilestone30Title => '真正的朋友 > 虚假的赞 💝';

  @override
  String get socialMediaMilestone30Description =>
      '离线一个月 = 孤独感和抑郁感显著减少！研究证明，限制社交媒体可以带来重大的心理健康改善。您已经走得更远了！';

  @override
  String get socialMediaMilestone60Title => '比较陷阱：逃脱！ ✨';

  @override
  String get socialMediaMilestone60Description =>
      '两个月没有不断的社会比较 = 自信心爆棚！研究一致表明，社交媒体的使用与自尊心下降有关，尤其是来自向上的社会比较。您已经摆脱了比较陷阱！';

  @override
  String get socialMediaMilestone90Title => '爱好收藏家等级：专家 🎨';

  @override
  String get socialMediaMilestone90Description =>
      '三个月 = 大约收回了270+小时！这足够学习一项新技能，阅读15+本书，或掌握您一直说“总有一天”会尝试的爱好。神经可塑性研究表明，您的大脑实际上正在为这些新的好习惯重新连接！';

  @override
  String get socialMediaMilestone180Title => '心理健康焕然一新 🌟';

  @override
  String get socialMediaMilestone180Description =>
      '离线六个月，您正式茁壮成长！长期研究表明，减少社交媒体的使用会导致幸福感、自尊心和生活满意度的持续改善。您是现实世界生活更美好的活生生的证明！';

  @override
  String get socialMediaMilestone365Title => '达成数字禅师成就 🏆';

  @override
  String get socialMediaMilestone365Description =>
      '整整一年的有意生活！您已经收回了1000+小时，建立了更深的人际关系，并证明了生活中最好的时刻不是为了分享——而是为了体验。您正式成为数字健康传奇！';

  @override
  String get nicotinePouchesMilestone1Title => '味觉和嗅觉开始恢复';

  @override
  String get nicotinePouchesMilestone1Description =>
      '尼古丁会使您的味蕾和嗅觉受体迟钝。在没有袋子仅仅24小时后，这些感官开始巡回回归！食物的味道又要变得美妙了。';

  @override
  String get nicotinePouchesMilestone3Title => '尼古丁完全清除';

  @override
  String get nicotinePouchesMilestone3Description =>
      '您的身体已正式驱逐所有尼古丁！虽然戒断症状可能在现在达到顶峰，但请记住——这是您的大脑正在为自由重新连接自己。最难的部分快结束了。';

  @override
  String get nicotinePouchesMilestone7Title => '口腔健康改善';

  @override
  String get nicotinePouchesMilestone7Description =>
      '您的牙龈正在举行庆祝活动！尼古丁袋会导致牙龈刺激和萎缩。一周后，流向牙龈的血液正常化，愈合开始。';

  @override
  String get nicotinePouchesMilestone14Title => '血液循环增强';

  @override
  String get nicotinePouchesMilestone14Description =>
      '您的血管正在跳快乐的舞蹈！尼古丁收缩血管，但两周自由后，您的循环显著改善。你好，更暖和的手和脚！';

  @override
  String get nicotinePouchesMilestone30Title => '应激反应正常化';

  @override
  String get nicotinePouchesMilestone30Description =>
      '剧情反转：尼古丁实际上增加了使用之间的压力！您的皮质醇水平和应激反应现在正在恢复基线。真正的放松，而不是尼古丁的假象。';

  @override
  String get nicotinePouchesMilestone60Title => '睡眠质量改善';

  @override
  String get nicotinePouchesMilestone60Description =>
      '美梦是由...没有尼古丁构成的！虽然尼古丁看起来很放松，但它实际上会扰乱睡眠结构。两个月后，您的快速眼动周期得到了美丽的恢复。';

  @override
  String get nicotinePouchesMilestone90Title => '多巴胺受体恢复';

  @override
  String get nicotinePouchesMilestone90Description =>
      '您的大脑奖励系统重新上线！尼古丁劫持多巴胺通路，使正常的快乐显得沉闷。三个月自由，生活的自然乐趣再次充满活力。';

  @override
  String get nicotinePouchesMilestone180Title => '心血管风险降低';

  @override
  String get nicotinePouchesMilestone180Description =>
      '您的心脏正在发送情书！六个月没有尼古丁显著降低了心血管疾病的风险。您的血压和心率变异性得到了极大的改善。';

  @override
  String get nicotinePouchesMilestone365Title => '长期健康得到保障';

  @override
  String get nicotinePouchesMilestone365Description =>
      '一年的自由！您患尼古丁相关健康问题的风险继续骤降。您已经打破了成瘾循环并收回了您的自主权。这真是英雄！ 🏆';

  @override
  String get pornographyMilestone1Title => '打破循环';

  @override
  String get pornographyMilestone1Description =>
      '您已经迈出了最艰难的一步！第一天是关于打破自动反应模式。您的大脑已经开始注意到它所期待的多巴胺峰值的缺失。';

  @override
  String get pornographyMilestone3Title => '戒断症状达到顶峰';

  @override
  String get pornographyMilestone3Description =>
      '平静前的风暴。渴望、不安和情绪波动现在最强烈。您的大脑正在努力重新连接自己。这种不适实际上是您的神经通路正在愈合！';

  @override
  String get pornographyMilestone7Title => '睡眠质量改善';

  @override
  String get pornographyMilestone7Description =>
      '美梦就是这样构成的！随着您大脑的奖励系统开始重新平衡，您的睡眠周期正在稳定。许多人报告说睡眠更深、更恢复精力，睡眠障碍更少。';

  @override
  String get pornographyMilestone14Title => '动力和精力恢复';

  @override
  String get pornographyMilestone14Description =>
      '迷雾正在消散！许多人注意到动力增加、思维更清晰，以及对现实世界活动的精力更多。您大脑的自然奖励系统开始在日常体验中再次找到乐趣。';

  @override
  String get pornographyMilestone30Title => '自信和自控力增长';

  @override
  String get pornographyMilestone30Description =>
      '您正在建立心理肌肉！一个月的禁欲通常会带来自信心的增加、更好的情绪调节以及更强的个人控制感。您正在向自己证明您可以克服挑战。';

  @override
  String get pornographyMilestone90Title => '脑功能稳定';

  @override
  String get pornographyMilestone90Description =>
      '您的大脑正在找到平衡！三个月允许在注意力、决策和情绪调节方面有显著改善。强迫性的冲动正变得更容易管理。';

  @override
  String get pornographyMilestone180Title => '人际关系和社交技巧改善';

  @override
  String get pornographyMilestone180Description =>
      '连接现在是您的超能力！六个月通常会带来建立真正连接的能力提高、更好的眼神交流、社交焦虑减少以及与他人更真实的关系。';

  @override
  String get pornographyMilestone365Title => '神经通路完全重置';

  @override
  String get pornographyMilestone365Description =>
      '您已经重新连接了您的大脑！一年允许实质性的神经通路改变。许多人报告说，他们看待人际关系、亲密关系和个人成就感的方式发生了彻底的转变。您已经建立了一个新的您！';

  @override
  String get pornographyMilestone1825Title => '持久的人生转变（5年）';

  @override
  String get pornographyMilestone1825Description =>
      '五年的自由！您已经建立了全新的神经模式和生活习惯。研究表明，大脑重新连接可能需要1-60个月，具体取决于成瘾的严重程度，而您已经超过了那个里程碑。';

  @override
  String get customMilestone1Title => '初始康复阶段开始';

  @override
  String get customMilestone1Description =>
      '您的身体开始愈合过程！在戒除后的24小时内，您的系统开始清除毒素并适应在没有成瘾物质的情况下运作。睡眠障碍很常见，但也是康复过程的一部分。';

  @override
  String get customMilestone3Title => '戒断症状达到顶峰';

  @override
  String get customMilestone3Description =>
      '您正在正面迎战风暴！对于许多物质，身体戒断症状通常在第3天左右达到顶峰，包括焦虑、情绪波动和身体不适。这意味着您正在度过最艰难的部分。';

  @override
  String get customMilestone7Title => '急性戒断阶段结束';

  @override
  String get customMilestone7Description =>
      '最糟糕的已经过去了！一周后，大多数物质的急性戒断症状开始消退。您的身体正在适应新的常态并开始稳定。';

  @override
  String get customMilestone14Title => '早期康复稳定';

  @override
  String get customMilestone14Description =>
      '您的头脑正在变得清晰！两周的清醒通常会带来心理清晰度的提高和渴望的减少，因为您的大脑开始适应在没有成瘾物质的情况下运作。';

  @override
  String get customMilestone30Title => '一个月里程碑';

  @override
  String get customMilestone30Description =>
      '一个重大的胜利！三十天的清醒代表了显著的进步。许多人发现睡眠模式、情绪和能量水平在此期间继续改善。';

  @override
  String get customMilestone90Title => '三个月康复里程碑';

  @override
  String get customMilestone90Description =>
      '您的承诺正在得到回报！三个月的康复代表了一个显著的成就。急性后戒断症状通常开始消退，许多人报告说感觉更像自己了。';

  @override
  String get customMilestone180Title => '六个月康复成就';

  @override
  String get customMilestone180Description =>
      '您正在建立持久的改变！六个月的清醒通常会带来身体健康、情绪稳定和整体生活质量的持续改善，因为您的身体继续愈合。';

  @override
  String get customMilestone365Title => '一年康复';

  @override
  String get customMilestone365Description =>
      '一个不可思议的成就！一年的清醒代表了一个重大的人生里程碑。许多人到此时在身体健康、人际关系和整体幸福感方面经历了显著的改善。';

  @override
  String get customMilestone730Title => '两年持续康复';

  @override
  String get customMilestone730Description =>
      '您已经建立了新生活！两年的康复展示了非凡的韧性和承诺。长期清醒通常会带来生活各个方面的深刻积极变化，并显著降低复发风险。';
}
