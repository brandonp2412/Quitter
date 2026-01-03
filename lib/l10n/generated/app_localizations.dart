import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_zh.dart';

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
    Locale('zh'),
  ];

  /// The main application title
  ///
  /// In en, this message translates to:
  /// **'Quitter'**
  String get appTitle;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// Tab label for the main Quitter tab
  ///
  /// In en, this message translates to:
  /// **'Quitter'**
  String get tabQuitter;

  /// No description provided for @adderallPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Quitting Adderall'**
  String get adderallPageTitle;

  /// No description provided for @adderallHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get adderallHeaderStarted;

  /// No description provided for @adderallHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Ready to Start Your Recovery?'**
  String get adderallHeaderNotStarted;

  /// No description provided for @adderallSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone as your brain heals'**
  String get adderallSubtitleStarted;

  /// No description provided for @adderallSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you quit Adderall and start your journey to recovery'**
  String get adderallSubtitleNotStarted;

  /// No description provided for @adderallMilestone1Title.
  ///
  /// In en, this message translates to:
  /// **'First 24 Hours: Withdrawal Begins'**
  String get adderallMilestone1Title;

  /// No description provided for @adderallMilestone1Description.
  ///
  /// In en, this message translates to:
  /// **'You may feel increased fatigue, depression, and appetite as your body starts adjusting to life without stimulants. This is normal and temporary. Stay hydrated and rest when needed.'**
  String get adderallMilestone1Description;

  /// No description provided for @adderallMilestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Day 3: Peak Withdrawal'**
  String get adderallMilestone3Title;

  /// No description provided for @adderallMilestone3Description.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal symptoms reach their peak intensity. You might experience strong fatigue, irritability, and difficulty concentrating. This is the hardest part - but it gets better from here. Consider reaching out to your support system.'**
  String get adderallMilestone3Description;

  /// No description provided for @adderallMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'One Week: Physical Symptoms Improving'**
  String get adderallMilestone7Title;

  /// No description provided for @adderallMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'The worst of the physical withdrawal symptoms are starting to fade. Sleep patterns begin normalizing and energy levels slowly improve. Your body is adapting to functioning without stimulants.'**
  String get adderallMilestone7Description;

  /// No description provided for @adderallMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks: Emotional Stability Returning'**
  String get adderallMilestone14Title;

  /// No description provided for @adderallMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'Mood swings and irritability are lessening. You\'re regaining emotional balance as your brain chemistry stabilizes. Many people find this week marks a turning point in their recovery journey.'**
  String get adderallMilestone14Description;

  /// No description provided for @adderallMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month: Brain Chemistry Rebalancing'**
  String get adderallMilestone30Title;

  /// No description provided for @adderallMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'Your brain is actively healing. Natural dopamine production is improving, and you may notice better focus and motivation without medication. Sleep quality and appetite are returning to normal patterns.'**
  String get adderallMilestone30Description;

  /// No description provided for @adderallMilestone60Title.
  ///
  /// In en, this message translates to:
  /// **'Two Months: Cognitive Function Improving'**
  String get adderallMilestone60Title;

  /// No description provided for @adderallMilestone60Description.
  ///
  /// In en, this message translates to:
  /// **'Significant improvements in mental clarity, memory, and mood stability. Your brain\'s reward system is healing, making everyday activities more naturally rewarding. Many people report feeling more like themselves.'**
  String get adderallMilestone60Description;

  /// No description provided for @adderallMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Three Months: Major Recovery Milestone'**
  String get adderallMilestone90Title;

  /// No description provided for @adderallMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Most withdrawal symptoms have resolved. Your brain has made substantial progress in healing. Natural energy levels, focus, and emotional regulation are significantly improved. This is a major achievement worth celebrating.'**
  String get adderallMilestone90Description;

  /// No description provided for @adderallMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Six Months: Brain Healing Continues'**
  String get adderallMilestone180Title;

  /// No description provided for @adderallMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'Dopamine receptors continue restoring to normal function. You\'re experiencing sustained improvements in cognitive performance, emotional wellbeing, and overall quality of life. Your brain is getting stronger every day.'**
  String get adderallMilestone180Description;

  /// No description provided for @adderallMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One Year: Near-Complete Recovery'**
  String get adderallMilestone365Title;

  /// No description provided for @adderallMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'Your brain\'s dopamine system has largely restored to normal functioning. You\'ve proven your resilience and rebuilt your life without dependence on stimulants. This milestone represents a complete transformation - celebrate how far you\'ve come!'**
  String get adderallMilestone365Description;

  /// No description provided for @showAllItems.
  ///
  /// In en, this message translates to:
  /// **'Show all items'**
  String get showAllItems;

  /// No description provided for @showAllSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enable or disable all main screen items'**
  String get showAllSubtitle;

  /// No description provided for @enableNotifications.
  ///
  /// In en, this message translates to:
  /// **'Enable all notifications'**
  String get enableNotifications;

  /// No description provided for @enableNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Turn on or off all notifications'**
  String get enableNotificationsSubtitle;

  /// No description provided for @heroinPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Heroin Recovery'**
  String get heroinPageTitle;

  /// No description provided for @heroinHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get heroinHeaderStarted;

  /// No description provided for @heroinHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Benefits of Quitting Heroin'**
  String get heroinHeaderNotStarted;

  /// No description provided for @heroinSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get heroinSubtitleStarted;

  /// No description provided for @heroinSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you quit'**
  String get heroinSubtitleNotStarted;

  /// No description provided for @heroinMilestone1Title.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Begins'**
  String get heroinMilestone1Title;

  /// No description provided for @heroinMilestone1Description.
  ///
  /// In en, this message translates to:
  /// **'Your body starts the detox process. Early withdrawal symptoms like anxiety, sweating, and muscle aches may begin within 6-24 hours. This is your body beginning to heal.'**
  String get heroinMilestone1Description;

  /// No description provided for @heroinMilestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Peak Withdrawal'**
  String get heroinMilestone3Title;

  /// No description provided for @heroinMilestone3Description.
  ///
  /// In en, this message translates to:
  /// **'Acute withdrawal symptoms typically peak around days 2-3. While challenging, this marks the most intense phase. Physical symptoms include nausea, vomiting, body aches, and insomnia. Support is crucial during this time.'**
  String get heroinMilestone3Description;

  /// No description provided for @heroinMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'Acute Symptoms Subside'**
  String get heroinMilestone7Title;

  /// No description provided for @heroinMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'The most severe physical withdrawal symptoms begin to fade. Your body is adjusting to functioning without heroin. Sleep may still be disrupted, but you\'re through the hardest physical phase.'**
  String get heroinMilestone7Description;

  /// No description provided for @heroinMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'Physical Health Normalizes'**
  String get heroinMilestone30Title;

  /// No description provided for @heroinMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'Your sleep patterns, appetite, and energy levels start returning to normal. Physical health improvements become noticeable. Your body\'s natural systems are beginning to regulate themselves again.'**
  String get heroinMilestone30Description;

  /// No description provided for @heroinMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Immune System Recovery'**
  String get heroinMilestone90Title;

  /// No description provided for @heroinMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Your immune system begins significant recovery after months of suppression. You\'ll likely get sick less often and fight off infections more effectively. Cardiovascular health continues to improve.'**
  String get heroinMilestone90Description;

  /// No description provided for @heroinMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Cognitive Improvements'**
  String get heroinMilestone180Title;

  /// No description provided for @heroinMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'Notable improvements in memory, attention, and decision-making abilities. Brain imaging studies show measurable recovery in areas affected by heroin use. Mental clarity continues to increase.'**
  String get heroinMilestone180Description;

  /// No description provided for @heroinMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'Major Brain Healing'**
  String get heroinMilestone365Title;

  /// No description provided for @heroinMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'Significant restoration of brain function and emotional regulation. Dopamine receptors continue to normalize, making natural rewards more satisfying. Many experience improved relationships and life satisfaction.'**
  String get heroinMilestone365Description;

  /// No description provided for @heroinMilestone540Title.
  ///
  /// In en, this message translates to:
  /// **'Continued Cognitive Recovery'**
  String get heroinMilestone540Title;

  /// No description provided for @heroinMilestone540Description.
  ///
  /// In en, this message translates to:
  /// **'Executive function, impulse control, and emotional stability continue to improve. The brain\'s reward system becomes increasingly balanced. Long-term abstinence strengthens neural pathways for healthy decision-making.'**
  String get heroinMilestone540Description;

  /// No description provided for @heroinMilestone730Title.
  ///
  /// In en, this message translates to:
  /// **'Long-Term Brain Recovery'**
  String get heroinMilestone730Title;

  /// No description provided for @heroinMilestone730Description.
  ///
  /// In en, this message translates to:
  /// **'Two years of recovery brings substantial neuroplasticity and brain healing. Cognitive function approaches pre-addiction levels. You\'ve built a strong foundation for sustained recovery and a healthier future.'**
  String get heroinMilestone730Description;

  /// No description provided for @benzoPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Benzodiazepine Recovery'**
  String get benzoPageTitle;

  /// No description provided for @benzoHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get benzoHeaderStarted;

  /// No description provided for @benzoHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Benefits of Quitting Benzodiazepines'**
  String get benzoHeaderNotStarted;

  /// No description provided for @benzoSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get benzoSubtitleStarted;

  /// No description provided for @benzoSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you quit'**
  String get benzoSubtitleNotStarted;

  /// No description provided for @benzoMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'Early Withdrawal Phase'**
  String get benzoMilestone7Title;

  /// No description provided for @benzoMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'After completing a gradual taper, early withdrawal symptoms like rebound anxiety and insomnia may appear. This is your nervous system beginning to readjust. Medical support during this phase is crucial for safety and comfort.'**
  String get benzoMilestone7Description;

  /// No description provided for @benzoMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Acute Withdrawal Peak'**
  String get benzoMilestone14Title;

  /// No description provided for @benzoMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'Acute withdrawal symptoms typically peak within the first two weeks. You may experience anxiety, sleep disturbances, and physical discomfort. These symptoms, while challenging, indicate your brain is starting to heal and rebalance.'**
  String get benzoMilestone14Description;

  /// No description provided for @benzoMilestone60Title.
  ///
  /// In en, this message translates to:
  /// **'Sleep Architecture Improves'**
  String get benzoMilestone60Title;

  /// No description provided for @benzoMilestone60Description.
  ///
  /// In en, this message translates to:
  /// **'Studies show that after 2 months, your natural sleep patterns begin to restore. Slow-wave sleep increases and sleep quality improves compared to when taking benzodiazepines, even though overall sleep efficiency may still be recovering.'**
  String get benzoMilestone60Description;

  /// No description provided for @benzoMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Physical Health Stabilizes'**
  String get benzoMilestone90Title;

  /// No description provided for @benzoMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Around 3 months, many physical withdrawal symptoms have significantly improved. Your body is continuing to adjust to functioning without medication. Anxiety and mood may still fluctuate, but overall functioning improves.'**
  String get benzoMilestone90Description;

  /// No description provided for @benzoMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Cognitive Function Begins Recovery'**
  String get benzoMilestone180Title;

  /// No description provided for @benzoMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'At 6 months, noticeable improvements in memory, attention, and cognitive function begin to emerge. Research shows modest recovery in many cognitive areas, though full restoration takes longer. Your brain\'s natural abilities are gradually returning.'**
  String get benzoMilestone180Description;

  /// No description provided for @benzoMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One Year of Healing'**
  String get benzoMilestone365Title;

  /// No description provided for @benzoMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'After one year, significant improvements in mental and physical wellbeing become apparent. Many report reduced anxiety, better sleep quality, and improved overall health compared to when taking benzodiazepines long-term. Brain healing continues.'**
  String get benzoMilestone365Description;

  /// No description provided for @benzoMilestone540Title.
  ///
  /// In en, this message translates to:
  /// **'Continued Brain Recovery'**
  String get benzoMilestone540Title;

  /// No description provided for @benzoMilestone540Description.
  ///
  /// In en, this message translates to:
  /// **'At 18 months, continued cognitive improvements occur. GABA receptor function normalizes within 2-6 months of cessation, and brain structure begins recovering. Neuroplasticity allows your brain to form new, healthier neural pathways.'**
  String get benzoMilestone540Description;

  /// No description provided for @benzoMilestone730Title.
  ///
  /// In en, this message translates to:
  /// **'Two Years: Major Progress'**
  String get benzoMilestone730Title;

  /// No description provided for @benzoMilestone730Description.
  ///
  /// In en, this message translates to:
  /// **'Two years marks substantial recovery. Most people experience significant improvements in cognitive function, emotional regulation, and quality of life. While some may still experience gradual improvements, many have returned to pre-benzodiazepine functioning.'**
  String get benzoMilestone730Description;

  /// No description provided for @benzoMilestone1095Title.
  ///
  /// In en, this message translates to:
  /// **'Three Years: Long-Term Recovery'**
  String get benzoMilestone1095Title;

  /// No description provided for @benzoMilestone1095Description.
  ///
  /// In en, this message translates to:
  /// **'At three years, physical brain structure recovery reaches completion for most individuals. Hippocampal and amygdala volumes continue normalizing through neuroplasticity. You\'ve achieved lasting recovery and rebuilt a healthier foundation for life.'**
  String get benzoMilestone1095Description;

  /// No description provided for @addictionMeth.
  ///
  /// In en, this message translates to:
  /// **'Meth'**
  String get addictionMeth;

  /// No description provided for @addictionHeroin.
  ///
  /// In en, this message translates to:
  /// **'Heroin'**
  String get addictionHeroin;

  /// No description provided for @addictionBenzos.
  ///
  /// In en, this message translates to:
  /// **'Benzos'**
  String get addictionBenzos;

  /// No description provided for @methPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Meth Recovery'**
  String get methPageTitle;

  /// No description provided for @methHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get methHeaderStarted;

  /// No description provided for @methHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Drop the Glass'**
  String get methHeaderNotStarted;

  /// No description provided for @methSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get methSubtitleStarted;

  /// No description provided for @methSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Freedom is within your grasp'**
  String get methSubtitleNotStarted;

  /// No description provided for @methMilestone1Title.
  ///
  /// In en, this message translates to:
  /// **'First 24 Hours - The Crash Begins'**
  String get methMilestone1Title;

  /// No description provided for @methMilestone1Description.
  ///
  /// In en, this message translates to:
  /// **'The initial crash phase starts with profound fatigue and increased appetite as your body begins recovery. You may experience depression and sleep heavily as your system starts to stabilize from the intense stimulation.'**
  String get methMilestone1Description;

  /// No description provided for @methMilestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Day 3 - Peak Withdrawal'**
  String get methMilestone3Title;

  /// No description provided for @methMilestone3Description.
  ///
  /// In en, this message translates to:
  /// **'Cravings intensify significantly during this period as your body adjusts. You may experience increased energy compared to the crash phase, which can make cravings feel stronger. This is a critical time for relapse prevention and support.'**
  String get methMilestone3Description;

  /// No description provided for @methMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'One Week - Physical Symptoms Ease'**
  String get methMilestone7Title;

  /// No description provided for @methMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'Acute withdrawal symptoms begin to subside, though psychological challenges remain. Your sleep patterns start normalizing and physical discomfort decreases. This marks the transition from acute to post-acute withdrawal.'**
  String get methMilestone7Description;

  /// No description provided for @methMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month - Emerging Stability'**
  String get methMilestone30Title;

  /// No description provided for @methMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'The honeymoon phase begins as your body heals and cravings start to fade. Energy levels increase and mood improves as your brain chemistry begins rebalancing. However, remain vigilant as challenges can still arise.'**
  String get methMilestone30Description;

  /// No description provided for @methMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Three Months - Brain Healing Begins'**
  String get methMilestone90Title;

  /// No description provided for @methMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Your brain is actively working to restore normal function. Cognitive improvements become noticeable in areas like attention and decision-making. This period marks significant neurological recovery as your reward system starts to normalize.'**
  String get methMilestone90Description;

  /// No description provided for @methMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Six Months - Cardiovascular Recovery'**
  String get methMilestone180Title;

  /// No description provided for @methMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'Heart function shows measurable improvement with abstinence. Studies show cardiac function can recover significantly during this period when combined with medical support. Blood pressure and heart rhythm continue stabilizing.'**
  String get methMilestone180Description;

  /// No description provided for @methMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One Year - Major Brain Recovery'**
  String get methMilestone365Title;

  /// No description provided for @methMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'Dopamine system recovery reaches significant milestones. Your brain\'s ability to experience pleasure from natural rewards improves substantially. Cognitive function, mood regulation, and decision-making show marked improvements.'**
  String get methMilestone365Description;

  /// No description provided for @methMilestone420Title.
  ///
  /// In en, this message translates to:
  /// **'14 Months - Dopamine Normalization'**
  String get methMilestone420Title;

  /// No description provided for @methMilestone420Description.
  ///
  /// In en, this message translates to:
  /// **'Brain imaging studies show dopamine transporter levels approaching normal at this stage. This represents the most significant phase of neurological recovery, with improvements in memory, motivation, and the ability to feel pleasure from everyday activities.'**
  String get methMilestone420Description;

  /// No description provided for @methMilestone730Title.
  ///
  /// In en, this message translates to:
  /// **'Two Years - Sustained Recovery'**
  String get methMilestone730Title;

  /// No description provided for @methMilestone730Description.
  ///
  /// In en, this message translates to:
  /// **'Long-term abstinence allows for continued brain healing. Attention and mood typically rebound within 12-18 months for most people. Your cognitive function, emotional regulation, and overall quality of life continue improving with sustained recovery.'**
  String get methMilestone730Description;

  /// No description provided for @addictionCocaine.
  ///
  /// In en, this message translates to:
  /// **'Cocaine'**
  String get addictionCocaine;

  /// No description provided for @addictionAdderall.
  ///
  /// In en, this message translates to:
  /// **'Adderall'**
  String get addictionAdderall;

  /// No description provided for @cocainePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Cocaine Recovery'**
  String get cocainePageTitle;

  /// No description provided for @cocaineHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get cocaineHeaderStarted;

  /// No description provided for @cocaineHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Ready to Start?'**
  String get cocaineHeaderNotStarted;

  /// No description provided for @cocaineSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get cocaineSubtitleStarted;

  /// No description provided for @cocaineSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what positive changes await you'**
  String get cocaineSubtitleNotStarted;

  /// No description provided for @cocaineMilestone1Title.
  ///
  /// In en, this message translates to:
  /// **'First 24 Hours - The Beginning'**
  String get cocaineMilestone1Title;

  /// No description provided for @cocaineMilestone1Description.
  ///
  /// In en, this message translates to:
  /// **'Your body begins adjusting as dopamine levels start to stabilize. You may experience fatigue, mood changes, and strong cravings, but your cardiovascular system is already beginning to recover.'**
  String get cocaineMilestone1Description;

  /// No description provided for @cocaineMilestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Day 3 - Peak Challenge'**
  String get cocaineMilestone3Title;

  /// No description provided for @cocaineMilestone3Description.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal symptoms often peak around this time. You may experience intense cravings, irritability, anxiety, and exhaustion. This is temporary - your brain is working hard to rebalance itself.'**
  String get cocaineMilestone3Description;

  /// No description provided for @cocaineMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'One Week - Physical Recovery Begins'**
  String get cocaineMilestone7Title;

  /// No description provided for @cocaineMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'The most intense physical symptoms are beginning to subside. Your heart rate and blood pressure are stabilizing. While psychological cravings may persist, your body is healing.'**
  String get cocaineMilestone7Description;

  /// No description provided for @cocaineMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks - Finding Stability'**
  String get cocaineMilestone14Title;

  /// No description provided for @cocaineMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'Many people start feeling more stable emotionally. Your energy levels are improving, and acute withdrawal symptoms are easing. Your cardiovascular health continues to improve significantly.'**
  String get cocaineMilestone14Description;

  /// No description provided for @cocaineMilestone60Title.
  ///
  /// In en, this message translates to:
  /// **'Two Months - Sleep and Mood Improve'**
  String get cocaineMilestone60Title;

  /// No description provided for @cocaineMilestone60Description.
  ///
  /// In en, this message translates to:
  /// **'Your sleep quality is noticeably better as your brain chemistry continues normalizing. You may find yourself feeling more rested and experiencing more stable moods throughout the day.'**
  String get cocaineMilestone60Description;

  /// No description provided for @cocaineMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Three Months - Brain Restoration'**
  String get cocaineMilestone90Title;

  /// No description provided for @cocaineMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Your brain is actively restoring dopamine receptors and neural pathways. You\'ll likely notice improvements in focus, decision-making, and emotional regulation. Cognitive function is significantly improved.'**
  String get cocaineMilestone90Description;

  /// No description provided for @cocaineMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Six Months - Cognitive Gains'**
  String get cocaineMilestone180Title;

  /// No description provided for @cocaineMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'Brain imaging studies show increased gray matter volume in the prefrontal cortex at this stage. Your executive function, memory, and impulse control continue to strengthen. You\'re thinking more clearly.'**
  String get cocaineMilestone180Description;

  /// No description provided for @cocaineMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One Year - Cardiovascular Health'**
  String get cocaineMilestone365Title;

  /// No description provided for @cocaineMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'Your heart and cardiovascular system have made remarkable recovery. Blood pressure and heart rate are normalized. Risk of heart attack and stroke has decreased significantly. Your body is healing.'**
  String get cocaineMilestone365Description;

  /// No description provided for @cocaineMilestone730Title.
  ///
  /// In en, this message translates to:
  /// **'Two Years - Sustained Recovery'**
  String get cocaineMilestone730Title;

  /// No description provided for @cocaineMilestone730Description.
  ///
  /// In en, this message translates to:
  /// **'Brain healing continues with sustained improvements in memory, focus, and emotional regulation. Your neural pathways have significantly reorganized, supporting healthier patterns and better overall wellbeing.'**
  String get cocaineMilestone730Description;

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

  /// Floating action button label on quit page (start button)
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get quitStartButton;

  /// Floating action button label on quit page (reset button)
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get quitResetButton;

  /// Prompt displayed on the quit card
  ///
  /// In en, this message translates to:
  /// **'Tap to start'**
  String get quitCardSubtitle;

  /// Kepp days on Quit card
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =1 { day} other { days}}'**
  String quitCardKeepDays(int days);

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

  /// An error occurred. This setting is not supported.
  ///
  /// In en, this message translates to:
  /// **'Unsupported'**
  String get settingsLocaleUnsupported;

  /// Show app in Japanese
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get settingsLocaleJapanese;

  /// Show app in English
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLocaleEnglish;

  /// Show app in Simplified Chinese
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get settingsLocaleSimplifiedChinese;

  /// Follows the device locale
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsLocaleSystem;

  /// Language for the text in Quitter
  ///
  /// In en, this message translates to:
  /// **'Locale'**
  String get settingsLocale;

  /// Name of the nicotine pouches addiction type
  ///
  /// In en, this message translates to:
  /// **'Nicotine pouches'**
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

  /// Use the dynamic color scheme from Material 3
  ///
  /// In en, this message translates to:
  /// **'Dynamic colors'**
  String get settingsDynamicColorScheme;

  /// Use the blue-based color scheme.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get settingsBlueColorScheme;

  /// Use the green-based color scheme.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get settingsGreenColorScheme;

  /// Use the red-based color scheme.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get settingsRedColorScheme;

  /// Use the purple-based color scheme.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get settingsPurpleColorScheme;

  /// Use the orange-based color scheme.
  ///
  /// In en, this message translates to:
  /// **'Orange'**
  String get settingsOrangeColorScheme;

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

  /// No description provided for @settingsShowHeroinSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Show heroin tracking'**
  String get settingsShowHeroinSubtitle;

  /// No description provided for @settingsShowBenzosSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Show benzos tracking'**
  String get settingsShowBenzosSubtitle;

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

  /// No description provided for @settingsShowAdderallTracking.
  ///
  /// In en, this message translates to:
  /// **'Show adderall tracking'**
  String get settingsShowAdderallTracking;

  /// No description provided for @settingsNotifyAdderall.
  ///
  /// In en, this message translates to:
  /// **'Notify adderall quitting progress'**
  String get settingsNotifyAdderall;

  /// No description provided for @settingsShowCocaineTracking.
  ///
  /// In en, this message translates to:
  /// **'Show cocaine tracking'**
  String get settingsShowCocaineTracking;

  /// No description provided for @settingsShowMethTracking.
  ///
  /// In en, this message translates to:
  /// **'Show meth tracking'**
  String get settingsShowMethTracking;

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

  /// No description provided for @settingsNotifyHeroin.
  ///
  /// In en, this message translates to:
  /// **'Notify heroin quitting progress'**
  String get settingsNotifyHeroin;

  /// No description provided for @settingsNotifyBenzos.
  ///
  /// In en, this message translates to:
  /// **'Notify benzos quitting progress'**
  String get settingsNotifyBenzos;

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

  /// No description provided for @settingsNotifyCocaine.
  ///
  /// In en, this message translates to:
  /// **'Notify cocaine quitting progress'**
  String get settingsNotifyCocaine;

  /// No description provided for @settingsNotifyMeth.
  ///
  /// In en, this message translates to:
  /// **'Notify meth quitting progress'**
  String get settingsNotifyMeth;

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

  /// Display quit date with elapsed days.
  ///
  /// In en, this message translates to:
  /// **'{quitDate} ({days, plural, =1 {{days} day} other {{days} days}})'**
  String alcoholPageQuitDateDisplay(DateTime quitDate, int days);

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

  /// Alcohol milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Sleep Quality Begins to Improve'**
  String get alcoholMilestone1Title;

  /// Alcohol milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'Your REM sleep cycles start to normalize within the first day. While alcohol might help you fall asleep initially, it disrupts deep sleep and REM cycles throughout the night, causing fragmented sleep.'**
  String get alcoholMilestone1Description;

  /// Alcohol milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'Hydration Levels Restore'**
  String get alcoholMilestone3Title;

  /// Alcohol milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'Your kidneys are recovering from alcohol\'s diuretic effects. Alcohol suppresses antidiuretic hormone, leading to increased urination and dehydration. By day 3, your body\'s fluid balance is improving significantly.'**
  String get alcoholMilestone3Description;

  /// Alcohol milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Immune System Strengthens'**
  String get alcoholMilestone7Title;

  /// Alcohol milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'Your white blood cells are recovering their function. Even a single bout of heavy drinking can impair immune function for up to 24 hours, and chronic drinking significantly weakens your body\'s ability to fight infections.'**
  String get alcoholMilestone7Description;

  /// Alcohol milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Brain Volume Recovery Begins'**
  String get alcoholMilestone14Title;

  /// Alcohol milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Rapid recovery of brain volume begins within the first two weeks of abstinence. Research shows evidence of brain tissue recovery starting around 14 days, though full cognitive function continues improving over months.'**
  String get alcoholMilestone14Description;

  /// Alcohol milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'Blood Pressure Normalizes'**
  String get alcoholMilestone30Title;

  /// Alcohol milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'Your cardiovascular system shows significant improvement. Regular alcohol consumption elevates blood pressure, but abstinence for about a month can help bring blood pressure back to healthier levels.'**
  String get alcoholMilestone30Description;

  /// Alcohol milestone day 60 title
  ///
  /// In en, this message translates to:
  /// **'Liver Function Improves'**
  String get alcoholMilestone60Title;

  /// Alcohol milestone day 60 description
  ///
  /// In en, this message translates to:
  /// **'Your liver shows measurable improvement in function. This regenerative organ can recover significantly from alcohol-induced damage, with liver enzymes and fat accumulation showing improvement within 2 months of abstinence.'**
  String get alcoholMilestone60Description;

  /// Alcohol milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Cognitive Function Substantially Improves'**
  String get alcoholMilestone90Title;

  /// Alcohol milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Significant cognitive recovery occurs over the first 3 months. Studies show people who maintain abstinence continue to recover cognitive function over several months, with measurable improvements in memory, concentration, and decision-making.'**
  String get alcoholMilestone90Description;

  /// Alcohol milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Brain Volume and Function Continue Recovery'**
  String get alcoholMilestone180Title;

  /// Alcohol milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Six months of sobriety allows for continued neural recovery. Research indicates that brain volume continues to increase and cognitive abilities continue improving significantly during this period of sustained abstinence.'**
  String get alcoholMilestone180Description;

  /// Alcohol milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'Cancer Risk Reduction May Begin'**
  String get alcoholMilestone365Title;

  /// Alcohol milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'One year of abstinence may begin to reduce cancer risk. While alcohol clearly increases risk for several cancers (liver, breast, colorectal, esophageal), research on risk reduction timeline is still emerging and varies by cancer type.'**
  String get alcoholMilestone365Description;

  /// Smoking milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Carbon Monoxide Clears'**
  String get smokingMilestone1Title;

  /// Smoking milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'Your blood is breathing again! Within 24 hours, carbon monoxide levels drop to normal and oxygen levels increase. Your heart doesn\'t have to work overtime anymore to pump poisoned blood around your body.'**
  String get smokingMilestone1Description;

  /// Smoking milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'Nicotine Withdrawal Peaks'**
  String get smokingMilestone3Title;

  /// Smoking milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'The nicotine monster is at its angriest, but you\'re winning the battle! All nicotine has left your system. The worst cravings happen now, but they\'re also your ticket to freedom on the other side.'**
  String get smokingMilestone3Description;

  /// Smoking milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Taste & Smell Dramatically Improve'**
  String get smokingMilestone7Title;

  /// Smoking milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'Food is about to become an adventure again! Smoking destroys taste buds and smell receptors. One week in, and you\'re rediscovering flavors you forgot existed. Prepare for some serious food appreciation!'**
  String get smokingMilestone7Description;

  /// Smoking milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Circulation & Walking Improve'**
  String get smokingMilestone14Title;

  /// Smoking milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Your legs are thanking you with every step! Blood circulation improves dramatically, making walking and exercise noticeably easier. Those stairs aren\'t looking so intimidating anymore, are they?'**
  String get smokingMilestone14Description;

  /// Smoking milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'Lung Function Increases'**
  String get smokingMilestone30Title;

  /// Smoking milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'Your lungs are throwing a comeback party! Cilia have regrown and are sweeping out years of tar and debris. Lung capacity increases significantly, and that smoker\'s cough is history.'**
  String get smokingMilestone30Description;

  /// Smoking milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Heart Attack Risk Drops Significantly'**
  String get smokingMilestone90Title;

  /// Smoking milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Your heart is sending love letters! Three months smoke-free and your cardiovascular risk has already dropped substantially. Your cardiovascular system is healing faster than you might think possible.'**
  String get smokingMilestone90Description;

  /// Smoking milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Immune System Strengthens'**
  String get smokingMilestone180Title;

  /// Smoking milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Your immune system just got a superhero upgrade! Six months without smoking and your white blood cells are back to full strength, fighting infections like the champions they were born to be.'**
  String get smokingMilestone180Description;

  /// Smoking milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'Stroke Risk Reduces Significantly'**
  String get smokingMilestone365Title;

  /// Smoking milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'One full year of freedom! Your stroke risk has decreased substantially, and your blood vessels are healing beautifully. You\'ve officially given your brain the gift of better circulation and protection.'**
  String get smokingMilestone365Description;

  /// Smoking milestone day 1825 title
  ///
  /// In en, this message translates to:
  /// **'Cancer Risk Plummets (5 Years)'**
  String get smokingMilestone1825Title;

  /// Smoking milestone day 1825 description
  ///
  /// In en, this message translates to:
  /// **'Five years of victory! Your risk of mouth, throat, esophagus, and bladder cancers has dropped by half. Lung cancer risk has decreased significantly too. Your cells have had time to repair and regenerate.'**
  String get smokingMilestone1825Description;

  /// Vaping milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Nicotine Cravings Peak'**
  String get vapingMilestone1Title;

  /// Vaping milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'Your brain is throwing a nicotine tantrum, but you\'re already winning! Within 24 hours, nicotine levels drop dramatically. The worst cravings happen now, but they\'re also the most important to push through.'**
  String get vapingMilestone1Description;

  /// Vaping milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'Breathing Improves'**
  String get vapingMilestone3Title;

  /// Vaping milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'Your lungs are doing a happy dance! Bronchial tubes begin to relax and lung capacity starts improving. That tight chest feeling from vaping is already beginning to ease up.'**
  String get vapingMilestone3Description;

  /// Vaping milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Taste & Smell Return'**
  String get vapingMilestone7Title;

  /// Vaping milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'Food is about to taste amazing again! Nicotine dampens taste buds and smell receptors. A week in, and your sensory superpowers are making their comeback tour.'**
  String get vapingMilestone7Description;

  /// Vaping milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Circulation Improves'**
  String get vapingMilestone14Title;

  /// Vaping milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Your blood is flowing like a champion! Nicotine constricts blood vessels, but two weeks smoke-free and your circulation is dramatically improving. Cold hands and feet, begone!'**
  String get vapingMilestone14Description;

  /// Vaping milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'Lung Function Recovery'**
  String get vapingMilestone30Title;

  /// Vaping milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'Your lungs are practically throwing a celebration parade! Cilia (tiny lung cleaners) have regenerated and lung function has improved significantly. That morning cough is history!'**
  String get vapingMilestone30Description;

  /// Vaping milestone day 60 title
  ///
  /// In en, this message translates to:
  /// **'Anxiety Levels Normalize'**
  String get vapingMilestone60Title;

  /// Vaping milestone day 60 description
  ///
  /// In en, this message translates to:
  /// **'Plot twist: vaping was making your anxiety problems worse, not better! Two months in and your baseline anxiety levels are significantly lower. Your nervous system is finally chilling out.'**
  String get vapingMilestone60Description;

  /// Vaping milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Cognitive Function Sharpens'**
  String get vapingMilestone90Title;

  /// Vaping milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Brain fog has officially left the building! Three months without nicotine and your cognitive function, focus, and memory are significantly improved. It\'s like upgrading your mental RAM.'**
  String get vapingMilestone90Description;

  /// Vaping milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Oral Health Recovery'**
  String get vapingMilestone180Title;

  /// Vaping milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Your mouth is sending thank-you cards! Six months vape-free and gum inflammation decreases, tooth staining fades, and your risk of oral health issues drops substantially.'**
  String get vapingMilestone180Description;

  /// Vaping milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'Cardiovascular Risk Reduction'**
  String get vapingMilestone365Title;

  /// Vaping milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'Your heart is literally stronger! One full year and your risk of heart disease has dropped significantly. Your cardiovascular system has recovered from nicotine\'s daily assault course.'**
  String get vapingMilestone365Description;

  /// Marijuana milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Symptoms Begin'**
  String get marijuanaMilestone1Title;

  /// Marijuana milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'Your brain is adjusting to life without THC! Within 24-48 hours, you might experience irritability, anxiety, or sleep difficulties. This is completely normal - your cannabinoid receptors are starting to reset.'**
  String get marijuanaMilestone1Description;

  /// Marijuana milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'Physical Symptoms Peak'**
  String get marijuanaMilestone3Title;

  /// Marijuana milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'You\'re at the toughest point, but it\'s all uphill from here! Days 2-6 typically see peak withdrawal symptoms including headaches, sweating, and mood changes. Your body is working hard to rebalance itself.'**
  String get marijuanaMilestone3Description;

  /// Marijuana milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Sleep Patterns Improve'**
  String get marijuanaMilestone7Title;

  /// Marijuana milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'Sweet dreams are making a comeback! After a week without cannabis, your natural sleep architecture begins to normalize. REM sleep rebounds, leading to more vivid dreams and better rest quality.'**
  String get marijuanaMilestone7Description;

  /// Marijuana milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Acute Withdrawal Ends'**
  String get marijuanaMilestone14Title;

  /// Marijuana milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'The storm has passed! Most physical withdrawal symptoms significantly decrease after two weeks. Your mood is stabilizing and daily functioning becomes much easier. The hardest part is behind you.'**
  String get marijuanaMilestone14Description;

  /// Marijuana milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'Memory Function Improves'**
  String get marijuanaMilestone30Title;

  /// Marijuana milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'Your brain fog is clearing! Research shows that verbal learning and memory begin improving significantly after stopping cannabis use. The hippocampus, crucial for memory formation, starts functioning better.'**
  String get marijuanaMilestone30Description;

  /// Marijuana milestone day 60 title
  ///
  /// In en, this message translates to:
  /// **'Concentration Sharpens'**
  String get marijuanaMilestone60Title;

  /// Marijuana milestone day 60 description
  ///
  /// In en, this message translates to:
  /// **'Focus mode: activated! Two months without cannabis and your ability to concentrate and maintain attention shows marked improvement. Work tasks and studying become noticeably easier to manage.'**
  String get marijuanaMilestone60Description;

  /// Marijuana milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Mood Stability Returns'**
  String get marijuanaMilestone90Title;

  /// Marijuana milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Emotional equilibrium restored! Three months of abstinence brings significant improvements in mood regulation, decreased anxiety levels, and better stress management. Your emotional baseline is normalizing.'**
  String get marijuanaMilestone90Description;

  /// Marijuana milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Executive Function Recovery'**
  String get marijuanaMilestone180Title;

  /// Marijuana milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Your mental CEO is back in charge! Six months without cannabis shows substantial improvement in executive functions - planning, decision-making, and problem-solving abilities are significantly enhanced.'**
  String get marijuanaMilestone180Description;

  /// Marijuana milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'Brain Structure Restoration'**
  String get marijuanaMilestone365Title;

  /// Marijuana milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'Neural architecture rebuilt! One year of abstinence allows significant recovery of brain regions affected by chronic cannabis use. Cognitive improvements become your new normal, with lasting benefits to learning and memory.'**
  String get marijuanaMilestone365Description;

  /// Opioid milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Acute Withdrawal Begins'**
  String get opioidMilestone1Title;

  /// Opioid milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'The hardest part starts now, but you\'re not alone. Acute withdrawal symptoms peak in the first 24-72 hours. This is your body beginning the healing process. Professional medical support is crucial during this phase.'**
  String get opioidMilestone1Description;

  /// Opioid milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Physical Symptoms Peak & Begin Declining'**
  String get opioidMilestone7Title;

  /// Opioid milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'You\'ve made it through the storm! The worst physical withdrawal symptoms typically peak around days 3-5 and start declining by day 7. Your body is working hard to restore its natural balance.'**
  String get opioidMilestone7Description;

  /// Opioid milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Sleep Patterns Start Improving'**
  String get opioidMilestone14Title;

  /// Opioid milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Sweet dreams are making a comeback! Two weeks in, your natural sleep architecture begins to restore. Opioids disrupt REM sleep, but your brain is learning to dream naturally again.'**
  String get opioidMilestone14Description;

  /// Opioid milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'Cognitive Function Begins Recovery'**
  String get opioidMilestone30Title;

  /// Opioid milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'Brain fog is starting to lift! One month clean and your cognitive function, decision-making, and memory are beginning to improve. Your prefrontal cortex is healing from opioid-induced changes.'**
  String get opioidMilestone30Description;

  /// Opioid milestone day 60 title
  ///
  /// In en, this message translates to:
  /// **'Emotional Regulation Improves'**
  String get opioidMilestone60Title;

  /// Opioid milestone day 60 description
  ///
  /// In en, this message translates to:
  /// **'Your emotions are finding their natural rhythm again. Two months in recovery and your brain\'s reward system is starting to respond to everyday pleasures. The emotional rollercoaster is stabilizing.'**
  String get opioidMilestone60Description;

  /// Opioid milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Dopamine Function Significantly Recovers'**
  String get opioidMilestone90Title;

  /// Opioid milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Your brain\'s reward system is throwing a welcome-back party! Three months clean and dopamine function has significantly improved. Natural activities start feeling rewarding again - food, music, relationships.'**
  String get opioidMilestone90Description;

  /// Opioid milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Immune System Strengthens'**
  String get opioidMilestone180Title;

  /// Opioid milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Your immune system is back on patrol duty! Six months of recovery and your body\'s natural defenses have significantly strengthened. You\'re better equipped to fight off infections and illness.'**
  String get opioidMilestone180Description;

  /// Opioid milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'Neural Plasticity & Brain Structure Improve'**
  String get opioidMilestone365Title;

  /// Opioid milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'Your brain has been busy renovating! One full year of recovery shows significant improvements in brain structure and neural plasticity. The changes from chronic opioid use are healing beautifully.'**
  String get opioidMilestone365Description;

  /// Opioid milestone day 730 title
  ///
  /// In en, this message translates to:
  /// **'Long-term Recovery Stability (2 Years)'**
  String get opioidMilestone730Title;

  /// Opioid milestone day 730 description
  ///
  /// In en, this message translates to:
  /// **'Two years of strength and resilience! You\'ve built new neural pathways, coping strategies, and life patterns. Research shows that reaching this milestone dramatically reduces relapse risk. You\'re a recovery warrior!'**
  String get opioidMilestone730Description;

  /// Social media milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Digital Detox Day One! 🎯'**
  String get socialMediaMilestone1Title;

  /// Social media milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'You\'ve officially started rewiring your brain! Research shows that even thinking about checking social media triggers the same neural pathways as addiction. But you\'re already breaking the cycle - go you!'**
  String get socialMediaMilestone1Description;

  /// Social media milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'FOMO? More Like FO-NO! 😎'**
  String get socialMediaMilestone3Title;

  /// Social media milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'Three days in and those anxious \'what am I missing?\' thoughts are already fading. You\'re training your brain that real life is way more interesting than curated feeds!'**
  String get socialMediaMilestone3Description;

  /// Social media milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Attention Span: Goldfish → Human 🧠'**
  String get socialMediaMilestone7Title;

  /// Social media milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'Week one complete! Your ability to focus without checking your phone every few minutes is already improving. Studies show our brains crave the dopamine hits from notifications - but you\'re teaching yours to find rewards elsewhere!'**
  String get socialMediaMilestone7Description;

  /// Social media milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Sleep Like a Baby (Not a Zombie) 😴'**
  String get socialMediaMilestone14Title;

  /// Social media milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Two weeks without scrolling before bed = better sleep quality! The blue light from screens suppresses melatonin production, but your natural sleep rhythms are bouncing back beautifully.'**
  String get socialMediaMilestone14Description;

  /// Social media milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'Real Friends > Fake Likes 💝'**
  String get socialMediaMilestone30Title;

  /// Social media milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'One month offline = significant reductions in loneliness and depression! Research proves that limiting social media creates major mental health improvements. You\'ve gone even further!'**
  String get socialMediaMilestone30Description;

  /// Social media milestone day 60 title
  ///
  /// In en, this message translates to:
  /// **'Comparison Trap: ESCAPED! ✨'**
  String get socialMediaMilestone60Title;

  /// Social media milestone day 60 description
  ///
  /// In en, this message translates to:
  /// **'Two months without constant social comparison = confidence through the roof! Research consistently shows that social media use correlates with decreased self-esteem, especially from upward social comparisons. You\'ve broken free from the comparison trap!'**
  String get socialMediaMilestone60Description;

  /// Social media milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Hobby Collector Level: Expert 🎨'**
  String get socialMediaMilestone90Title;

  /// Social media milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Three months = roughly 270+ hours reclaimed! That\'s enough time to learn a new skill, read 15+ books, or master that hobby you always said you\'d try \'someday.\' Neuroplasticity research shows your brain is literally rewiring for these new awesome habits!'**
  String get socialMediaMilestone90Description;

  /// Social media milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Mental Health Glow-Up Complete 🌟'**
  String get socialMediaMilestone180Title;

  /// Social media milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Six months offline and you\'re officially thriving! Long-term studies show that reducing social media use leads to sustained improvements in wellbeing, self-esteem, and life satisfaction. You\'re living proof that life\'s better in the real world!'**
  String get socialMediaMilestone180Description;

  /// Social media milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'Digital Zen Master Achieved 🏆'**
  String get socialMediaMilestone365Title;

  /// Social media milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'One full year of intentional living! You\'ve reclaimed 1,000+ hours, formed deeper relationships, and proved that the best moments in life aren\'t meant for sharing - they\'re meant for experiencing. You\'re officially a digital wellness legend!'**
  String get socialMediaMilestone365Description;

  /// Nicotine pouches milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Taste & Smell Begin Recovery'**
  String get nicotinePouchesMilestone1Title;

  /// Nicotine pouches milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'Nicotine dulls your taste buds and smell receptors. After just 24 hours without pouches, these senses start their comeback tour! Food is about to taste amazing again.'**
  String get nicotinePouchesMilestone1Description;

  /// Nicotine pouches milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'Nicotine Completely Cleared'**
  String get nicotinePouchesMilestone3Title;

  /// Nicotine pouches milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'Your body has officially evicted all nicotine! While withdrawal symptoms might peak around now, remember - this is your brain rewiring itself for freedom. The hardest part is almost over.'**
  String get nicotinePouchesMilestone3Description;

  /// Nicotine pouches milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Oral Health Improves'**
  String get nicotinePouchesMilestone7Title;

  /// Nicotine pouches milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'Your gums are throwing a celebration! Nicotine pouches can cause gum irritation and recession. After a week, blood flow to your gums normalizes and healing begins.'**
  String get nicotinePouchesMilestone7Description;

  /// Nicotine pouches milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Circulation Enhancement'**
  String get nicotinePouchesMilestone14Title;

  /// Nicotine pouches milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Your blood vessels are doing a happy dance! Nicotine constricts blood vessels, but two weeks free and your circulation is significantly improved. Hello, warmer hands and feet!'**
  String get nicotinePouchesMilestone14Description;

  /// Nicotine pouches milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'Stress Response Normalizes'**
  String get nicotinePouchesMilestone30Title;

  /// Nicotine pouches milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'Plot twist: nicotine actually increases stress between uses! Your cortisol levels and stress response are now returning to baseline. Real relaxation, not the nicotine fake-out.'**
  String get nicotinePouchesMilestone30Description;

  /// Nicotine pouches milestone day 60 title
  ///
  /// In en, this message translates to:
  /// **'Sleep Quality Improves'**
  String get nicotinePouchesMilestone60Title;

  /// Nicotine pouches milestone day 60 description
  ///
  /// In en, this message translates to:
  /// **'Sweet dreams are made of... no nicotine! While nicotine seems relaxing, it actually disrupts sleep architecture. Two months in, and your REM cycles are beautifully restored.'**
  String get nicotinePouchesMilestone60Description;

  /// Nicotine pouches milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Dopamine Receptors Recover'**
  String get nicotinePouchesMilestone90Title;

  /// Nicotine pouches milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Your brain\'s reward system is back online! Nicotine hijacks dopamine pathways, making normal pleasures seem dull. Three months free, and life\'s natural joys are vibrant again.'**
  String get nicotinePouchesMilestone90Description;

  /// Nicotine pouches milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Cardiovascular Risk Drops'**
  String get nicotinePouchesMilestone180Title;

  /// Nicotine pouches milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Your heart is sending love letters! Six months without nicotine significantly reduces cardiovascular disease risk. Your blood pressure and heart rate variability are vastly improved.'**
  String get nicotinePouchesMilestone180Description;

  /// Nicotine pouches milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'Long-term Health Secured'**
  String get nicotinePouchesMilestone365Title;

  /// Nicotine pouches milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'One year of freedom! Your risk of nicotine-related health issues continues to plummet. You\'ve broken the addiction cycle and reclaimed your autonomy. That\'s genuinely heroic! 🏆'**
  String get nicotinePouchesMilestone365Description;

  /// Pornography milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Breaking the Cycle'**
  String get pornographyMilestone1Title;

  /// Pornography milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'You\'ve taken the hardest step! Day one is about breaking the automatic response pattern. Your brain is already starting to notice the absence of the dopamine spike it was expecting.'**
  String get pornographyMilestone1Description;

  /// Pornography milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Symptoms Peak'**
  String get pornographyMilestone3Title;

  /// Pornography milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'The storm before the calm. Cravings, restlessness, and mood swings are at their strongest now. Your brain is working hard to rewire itself. This discomfort is actually your neural pathways healing!'**
  String get pornographyMilestone3Description;

  /// Pornography milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Sleep Quality Improves'**
  String get pornographyMilestone7Title;

  /// Pornography milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'Sweet dreams are made of this! Your sleep cycles are stabilizing as your brain\'s reward system begins to rebalance. Many people report deeper, more restorative sleep and fewer sleep disturbances.'**
  String get pornographyMilestone7Description;

  /// Pornography milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Motivation & Energy Return'**
  String get pornographyMilestone14Title;

  /// Pornography milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'The fog is lifting! Many people notice increased motivation, clearer thinking, and more energy for real-world activities. Your brain\'s natural reward system is starting to find pleasure in everyday experiences again.'**
  String get pornographyMilestone14Description;

  /// Pornography milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'Confidence & Self-Control Grow'**
  String get pornographyMilestone30Title;

  /// Pornography milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'You\'re building mental muscle! One month of abstinence often brings increased self-confidence, better emotional regulation, and a stronger sense of personal control. You\'re proving to yourself that you can overcome challenges.'**
  String get pornographyMilestone30Description;

  /// Pornography milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Brain Function Stabilizes'**
  String get pornographyMilestone90Title;

  /// Pornography milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Your brain is finding its balance! Three months allows significant improvements in focus, decision-making, and emotional regulation. The compulsive urges are becoming much more manageable.'**
  String get pornographyMilestone90Description;

  /// Pornography milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Relationship & Social Skills Improve'**
  String get pornographyMilestone180Title;

  /// Pornography milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Connection is your superpower now! Six months often brings improved ability to form genuine connections, better eye contact, reduced social anxiety, and more authentic relationships with others.'**
  String get pornographyMilestone180Description;

  /// Pornography milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'Complete Neural Pathway Reset'**
  String get pornographyMilestone365Title;

  /// Pornography milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'You\'ve rewired your brain! One year allows for substantial neural pathway changes. Many report complete transformation in how they view relationships, intimacy, and personal fulfillment. You\'ve built a new you!'**
  String get pornographyMilestone365Description;

  /// Pornography milestone day 1825 title
  ///
  /// In en, this message translates to:
  /// **'Lasting Life Transformation (5 Years)'**
  String get pornographyMilestone1825Title;

  /// Pornography milestone day 1825 description
  ///
  /// In en, this message translates to:
  /// **'Five years of freedom! You\'ve established completely new neural patterns and life habits. Research suggests brain rewiring can take 1-60 months depending on addiction severity, and you\'ve surpassed that milestone.'**
  String get pornographyMilestone1825Description;

  /// Custom milestone day 1 title
  ///
  /// In en, this message translates to:
  /// **'Initial Recovery Phase Begins'**
  String get customMilestone1Title;

  /// Custom milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'Your body starts the healing process! Within 24 hours of quitting, your system begins to clear toxins and adjust to functioning without addictive substances. Sleep disturbances are common but part of the recovery process.'**
  String get customMilestone1Description;

  /// Custom milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Symptoms Peak'**
  String get customMilestone3Title;

  /// Custom milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'You\'re facing the storm head-on! Physical withdrawal symptoms typically peak around day 3 for many substances, including anxiety, mood swings, and physical discomfort. This means you\'re getting through the hardest part.'**
  String get customMilestone3Description;

  /// Custom milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'Acute Withdrawal Phase Ending'**
  String get customMilestone7Title;

  /// Custom milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'The worst is behind you! After one week, acute withdrawal symptoms begin to subside for most substances. Your body is adjusting to its new normal and starting to stabilize.'**
  String get customMilestone7Description;

  /// Custom milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Early Recovery Stabilization'**
  String get customMilestone14Title;

  /// Custom milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Your mind is clearing! Two weeks of sobriety often brings improved mental clarity and reduced cravings as your brain begins to adapt to functioning without addictive substances.'**
  String get customMilestone14Description;

  /// Custom milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'One Month Milestone'**
  String get customMilestone30Title;

  /// Custom milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'A major victory! Thirty days of sobriety represents significant progress. Many people find that sleep patterns, mood, and energy levels continue to improve during this period.'**
  String get customMilestone30Description;

  /// Custom milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Three Month Recovery Milestone'**
  String get customMilestone90Title;

  /// Custom milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Your commitment is paying off! Three months of recovery represents a significant achievement. Post-acute withdrawal symptoms typically begin to fade, and many people report feeling more like themselves again.'**
  String get customMilestone90Description;

  /// Custom milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Six Month Recovery Achievement'**
  String get customMilestone180Title;

  /// Custom milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'You\'re building lasting change! Six months of sobriety often brings continued improvements in physical health, emotional stability, and overall quality of life as your body continues healing.'**
  String get customMilestone180Description;

  /// Custom milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'One Year of Recovery'**
  String get customMilestone365Title;

  /// Custom milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'An incredible achievement! One year of sobriety represents a major life milestone. Many people experience significant improvements in physical health, relationships, and overall well-being by this point.'**
  String get customMilestone365Description;

  /// Custom milestone day 730 title
  ///
  /// In en, this message translates to:
  /// **'Two Years of Sustained Recovery'**
  String get customMilestone730Title;

  /// Custom milestone day 730 description
  ///
  /// In en, this message translates to:
  /// **'You\'ve built a new life! Two years of recovery demonstrates remarkable resilience and commitment. Long-term sobriety often brings profound positive changes in all areas of life and significantly reduced risk of relapse.'**
  String get customMilestone730Description;
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
      <String>['en', 'ja', 'zh'].contains(locale.languageCode);

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
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
