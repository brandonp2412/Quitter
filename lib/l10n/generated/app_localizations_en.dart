// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Quitter';

  @override
  String get tabQuitter => 'Quitter';

  @override
  String get tabJournal => 'Journal';

  @override
  String get tabSettings => 'Settings';

  @override
  String get homeAddButton => 'Add';

  @override
  String get homeAddTooltip => 'Create your own custom addiction to quit';

  @override
  String newVersionToast(String version) {
    return 'New version $version';
  }

  @override
  String get changesAction => 'Changes';

  @override
  String hideDialogTitle(String title) {
    return 'Hide $title?';
  }

  @override
  String hideDialogMessage(String title) {
    return 'This will hide the $title option from your home screen. You can show it again in Settings.';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get hide => 'Hide';

  @override
  String get addictionAlcohol => 'Alcohol';

  @override
  String get addictionVaping => 'Vaping';

  @override
  String get addictionSmoking => 'Smoking';

  @override
  String get addictionMarijuana => 'Marijuana';

  @override
  String get addictionNicotinePouches => 'Nicotine Pouches';

  @override
  String get addictionOpioids => 'Opioids';

  @override
  String get addictionSocialMedia => 'Social Media';

  @override
  String get addictionAC => 'AC';

  @override
  String get addictionAdultContent => 'Adult content';

  @override
  String get settingsSearchHint => 'Search...';

  @override
  String get settingsSectionAppearance => 'Appearance';

  @override
  String get settingsSectionSecurity => 'Security';

  @override
  String get settingsSectionMainScreenItems => 'Main Screen Items';

  @override
  String get settingsSectionNotifications => 'Notifications';

  @override
  String get settingsSectionSystem => 'System';

  @override
  String get settingsPinLock => 'PIN lock';

  @override
  String get settingsPinLockSubtitle => 'Require PIN to open app';

  @override
  String get settingsPinTimeout => 'PIN timeout (seconds)';

  @override
  String get settingsPinTimeoutHint => '15';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsColorScheme => 'Color scheme';

  @override
  String get settingsResetButtons => 'Reset buttons';

  @override
  String get settingsResetButtonsSubtitle => 'Show reset buttons on quit pages';

  @override
  String get settingsShowJournal => 'Show journal';

  @override
  String get settingsShowJournalSubtitle =>
      'Enable the journal tab for logging your thoughts';

  @override
  String get settingsSwipeBetweenTabs => 'Swipe between tabs';

  @override
  String get settingsSwipeBetweenTabsSubtitle =>
      'Dragging your finger moves between Journal, Homepage & Settings';

  @override
  String get settingsShowAlcoholTracking => 'Show alcohol tracking';

  @override
  String get settingsShowVapingTracking => 'Show vaping tracking';

  @override
  String get settingsShowSmokingTracking => 'Show smoking tracking';

  @override
  String get settingsShowMarijuanaTracking => 'Show marijuana tracking';

  @override
  String get settingsShowNicotinePouchesTracking =>
      'Show nicotine pouches tracking';

  @override
  String get settingsShowOpioidsTracking => 'Show opioids tracking';

  @override
  String get settingsShowSocialMediaTracking => 'Show social media tracking';

  @override
  String get settingsShowAdultContentTracking => 'Show adult content tracking';

  @override
  String get settingsNotificationFrequency => 'Notification frequency';

  @override
  String settingsNotificationFrequencySubtitle(int days, String time) {
    return 'Every $days day(s) at $time';
  }

  @override
  String get settingsNotifyAlcohol => 'Notify alcohol quitting progress';

  @override
  String get settingsNotifyVaping => 'Notify vaping quitting progress';

  @override
  String get settingsNotifySmoking => 'Notify smoking quitting progress';

  @override
  String get settingsNotifyMarijuana => 'Notify marijuana quitting progress';

  @override
  String get settingsNotifyNicotinePouches =>
      'Notify nicotine pouches quitting progress';

  @override
  String get settingsNotifyOpioids => 'Notify opioids quitting progress';

  @override
  String get settingsNotifySocialMedia =>
      'Notify social media quitting progress';

  @override
  String get settingsNotifyAdultContent =>
      'Notify adult content quitting progress';

  @override
  String get settingsResetMessages => 'Reset messages';

  @override
  String get settingsResetMessagesSubtitle =>
      'Show positive reinforcement after relapses';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsWhatsNew => 'What\'s new';

  @override
  String get settingsEnjoyingApp => 'Enjoying the app?';

  @override
  String get settingsReportBug => 'Report a bug';

  @override
  String get settingsExportData => 'Export data';

  @override
  String get settingsImportData => 'Import data';

  @override
  String get settingsDeleteEverything => 'Delete everything';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System';

  @override
  String get themePureBlack => 'Pure black';

  @override
  String get themeMode => 'Theme mode';

  @override
  String get pinDialogSetTitle => 'Set PIN';

  @override
  String get pinDialogEnterPIN => 'Enter PIN';

  @override
  String get pinDialogConfirmPIN => 'Confirm PIN';

  @override
  String get pinDialogSet => 'Set';

  @override
  String get pinDialogPINsDoNotMatch => 'PINs do not match';

  @override
  String get pinDialogPIN => 'PIN';

  @override
  String get pinDialogOK => 'OK';

  @override
  String get notificationFrequencyDialogTitle => 'Notification frequency';

  @override
  String get notificationFrequencyNotifyEvery => 'Notify every';

  @override
  String get notificationFrequencyDays => 'day(s)';

  @override
  String get notificationFrequencyAt => 'At';

  @override
  String get notificationFrequencySave => 'Save';

  @override
  String get notificationTestTitle => 'Positive affirmation';

  @override
  String notificationTestBody(int days, String plural) {
    return 'You will see a notification like this every $days day$plural congratulating you on your progress!';
  }

  @override
  String get deleteEverythingDialogTitle => 'Delete everything';

  @override
  String get deleteEverythingDialogMessage =>
      'Are you sure you delete everything? This action cannot be undone.';

  @override
  String get deleteEverythingConfirm => 'DELETE!';

  @override
  String get dataExported => 'Data exported!';

  @override
  String get dataImported => 'Data imported successfully!';

  @override
  String get journalHowWasYourDay => 'How was your day?';

  @override
  String get journalPlaceholder =>
      'Write about your day, thoughts, feelings, or anything you want to remember...';

  @override
  String journalWordCount(int count) {
    return '$count words';
  }

  @override
  String get journalPreviousMonth => 'Previous Month';

  @override
  String get journalNextMonth => 'Next Month';

  @override
  String get quitMilestonesStart => 'Start';

  @override
  String get quitMilestonesReset => 'Reset';

  @override
  String get quitMilestonesQuitDate => 'Quit date';

  @override
  String quitMilestonesClearTitle(int days) {
    return 'Clear milestone for $days days?';
  }

  @override
  String quitMilestonesClearMessage(int days) {
    return 'This will clear all past times you achieved the $days day milestone.';
  }

  @override
  String get quitMilestonesClear => 'Clear';

  @override
  String quitMilestonesShareMessage(int days, String plural, String title) {
    return 'I\'m $days day$plural clean from $title!';
  }

  @override
  String get entryPageHeaderStarted => 'One step stronger';

  @override
  String get entryPageHeaderNotStarted => 'Not started';

  @override
  String get entryPageSubtitleStarted => 'You are doing great!';

  @override
  String get entryPageSubtitleNotStarted =>
      'Tap \"Start\" to begin your journey';

  @override
  String get editEntryAddTitle => 'Add entry';

  @override
  String get editEntryEditTitle => 'Edit entry';

  @override
  String get editEntryTitle => 'Title';

  @override
  String get editEntryTitleError => 'Please enter a title';

  @override
  String get editEntryColor => 'Color';

  @override
  String get editEntryIcon => 'Icon';

  @override
  String get editEntrySave => 'Save';

  @override
  String get editEntryDeleteDialogTitle => 'Are you sure?';

  @override
  String get editEntryDeleteDialogMessage =>
      'Do you really want to delete this entry?';

  @override
  String get editEntryDeleteNo => 'No';

  @override
  String get editEntryDeleteYes => 'Yes';

  @override
  String get pinPageEnterPIN => 'Enter PIN';

  @override
  String get pinPageIncorrectPIN => 'Incorrect PIN';

  @override
  String get pinPageTooManyAttempts => 'Too many attempts. Wait 30 seconds.';

  @override
  String get aboutPageTitle => 'About';

  @override
  String get aboutVersion => 'Version';

  @override
  String get aboutAuthor => 'Author';

  @override
  String get aboutAuthorName => 'Brandon Dick';

  @override
  String get aboutLicense => 'License';

  @override
  String get aboutLicenseMIT => 'MIT';

  @override
  String get aboutDonate => 'Donate';

  @override
  String get aboutDonateSubtitle => 'Help support this project';

  @override
  String get aboutSourceCode => 'Source code';

  @override
  String get whatsNewTitle => 'What\'s new?';

  @override
  String get whatsNewSearchHint => 'Search...';

  @override
  String get whatsNewEnjoyingButton => 'Enjoying the app?';

  @override
  String get enjoyingPageTitle => 'Enjoying the app?';

  @override
  String get enjoyingLeaveReview => 'Leave a review';

  @override
  String get enjoyingLeaveReviewSubtitle => 'Let me know what you think!';

  @override
  String get enjoyingGiveStar => 'Give us a star';

  @override
  String get enjoyingGiveStarSubtitle => 'Show your support on GitHub';

  @override
  String get enjoyingDonate => 'Donate';

  @override
  String get enjoyingDonateSubtitle => 'Support development';

  @override
  String get alcoholPageTitle => 'Sober & sparkling';

  @override
  String get alcoholHeaderStarted => 'Cheers to you!';

  @override
  String get alcoholHeaderNotStarted => 'Sober journey ahead!';

  @override
  String get alcoholSubtitleStarted => 'Every day is a win 🥳';

  @override
  String get alcoholSubtitleNotStarted => 'Ready for a brighter you? ✨';

  @override
  String get vapingPageTitle => 'Vape-free victory';

  @override
  String get vapingHeaderStarted => 'Clear skies ahead!';

  @override
  String get vapingHeaderNotStarted => 'Vape-free living!';

  @override
  String get vapingSubtitleStarted => 'Breathing easy, living free 🌬️';

  @override
  String get vapingSubtitleNotStarted => 'Ready to ditch the vape? ✨';

  @override
  String get smokingPageTitle => 'Smoke-free & soaring';

  @override
  String get smokingHeaderStarted => 'Breathe easy!';

  @override
  String get smokingHeaderNotStarted => 'Smoke-free journey!';

  @override
  String get smokingSubtitleStarted => 'Every puff-free day is a win 🚭';

  @override
  String get smokingSubtitleNotStarted => 'Ready to reclaim your health? ✨';

  @override
  String get marijuanaPageTitle => 'Cannabis-free journey';

  @override
  String get marijuanaHeaderStarted => 'Clear mind rising!';

  @override
  String get marijuanaHeaderNotStarted => 'Cannabis-free living!';

  @override
  String get marijuanaSubtitleStarted =>
      'Building mental clarity, one day at a time 🧠';

  @override
  String get marijuanaSubtitleNotStarted => 'Ready for a clearer tomorrow? 🌱';

  @override
  String get nicotinePouchesPageTitle => 'Pouch-free Power';

  @override
  String get nicotinePouchesHeaderStarted => 'Fresh & free!';

  @override
  String get nicotinePouchesHeaderNotStarted => 'Pouch-free progress!';

  @override
  String get nicotinePouchesSubtitleStarted =>
      'Embrace a brighter, healthier you ✨';

  @override
  String get nicotinePouchesSubtitleNotStarted =>
      'Ready to ditch the pouches? 🚀';

  @override
  String get opioidsPageTitle => 'Path to peace';

  @override
  String get opioidsHeaderStarted => 'Stronger every day!';

  @override
  String get opioidsHeaderNotStarted => 'Road to recovery!';

  @override
  String get opioidsSubtitleStarted => 'Embrace your strength 💪';

  @override
  String get opioidsSubtitleNotStarted => 'Ready to reclaim your life? 💖';

  @override
  String get opioidsInfoBox =>
      'Recovery is a medical process. Always consult healthcare professionals.';

  @override
  String get socialMediaPageTitle => 'Digital detox delight';

  @override
  String get socialMediaHeaderStarted => 'Unplug & play!';

  @override
  String get socialMediaHeaderNotStarted => 'Digital detox journey!';

  @override
  String get socialMediaSubtitleStarted => 'Real life is the best feed 💖';

  @override
  String get socialMediaSubtitleNotStarted => 'Ready to reclaim your time? 🚀';

  @override
  String get pornographyPageTitle => 'Pure & powerful';

  @override
  String get pornographyHeaderStarted => 'Reclaiming your mind!';

  @override
  String get pornographyHeaderNotStarted => 'Start your journey!';

  @override
  String get pornographySubtitleStarted => 'Building authentic connections 🧠✨';

  @override
  String get pornographySubtitleNotStarted =>
      'Ready to break free and rebuild? 💪';

  @override
  String get relapseMessage1 =>
      'Recovery isn\'t linear. Every step forward matters, including this one.';

  @override
  String get relapseMessage2 =>
      'You\'re here, you\'re trying, and that takes real courage.';

  @override
  String get relapseMessage3 =>
      'Setbacks don\'t erase your progress. You\'re learning and growing.';

  @override
  String get relapseMessage4 =>
      'Each restart is proof of your strength, not a sign of weakness.';

  @override
  String get relapseMessage5 => 'Tomorrow is a fresh start. You\'ve got this.';

  @override
  String get relapseMessage6 =>
      'Your worth isn\'t defined by perfect streaks. You matter.';

  @override
  String get relapseMessage7 =>
      'Recovery is a journey with hills and valleys. Keep walking.';

  @override
  String get relapseMessage8 =>
      'You had the strength to start before, and you have it again now.';

  @override
  String get relapseMessage9 =>
      'One moment doesn\'t define your entire journey forward.';

  @override
  String get relapseMessage10 =>
      'Being here shows you haven\'t given up. That\'s powerful.';

  @override
  String get relapseMessage11 =>
      'Progress isn\'t about perfection—it\'s about persistence.';

  @override
  String get relapseMessage12 =>
      'You\'re building resilience with every attempt. Keep building.';

  @override
  String get relapseMessage13 =>
      'Your commitment to trying again is already a victory.';

  @override
  String get relapseMessage14 =>
      'Healing isn\'t instant, but it\'s happening with each choice you make.';

  @override
  String get relapseMessage15 =>
      'You\'re not starting over—you\'re continuing with more wisdom.';

  @override
  String get relapseMessage16 =>
      'Every expert was once a beginner. Every pro was once an amateur.';

  @override
  String get relapseMessage17 =>
      'Recovery happens one day at a time, sometimes one hour at a time.';

  @override
  String get relapseMessage18 =>
      'You\'re writing a comeback story. This is just one chapter.';

  @override
  String get relapseMessage19 =>
      'The fact that you\'re here means you care about yourself. Hold onto that.';

  @override
  String get relapseMessage20 =>
      'Small steps in the right direction are still steps forward.';

  @override
  String get undo => 'Undo';

  @override
  String get ok => 'OK';
}
