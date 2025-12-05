// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Quitter';

  @override
  String get tabQuitter => 'Quitter';

  @override
  String get tabJournal => '日記';

  @override
  String get tabSettings => '設定';

  @override
  String get homeAddButton => '追加';

  @override
  String get homeAddTooltip => '独自のカスタム依存を作成して克服しましょう';

  @override
  String get quitCardSubtitle => 'Tap to start';

  @override
  String newVersionToast(String version) {
    return '新しいバージョン $version';
  }

  @override
  String get changesAction => '変更履歴';

  @override
  String hideDialogTitle(String title) {
    return '$titleを非表示にしますか?';
  }

  @override
  String hideDialogMessage(String title) {
    return 'これにより、ホーム画面から$titleオプションが非表示になります。設定から再び表示できます。';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get hide => '非表示';

  @override
  String get addictionAlcohol => 'アルコール';

  @override
  String get addictionVaping => 'ベイピング';

  @override
  String get addictionSmoking => '喫煙';

  @override
  String get addictionMarijuana => 'マリファナ';

  @override
  String get settingsLocaleUnsupported => 'Unsupported';

  @override
  String get settingsLocaleJapanese => 'Japanese';

  @override
  String get settingsLocaleEnglish => 'English';

  @override
  String get settingsLocaleSimplifiedChinese => 'Chinese';

  @override
  String get settingsLocaleSystem => 'System';

  @override
  String get settingsLocale => 'Locale';

  @override
  String get addictionNicotinePouches => 'ニコチンパウチ';

  @override
  String get addictionOpioids => 'オピオイド';

  @override
  String get addictionSocialMedia => 'ソーシャルメディア';

  @override
  String get addictionAC => 'AC';

  @override
  String get addictionAdultContent => 'アダルトコンテンツ';

  @override
  String get settingsSearchHint => '検索...';

  @override
  String get settingsSectionAppearance => '外観';

  @override
  String get settingsSectionSecurity => 'セキュリティ';

  @override
  String get settingsSectionMainScreenItems => 'メイン画面の項目';

  @override
  String get settingsSectionNotifications => '通知';

  @override
  String get settingsSectionSystem => 'システム';

  @override
  String get settingsPinLock => 'PINロック';

  @override
  String get settingsPinLockSubtitle => 'アプリを開く際にPINを要求する';

  @override
  String get settingsPinTimeout => 'PINタイムアウト(秒)';

  @override
  String get settingsPinTimeoutHint => '15';

  @override
  String get settingsTheme => 'テーマ';

  @override
  String get settingsColorScheme => '配色';

  @override
  String get settingsDynamicColorScheme => 'Dynamic colors';

  @override
  String get settingsBlueColorScheme => 'Blue';

  @override
  String get settingsGreenColorScheme => 'Green';

  @override
  String get settingsRedColorScheme => 'Red';

  @override
  String get settingsPurpleColorScheme => 'Purple';

  @override
  String get settingsOrangeColorScheme => 'Orange';

  @override
  String get settingsResetButtons => 'リセットボタン';

  @override
  String get settingsResetButtonsSubtitle => '禁止ページにリセットボタンを表示する';

  @override
  String get settingsShowJournal => '日記を表示';

  @override
  String get settingsShowJournalSubtitle => '考えを記録するための日記タブを有効にする';

  @override
  String get settingsSwipeBetweenTabs => 'タブ間のスワイプ';

  @override
  String get settingsSwipeBetweenTabsSubtitle => '指をドラッグして日記、ホームページ、設定の間を移動する';

  @override
  String get settingsShowAlcoholTracking => 'アルコール追跡を表示';

  @override
  String get settingsShowVapingTracking => 'ベイピング追跡を表示';

  @override
  String get settingsShowSmokingTracking => '喫煙追跡を表示';

  @override
  String get settingsShowMarijuanaTracking => 'マリファナ追跡を表示';

  @override
  String get settingsShowNicotinePouchesTracking => 'ニコチンパウチ追跡を表示';

  @override
  String get settingsShowOpioidsTracking => 'オピオイド追跡を表示';

  @override
  String get settingsShowSocialMediaTracking => 'ソーシャルメディア追跡を表示';

  @override
  String get settingsShowAdultContentTracking => 'アダルトコンテンツ追跡を表示';

  @override
  String get settingsNotificationFrequency => '通知頻度';

  @override
  String settingsNotificationFrequencySubtitle(int days, String time) {
    return '$days日ごと $time';
  }

  @override
  String get settingsNotifyAlcohol => 'アルコール禁止の進捗を通知';

  @override
  String get settingsNotifyVaping => 'ベイピング禁止の進捗を通知';

  @override
  String get settingsNotifySmoking => '喫煙禁止の進捗を通知';

  @override
  String get settingsNotifyMarijuana => 'マリファナ禁止の進捗を通知';

  @override
  String get settingsNotifyNicotinePouches => 'ニコチンパウチ禁止の進捗を通知';

  @override
  String get settingsNotifyOpioids => 'オピオイド禁止の進捗を通知';

  @override
  String get settingsNotifySocialMedia => 'ソーシャルメディア禁止の進捗を通知';

  @override
  String get settingsNotifyAdultContent => 'アダルトコンテンツ禁止の進捗を通知';

  @override
  String get settingsResetMessages => 'リセットメッセージ';

  @override
  String get settingsResetMessagesSubtitle => '再発後にポジティブなメッセージを表示する';

  @override
  String get settingsAbout => 'このアプリについて';

  @override
  String get settingsWhatsNew => '新機能';

  @override
  String get settingsEnjoyingApp => 'アプリを気に入っていただけましたか?';

  @override
  String get settingsReportBug => 'バグを報告';

  @override
  String get settingsExportData => 'データをエクスポート';

  @override
  String get settingsImportData => 'データをインポート';

  @override
  String get settingsDeleteEverything => 'すべてを削除';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get themeSystem => 'システム';

  @override
  String get themePureBlack => '純黒';

  @override
  String get themeMode => 'テーマモード';

  @override
  String get pinDialogSetTitle => 'PINを設定';

  @override
  String get pinDialogEnterPIN => 'PINを入力';

  @override
  String get pinDialogConfirmPIN => 'PINを確認';

  @override
  String get pinDialogSet => '設定';

  @override
  String get pinDialogPINsDoNotMatch => 'PINが一致しません';

  @override
  String get pinDialogPIN => 'PIN';

  @override
  String get pinDialogOK => 'OK';

  @override
  String get notificationFrequencyDialogTitle => '通知頻度';

  @override
  String get notificationFrequencyNotifyEvery => '通知間隔';

  @override
  String get notificationFrequencyDays => '日';

  @override
  String get notificationFrequencyAt => '時刻';

  @override
  String get notificationFrequencySave => '保存';

  @override
  String get notificationTestTitle => 'ポジティブな励まし';

  @override
  String notificationTestBody(int days, String plural) {
    return '$days日$pluralごとに、あなたの進捗を祝福する通知が届きます!';
  }

  @override
  String get deleteEverythingDialogTitle => 'すべてを削除';

  @override
  String get deleteEverythingDialogMessage => '本当にすべてを削除しますか?この操作は取り消せません。';

  @override
  String get deleteEverythingConfirm => '削除する!';

  @override
  String get dataExported => 'データをエクスポートしました!';

  @override
  String get dataImported => 'データを正常にインポートしました!';

  @override
  String get journalHowWasYourDay => '今日はどうでしたか?';

  @override
  String get journalPlaceholder => '今日のこと、思考、感情、覚えておきたいことなど、何でも書いてみましょう...';

  @override
  String journalWordCount(int count) {
    return '$count 文字';
  }

  @override
  String get journalPreviousMonth => '前の月';

  @override
  String get journalNextMonth => '次の月';

  @override
  String get quitMilestonesStart => 'スタート';

  @override
  String get quitMilestonesReset => 'リセット';

  @override
  String get quitMilestonesQuitDate => '禁止開始日';

  @override
  String quitMilestonesClearTitle(int days) {
    return '$days日のマイルストーンをクリアしますか?';
  }

  @override
  String quitMilestonesClearMessage(int days) {
    return 'これにより、$days日のマイルストーンを達成した過去の記録がすべてクリアされます。';
  }

  @override
  String get quitMilestonesClear => 'クリア';

  @override
  String quitMilestonesShareMessage(int days, String plural, String title) {
    return '$titleをやめて$days日$pluralクリーンな状態です!';
  }

  @override
  String get entryPageHeaderStarted => '一歩ずつ強くなっています';

  @override
  String get entryPageHeaderNotStarted => '未開始';

  @override
  String get entryPageSubtitleStarted => '素晴らしいですよ!';

  @override
  String get entryPageSubtitleNotStarted => '「スタート」をタップして旅を始めましょう';

  @override
  String get editEntryAddTitle => 'エントリーを追加';

  @override
  String get editEntryEditTitle => 'エントリーを編集';

  @override
  String get editEntryTitle => 'タイトル';

  @override
  String get editEntryTitleError => 'タイトルを入力してください';

  @override
  String get editEntryColor => '色';

  @override
  String get editEntryIcon => 'アイコン';

  @override
  String get editEntrySave => '保存';

  @override
  String get editEntryDeleteDialogTitle => '本当によろしいですか?';

  @override
  String get editEntryDeleteDialogMessage => '本当にこのエントリーを削除しますか?';

  @override
  String get editEntryDeleteNo => 'いいえ';

  @override
  String get editEntryDeleteYes => 'はい';

  @override
  String get pinPageEnterPIN => 'PINを入力';

  @override
  String get pinPageIncorrectPIN => 'PINが正しくありません';

  @override
  String get pinPageTooManyAttempts => '試行回数が多すぎます。30秒待ってください。';

  @override
  String get aboutPageTitle => 'このアプリについて';

  @override
  String get aboutVersion => 'バージョン';

  @override
  String get aboutAuthor => '作成者';

  @override
  String get aboutAuthorName => 'Brandon Dick';

  @override
  String get aboutLicense => 'ライセンス';

  @override
  String get aboutLicenseMIT => 'MIT';

  @override
  String get aboutDonate => '寄付';

  @override
  String get aboutDonateSubtitle => 'このプロジェクトをサポート';

  @override
  String get aboutSourceCode => 'ソースコード';

  @override
  String get whatsNewTitle => '新機能';

  @override
  String get whatsNewSearchHint => '検索...';

  @override
  String get whatsNewEnjoyingButton => 'アプリを気に入っていただけましたか?';

  @override
  String get enjoyingPageTitle => 'アプリを気に入っていただけましたか?';

  @override
  String get enjoyingLeaveReview => 'レビューを書く';

  @override
  String get enjoyingLeaveReviewSubtitle => 'ご感想をお聞かせください!';

  @override
  String get enjoyingGiveStar => 'スターをつける';

  @override
  String get enjoyingGiveStarSubtitle => 'GitHubでサポートを表明';

  @override
  String get enjoyingDonate => '寄付';

  @override
  String get enjoyingDonateSubtitle => '開発をサポート';

  @override
  String get alcoholPageTitle => 'お酒のない輝く日々';

  @override
  String get alcoholHeaderStarted => 'よく頑張りました!';

  @override
  String get alcoholHeaderNotStarted => 'クリーンな旅の始まり!';

  @override
  String get alcoholSubtitleStarted => '毎日が勝利です 🥳';

  @override
  String get alcoholSubtitleNotStarted => '輝く自分になる準備はできていますか? ✨';

  @override
  String get vapingPageTitle => 'ベイプフリーの勝利';

  @override
  String get vapingHeaderStarted => '晴れやかな未来へ!';

  @override
  String get vapingHeaderNotStarted => 'ベイプのない生活!';

  @override
  String get vapingSubtitleStarted => '楽に呼吸、自由に生きる 🌬️';

  @override
  String get vapingSubtitleNotStarted => 'ベイプをやめる準備はできていますか? ✨';

  @override
  String get smokingPageTitle => '禁煙と飛躍';

  @override
  String get smokingHeaderStarted => '楽に呼吸を!';

  @override
  String get smokingHeaderNotStarted => '禁煙の旅!';

  @override
  String get smokingSubtitleStarted => 'タバコのない毎日が勝利です 🚭';

  @override
  String get smokingSubtitleNotStarted => '健康を取り戻す準備はできていますか? ✨';

  @override
  String get marijuanaPageTitle => '大麻フリーの旅';

  @override
  String get marijuanaHeaderStarted => 'クリアな心の目覚め!';

  @override
  String get marijuanaHeaderNotStarted => '大麻のない生活!';

  @override
  String get marijuanaSubtitleStarted => '一日ずつ、心の明晰さを築いていきましょう 🧠';

  @override
  String get marijuanaSubtitleNotStarted => 'クリアな明日への準備はできていますか? 🌱';

  @override
  String get nicotinePouchesPageTitle => 'パウチフリーのパワー';

  @override
  String get nicotinePouchesHeaderStarted => '爽快で自由!';

  @override
  String get nicotinePouchesHeaderNotStarted => 'パウチフリーの進歩!';

  @override
  String get nicotinePouchesSubtitleStarted => 'より明るく健康的な自分を受け入れましょう ✨';

  @override
  String get nicotinePouchesSubtitleNotStarted => 'パウチをやめる準備はできていますか? 🚀';

  @override
  String get opioidsPageTitle => '平安への道';

  @override
  String get opioidsHeaderStarted => '毎日強くなっています!';

  @override
  String get opioidsHeaderNotStarted => '回復への道!';

  @override
  String get opioidsSubtitleStarted => 'あなたの強さを受け入れましょう 💪';

  @override
  String get opioidsSubtitleNotStarted => '人生を取り戻す準備はできていますか? 💖';

  @override
  String get opioidsInfoBox => '回復は医療プロセスです。必ず医療専門家に相談してください。';

  @override
  String get socialMediaPageTitle => 'デジタルデトックスの喜び';

  @override
  String get socialMediaHeaderStarted => 'オフラインで楽しもう!';

  @override
  String get socialMediaHeaderNotStarted => 'デジタルデトックスの旅!';

  @override
  String get socialMediaSubtitleStarted => '現実の生活が最高のフィードです 💖';

  @override
  String get socialMediaSubtitleNotStarted => '時間を取り戻す準備はできていますか? 🚀';

  @override
  String get pornographyPageTitle => '純粋で力強く';

  @override
  String get pornographyHeaderStarted => '心を取り戻しています!';

  @override
  String get pornographyHeaderNotStarted => '旅を始めましょう!';

  @override
  String get pornographySubtitleStarted => '本物のつながりを築いていきます 🧠✨';

  @override
  String get pornographySubtitleNotStarted => '解放され、再構築する準備はできていますか? 💪';

  @override
  String get relapseMessage1 => '回復は直線的ではありません。すべての前進が大切で、この一歩も含まれます。';

  @override
  String get relapseMessage2 => 'あなたはここにいて、努力しています。それには本当の勇気が必要です。';

  @override
  String get relapseMessage3 => '後退はあなたの進歩を消すものではありません。あなたは学び、成長しています。';

  @override
  String get relapseMessage4 => '再スタートはあなたの強さの証であり、弱さのサインではありません。';

  @override
  String get relapseMessage5 => '明日は新しいスタートです。あなたならできます。';

  @override
  String get relapseMessage6 => 'あなたの価値は完璧な記録では決まりません。あなたには価値があります。';

  @override
  String get relapseMessage7 => '回復は山と谷のある旅です。歩き続けましょう。';

  @override
  String get relapseMessage8 => '以前スタートする強さがあったのだから、今もまたその強さがあります。';

  @override
  String get relapseMessage9 => '一瞬があなたの未来の旅全体を決めるわけではありません。';

  @override
  String get relapseMessage10 => 'ここにいることは、諦めていない証です。それは強力です。';

  @override
  String get relapseMessage11 => '進歩とは完璧さではなく、粘り強さです。';

  @override
  String get relapseMessage12 => 'あなたは試みるたびに回復力を築いています。築き続けましょう。';

  @override
  String get relapseMessage13 => '再び挑戦することへのあなたのコミットメントは、すでに勝利です。';

  @override
  String get relapseMessage14 => '癒しは一瞬では起きませんが、あなたの選択一つ一つで起きています。';

  @override
  String get relapseMessage15 => '最初からやり直しているのではなく、より多くの知恵を持って続けているのです。';

  @override
  String get relapseMessage16 => 'すべての専門家はかつて初心者でした。すべてのプロはかつて素人でした。';

  @override
  String get relapseMessage17 => '回復は一日ずつ、時には一時間ずつ起こります。';

  @override
  String get relapseMessage18 => 'あなたは復活のストーリーを書いています。これはただの一章です。';

  @override
  String get relapseMessage19 => 'あなたがここにいるという事実は、自分自身を大切にしている証拠です。それを忘れないで。';

  @override
  String get relapseMessage20 => '正しい方向への小さな一歩も、前進です。';

  @override
  String get undo => '取り消す';

  @override
  String get ok => 'OK';

  @override
  String get alcoholMilestone1Title => '睡眠の質が改善し始める';

  @override
  String get alcoholMilestone1Description =>
      '初日からREM睡眠のサイクルが正常化し始めます。アルコールは最初は眠りにつくのを助けるかもしれませんが、夜を通して深い睡眠とREMサイクルを乱し、断片的な睡眠を引き起こします。';

  @override
  String get alcoholMilestone3Title => '水分バランスが回復';

  @override
  String get alcoholMilestone3Description =>
      '腎臓がアルコールの利尿作用から回復しています。アルコールは抗利尿ホルモンを抑制し、排尿の増加と脱水を引き起こします。3日目には、体の水分バランスが大幅に改善しています。';

  @override
  String get alcoholMilestone7Title => '免疫システムが強化';

  @override
  String get alcoholMilestone7Description =>
      '白血球の機能が回復しています。たった一度の深酒でも最大24時間免疫機能を低下させ、慢性的な飲酒は感染症と闘う体の能力を著しく弱めます。';

  @override
  String get alcoholMilestone14Title => '脳の容積回復が始まる';

  @override
  String get alcoholMilestone14Description =>
      '禁酒から2週間以内に脳の容積の急速な回復が始まります。研究によると、14日目頃から脳組織の回復の兆候が見られますが、完全な認知機能は数ヶ月かけて改善し続けます。';

  @override
  String get alcoholMilestone30Title => '血圧が正常化';

  @override
  String get alcoholMilestone30Description =>
      '心血管系が大幅に改善しています。定期的なアルコール摂取は血圧を上昇させますが、約1ヶ月の禁酒で血圧をより健康的なレベルに戻すことができます。';

  @override
  String get alcoholMilestone60Title => '肝機能が改善';

  @override
  String get alcoholMilestone60Description =>
      '肝臓の機能に測定可能な改善が見られます。この再生能力のある臓器は、アルコールによるダメージから大幅に回復でき、禁酒2ヶ月以内に肝酵素と脂肪蓄積の改善が見られます。';

  @override
  String get alcoholMilestone90Title => '認知機能が大幅に改善';

  @override
  String get alcoholMilestone90Description =>
      '最初の3ヶ月で重要な認知回復が起こります。研究によると、禁酒を続ける人々は数ヶ月にわたって認知機能を回復し続け、記憶力、集中力、意思決定に測定可能な改善が見られます。';

  @override
  String get alcoholMilestone180Title => '脳の容積と機能が継続的に回復';

  @override
  String get alcoholMilestone180Description =>
      '6ヶ月の禁酒は継続的な神経回復を可能にします。研究によると、この持続的な禁酒期間中、脳の容積は増加し続け、認知能力も大幅に改善し続けます。';

  @override
  String get alcoholMilestone365Title => 'がんリスクの低減が始まる可能性';

  @override
  String get alcoholMilestone365Description =>
      '1年間の禁酒でがんリスクの低減が始まる可能性があります。アルコールは明らかにいくつかのがん（肝臓、乳房、大腸、食道）のリスクを高めますが、リスク低減のタイムラインに関する研究はまだ発展途上であり、がんの種類によって異なります。';

  @override
  String get smokingMilestone1Title => '一酸化炭素が消える';

  @override
  String get smokingMilestone1Description =>
      '血液が再び呼吸しています！24時間以内に一酸化炭素レベルが正常に戻り、酸素レベルが上昇します。心臓はもう毒された血液を体中にポンプする必要がありません。';

  @override
  String get smokingMilestone3Title => 'ニコチン離脱がピークに';

  @override
  String get smokingMilestone3Description =>
      'ニコチンの怪物は最も怒っていますが、あなたは戦いに勝っています！すべてのニコチンが体から排出されました。最悪の渇望は今起きていますが、それは自由への切符でもあります。';

  @override
  String get smokingMilestone7Title => '味覚と嗅覚が劇的に改善';

  @override
  String get smokingMilestone7Description =>
      '食べ物が再び冒険になろうとしています！喫煙は味蕾と嗅覚受容体を破壊します。1週間で、忘れていた味を再発見しています。本格的な食の楽しみの準備をしましょう！';

  @override
  String get smokingMilestone14Title => '血行と歩行が改善';

  @override
  String get smokingMilestone14Description =>
      'あなたの足は一歩ごとに感謝しています！血液循環が劇的に改善し、歩行と運動が明らかに楽になります。あの階段ももうそれほど怖くないでしょう？';

  @override
  String get smokingMilestone30Title => '肺機能が向上';

  @override
  String get smokingMilestone30Description =>
      '肺がカムバックパーティーを開いています！繊毛が再生し、何年ものタールや破片を掃き出しています。肺活量が大幅に増加し、喫煙者の咳は過去のものになりました。';

  @override
  String get smokingMilestone90Title => '心臓発作のリスクが大幅に低下';

  @override
  String get smokingMilestone90Description =>
      '心臓がラブレターを送っています！禁煙3ヶ月で心血管リスクはすでに大幅に低下しています。心血管系は思っている以上に速く回復しています。';

  @override
  String get smokingMilestone180Title => '免疫システムが強化';

  @override
  String get smokingMilestone180Description =>
      '免疫システムがスーパーヒーローにアップグレードされました！禁煙6ヶ月で白血球はフルパワーに戻り、生まれながらのチャンピオンのように感染症と戦っています。';

  @override
  String get smokingMilestone365Title => '脳卒中リスクが大幅に減少';

  @override
  String get smokingMilestone365Description =>
      '自由の1年間！脳卒中リスクは大幅に減少し、血管は美しく回復しています。脳により良い循環と保護というギフトを正式に与えました。';

  @override
  String get smokingMilestone1825Title => 'がんリスクが激減（5年）';

  @override
  String get smokingMilestone1825Description =>
      '5年間の勝利！口、喉、食道、膀胱がんのリスクは半分に減少しました。肺がんのリスクも大幅に減少しています。細胞は修復と再生の時間を得ました。';

  @override
  String get vapingMilestone1Title => 'ニコチン渇望がピークに';

  @override
  String get vapingMilestone1Description =>
      '脳がニコチンを求めて暴れていますが、あなたはもう勝ち始めています！24時間以内にニコチンレベルは劇的に低下します。最悪の渇望は今起きていますが、乗り越えることが最も重要です。';

  @override
  String get vapingMilestone3Title => '呼吸が改善';

  @override
  String get vapingMilestone3Description =>
      '肺が喜びのダンスをしています！気管支がリラックスし始め、肺活量が改善し始めます。ベイピングによる胸の締め付け感がすでに和らぎ始めています。';

  @override
  String get vapingMilestone7Title => '味覚と嗅覚が戻る';

  @override
  String get vapingMilestone7Description =>
      '食べ物がまた美味しくなろうとしています！ニコチンは味蕾と嗅覚受容体を鈍らせます。1週間で、あなたの感覚のスーパーパワーがカムバックツアーを開始しています。';

  @override
  String get vapingMilestone14Title => '血行が改善';

  @override
  String get vapingMilestone14Description =>
      '血液がチャンピオンのように流れています！ニコチンは血管を収縮させますが、2週間ベイプフリーであなたの血行は劇的に改善しています。冷たい手足よ、さようなら！';

  @override
  String get vapingMilestone30Title => '肺機能の回復';

  @override
  String get vapingMilestone30Description =>
      '肺が実質的にお祝いパレードを開いています！繊毛（小さな肺の掃除屋）が再生し、肺機能が大幅に改善しました。朝の咳は過去のものになりました！';

  @override
  String get vapingMilestone60Title => '不安レベルが正常化';

  @override
  String get vapingMilestone60Description =>
      'どんでん返し：ベイピングは不安問題を良くするどころか悪化させていました！2ヶ月経ってベースラインの不安レベルは大幅に低下しています。神経系がついにリラックスしています。';

  @override
  String get vapingMilestone90Title => '認知機能が鋭くなる';

  @override
  String get vapingMilestone90Description =>
      '脳霧が正式に去りました！ニコチンなしで3ヶ月、認知機能、集中力、記憶力が大幅に改善しました。メンタルRAMをアップグレードしたようなものです。';

  @override
  String get vapingMilestone180Title => '口腔の健康が回復';

  @override
  String get vapingMilestone180Description =>
      'あなたの口がお礼状を送っています！ベイプフリー6ヶ月で歯茎の炎症が減少し、歯の着色が薄れ、口腔の健康問題のリスクが大幅に低下します。';

  @override
  String get vapingMilestone365Title => '心血管リスクの低減';

  @override
  String get vapingMilestone365Description =>
      '心臓が文字通り強くなりました！丸1年で心臓病のリスクが大幅に低下しました。心血管系がニコチンの日々の攻撃コースから回復しました。';

  @override
  String get marijuanaMilestone1Title => '離脱症状が始まる';

  @override
  String get marijuanaMilestone1Description =>
      '脳がTHCのない生活に適応しています！24〜48時間以内に、イライラ、不安、睡眠障害を経験するかもしれません。これは完全に正常です - カンナビノイド受容体がリセットを開始しています。';

  @override
  String get marijuanaMilestone3Title => '身体症状がピークに';

  @override
  String get marijuanaMilestone3Description =>
      '最も厳しいポイントにいますが、ここからはすべて上り坂です！2〜6日目は通常、頭痛、発汗、気分の変化を含むピークの離脱症状が見られます。体はバランスを取り戻すために懸命に働いています。';

  @override
  String get marijuanaMilestone7Title => '睡眠パターンが改善';

  @override
  String get marijuanaMilestone7Description =>
      '甘い夢がカムバックしています！大麻なしで1週間後、自然な睡眠構造が正常化し始めます。REM睡眠がリバウンドし、より鮮明な夢とより良い休息の質につながります。';

  @override
  String get marijuanaMilestone14Title => '急性離脱が終了';

  @override
  String get marijuanaMilestone14Description =>
      '嵐は過ぎ去りました！2週間後、ほとんどの身体的離脱症状は大幅に減少します。気分が安定し、日常生活がはるかに楽になります。最も困難な部分はあなたの後ろにあります。';

  @override
  String get marijuanaMilestone30Title => '記憶機能が改善';

  @override
  String get marijuanaMilestone30Description =>
      '脳霧が晴れています！研究によると、大麻の使用を止めた後、言語学習と記憶が大幅に改善し始めます。記憶形成に重要な海馬がより良く機能し始めます。';

  @override
  String get marijuanaMilestone60Title => '集中力が鋭くなる';

  @override
  String get marijuanaMilestone60Description =>
      'フォーカスモード：起動！大麻なしで2ヶ月、集中力と注意力を維持する能力が著しく改善されます。仕事のタスクや勉強が明らかに管理しやすくなります。';

  @override
  String get marijuanaMilestone90Title => '気分の安定性が戻る';

  @override
  String get marijuanaMilestone90Description =>
      '感情のバランスが回復！3ヶ月の禁欲は、気分調節の大幅な改善、不安レベルの低下、ストレス管理の改善をもたらします。感情のベースラインが正常化しています。';

  @override
  String get marijuanaMilestone180Title => '実行機能の回復';

  @override
  String get marijuanaMilestone180Description =>
      'メンタルCEOが再び指揮を執っています！大麻なしで6ヶ月、実行機能 - 計画、意思決定、問題解決能力 - が大幅に向上しています。';

  @override
  String get marijuanaMilestone365Title => '脳構造の復元';

  @override
  String get marijuanaMilestone365Description =>
      '神経アーキテクチャが再構築されました！1年間の禁欲により、慢性的な大麻使用の影響を受けた脳領域の大幅な回復が可能になります。認知機能の改善があなたの新しい常態となり、学習と記憶に持続的な恩恵をもたらします。';

  @override
  String get opioidMilestone1Title => '急性離脱症状が始まる';

  @override
  String get opioidMilestone1Description =>
      '最も困難な部分が今始まりますが、あなたは一人ではありません。急性離脱症状は最初の24〜72時間でピークに達します。これは体が回復プロセスを開始していることを意味します。この段階では専門的な医療サポートが非常に重要です。';

  @override
  String get opioidMilestone7Title => '身体症状がピークを迎え減少し始める';

  @override
  String get opioidMilestone7Description =>
      '嵐を乗り越えました！最悪の身体的離脱症状は通常3〜5日目頃にピークに達し、7日目までに減少し始めます。体は自然なバランスを取り戻すために懸命に働いています。';

  @override
  String get opioidMilestone14Title => '睡眠パターンが改善し始める';

  @override
  String get opioidMilestone14Description =>
      '甘い夢がカムバックしています！2週間経つと、自然な睡眠構造が回復し始めます。オピオイドはREM睡眠を乱しますが、脳は再び自然に夢を見ることを学んでいます。';

  @override
  String get opioidMilestone30Title => '認知機能が回復し始める';

  @override
  String get opioidMilestone30Description =>
      '脳霧が晴れ始めています！1ヶ月クリーンで、認知機能、意思決定、記憶が改善し始めています。前頭前皮質がオピオイドによる変化から回復しています。';

  @override
  String get opioidMilestone60Title => '感情調節が改善';

  @override
  String get opioidMilestone60Description =>
      '感情が自然なリズムを取り戻しています。回復から2ヶ月、脳の報酬系が日常の喜びに反応し始めています。感情のジェットコースターが安定してきています。';

  @override
  String get opioidMilestone90Title => 'ドーパミン機能が大幅に回復';

  @override
  String get opioidMilestone90Description =>
      '脳の報酬系がウェルカムバックパーティーを開いています！3ヶ月クリーンでドーパミン機能が大幅に改善しました。自然な活動が再び報酬的に感じられるようになります - 食事、音楽、人間関係。';

  @override
  String get opioidMilestone180Title => '免疫システムが強化';

  @override
  String get opioidMilestone180Description =>
      '免疫システムが警備任務に復帰しました！6ヶ月の回復で体の自然な防御機能が大幅に強化されました。感染症や病気と戦う準備が整いました。';

  @override
  String get opioidMilestone365Title => '神経可塑性と脳構造が改善';

  @override
  String get opioidMilestone365Description =>
      '脳がリノベーション作業を続けてきました！丸1年の回復で脳構造と神経可塑性に大幅な改善が見られます。慢性的なオピオイド使用による変化が美しく回復しています。';

  @override
  String get opioidMilestone730Title => '長期回復の安定（2年）';

  @override
  String get opioidMilestone730Description =>
      '2年間の強さと回復力！新しい神経経路、対処戦略、生活パターンを構築しました。研究によると、このマイルストーンに到達すると再発リスクが劇的に減少します。あなたは回復の戦士です！';

  @override
  String get socialMediaMilestone1Title => 'デジタルデトックス1日目！ 🎯';

  @override
  String get socialMediaMilestone1Description =>
      '正式に脳のリワイヤリングを開始しました！研究によると、ソーシャルメディアをチェックしようと考えるだけで、依存症と同じ神経経路が活性化されます。しかし、あなたはすでにそのサイクルを断ち切っています - すごい！';

  @override
  String get socialMediaMilestone3Title => 'FOMO？むしろFO-NO！ 😎';

  @override
  String get socialMediaMilestone3Description =>
      '3日目で、あの不安な「何か見逃してるかも？」という考えがすでに薄れてきています。現実の生活がキュレーションされたフィードよりずっと面白いと、脳を訓練しています！';

  @override
  String get socialMediaMilestone7Title => '集中力：金魚 → 人間 🧠';

  @override
  String get socialMediaMilestone7Description =>
      '1週間完了！数分ごとにスマホをチェックせずに集中する能力がすでに向上しています。研究によると、私たちの脳は通知からのドーパミンを欲しがりますが、あなたは別の場所で報酬を見つけることを教えています！';

  @override
  String get socialMediaMilestone14Title => '赤ちゃんのように眠る（ゾンビではなく） 😴';

  @override
  String get socialMediaMilestone14Description =>
      '寝る前にスクロールしない2週間 = より良い睡眠の質！画面からのブルーライトはメラトニンの生成を抑制しますが、自然な睡眠リズムが美しく回復しています。';

  @override
  String get socialMediaMilestone30Title => '本当の友達 > 偽のいいね 💝';

  @override
  String get socialMediaMilestone30Description =>
      '1ヶ月オフライン = 孤独感とうつ病の大幅な減少！研究によると、ソーシャルメディアを制限することで大きなメンタルヘルスの改善が生まれます。あなたはさらに先を行っています！';

  @override
  String get socialMediaMilestone60Title => '比較の罠：脱出成功！ ✨';

  @override
  String get socialMediaMilestone60Description =>
      '絶え間ない社会的比較なしの2ヶ月 = 自信が急上昇！研究は一貫して、ソーシャルメディアの使用が自尊心の低下と相関していること、特に上方社会比較からのものを示しています。比較の罠から解放されました！';

  @override
  String get socialMediaMilestone90Title => '趣味コレクターレベル：エキスパート 🎨';

  @override
  String get socialMediaMilestone90Description =>
      '3ヶ月 = 約270時間以上を取り戻しました！これは新しいスキルを学んだり、15冊以上の本を読んだり、「いつか」と言っていた趣味をマスターするのに十分な時間です。神経可塑性研究によると、脳は文字通りこれらの新しい素晴らしい習慣に向けてリワイヤリングしています！';

  @override
  String get socialMediaMilestone180Title => 'メンタルヘルスのグロウアップ完了 🌟';

  @override
  String get socialMediaMilestone180Description =>
      '6ヶ月オフラインで正式に繁栄しています！長期研究によると、ソーシャルメディアの使用を減らすことで、幸福感、自尊心、人生の満足度が持続的に向上します。現実世界での生活がより良いという生きた証拠です！';

  @override
  String get socialMediaMilestone365Title => 'デジタル禅マスター達成 🏆';

  @override
  String get socialMediaMilestone365Description =>
      '丸1年の意図的な生活！1,000時間以上を取り戻し、より深い人間関係を形成し、人生で最高の瞬間は共有するためではなく、体験するためにあることを証明しました。あなたは正式にデジタルウェルネスの伝説です！';

  @override
  String get nicotinePouchesMilestone1Title => '味覚と嗅覚が回復し始める';

  @override
  String get nicotinePouchesMilestone1Description =>
      'ニコチンは味蕾と嗅覚受容体を鈍らせます。パウチなしでわずか24時間後、これらの感覚がカムバックツアーを開始します！食べ物がまた美味しくなろうとしています。';

  @override
  String get nicotinePouchesMilestone3Title => 'ニコチンが完全に排出';

  @override
  String get nicotinePouchesMilestone3Description =>
      '体が正式にすべてのニコチンを追い出しました！離脱症状は今頃ピークかもしれませんが、覚えておいてください - これはあなたの脳が自由のために自らをリワイヤリングしているのです。最も困難な部分はほぼ終わりです。';

  @override
  String get nicotinePouchesMilestone7Title => '口腔の健康が改善';

  @override
  String get nicotinePouchesMilestone7Description =>
      '歯茎がお祝いをしています！ニコチンパウチは歯茎の炎症や後退を引き起こす可能性があります。1週間後、歯茎への血流が正常化し、治癒が始まります。';

  @override
  String get nicotinePouchesMilestone14Title => '血行が向上';

  @override
  String get nicotinePouchesMilestone14Description =>
      '血管がハッピーダンスをしています！ニコチンは血管を収縮させますが、2週間フリーであなたの血行は大幅に改善されています。こんにちは、温かい手足！';

  @override
  String get nicotinePouchesMilestone30Title => 'ストレス反応が正常化';

  @override
  String get nicotinePouchesMilestone30Description =>
      'どんでん返し：ニコチンは実際に使用の間のストレスを増加させます！コルチゾールレベルとストレス反応がベースラインに戻っています。本物のリラクゼーション、ニコチンの偽物ではありません。';

  @override
  String get nicotinePouchesMilestone60Title => '睡眠の質が改善';

  @override
  String get nicotinePouchesMilestone60Description =>
      '甘い夢は...ニコチンなしで作られます！ニコチンはリラックスするように見えますが、実際には睡眠構造を乱します。2ヶ月経ち、REMサイクルが美しく回復しました。';

  @override
  String get nicotinePouchesMilestone90Title => 'ドーパミン受容体が回復';

  @override
  String get nicotinePouchesMilestone90Description =>
      '脳の報酬系がオンラインに戻りました！ニコチンはドーパミン経路をハイジャックし、通常の喜びを鈍く感じさせます。3ヶ月フリーで、人生の自然な喜びが再び鮮やかになりました。';

  @override
  String get nicotinePouchesMilestone180Title => '心血管リスクが低下';

  @override
  String get nicotinePouchesMilestone180Description =>
      '心臓がラブレターを送っています！ニコチンなしで6ヶ月、心血管疾患のリスクが大幅に減少しています。血圧と心拍変動性が大幅に改善しました。';

  @override
  String get nicotinePouchesMilestone365Title => '長期的な健康を確保';

  @override
  String get nicotinePouchesMilestone365Description =>
      '自由の1年！ニコチン関連の健康問題のリスクは減少し続けています。依存のサイクルを断ち切り、自律性を取り戻しました。これは本当に英雄的です！ 🏆';

  @override
  String get pornographyMilestone1Title => 'サイクルを断ち切る';

  @override
  String get pornographyMilestone1Description =>
      '最も難しい一歩を踏み出しました！1日目は自動的な反応パターンを断ち切ることです。脳はすでに期待していたドーパミンの急上昇がないことに気づき始めています。';

  @override
  String get pornographyMilestone3Title => '離脱症状がピークに';

  @override
  String get pornographyMilestone3Description =>
      '嵐の前の静けさ。渇望、落ち着きのなさ、気分の変動が今最も強くなっています。脳は自らをリワイヤリングするために懸命に働いています。この不快感は実際には神経経路が癒えている証拠です！';

  @override
  String get pornographyMilestone7Title => '睡眠の質が改善';

  @override
  String get pornographyMilestone7Description =>
      '甘い夢はこうして作られます！脳の報酬系が再バランスし始めると、睡眠サイクルが安定してきます。多くの人がより深く、より回復力のある睡眠と、より少ない睡眠障害を報告しています。';

  @override
  String get pornographyMilestone14Title => 'モチベーションとエネルギーが戻る';

  @override
  String get pornographyMilestone14Description =>
      '霧が晴れています！多くの人がモチベーションの向上、より明確な思考、現実世界の活動へのより多くのエネルギーを感じます。脳の自然な報酬系が日常の経験から再び喜びを見出し始めています。';

  @override
  String get pornographyMilestone30Title => '自信と自制心が育つ';

  @override
  String get pornographyMilestone30Description =>
      'メンタルの筋肉を鍛えています！1ヶ月の禁欲は、しばしば自信の向上、より良い感情調節、より強い個人的なコントロール感をもたらします。あなたは自分が困難を克服できることを自分自身に証明しています。';

  @override
  String get pornographyMilestone90Title => '脳機能が安定';

  @override
  String get pornographyMilestone90Description =>
      '脳がバランスを見つけています！3ヶ月で集中力、意思決定、感情調節に大幅な改善が見られます。衝動的な欲求がはるかに管理しやすくなっています。';

  @override
  String get pornographyMilestone180Title => '人間関係と社会的スキルが改善';

  @override
  String get pornographyMilestone180Description =>
      'つながりがあなたのスーパーパワーになりました！6ヶ月は、本物のつながりを形成する能力の向上、より良いアイコンタクト、社会不安の軽減、より本物の人間関係をもたらすことが多いです。';

  @override
  String get pornographyMilestone365Title => '神経経路の完全リセット';

  @override
  String get pornographyMilestone365Description =>
      '脳をリワイヤリングしました！1年で大幅な神経経路の変化が可能になります。多くの人が人間関係、親密さ、個人的な充実感の見方が完全に変わったと報告しています。新しいあなたを築きました！';

  @override
  String get pornographyMilestone1825Title => '持続的な人生の変革（5年）';

  @override
  String get pornographyMilestone1825Description =>
      '5年間の自由！まったく新しい神経パターンと生活習慣を確立しました。研究によると、脳のリワイヤリングには依存の重症度によって1〜60ヶ月かかる可能性がありますが、あなたはそのマイルストーンを超えました。';

  @override
  String get customMilestone1Title => '回復の初期段階が始まる';

  @override
  String get customMilestone1Description =>
      '体が癒しのプロセスを開始します！やめてから24時間以内に、あなたの体は毒素を排出し、依存物質なしで機能するように調整を始めます。睡眠障害は一般的ですが、回復プロセスの一部です。';

  @override
  String get customMilestone3Title => '離脱症状がピークに';

  @override
  String get customMilestone3Description =>
      '嵐に真正面から立ち向かっています！多くの物質において、不安、気分の変動、身体的不快感などの身体的離脱症状は3日目頃にピークを迎えます。これは最も困難な部分を乗り越えているということです。';

  @override
  String get customMilestone7Title => '急性離脱期が終わる';

  @override
  String get customMilestone7Description =>
      '最悪の時期は過ぎました！1週間後、ほとんどの物質で急性離脱症状が治まり始めます。体は新しい正常に適応し、安定し始めています。';

  @override
  String get customMilestone14Title => '早期回復の安定化';

  @override
  String get customMilestone14Description =>
      '頭がすっきりしてきています！2週間の断酒・断薬は、脳が依存物質なしで機能することに適応し始めるにつれて、精神的な明晰さの向上と渇望の減少をもたらすことが多いです。';

  @override
  String get customMilestone30Title => '1ヶ月のマイルストーン';

  @override
  String get customMilestone30Description =>
      '大きな勝利です！30日間の断酒・断薬は重要な進歩を示しています。多くの人が、この期間中に睡眠パターン、気分、エネルギーレベルが改善し続けると感じています。';

  @override
  String get customMilestone90Title => '3ヶ月の回復マイルストーン';

  @override
  String get customMilestone90Description =>
      'あなたのコミットメントが報われています！3ヶ月の回復は重要な達成を表しています。急性離脱後の症状は通常薄れ始め、多くの人が再び自分らしく感じると報告しています。';

  @override
  String get customMilestone180Title => '6ヶ月の回復達成';

  @override
  String get customMilestone180Description =>
      '持続的な変化を築いています！6ヶ月の断酒・断薬は、体が癒し続けるにつれて、身体的健康、感情的安定性、生活の質全体の継続的な改善をもたらすことが多いです。';

  @override
  String get customMilestone365Title => '1年間の回復';

  @override
  String get customMilestone365Description =>
      '信じられない達成です！1年間の断酒・断薬は人生の大きなマイルストーンです。多くの人がこの時点で、身体的健康、人間関係、全体的な幸福感に大きな改善を経験しています。';

  @override
  String get customMilestone730Title => '2年間の持続的な回復';

  @override
  String get customMilestone730Description =>
      '新しい人生を築きました！2年間の回復は、驚くべき回復力とコミットメントを示しています。長期的な断酒・断薬は、人生のあらゆる分野で深い前向きな変化と、再発リスクの大幅な減少をもたらすことが多いです。';
}
