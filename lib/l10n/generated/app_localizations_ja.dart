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
}
