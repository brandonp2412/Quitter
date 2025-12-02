import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
  ];

  /// The main application title
  ///
  /// In en, this message translates to:
  /// **'Quitter'**
  String get appTitle;

  /// Tab label for the main Quitter tab
  ///
  /// In en, this message translates to:
  /// **'Quitter'**
  String get tabQuitter;

  /// Tab label for the Journal tab
  ///
  /// In en, this message translates to:
  /// **'Journal'**
  String get tabJournal;

  /// Tab label for the Settings tab
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get tabSettings;

  /// Floating action button label on home page
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get homeAddButton;

  /// Tooltip for the add custom addiction button
  ///
  /// In en, this message translates to:
  /// **'Create your own custom addiction to quit'**
  String get homeAddTooltip;

  /// Toast message shown when app is updated
  ///
  /// In en, this message translates to:
  /// **'New version {version}'**
  String newVersionToast(String version);

  /// Action button text to view changelog
  ///
  /// In en, this message translates to:
  /// **'Changes'**
  String get changesAction;

  /// Title for hide addiction confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Hide {title}?'**
  String hideDialogTitle(String title);

  /// Message explaining what hiding an addiction does
  ///
  /// In en, this message translates to:
  /// **'This will hide the {title} option from your home screen. You can show it again in Settings.'**
  String hideDialogMessage(String title);

  /// Cancel button text used throughout the app
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Hide button text in hide addiction dialog
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hide;

  /// Name of the alcohol addiction type
  ///
  /// In en, this message translates to:
  /// **'Alcohol'**
  String get addictionAlcohol;

  /// Name of the vaping addiction type
  ///
  /// In en, this message translates to:
  /// **'Vaping'**
  String get addictionVaping;

  /// Name of the smoking addiction type
  ///
  /// In en, this message translates to:
  /// **'Smoking'**
  String get addictionSmoking;

  /// Name of the marijuana addiction type
  ///
  /// In en, this message translates to:
  /// **'Marijuana'**
  String get addictionMarijuana;

  /// Name of the nicotine pouches addiction type
  ///
  /// In en, this message translates to:
  /// **'Nicotine Pouches'**
  String get addictionNicotinePouches;

  /// Name of the opioids addiction type
  ///
  /// In en, this message translates to:
  /// **'Opioids'**
  String get addictionOpioids;

  /// Name of the social media addiction type
  ///
  /// In en, this message translates to:
  /// **'Social Media'**
  String get addictionSocialMedia;

  /// Short name for adult content addiction (displayed as AC)
  ///
  /// In en, this message translates to:
  /// **'AC'**
  String get addictionAC;

  /// Full name for adult content addiction (used in settings)
  ///
  /// In en, this message translates to:
  /// **'Adult content'**
  String get addictionAdultContent;

  /// Hint text for settings search bar
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get settingsSearchHint;

  /// Section header for appearance settings
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsSectionAppearance;

  /// Section header for security settings
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get settingsSectionSecurity;

  /// Section header for main screen items settings
  ///
  /// In en, this message translates to:
  /// **'Main Screen Items'**
  String get settingsSectionMainScreenItems;

  /// Section header for notification settings
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsSectionNotifications;

  /// Section header for system settings
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsSectionSystem;

  /// Setting title for PIN lock feature
  ///
  /// In en, this message translates to:
  /// **'PIN lock'**
  String get settingsPinLock;

  /// Subtitle explaining PIN lock setting
  ///
  /// In en, this message translates to:
  /// **'Require PIN to open app'**
  String get settingsPinLockSubtitle;

  /// Label for PIN timeout setting
  ///
  /// In en, this message translates to:
  /// **'PIN timeout (seconds)'**
  String get settingsPinTimeout;

  /// Hint text for PIN timeout field
  ///
  /// In en, this message translates to:
  /// **'15'**
  String get settingsPinTimeoutHint;

  /// Setting title for theme selection
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// Setting title for color scheme selection
  ///
  /// In en, this message translates to:
  /// **'Color scheme'**
  String get settingsColorScheme;

  /// Setting title for reset buttons visibility
  ///
  /// In en, this message translates to:
  /// **'Reset buttons'**
  String get settingsResetButtons;

  /// Subtitle explaining reset buttons setting
  ///
  /// In en, this message translates to:
  /// **'Show reset buttons on quit pages'**
  String get settingsResetButtonsSubtitle;

  /// Setting title for journal visibility
  ///
  /// In en, this message translates to:
  /// **'Show journal'**
  String get settingsShowJournal;

  /// Subtitle explaining show journal setting
  ///
  /// In en, this message translates to:
  /// **'Enable the journal tab for logging your thoughts'**
  String get settingsShowJournalSubtitle;

  /// Setting title for swipe between tabs feature
  ///
  /// In en, this message translates to:
  /// **'Swipe between tabs'**
  String get settingsSwipeBetweenTabs;

  /// Subtitle explaining swipe between tabs setting
  ///
  /// In en, this message translates to:
  /// **'Dragging your finger moves between Journal, Homepage & Settings'**
  String get settingsSwipeBetweenTabsSubtitle;

  /// Setting subtitle for showing alcohol tracking
  ///
  /// In en, this message translates to:
  /// **'Show alcohol tracking'**
  String get settingsShowAlcoholTracking;

  /// Setting subtitle for showing vaping tracking
  ///
  /// In en, this message translates to:
  /// **'Show vaping tracking'**
  String get settingsShowVapingTracking;

  /// Setting subtitle for showing smoking tracking
  ///
  /// In en, this message translates to:
  /// **'Show smoking tracking'**
  String get settingsShowSmokingTracking;

  /// Setting subtitle for showing marijuana tracking
  ///
  /// In en, this message translates to:
  /// **'Show marijuana tracking'**
  String get settingsShowMarijuanaTracking;

  /// Setting subtitle for showing nicotine pouches tracking
  ///
  /// In en, this message translates to:
  /// **'Show nicotine pouches tracking'**
  String get settingsShowNicotinePouchesTracking;

  /// Setting subtitle for showing opioids tracking
  ///
  /// In en, this message translates to:
  /// **'Show opioids tracking'**
  String get settingsShowOpioidsTracking;

  /// Setting subtitle for showing social media tracking
  ///
  /// In en, this message translates to:
  /// **'Show social media tracking'**
  String get settingsShowSocialMediaTracking;

  /// Setting subtitle for showing adult content tracking
  ///
  /// In en, this message translates to:
  /// **'Show adult content tracking'**
  String get settingsShowAdultContentTracking;

  /// Setting title for notification frequency
  ///
  /// In en, this message translates to:
  /// **'Notification frequency'**
  String get settingsNotificationFrequency;

  /// Subtitle showing notification frequency
  ///
  /// In en, this message translates to:
  /// **'Every {days} day(s) at {time}'**
  String settingsNotificationFrequencySubtitle(int days, String time);

  /// Setting subtitle for alcohol notifications
  ///
  /// In en, this message translates to:
  /// **'Notify alcohol quitting progress'**
  String get settingsNotifyAlcohol;

  /// Setting subtitle for vaping notifications
  ///
  /// In en, this message translates to:
  /// **'Notify vaping quitting progress'**
  String get settingsNotifyVaping;

  /// Setting subtitle for smoking notifications
  ///
  /// In en, this message translates to:
  /// **'Notify smoking quitting progress'**
  String get settingsNotifySmoking;

  /// Setting subtitle for marijuana notifications
  ///
  /// In en, this message translates to:
  /// **'Notify marijuana quitting progress'**
  String get settingsNotifyMarijuana;

  /// Setting subtitle for nicotine pouches notifications
  ///
  /// In en, this message translates to:
  /// **'Notify nicotine pouches quitting progress'**
  String get settingsNotifyNicotinePouches;

  /// Setting subtitle for opioids notifications
  ///
  /// In en, this message translates to:
  /// **'Notify opioids quitting progress'**
  String get settingsNotifyOpioids;

  /// Setting subtitle for social media notifications
  ///
  /// In en, this message translates to:
  /// **'Notify social media quitting progress'**
  String get settingsNotifySocialMedia;

  /// Setting subtitle for adult content notifications
  ///
  /// In en, this message translates to:
  /// **'Notify adult content quitting progress'**
  String get settingsNotifyAdultContent;

  /// Setting title for reset messages
  ///
  /// In en, this message translates to:
  /// **'Reset messages'**
  String get settingsResetMessages;

  /// Subtitle explaining reset messages setting
  ///
  /// In en, this message translates to:
  /// **'Show positive reinforcement after relapses'**
  String get settingsResetMessagesSubtitle;

  /// Setting title for about page
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// Setting title for what's new page
  ///
  /// In en, this message translates to:
  /// **'What\'s new'**
  String get settingsWhatsNew;

  /// Setting title for enjoying the app page
  ///
  /// In en, this message translates to:
  /// **'Enjoying the app?'**
  String get settingsEnjoyingApp;

  /// Setting title for reporting a bug
  ///
  /// In en, this message translates to:
  /// **'Report a bug'**
  String get settingsReportBug;

  /// Setting title for exporting data
  ///
  /// In en, this message translates to:
  /// **'Export data'**
  String get settingsExportData;

  /// Setting title for importing data
  ///
  /// In en, this message translates to:
  /// **'Import data'**
  String get settingsImportData;

  /// Setting title for deleting all data
  ///
  /// In en, this message translates to:
  /// **'Delete everything'**
  String get settingsDeleteEverything;

  /// Light theme option
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// Dark theme option
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// System theme option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// Pure black theme option for OLED displays
  ///
  /// In en, this message translates to:
  /// **'Pure black'**
  String get themePureBlack;

  /// Dialog title for theme mode selection
  ///
  /// In en, this message translates to:
  /// **'Theme mode'**
  String get themeMode;

  /// Dialog title for setting a PIN
  ///
  /// In en, this message translates to:
  /// **'Set PIN'**
  String get pinDialogSetTitle;

  /// Label for PIN entry field
  ///
  /// In en, this message translates to:
  /// **'Enter PIN'**
  String get pinDialogEnterPIN;

  /// Label for PIN confirmation field
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN'**
  String get pinDialogConfirmPIN;

  /// Button to confirm setting PIN
  ///
  /// In en, this message translates to:
  /// **'Set'**
  String get pinDialogSet;

  /// Error message when PINs don't match
  ///
  /// In en, this message translates to:
  /// **'PINs do not match'**
  String get pinDialogPINsDoNotMatch;

  /// Label for PIN field in verification dialog
  ///
  /// In en, this message translates to:
  /// **'PIN'**
  String get pinDialogPIN;

  /// OK button in PIN dialog
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get pinDialogOK;

  /// Dialog title for notification frequency settings
  ///
  /// In en, this message translates to:
  /// **'Notification frequency'**
  String get notificationFrequencyDialogTitle;

  /// Label for notification frequency field
  ///
  /// In en, this message translates to:
  /// **'Notify every'**
  String get notificationFrequencyNotifyEvery;

  /// Suffix text for days in notification frequency
  ///
  /// In en, this message translates to:
  /// **'day(s)'**
  String get notificationFrequencyDays;

  /// Label for notification time field
  ///
  /// In en, this message translates to:
  /// **'At'**
  String get notificationFrequencyAt;

  /// Save button in notification frequency dialog
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get notificationFrequencySave;

  /// Title for test notification
  ///
  /// In en, this message translates to:
  /// **'Positive affirmation'**
  String get notificationTestTitle;

  /// Body text for test notification
  ///
  /// In en, this message translates to:
  /// **'You will see a notification like this every {days} day{plural} congratulating you on your progress!'**
  String notificationTestBody(int days, String plural);

  /// Dialog title for delete everything confirmation
  ///
  /// In en, this message translates to:
  /// **'Delete everything'**
  String get deleteEverythingDialogTitle;

  /// Message warning about deleting all data
  ///
  /// In en, this message translates to:
  /// **'Are you sure you delete everything? This action cannot be undone.'**
  String get deleteEverythingDialogMessage;

  /// Button to confirm deleting everything
  ///
  /// In en, this message translates to:
  /// **'DELETE!'**
  String get deleteEverythingConfirm;

  /// Toast message when data is exported successfully
  ///
  /// In en, this message translates to:
  /// **'Data exported!'**
  String get dataExported;

  /// Toast message when data is imported successfully
  ///
  /// In en, this message translates to:
  /// **'Data imported successfully!'**
  String get dataImported;

  /// Header text in journal entry section
  ///
  /// In en, this message translates to:
  /// **'How was your day?'**
  String get journalHowWasYourDay;

  /// Placeholder text for journal entry field
  ///
  /// In en, this message translates to:
  /// **'Write about your day, thoughts, feelings, or anything you want to remember...'**
  String get journalPlaceholder;

  /// Word count display in journal
  ///
  /// In en, this message translates to:
  /// **'{count} words'**
  String journalWordCount(int count);

  /// Tooltip for previous month button in calendar
  ///
  /// In en, this message translates to:
  /// **'Previous Month'**
  String get journalPreviousMonth;

  /// Tooltip for next month button in calendar
  ///
  /// In en, this message translates to:
  /// **'Next Month'**
  String get journalNextMonth;

  /// Button to start quit journey
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get quitMilestonesStart;

  /// Button to reset quit journey
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get quitMilestonesReset;

  /// Label for quit date field
  ///
  /// In en, this message translates to:
  /// **'Quit date'**
  String get quitMilestonesQuitDate;

  /// Dialog title for clearing milestone
  ///
  /// In en, this message translates to:
  /// **'Clear milestone for {days} days?'**
  String quitMilestonesClearTitle(int days);

  /// Message explaining what clearing a milestone does
  ///
  /// In en, this message translates to:
  /// **'This will clear all past times you achieved the {days} day milestone.'**
  String quitMilestonesClearMessage(int days);

  /// Button to clear milestone
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get quitMilestonesClear;

  /// Message template for sharing progress
  ///
  /// In en, this message translates to:
  /// **'I\'m {days} day{plural} clean from {title}!'**
  String quitMilestonesShareMessage(int days, String plural, String title);

  /// Header text for started custom entry
  ///
  /// In en, this message translates to:
  /// **'One step stronger'**
  String get entryPageHeaderStarted;

  /// Header text for not started custom entry
  ///
  /// In en, this message translates to:
  /// **'Not started'**
  String get entryPageHeaderNotStarted;

  /// Subtitle text for started custom entry
  ///
  /// In en, this message translates to:
  /// **'You are doing great!'**
  String get entryPageSubtitleStarted;

  /// Subtitle text for not started custom entry
  ///
  /// In en, this message translates to:
  /// **'Tap \"Start\" to begin your journey'**
  String get entryPageSubtitleNotStarted;

  /// Page title when adding a new entry
  ///
  /// In en, this message translates to:
  /// **'Add entry'**
  String get editEntryAddTitle;

  /// Page title when editing an entry
  ///
  /// In en, this message translates to:
  /// **'Edit entry'**
  String get editEntryEditTitle;

  /// Label for entry title field
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get editEntryTitle;

  /// Error message when title is empty
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get editEntryTitleError;

  /// Label for color selection
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get editEntryColor;

  /// Label for icon selection
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get editEntryIcon;

  /// Save button in edit entry page
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get editEntrySave;

  /// Dialog title for delete entry confirmation
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get editEntryDeleteDialogTitle;

  /// Message asking for delete confirmation
  ///
  /// In en, this message translates to:
  /// **'Do you really want to delete this entry?'**
  String get editEntryDeleteDialogMessage;

  /// No button in delete dialog
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get editEntryDeleteNo;

  /// Yes button in delete dialog
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get editEntryDeleteYes;

  /// Title text on PIN entry page
  ///
  /// In en, this message translates to:
  /// **'Enter PIN'**
  String get pinPageEnterPIN;

  /// Error message for incorrect PIN
  ///
  /// In en, this message translates to:
  /// **'Incorrect PIN'**
  String get pinPageIncorrectPIN;

  /// Error message when too many failed PIN attempts
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Wait 30 seconds.'**
  String get pinPageTooManyAttempts;

  /// Title for about page
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutPageTitle;

  /// Label for app version
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get aboutVersion;

  /// Label for app author
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get aboutAuthor;

  /// Name of the app author
  ///
  /// In en, this message translates to:
  /// **'Brandon Dick'**
  String get aboutAuthorName;

  /// Label for app license
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get aboutLicense;

  /// License type
  ///
  /// In en, this message translates to:
  /// **'MIT'**
  String get aboutLicenseMIT;

  /// Label for donate option
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get aboutDonate;

  /// Subtitle for donate option
  ///
  /// In en, this message translates to:
  /// **'Help support this project'**
  String get aboutDonateSubtitle;

  /// Label for source code link
  ///
  /// In en, this message translates to:
  /// **'Source code'**
  String get aboutSourceCode;

  /// Title for what's new page
  ///
  /// In en, this message translates to:
  /// **'What\'s new?'**
  String get whatsNewTitle;

  /// Hint text for changelog search
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get whatsNewSearchHint;

  /// Button text to go to enjoying page from what's new
  ///
  /// In en, this message translates to:
  /// **'Enjoying the app?'**
  String get whatsNewEnjoyingButton;

  /// Title for enjoying the app page
  ///
  /// In en, this message translates to:
  /// **'Enjoying the app?'**
  String get enjoyingPageTitle;

  /// Option to leave a review
  ///
  /// In en, this message translates to:
  /// **'Leave a review'**
  String get enjoyingLeaveReview;

  /// Subtitle for leave a review option
  ///
  /// In en, this message translates to:
  /// **'Let me know what you think!'**
  String get enjoyingLeaveReviewSubtitle;

  /// Option to star on GitHub
  ///
  /// In en, this message translates to:
  /// **'Give us a star'**
  String get enjoyingGiveStar;

  /// Subtitle for give star option
  ///
  /// In en, this message translates to:
  /// **'Show your support on GitHub'**
  String get enjoyingGiveStarSubtitle;

  /// Option to donate
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get enjoyingDonate;

  /// Subtitle for donate option
  ///
  /// In en, this message translates to:
  /// **'Support development'**
  String get enjoyingDonateSubtitle;

  /// Page title for alcohol tracking
  ///
  /// In en, this message translates to:
  /// **'Sober & sparkling'**
  String get alcoholPageTitle;

  /// Header for started alcohol quit journey
  ///
  /// In en, this message translates to:
  /// **'Cheers to you!'**
  String get alcoholHeaderStarted;

  /// Header for not started alcohol quit journey
  ///
  /// In en, this message translates to:
  /// **'Sober journey ahead!'**
  String get alcoholHeaderNotStarted;

  /// Subtitle for started alcohol quit journey
  ///
  /// In en, this message translates to:
  /// **'Every day is a win 🥳'**
  String get alcoholSubtitleStarted;

  /// Subtitle for not started alcohol quit journey
  ///
  /// In en, this message translates to:
  /// **'Ready for a brighter you? ✨'**
  String get alcoholSubtitleNotStarted;

  /// Page title for vaping tracking
  ///
  /// In en, this message translates to:
  /// **'Vape-free victory'**
  String get vapingPageTitle;

  /// Header for started vaping quit journey
  ///
  /// In en, this message translates to:
  /// **'Clear skies ahead!'**
  String get vapingHeaderStarted;

  /// Header for not started vaping quit journey
  ///
  /// In en, this message translates to:
  /// **'Vape-free living!'**
  String get vapingHeaderNotStarted;

  /// Subtitle for started vaping quit journey
  ///
  /// In en, this message translates to:
  /// **'Breathing easy, living free 🌬️'**
  String get vapingSubtitleStarted;

  /// Subtitle for not started vaping quit journey
  ///
  /// In en, this message translates to:
  /// **'Ready to ditch the vape? ✨'**
  String get vapingSubtitleNotStarted;

  /// Page title for smoking tracking
  ///
  /// In en, this message translates to:
  /// **'Smoke-free & soaring'**
  String get smokingPageTitle;

  /// Header for started smoking quit journey
  ///
  /// In en, this message translates to:
  /// **'Breathe easy!'**
  String get smokingHeaderStarted;

  /// Header for not started smoking quit journey
  ///
  /// In en, this message translates to:
  /// **'Smoke-free journey!'**
  String get smokingHeaderNotStarted;

  /// Subtitle for started smoking quit journey
  ///
  /// In en, this message translates to:
  /// **'Every puff-free day is a win 🚭'**
  String get smokingSubtitleStarted;

  /// Subtitle for not started smoking quit journey
  ///
  /// In en, this message translates to:
  /// **'Ready to reclaim your health? ✨'**
  String get smokingSubtitleNotStarted;

  /// Page title for marijuana tracking
  ///
  /// In en, this message translates to:
  /// **'Cannabis-free journey'**
  String get marijuanaPageTitle;

  /// Header for started marijuana quit journey
  ///
  /// In en, this message translates to:
  /// **'Clear mind rising!'**
  String get marijuanaHeaderStarted;

  /// Header for not started marijuana quit journey
  ///
  /// In en, this message translates to:
  /// **'Cannabis-free living!'**
  String get marijuanaHeaderNotStarted;

  /// Subtitle for started marijuana quit journey
  ///
  /// In en, this message translates to:
  /// **'Building mental clarity, one day at a time 🧠'**
  String get marijuanaSubtitleStarted;

  /// Subtitle for not started marijuana quit journey
  ///
  /// In en, this message translates to:
  /// **'Ready for a clearer tomorrow? 🌱'**
  String get marijuanaSubtitleNotStarted;

  /// Page title for nicotine pouches tracking
  ///
  /// In en, this message translates to:
  /// **'Pouch-free Power'**
  String get nicotinePouchesPageTitle;

  /// Header for started nicotine pouches quit journey
  ///
  /// In en, this message translates to:
  /// **'Fresh & free!'**
  String get nicotinePouchesHeaderStarted;

  /// Header for not started nicotine pouches quit journey
  ///
  /// In en, this message translates to:
  /// **'Pouch-free progress!'**
  String get nicotinePouchesHeaderNotStarted;

  /// Subtitle for started nicotine pouches quit journey
  ///
  /// In en, this message translates to:
  /// **'Embrace a brighter, healthier you ✨'**
  String get nicotinePouchesSubtitleStarted;

  /// Subtitle for not started nicotine pouches quit journey
  ///
  /// In en, this message translates to:
  /// **'Ready to ditch the pouches? 🚀'**
  String get nicotinePouchesSubtitleNotStarted;

  /// Page title for opioids tracking
  ///
  /// In en, this message translates to:
  /// **'Path to peace'**
  String get opioidsPageTitle;

  /// Header for started opioids quit journey
  ///
  /// In en, this message translates to:
  /// **'Stronger every day!'**
  String get opioidsHeaderStarted;

  /// Header for not started opioids quit journey
  ///
  /// In en, this message translates to:
  /// **'Road to recovery!'**
  String get opioidsHeaderNotStarted;

  /// Subtitle for started opioids quit journey
  ///
  /// In en, this message translates to:
  /// **'Embrace your strength 💪'**
  String get opioidsSubtitleStarted;

  /// Subtitle for not started opioids quit journey
  ///
  /// In en, this message translates to:
  /// **'Ready to reclaim your life? 💖'**
  String get opioidsSubtitleNotStarted;

  /// Important information box message for opioids recovery
  ///
  /// In en, this message translates to:
  /// **'Recovery is a medical process. Always consult healthcare professionals.'**
  String get opioidsInfoBox;

  /// Page title for social media tracking
  ///
  /// In en, this message translates to:
  /// **'Digital detox delight'**
  String get socialMediaPageTitle;

  /// Header for started social media quit journey
  ///
  /// In en, this message translates to:
  /// **'Unplug & play!'**
  String get socialMediaHeaderStarted;

  /// Header for not started social media quit journey
  ///
  /// In en, this message translates to:
  /// **'Digital detox journey!'**
  String get socialMediaHeaderNotStarted;

  /// Subtitle for started social media quit journey
  ///
  /// In en, this message translates to:
  /// **'Real life is the best feed 💖'**
  String get socialMediaSubtitleStarted;

  /// Subtitle for not started social media quit journey
  ///
  /// In en, this message translates to:
  /// **'Ready to reclaim your time? 🚀'**
  String get socialMediaSubtitleNotStarted;

  /// Page title for adult content tracking
  ///
  /// In en, this message translates to:
  /// **'Pure & powerful'**
  String get pornographyPageTitle;

  /// Header for started adult content quit journey
  ///
  /// In en, this message translates to:
  /// **'Reclaiming your mind!'**
  String get pornographyHeaderStarted;

  /// Header for not started adult content quit journey
  ///
  /// In en, this message translates to:
  /// **'Start your journey!'**
  String get pornographyHeaderNotStarted;

  /// Subtitle for started adult content quit journey
  ///
  /// In en, this message translates to:
  /// **'Building authentic connections 🧠✨'**
  String get pornographySubtitleStarted;

  /// Subtitle for not started adult content quit journey
  ///
  /// In en, this message translates to:
  /// **'Ready to break free and rebuild? 💪'**
  String get pornographySubtitleNotStarted;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Recovery isn\'t linear. Every step forward matters, including this one.'**
  String get relapseMessage1;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'You\'re here, you\'re trying, and that takes real courage.'**
  String get relapseMessage2;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Setbacks don\'t erase your progress. You\'re learning and growing.'**
  String get relapseMessage3;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Each restart is proof of your strength, not a sign of weakness.'**
  String get relapseMessage4;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Tomorrow is a fresh start. You\'ve got this.'**
  String get relapseMessage5;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Your worth isn\'t defined by perfect streaks. You matter.'**
  String get relapseMessage6;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Recovery is a journey with hills and valleys. Keep walking.'**
  String get relapseMessage7;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'You had the strength to start before, and you have it again now.'**
  String get relapseMessage8;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'One moment doesn\'t define your entire journey forward.'**
  String get relapseMessage9;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Being here shows you haven\'t given up. That\'s powerful.'**
  String get relapseMessage10;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Progress isn\'t about perfection—it\'s about persistence.'**
  String get relapseMessage11;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'You\'re building resilience with every attempt. Keep building.'**
  String get relapseMessage12;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Your commitment to trying again is already a victory.'**
  String get relapseMessage13;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Healing isn\'t instant, but it\'s happening with each choice you make.'**
  String get relapseMessage14;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'You\'re not starting over—you\'re continuing with more wisdom.'**
  String get relapseMessage15;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Every expert was once a beginner. Every pro was once an amateur.'**
  String get relapseMessage16;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Recovery happens one day at a time, sometimes one hour at a time.'**
  String get relapseMessage17;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'You\'re writing a comeback story. This is just one chapter.'**
  String get relapseMessage18;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'The fact that you\'re here means you care about yourself. Hold onto that.'**
  String get relapseMessage19;

  /// Encouragement message for relapse
  ///
  /// In en, this message translates to:
  /// **'Small steps in the right direction are still steps forward.'**
  String get relapseMessage20;

  /// Undo button text in reset snackbar
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// OK button text used in toast messages
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
