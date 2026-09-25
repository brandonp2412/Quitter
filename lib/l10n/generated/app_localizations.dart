import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ru.dart';
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
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ja'),
    Locale('ru'),
    Locale('zh'),
  ];

  /// No description provided for @kratomPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Kratom Recovery'**
  String get kratomPageTitle;

  /// No description provided for @kratomHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get kratomHeaderStarted;

  /// No description provided for @kratomHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Benefits of Quitting Kratom'**
  String get kratomHeaderNotStarted;

  /// No description provided for @kratomSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get kratomSubtitleStarted;

  /// No description provided for @kratomSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you quit'**
  String get kratomSubtitleNotStarted;

  /// No description provided for @kratomInfoBox.
  ///
  /// In en, this message translates to:
  /// **'Kratom acts on opioid receptors, so stopping can produce an opioid-like withdrawal. If you use heavily or alongside other opioids, ask a clinician about medically supervised withdrawal.'**
  String get kratomInfoBox;

  /// No description provided for @addictionKratom.
  ///
  /// In en, this message translates to:
  /// **'Kratom'**
  String get addictionKratom;

  /// No description provided for @kratomMilestone1Title.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Begins'**
  String get kratomMilestone1Title;

  /// No description provided for @kratomMilestone1Description.
  ///
  /// In en, this message translates to:
  /// **'Kratom acts on opioid receptors, so within 6–12 hours of your last dose you may feel restlessness, anxiety, sweating, runny nose, and muscle aches. This is your nervous system beginning to adjust.'**
  String get kratomMilestone1Description;

  /// No description provided for @kratomMilestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Peak Withdrawal'**
  String get kratomMilestone3Title;

  /// No description provided for @kratomMilestone3Description.
  ///
  /// In en, this message translates to:
  /// **'Acute symptoms usually peak around days 2–3: stronger aches, insomnia, stomach upset, and low mood. This is the hardest point, and it is temporary.'**
  String get kratomMilestone3Description;

  /// No description provided for @kratomMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'Acute Symptoms Subside'**
  String get kratomMilestone7Title;

  /// No description provided for @kratomMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'By one week the worst physical symptoms — aches, stomach upset, sweating — have largely faded. Sleep and energy are still recovering.'**
  String get kratomMilestone7Description;

  /// No description provided for @kratomMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Mood and Sleep Recovering'**
  String get kratomMilestone14Title;

  /// No description provided for @kratomMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'Two weeks in, sleep is more reliable and mood is steadier as your brain\'s own reward chemistry begins to rebalance.'**
  String get kratomMilestone14Description;

  /// No description provided for @kratomMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month Clear'**
  String get kratomMilestone30Title;

  /// No description provided for @kratomMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'At a month the body has stabilised: sleep, appetite, and energy are markedly better, and cravings are less frequent.'**
  String get kratomMilestone30Description;

  /// No description provided for @kratomMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Stable Foundation'**
  String get kratomMilestone90Title;

  /// No description provided for @kratomMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Three months of abstinence gives the brain\'s reward and stress circuits extended time to re-regulate. Mood, focus, and motivation are noticeably steadier.'**
  String get kratomMilestone90Description;

  /// No description provided for @kratomMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One Year Free'**
  String get kratomMilestone365Title;

  /// No description provided for @kratomMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'A full year free of kratom. The opioid system has long re-regulated, cravings are infrequent, and the habit no longer organises your day.'**
  String get kratomMilestone365Description;

  /// No description provided for @gabapentinoidsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Gabapentinoid Recovery'**
  String get gabapentinoidsPageTitle;

  /// No description provided for @gabapentinoidsHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get gabapentinoidsHeaderStarted;

  /// No description provided for @gabapentinoidsHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Benefits of Quitting Gabapentin / Pregabalin'**
  String get gabapentinoidsHeaderNotStarted;

  /// No description provided for @gabapentinoidsSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get gabapentinoidsSubtitleStarted;

  /// No description provided for @gabapentinoidsSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you quit'**
  String get gabapentinoidsSubtitleNotStarted;

  /// No description provided for @gabapentinoidsInfoBox.
  ///
  /// In en, this message translates to:
  /// **'Never stop gabapentin or pregabalin abruptly. Sudden discontinuation can trigger seizures — especially if you take them for epilepsy. A gradual, medically supervised taper is essential.'**
  String get gabapentinoidsInfoBox;

  /// No description provided for @addictionGabapentinoid.
  ///
  /// In en, this message translates to:
  /// **'Gabapentin / Pregabalin'**
  String get addictionGabapentinoid;

  /// No description provided for @gabapentinoidsMilestone1Title.
  ///
  /// In en, this message translates to:
  /// **'Taper, Don\'t Stop Suddenly'**
  String get gabapentinoidsMilestone1Title;

  /// No description provided for @gabapentinoidsMilestone1Description.
  ///
  /// In en, this message translates to:
  /// **'Gabapentinoid withdrawal can begin within 12–48 hours. The critical risk is seizures on abrupt cessation, so these drugs must be tapered under medical guidance rather than stopped cold.'**
  String get gabapentinoidsMilestone1Description;

  /// No description provided for @gabapentinoidsMilestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Peak Withdrawal'**
  String get gabapentinoidsMilestone3Title;

  /// No description provided for @gabapentinoidsMilestone3Description.
  ///
  /// In en, this message translates to:
  /// **'Symptoms typically peak around day 3: heightened anxiety, insomnia, sweating, nausea, and sometimes confusion. A supervised taper greatly reduces this.'**
  String get gabapentinoidsMilestone3Description;

  /// No description provided for @gabapentinoidsMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'Acute Phase Easing'**
  String get gabapentinoidsMilestone7Title;

  /// No description provided for @gabapentinoidsMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'Around days 7–10 the acute symptoms substantially decrease. A gradual taper keeps this window manageable.'**
  String get gabapentinoidsMilestone7Description;

  /// No description provided for @gabapentinoidsMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Sleep and Anxiety Settling'**
  String get gabapentinoidsMilestone14Title;

  /// No description provided for @gabapentinoidsMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'Two weeks in, sleep and your usual anxiety levels are improving as the nervous system adapts to functioning without the drug.'**
  String get gabapentinoidsMilestone14Description;

  /// No description provided for @gabapentinoidsMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month Clear'**
  String get gabapentinoidsMilestone30Title;

  /// No description provided for @gabapentinoidsMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'At a month most people are through withdrawal, with steadier mood, sleep, and clarity. Any lingering symptoms are usually mild.'**
  String get gabapentinoidsMilestone30Description;

  /// No description provided for @gabapentinoidsMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Stable and Adjusted'**
  String get gabapentinoidsMilestone90Title;

  /// No description provided for @gabapentinoidsMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Three months clear, the nervous system has fully readjusted. Most people feel stable, with normal sleep and mood.'**
  String get gabapentinoidsMilestone90Description;

  /// No description provided for @gabapentinoidsMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Half a Year Free'**
  String get gabapentinoidsMilestone180Title;

  /// No description provided for @gabapentinoidsMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'Six months free. The drug is long gone from your routine, and any rebound symptoms have resolved.'**
  String get gabapentinoidsMilestone180Description;

  /// No description provided for @ghbPageTitle.
  ///
  /// In en, this message translates to:
  /// **'GHB Recovery'**
  String get ghbPageTitle;

  /// No description provided for @ghbHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get ghbHeaderStarted;

  /// No description provided for @ghbHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Benefits of Quitting GHB'**
  String get ghbHeaderNotStarted;

  /// No description provided for @ghbSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get ghbSubtitleStarted;

  /// No description provided for @ghbSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you quit'**
  String get ghbSubtitleNotStarted;

  /// No description provided for @ghbInfoBox.
  ///
  /// In en, this message translates to:
  /// **'GHB withdrawal is a medical emergency — it rivals alcohol and benzodiazepine withdrawal and can cause delirium and seizures. Heavy or around-the-clock users should not stop without supervised inpatient detox.'**
  String get ghbInfoBox;

  /// No description provided for @addictionGhb.
  ///
  /// In en, this message translates to:
  /// **'GHB'**
  String get addictionGhb;

  /// No description provided for @ghbMilestone1Title.
  ///
  /// In en, this message translates to:
  /// **'Seek Medical Detox'**
  String get ghbMilestone1Title;

  /// No description provided for @ghbMilestone1Description.
  ///
  /// In en, this message translates to:
  /// **'GHB has a very short half-life, so withdrawal can start 1–6 hours after the last dose with anxiety, tremor, insomnia, and a fast heart rate. This is one of the most dangerous detoxes — get medical help.'**
  String get ghbMilestone1Description;

  /// No description provided for @ghbMilestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Peak Danger Window'**
  String get ghbMilestone3Title;

  /// No description provided for @ghbMilestone3Description.
  ///
  /// In en, this message translates to:
  /// **'Symptoms peak around 48–72 hours and can escalate to severe agitation, hallucinations, and delirium. This phase needs medical monitoring.'**
  String get ghbMilestone3Description;

  /// No description provided for @ghbMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'Acute Phase Passing'**
  String get ghbMilestone7Title;

  /// No description provided for @ghbMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'By around a week the acute syndrome is usually resolving, though delirium can last longer in severe cases. The body is past the most dangerous point.'**
  String get ghbMilestone7Description;

  /// No description provided for @ghbMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Through the Worst'**
  String get ghbMilestone14Title;

  /// No description provided for @ghbMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'Two weeks in, even severe withdrawal has usually run its course. Sleep and autonomic stability are returning, though anxiety can linger.'**
  String get ghbMilestone14Description;

  /// No description provided for @ghbMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month Stable'**
  String get ghbMilestone30Title;

  /// No description provided for @ghbMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'At a month the dangerous early withdrawal period is well behind you. Lingering anxiety, sleep problems, and low mood are continuing to improve.'**
  String get ghbMilestone30Description;

  /// No description provided for @ghbMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Lingering Symptoms Fading'**
  String get ghbMilestone90Title;

  /// No description provided for @ghbMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Three months on, lingering anxiety, sleep, and mood symptoms are easing as the brain\'s calming GABA system settles.'**
  String get ghbMilestone90Description;

  /// No description provided for @ghbMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Half a Year Free'**
  String get ghbMilestone180Title;

  /// No description provided for @ghbMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'Six months free of GHB. Lingering withdrawal has largely resolved, and mood, sleep, and clear thinking are back to normal.'**
  String get ghbMilestone180Description;

  /// No description provided for @ketaminePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Ketamine Recovery'**
  String get ketaminePageTitle;

  /// No description provided for @ketamineHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get ketamineHeaderStarted;

  /// No description provided for @ketamineHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Benefits of Quitting Ketamine'**
  String get ketamineHeaderNotStarted;

  /// No description provided for @ketamineSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get ketamineSubtitleStarted;

  /// No description provided for @ketamineSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you quit'**
  String get ketamineSubtitleNotStarted;

  /// No description provided for @ketamineInfoBox.
  ///
  /// In en, this message translates to:
  /// **'Ketamine withdrawal is mainly cravings, low mood, and brain fog rather than physical illness. Its biggest physical harm is bladder damage, and stopping is the essential first step toward recovery.'**
  String get ketamineInfoBox;

  /// No description provided for @addictionKetamine.
  ///
  /// In en, this message translates to:
  /// **'Ketamine'**
  String get addictionKetamine;

  /// No description provided for @ketamineMilestone1Title.
  ///
  /// In en, this message translates to:
  /// **'System Clearing'**
  String get ketamineMilestone1Title;

  /// No description provided for @ketamineMilestone1Description.
  ///
  /// In en, this message translates to:
  /// **'Ketamine rarely causes severe physical withdrawal. In the first day you may notice mood swings, cravings, sweating, or palpitations as the drug clears.'**
  String get ketamineMilestone1Description;

  /// No description provided for @ketamineMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'Mood and Cravings'**
  String get ketamineMilestone7Title;

  /// No description provided for @ketamineMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'The first week is mostly about cravings, low or swinging mood, and brain fog rather than physical withdrawal.'**
  String get ketamineMilestone7Description;

  /// No description provided for @ketamineMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Brain Fog Lifting'**
  String get ketamineMilestone14Title;

  /// No description provided for @ketamineMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'Two weeks in, thinking and memory start to clear and mood steadies as the dissociative effects fully wear off.'**
  String get ketamineMilestone14Description;

  /// No description provided for @ketamineMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month — Bladder Healing'**
  String get ketamineMilestone30Title;

  /// No description provided for @ketamineMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'At a month, early bladder damage often starts improving after you stop. Mood and thinking are clearer.'**
  String get ketamineMilestone30Description;

  /// No description provided for @ketamineMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Three Months On'**
  String get ketamineMilestone90Title;

  /// No description provided for @ketamineMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Three months without ketamine gives the bladder more time to heal, while thinking and mood keep improving. Cravings are less frequent.'**
  String get ketamineMilestone90Description;

  /// No description provided for @ketamineMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Half a Year Free'**
  String get ketamineMilestone180Title;

  /// No description provided for @ketamineMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'Six months free. Bladder symptoms have had extended time to improve, and the psychological pull of ketamine has weakened considerably.'**
  String get ketamineMilestone180Description;

  /// No description provided for @ketamineMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One Year Free'**
  String get ketamineMilestone365Title;

  /// No description provided for @ketamineMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'A year free of ketamine. Thinking, mood, and — when bladder damage was caught early — bladder function have had a full year to recover.'**
  String get ketamineMilestone365Description;

  /// No description provided for @inhalantsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Inhalants Recovery'**
  String get inhalantsPageTitle;

  /// No description provided for @inhalantsHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get inhalantsHeaderStarted;

  /// No description provided for @inhalantsHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Benefits of Quitting Inhalants'**
  String get inhalantsHeaderNotStarted;

  /// No description provided for @inhalantsSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get inhalantsSubtitleStarted;

  /// No description provided for @inhalantsSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you quit'**
  String get inhalantsSubtitleNotStarted;

  /// No description provided for @inhalantsInfoBox.
  ///
  /// In en, this message translates to:
  /// **'Inhalant withdrawal is shorter than alcohol or opioids but can be intense, with seizure risk in heavy users. Neurological recovery is real but slow — often unfolding over about two years of abstinence.'**
  String get inhalantsInfoBox;

  /// No description provided for @addictionInhalants.
  ///
  /// In en, this message translates to:
  /// **'Inhalants'**
  String get addictionInhalants;

  /// No description provided for @inhalantsMilestone1Title.
  ///
  /// In en, this message translates to:
  /// **'System Clearing'**
  String get inhalantsMilestone1Title;

  /// No description provided for @inhalantsMilestone1Description.
  ///
  /// In en, this message translates to:
  /// **'Inhalant chemicals clear the blood quickly but linger in fatty tissue. In the first day you may feel headache, irritability, nausea, anxiety, or insomnia.'**
  String get inhalantsMilestone1Description;

  /// No description provided for @inhalantsMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'Acute Symptoms Subside'**
  String get inhalantsMilestone7Title;

  /// No description provided for @inhalantsMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'Acute withdrawal peaks around days 2–5 and largely resolves within one to two weeks. By a week the worst is usually passing.'**
  String get inhalantsMilestone7Description;

  /// No description provided for @inhalantsMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Acute Phase Over'**
  String get inhalantsMilestone14Title;

  /// No description provided for @inhalantsMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'By two weeks the early withdrawal period has usually ended. Mood is steadier, though brain fog and tiredness can linger.'**
  String get inhalantsMilestone14Description;

  /// No description provided for @inhalantsMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month — Brain Recovering'**
  String get inhalantsMilestone30Title;

  /// No description provided for @inhalantsMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'At a month the worst early effects are behind you and thinking and memory are recovering. Clarity and mood improve.'**
  String get inhalantsMilestone30Description;

  /// No description provided for @inhalantsMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Three Months On'**
  String get inhalantsMilestone90Title;

  /// No description provided for @inhalantsMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Three months of abstinence supports continued recovery of memory, attention, and motor function. Improvements are gradual but real.'**
  String get inhalantsMilestone90Description;

  /// No description provided for @inhalantsMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One Year — Substantial Recovery'**
  String get inhalantsMilestone365Title;

  /// No description provided for @inhalantsMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'A year of abstinence brings substantial neurological recovery for most people, with continued gains expected through the second year.'**
  String get inhalantsMilestone365Description;

  /// No description provided for @inhalantsMilestone730Title.
  ///
  /// In en, this message translates to:
  /// **'Two Years — Long-Term Healing'**
  String get inhalantsMilestone730Title;

  /// No description provided for @inhalantsMilestone730Description.
  ///
  /// In en, this message translates to:
  /// **'Two years of abstinence is the window in which studies found substantial recovery of brain function — outside of damage from leaded petrol, which can persist.'**
  String get inhalantsMilestone730Description;

  /// No description provided for @synthetic_cannabinoidsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Synthetic Cannabinoids Recovery'**
  String get synthetic_cannabinoidsPageTitle;

  /// No description provided for @synthetic_cannabinoidsHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get synthetic_cannabinoidsHeaderStarted;

  /// No description provided for @synthetic_cannabinoidsHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Benefits of Quitting Synthetic Cannabinoids'**
  String get synthetic_cannabinoidsHeaderNotStarted;

  /// No description provided for @synthetic_cannabinoidsSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get synthetic_cannabinoidsSubtitleStarted;

  /// No description provided for @synthetic_cannabinoidsSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you quit'**
  String get synthetic_cannabinoidsSubtitleNotStarted;

  /// No description provided for @synthetic_cannabinoidsInfoBox.
  ///
  /// In en, this message translates to:
  /// **'Synthetic cannabinoids (“Spice”, “K2”) are far more potent than cannabis, and their withdrawal is similar but more severe — with anxiety and a fast heart rate. Heavy users may need medically supported detox.'**
  String get synthetic_cannabinoidsInfoBox;

  /// No description provided for @addictionSyntheticCannabinoids.
  ///
  /// In en, this message translates to:
  /// **'Synthetic Cannabinoids'**
  String get addictionSyntheticCannabinoids;

  /// No description provided for @synthetic_cannabinoidsMilestone1Title.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Begins'**
  String get synthetic_cannabinoidsMilestone1Title;

  /// No description provided for @synthetic_cannabinoidsMilestone1Description.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal from synthetic cannabinoids can begin within hours to a day or two. Expect anxiety, irritability, a fast heart rate, sweating, and sleep problems.'**
  String get synthetic_cannabinoidsMilestone1Description;

  /// No description provided for @synthetic_cannabinoidsMilestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Peak Symptoms'**
  String get synthetic_cannabinoidsMilestone3Title;

  /// No description provided for @synthetic_cannabinoidsMilestone3Description.
  ///
  /// In en, this message translates to:
  /// **'Symptoms tend to peak in the first few days — strongest anxiety, irritability, poor sleep, and cravings. This is the hardest stretch.'**
  String get synthetic_cannabinoidsMilestone3Description;

  /// No description provided for @synthetic_cannabinoidsMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'Acute Phase Easing'**
  String get synthetic_cannabinoidsMilestone7Title;

  /// No description provided for @synthetic_cannabinoidsMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'By one week the most intense symptoms are easing. Sleep, heart rate, and mood begin to settle.'**
  String get synthetic_cannabinoidsMilestone7Description;

  /// No description provided for @synthetic_cannabinoidsMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Sleep and Mood Settling'**
  String get synthetic_cannabinoidsMilestone14Title;

  /// No description provided for @synthetic_cannabinoidsMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'Two weeks in, sleep and mood are steadier and the fast heart rate of early withdrawal has resolved.'**
  String get synthetic_cannabinoidsMilestone14Description;

  /// No description provided for @synthetic_cannabinoidsMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month Clear'**
  String get synthetic_cannabinoidsMilestone30Title;

  /// No description provided for @synthetic_cannabinoidsMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'At a month most withdrawal symptoms have resolved. Sleep, mood, and clarity are markedly improved.'**
  String get synthetic_cannabinoidsMilestone30Description;

  /// No description provided for @synthetic_cannabinoidsMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Three Months On'**
  String get synthetic_cannabinoidsMilestone90Title;

  /// No description provided for @synthetic_cannabinoidsMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Three months clear, mood and sleep are stable and cravings are infrequent. The brain\'s cannabinoid system has re-regulated.'**
  String get synthetic_cannabinoidsMilestone90Description;

  /// No description provided for @synthetic_cannabinoidsMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Half a Year Free'**
  String get synthetic_cannabinoidsMilestone180Title;

  /// No description provided for @synthetic_cannabinoidsMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'Six months free of synthetic cannabinoids. Withdrawal is long resolved and the serious risks of these drugs are behind you.'**
  String get synthetic_cannabinoidsMilestone180Description;

  /// No description provided for @mdmaPageTitle.
  ///
  /// In en, this message translates to:
  /// **'MDMA Recovery'**
  String get mdmaPageTitle;

  /// No description provided for @mdmaHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get mdmaHeaderStarted;

  /// No description provided for @mdmaHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Benefits of Quitting MDMA'**
  String get mdmaHeaderNotStarted;

  /// No description provided for @mdmaSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get mdmaSubtitleStarted;

  /// No description provided for @mdmaSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you quit'**
  String get mdmaSubtitleNotStarted;

  /// No description provided for @mdmaInfoBox.
  ///
  /// In en, this message translates to:
  /// **'MDMA floods and then depletes serotonin, producing the “comedown” and, after heavy use, withdrawal-like low mood. Serotonin transporter levels recover with sustained abstinence, though heavy use can leave longer-lasting effects.'**
  String get mdmaInfoBox;

  /// No description provided for @addictionMdma.
  ///
  /// In en, this message translates to:
  /// **'MDMA'**
  String get addictionMdma;

  /// No description provided for @mdmaMilestone1Title.
  ///
  /// In en, this message translates to:
  /// **'The Comedown'**
  String get mdmaMilestone1Title;

  /// No description provided for @mdmaMilestone1Description.
  ///
  /// In en, this message translates to:
  /// **'After MDMA, depleted serotonin produces the “comedown”: low mood, fatigue, irritability, and poor sleep for a day or two. Hydration, food, and rest help.'**
  String get mdmaMilestone1Description;

  /// No description provided for @mdmaMilestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Mood Rebalancing'**
  String get mdmaMilestone3Title;

  /// No description provided for @mdmaMilestone3Description.
  ///
  /// In en, this message translates to:
  /// **'By a few days the sharpest comedown has passed. Mood and energy begin to rebalance as serotonin is replenished.'**
  String get mdmaMilestone3Description;

  /// No description provided for @mdmaMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'Acute Phase Over'**
  String get mdmaMilestone7Title;

  /// No description provided for @mdmaMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'After heavier use, withdrawal-like symptoms (low mood, poor focus, cravings) can run about a week before improving.'**
  String get mdmaMilestone7Description;

  /// No description provided for @mdmaMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks On'**
  String get mdmaMilestone14Title;

  /// No description provided for @mdmaMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'Two weeks of abstinence typically brings clear improvement in mood, sleep, and focus as the serotonin system recovers.'**
  String get mdmaMilestone14Description;

  /// No description provided for @mdmaMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month Clear'**
  String get mdmaMilestone30Title;

  /// No description provided for @mdmaMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'At a month, mood and thinking are much steadier. The brain\'s serotonin-recycling system continues to recover while you stay off MDMA.'**
  String get mdmaMilestone30Description;

  /// No description provided for @mdmaMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Three Months On'**
  String get mdmaMilestone90Title;

  /// No description provided for @mdmaMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Three months of abstinence supports continued serotonin-system recovery. Mood and sleep are stable; anxiety eases over the following months.'**
  String get mdmaMilestone90Description;

  /// No description provided for @mdmaMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One Year Free'**
  String get mdmaMilestone365Title;

  /// No description provided for @mdmaMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'A year free of MDMA. Serotonin function and mood have had extended time to recover, and anxiety related to use typically resolves by now.'**
  String get mdmaMilestone365Description;

  /// No description provided for @steroidsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Anabolic Steroid Recovery'**
  String get steroidsPageTitle;

  /// No description provided for @steroidsHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get steroidsHeaderStarted;

  /// No description provided for @steroidsHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Benefits of Quitting Anabolic Steroids'**
  String get steroidsHeaderNotStarted;

  /// No description provided for @steroidsSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get steroidsSubtitleStarted;

  /// No description provided for @steroidsSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you quit'**
  String get steroidsSubtitleNotStarted;

  /// No description provided for @steroidsInfoBox.
  ///
  /// In en, this message translates to:
  /// **'Stopping anabolic steroids leaves testosterone low until the body restarts its own hormone production — usually over months, but sometimes longer. Depression and low libido are common during this phase; severe depression or suicidal thoughts need urgent medical care.'**
  String get steroidsInfoBox;

  /// No description provided for @addictionSteroids.
  ///
  /// In en, this message translates to:
  /// **'Anabolic Steroids'**
  String get addictionSteroids;

  /// No description provided for @steroidsMilestone1Title.
  ///
  /// In en, this message translates to:
  /// **'The Hormone Deficit Begins'**
  String get steroidsMilestone1Title;

  /// No description provided for @steroidsMilestone1Description.
  ///
  /// In en, this message translates to:
  /// **'Anabolic steroids suppress your body\'s own testosterone. On stopping, you enter a hormone deficit, which can bring fatigue, low mood, and low libido. Medical guidance is recommended.'**
  String get steroidsMilestone1Description;

  /// No description provided for @steroidsMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Adjustment Phase'**
  String get steroidsMilestone14Title;

  /// No description provided for @steroidsMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'The first weeks are the hardest of the hormone dip — low energy, mood, and libido. This is the phase when many relapse to avoid it; support helps.'**
  String get steroidsMilestone14Description;

  /// No description provided for @steroidsMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month — Axis Restarting'**
  String get steroidsMilestone30Title;

  /// No description provided for @steroidsMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'At a month, your brain–testes hormone system is restarting. The hormones that drive testosterone and testosterone itself are beginning to rise, though low mood, libido, or energy can still linger.'**
  String get steroidsMilestone30Description;

  /// No description provided for @steroidsMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Three Months — Hormones Climbing'**
  String get steroidsMilestone90Title;

  /// No description provided for @steroidsMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Three months in, testosterone and the hormones that drive it are climbing toward normal for most people, and mood and libido often improve with them.'**
  String get steroidsMilestone90Description;

  /// No description provided for @steroidsMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Six Months — Often Recovered'**
  String get steroidsMilestone180Title;

  /// No description provided for @steroidsMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'By six months many people have strong hormone recovery, with testosterone and its control hormones back in range and symptoms easing.'**
  String get steroidsMilestone180Description;

  /// No description provided for @steroidsMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One Year On'**
  String get steroidsMilestone365Title;

  /// No description provided for @steroidsMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'A year off steroids. For most, hormones and mood have normalised; persistent low testosterone past this point warrants specialist assessment.'**
  String get steroidsMilestone365Description;

  /// No description provided for @steroidsMilestone730Title.
  ///
  /// In en, this message translates to:
  /// **'Two Years — A New Normal'**
  String get steroidsMilestone730Title;

  /// No description provided for @steroidsMilestone730Description.
  ///
  /// In en, this message translates to:
  /// **'Two years off steroids. Your hormones now reflect your body\'s natural levels; ongoing low-testosterone symptoms should be checked by a specialist.'**
  String get steroidsMilestone730Description;

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
  /// **'Two Months: Thinking and Memory Improving'**
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
  /// **'Dopamine signalling continues to recover. Focus, memory, mood, and day-to-day quality of life keep improving.'**
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
  /// **'Thinking and Memory Begin to Recover'**
  String get benzoMilestone180Title;

  /// No description provided for @benzoMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'At six months, memory and attention show measurable improvement. Research finds recovery across many thinking skills, with gains continuing beyond six months.'**
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
  /// **'At 18 months, memory, attention, and clear thinking keep improving. The brain\'s calming GABA system has had well over a year to settle, while the brain continues building healthier patterns.'**
  String get benzoMilestone540Description;

  /// No description provided for @benzoMilestone730Title.
  ///
  /// In en, this message translates to:
  /// **'Two Years: Major Progress'**
  String get benzoMilestone730Title;

  /// No description provided for @benzoMilestone730Description.
  ///
  /// In en, this message translates to:
  /// **'Two years marks substantial recovery. Most people have much clearer thinking, steadier emotions, and a much better quality of life than during long-term benzodiazepine use.'**
  String get benzoMilestone730Description;

  /// No description provided for @benzoMilestone1095Title.
  ///
  /// In en, this message translates to:
  /// **'Three Years: Long-Term Recovery'**
  String get benzoMilestone1095Title;

  /// No description provided for @benzoMilestone1095Description.
  ///
  /// In en, this message translates to:
  /// **'At three years, the long withdrawal period is far behind most people. Sleep, mood, memory, and attention have had years to recover, and day-to-day life is typically far better than during long-term use.'**
  String get benzoMilestone1095Description;

  /// No description provided for @addictionMeth.
  ///
  /// In en, this message translates to:
  /// **'Meth'**
  String get addictionMeth;

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
  /// **'Your brain is actively recovering. Attention, memory, and decision-making start to feel better as the reward system moves toward normal.'**
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
  /// **'After a year, the dopamine system has made major gains. Natural rewards feel more rewarding again, while mood, memory, and decision-making are markedly better.'**
  String get methMilestone365Description;

  /// No description provided for @methMilestone420Title.
  ///
  /// In en, this message translates to:
  /// **'14 Months - Dopamine Normalization'**
  String get methMilestone420Title;

  /// No description provided for @methMilestone420Description.
  ///
  /// In en, this message translates to:
  /// **'Brain scans show dopamine-recycling proteins approaching healthy levels around this stage. Memory, motivation, and the ability to enjoy everyday activities continue to improve.'**
  String get methMilestone420Description;

  /// No description provided for @methMilestone730Title.
  ///
  /// In en, this message translates to:
  /// **'Two Years - Sustained Recovery'**
  String get methMilestone730Title;

  /// No description provided for @methMilestone730Description.
  ///
  /// In en, this message translates to:
  /// **'Two years without meth gives the brain sustained time to heal. Attention, mood, memory, and day-to-day quality of life continue to improve.'**
  String get methMilestone730Description;

  /// No description provided for @addictionNitrousOxide.
  ///
  /// In en, this message translates to:
  /// **'Nitrous Oxide'**
  String get addictionNitrousOxide;

  /// No description provided for @nitrousOxidePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Nitrous Oxide Recovery'**
  String get nitrousOxidePageTitle;

  /// No description provided for @nitrousOxideHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get nitrousOxideHeaderStarted;

  /// No description provided for @nitrousOxideHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Ready to Start?'**
  String get nitrousOxideHeaderNotStarted;

  /// No description provided for @nitrousOxideSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get nitrousOxideSubtitleStarted;

  /// No description provided for @nitrousOxideSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what positive changes await you'**
  String get nitrousOxideSubtitleNotStarted;

  /// No description provided for @nitrousOxideMilestone1Title.
  ///
  /// In en, this message translates to:
  /// **'First 24 Hours - System Clearing'**
  String get nitrousOxideMilestone1Title;

  /// No description provided for @nitrousOxideMilestone1Description.
  ///
  /// In en, this message translates to:
  /// **'The gas leaves your system within minutes, but healing takes longer. Dizziness settles, headaches ease, and your brain starts adjusting without the dopamine shortcut. Your B12 recovery begins now.'**
  String get nitrousOxideMilestone1Description;

  /// No description provided for @nitrousOxideMilestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Day 3 - No Physical Withdrawal'**
  String get nitrousOxideMilestone3Title;

  /// No description provided for @nitrousOxideMilestone3Description.
  ///
  /// In en, this message translates to:
  /// **'Here\'s good news: nitrous oxide doesn\'t cause physical withdrawal. The urges you feel are psychological — habit and association, not your body demanding a substance. That makes them manageable.'**
  String get nitrousOxideMilestone3Description;

  /// No description provided for @nitrousOxideMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'One Week - B12 Rising'**
  String get nitrousOxideMilestone7Title;

  /// No description provided for @nitrousOxideMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'One week with no new B12 being destroyed. If you\'ve started supplementing, your levels are already climbing. Energy, mood, and focus are all tied to B12 — you should be starting to feel them improve.'**
  String get nitrousOxideMilestone7Description;

  /// No description provided for @nitrousOxideMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks - Nerves Healing'**
  String get nitrousOxideMilestone14Title;

  /// No description provided for @nitrousOxideMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'B12 is essential for the protective coating on your nerve fibres. Two weeks in, that repair process is actively underway. Any tingling or numbness you had should be easing — your nervous system is patching itself back together.'**
  String get nitrousOxideMilestone14Description;

  /// No description provided for @nitrousOxideMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month - Energy Returns'**
  String get nitrousOxideMilestone30Title;

  /// No description provided for @nitrousOxideMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'B12 plays a key role in red blood cell production, which means oxygen delivery to every cell in your body. One month of recovery and supplementation means meaningfully better energy, clearer thinking, and a more stable mood.'**
  String get nitrousOxideMilestone30Description;

  /// No description provided for @nitrousOxideMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Three Months - Neurological Recovery'**
  String get nitrousOxideMilestone90Title;

  /// No description provided for @nitrousOxideMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Three months without B12 destruction means three months of nerve repair. The nervous system is resilient — most people who started treatment promptly see significant recovery in tingling, weakness, and brain fog by this point.'**
  String get nitrousOxideMilestone90Description;

  /// No description provided for @nitrousOxideMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One Year - Long-Term Health Secured'**
  String get nitrousOxideMilestone365Title;

  /// No description provided for @nitrousOxideMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'A full year free from nitrous oxide. Your B12 stores are restored, your nervous system has had a year to heal, and the cardiovascular risk from elevated homocysteine has resolved. Your body is operating on its own chemistry again.'**
  String get nitrousOxideMilestone365Description;

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
  /// **'Your dopamine system is recovering. Focus, decision-making, and emotional control are markedly better, and thinking is clearer.'**
  String get cocaineMilestone90Description;

  /// No description provided for @cocaineMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Six Months - Clearer Thinking'**
  String get cocaineMilestone180Title;

  /// No description provided for @cocaineMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'Brain scans show recovery in the front of the brain, the area that supports planning and self-control. Memory, impulse control, and clear thinking continue to strengthen.'**
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

  /// Tab label for the Stats tab
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get tabStats;

  /// Heading on the stats page
  ///
  /// In en, this message translates to:
  /// **'Recovery Stats'**
  String get statsTitle;

  /// Empty state message on the stats page
  ///
  /// In en, this message translates to:
  /// **'Start tracking addictions to see your stats'**
  String get statsNoAddictions;

  /// Section title for the overview journey card on stats page
  ///
  /// In en, this message translates to:
  /// **'Your Journey'**
  String get statsJourneyTitle;

  /// Total days clean across all addictions
  ///
  /// In en, this message translates to:
  /// **'{days} total days'**
  String statsTotalDays(int days);

  /// Number of addictions being tracked
  ///
  /// In en, this message translates to:
  /// **'{count} tracked'**
  String statsAddictionsTracked(int count);

  /// Section title for the money saved card on stats page
  ///
  /// In en, this message translates to:
  /// **'Money Saved'**
  String get statsMoneySavedTitle;

  /// Disclaimer text on the money saved card
  ///
  /// In en, this message translates to:
  /// **'Estimated based on average usage'**
  String get statsMoneySavedEstimate;

  /// Fun equivalence for money saved — coffees
  ///
  /// In en, this message translates to:
  /// **'That\'s about {count} coffees'**
  String statsEquivalentCoffees(int count);

  /// Fun equivalence for money saved — restaurant meals
  ///
  /// In en, this message translates to:
  /// **'That\'s about {count} restaurant meals'**
  String statsEquivalentMeals(int count);

  /// Fun equivalence for money saved — a flight ticket
  ///
  /// In en, this message translates to:
  /// **'That\'s a flight somewhere new'**
  String get statsEquivalentFlight;

  /// Fun equivalence for money saved — a vacation
  ///
  /// In en, this message translates to:
  /// **'That\'s a vacation abroad'**
  String get statsEquivalentVacation;

  /// Section title for the time saved card on stats page
  ///
  /// In en, this message translates to:
  /// **'Time Reclaimed'**
  String get statsTimeSavedTitle;

  /// Hours of time saved
  ///
  /// In en, this message translates to:
  /// **'{hours} hours'**
  String statsHoursSaved(int hours);

  /// Fun equivalence for time saved — books read
  ///
  /// In en, this message translates to:
  /// **'Enough to read about {count} books'**
  String statsEquivalentBooks(int count);

  /// Fun equivalence for time saved — movies watched
  ///
  /// In en, this message translates to:
  /// **'Enough to watch about {count} movies'**
  String statsEquivalentMovies(int count);

  /// Section title for the streaks bar chart on stats page
  ///
  /// In en, this message translates to:
  /// **'Your Streaks'**
  String get statsStreaksTitle;

  /// Compact days label used in streak bars
  ///
  /// In en, this message translates to:
  /// **'{days}d'**
  String statsDaysSuffix(int days);

  /// Day unit displayed beside the total journey count
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1 {day} other {days}}'**
  String statsDayUnit(int count);

  /// Compact hours label used in stats detail rows
  ///
  /// In en, this message translates to:
  /// **'{hours}h'**
  String statsHoursSuffix(int hours);

  /// Section title for the resilience/relapse history card on stats page
  ///
  /// In en, this message translates to:
  /// **'Resilience'**
  String get statsResilienceTitle;

  /// Motivational message about number of relapses
  ///
  /// In en, this message translates to:
  /// **'{count} times you\'ve reset and kept going'**
  String statsTimesBouncedBack(int count);

  /// Average days achieved before each relapse
  ///
  /// In en, this message translates to:
  /// **'{days} days of progress each time'**
  String statsDaysBeforeRelapse(int days);

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

  /// Title for stop tracking confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Stop tracking {title}?'**
  String stopTrackingDialogTitle(String title);

  /// Message for stop tracking confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'This will remove {title} from your home screen. Your milestone history will be preserved.'**
  String stopTrackingDialogMessage(String title);

  /// Remove button text in stop tracking dialog
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get stopTracking;

  /// Title for the add addiction picker page
  ///
  /// In en, this message translates to:
  /// **'Track an Addiction'**
  String get addAddictionTitle;

  /// Custom addiction option in addiction picker
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get addAddictionCustom;

  /// Subtitle for custom addiction option
  ///
  /// In en, this message translates to:
  /// **'Track anything you want to quit'**
  String get addAddictionCustomSubtitle;

  /// Title shown on home when no addictions are being tracked
  ///
  /// In en, this message translates to:
  /// **'Nothing tracked yet'**
  String get homeEmptyTitle;

  /// Subtitle shown on home when no addictions are being tracked
  ///
  /// In en, this message translates to:
  /// **'Tap + to start tracking an addiction'**
  String get homeEmptySubtitle;

  /// Message shown when all addictions are already tracked
  ///
  /// In en, this message translates to:
  /// **'All available addictions are already being tracked'**
  String get addAddictionNoneAvailable;

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
  /// **'Simplified Chinese'**
  String get settingsLocaleSimplifiedChinese;

  /// Show app in Russian
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get settingsLocaleRussian;

  /// Show app in Spanish
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get settingsLocaleSpanish;

  /// Show app in French
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get settingsLocaleFrench;

  /// Follows the device locale
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get settingsLocaleSystem;

  /// Language for the text in Quitter
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLocale;

  /// Name of the nicotine pouches addiction type
  ///
  /// In en, this message translates to:
  /// **'Nicotine pouches'**
  String get addictionNicotinePouches;

  /// Name of the heroin addiction type
  ///
  /// In en, this message translates to:
  /// **'Heroin'**
  String get addictionHeroin;

  /// Name of the opioids addiction type
  ///
  /// In en, this message translates to:
  /// **'Opioids'**
  String get addictionOpioids;

  /// Name of the fentanyl addiction type
  ///
  /// In en, this message translates to:
  /// **'Fentanyl'**
  String get addictionFentanyl;

  /// Name of the smokeless tobacco addiction type
  ///
  /// In en, this message translates to:
  /// **'Dip / Chewing Tobacco'**
  String get addictionSmokelessTobacco;

  /// Page title for smokeless tobacco quit milestones
  ///
  /// In en, this message translates to:
  /// **'Tobacco-Free'**
  String get smokelessTobaccoPageTitle;

  /// Header shown when user has started quitting smokeless tobacco
  ///
  /// In en, this message translates to:
  /// **'Nicotine-free journey'**
  String get smokelessTobaccoHeaderStarted;

  /// Header shown when user has not started quitting smokeless tobacco
  ///
  /// In en, this message translates to:
  /// **'Quit dip & chewing tobacco'**
  String get smokelessTobaccoHeaderNotStarted;

  /// Subtitle when smokeless tobacco quit is in progress
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get smokelessTobaccoSubtitleStarted;

  /// Subtitle before smokeless tobacco quit starts
  ///
  /// In en, this message translates to:
  /// **'See what happens when you quit'**
  String get smokelessTobaccoSubtitleNotStarted;

  /// Name of the social media addiction type
  ///
  /// In en, this message translates to:
  /// **'Social Media'**
  String get addictionSocialMedia;

  /// Name of the adult content addiction type
  ///
  /// In en, this message translates to:
  /// **'Adult Content'**
  String get addictionAdultContent;

  /// Generic search hint text
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get search;

  /// Shown when a search yields no matches
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noSearchResults;

  /// No description provided for @clearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get clearSearch;

  /// Hint text for the home addiction search bar
  ///
  /// In en, this message translates to:
  /// **'Search addictions...'**
  String get homeSearchHint;

  /// Button to create a custom tracker from an unmatched search
  ///
  /// In en, this message translates to:
  /// **'Track it anyway'**
  String get homeTrackAnyway;

  /// Hint text for the icon picker search bar
  ///
  /// In en, this message translates to:
  /// **'Search icons...'**
  String get iconSearchHint;

  /// Shown when icon search yields no matches
  ///
  /// In en, this message translates to:
  /// **'No icons found'**
  String get iconNoResults;

  /// Button to open a milestone reference source
  ///
  /// In en, this message translates to:
  /// **'Open Original Source'**
  String get milestoneOpenOriginalSource;

  /// Title of the export file save dialog
  ///
  /// In en, this message translates to:
  /// **'Save data to'**
  String get settingsExportSaveDialog;

  /// Hint text for settings search bar
  ///
  /// In en, this message translates to:
  /// **'Search settings...'**
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

  /// Setting title for week start day preference
  ///
  /// In en, this message translates to:
  /// **'Week starts on Monday'**
  String get settingsWeekStartsMonday;

  /// Subtitle explaining week starts on Monday setting
  ///
  /// In en, this message translates to:
  /// **'Calendar week begins on Monday instead of Sunday'**
  String get settingsWeekStartsMondaySubtitle;

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
  /// **'Every {days, plural, =1 {{days} day} other {{days} days}} at {time}'**
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

  /// Setting subtitle for custom entry notifications
  ///
  /// In en, this message translates to:
  /// **'Notify {name} quitting progress'**
  String settingsNotifyCustomEntry(String name);

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
  /// **'You will see a notification like this every {days, plural, =1 {{days} day} other {{days} days}} congratulating you on your progress!'**
  String notificationTestBody(int days);

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

  /// Dialog title shown when data import fails
  ///
  /// In en, this message translates to:
  /// **'Import failed'**
  String get dataImportFailed;

  /// Dialog message shown when data import fails
  ///
  /// In en, this message translates to:
  /// **'The selected file could not be imported. Check that it is a valid Quitter backup and try again.'**
  String get dataImportFailedMessage;

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
  /// **'I\'m {days, plural, =1 {{days} day} other {{days} days}} clean from {title}!'**
  String quitMilestonesShareMessage(int days, String title);

  /// Milestone badge label for a day count
  ///
  /// In en, this message translates to:
  /// **'Day {days}'**
  String timelineMilestoneDay(int days);

  /// Milestone badge label for a year count
  ///
  /// In en, this message translates to:
  /// **'{years, plural, =1 {{years} Year} other {{years} Years}}'**
  String timelineMilestoneYears(int years);

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

  /// Error message when too many failed PIN attempts, showing remaining lockout seconds
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Try again in {seconds}s.'**
  String pinPageTooManyAttempts(int seconds);

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
  /// **'Pornography Recovery'**
  String get pornographyPageTitle;

  /// Header for started adult content quit journey
  ///
  /// In en, this message translates to:
  /// **'Building lasting control'**
  String get pornographyHeaderStarted;

  /// Header for not started adult content quit journey
  ///
  /// In en, this message translates to:
  /// **'Change problematic pornography use'**
  String get pornographyHeaderNotStarted;

  /// Subtitle for started adult content quit journey
  ///
  /// In en, this message translates to:
  /// **'Track triggers, control, and evidence-based milestones'**
  String get pornographySubtitleStarted;

  /// Subtitle for not started adult content quit journey
  ///
  /// In en, this message translates to:
  /// **'See what research supports and measure your own progress'**
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
  /// **'Brain volume begins recovering within the first two weeks. Thinking and memory keep improving over the following months.'**
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
  /// **'Thinking and Memory Improve Substantially'**
  String get alcoholMilestone90Title;

  /// Alcohol milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'The first three months bring major gains in memory, concentration, and decision-making, with recovery continuing across the following months.'**
  String get alcoholMilestone90Description;

  /// Alcohol milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Brain Volume and Function Continue Recovery'**
  String get alcoholMilestone180Title;

  /// Alcohol milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Six months sober gives the brain sustained time to recover. Brain volume and thinking skills continue to improve.'**
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
  /// **'Plot twist: vaping was making anxiety worse, not better! Two months in, your usual anxiety level is lower and your nervous system is settling.'**
  String get vapingMilestone60Description;

  /// Vaping milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Focus and Memory Sharpen'**
  String get vapingMilestone90Title;

  /// Vaping milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'Brain fog has left the building! Three months without nicotine and your focus, memory, and clear thinking are markedly better. It\'s like upgrading your mental RAM.'**
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
  /// **'Three months without cannabis brings steadier mood, less anxiety, and better stress control. Your emotional state is settling into a healthier normal.'**
  String get marijuanaMilestone90Description;

  /// Marijuana milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Planning and Decision-Making Recover'**
  String get marijuanaMilestone180Title;

  /// Marijuana milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'Your mental CEO is back in charge! Six months without cannabis brings major gains in planning, decision-making, and problem-solving.'**
  String get marijuanaMilestone180Description;

  /// Marijuana milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'Brain Structure Restoration'**
  String get marijuanaMilestone365Title;

  /// Marijuana milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'One year without cannabis gives memory-related brain areas substantial time to recover. Learning and memory improvements are now part of your new normal.'**
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
  /// **'Thinking and Memory Begin to Recover'**
  String get opioidMilestone30Title;

  /// Opioid milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'Brain fog is lifting! One month clean and memory, decision-making, and clear thinking are improving as the front of the brain recovers from opioid-related changes.'**
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
  /// **'Three months = roughly 270+ hours reclaimed! That\'s enough time to learn a skill, read 15+ books, or get deep into a hobby. Your brain strengthens the habits you repeat, so those offline routines are becoming easier and more automatic.'**
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
  /// **'Plot twist: nicotine actually increases stress between uses! Your cortisol and stress response are returning to normal. Real relaxation, not the nicotine fake-out.'**
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
  /// **'Taking Back Control'**
  String get pornographyMilestone1Title;

  /// Pornography milestone day 1 description
  ///
  /// In en, this message translates to:
  /// **'Problematic pornography use is defined by impaired control and resulting distress or impairment. One day matters because you have already interrupted the old pattern once and started identifying what triggers it.'**
  String get pornographyMilestone1Description;

  /// Pornography milestone day 3 title
  ///
  /// In en, this message translates to:
  /// **'Know Your Urges'**
  String get pornographyMilestone3Title;

  /// Pornography milestone day 3 description
  ///
  /// In en, this message translates to:
  /// **'People with more severe problematic use commonly report intrusive sexual thoughts, difficult-to-control desire, irritability, mood shifts, and sleep problems. Day three is a useful point to name which of those are actually happening for you.'**
  String get pornographyMilestone3Description;

  /// Pornography milestone day 7 title
  ///
  /// In en, this message translates to:
  /// **'One Week: Trial Evidence'**
  String get pornographyMilestone7Title;

  /// Pornography milestone day 7 description
  ///
  /// In en, this message translates to:
  /// **'In a randomized 7-day abstinence study, regular users showed no overall withdrawal syndrome. An exploratory subgroup with both high problematic use and daily viewing had more craving, so a rough first week is possible but not inevitable.'**
  String get pornographyMilestone7Description;

  /// Pornography milestone day 14 title
  ///
  /// In en, this message translates to:
  /// **'Map Your Triggers'**
  String get pornographyMilestone14Title;

  /// Pornography milestone day 14 description
  ///
  /// In en, this message translates to:
  /// **'Two weeks gives you repeated exposure to the situations that used to cue pornography. Research links problematic use with factors including craving, stress, avoidance, loneliness, and coping style; knowing your own pattern gives you something concrete to change.'**
  String get pornographyMilestone14Description;

  /// Pornography milestone day 30 title
  ///
  /// In en, this message translates to:
  /// **'A Month of Control'**
  String get pornographyMilestone30Title;

  /// Pornography milestone day 30 description
  ///
  /// In en, this message translates to:
  /// **'A month is a meaningful test of control. In a 14,581-person study, sexual-function problems were associated more strongly with problematic use than with simple viewing frequency, so regaining control is the more evidence-based target.'**
  String get pornographyMilestone30Description;

  /// Pornography milestone day 90 title
  ///
  /// In en, this message translates to:
  /// **'Change Can Hold'**
  String get pornographyMilestone90Title;

  /// Pornography milestone day 90 description
  ///
  /// In en, this message translates to:
  /// **'A randomized ACT trial for problematic pornography use found large reductions in viewing after 12 sessions, with substantial reductions still present at 3-month follow-up. Durable change is realistic, especially when you build structured skills instead of relying only on willpower.'**
  String get pornographyMilestone90Description;

  /// Pornography milestone day 180 title
  ///
  /// In en, this message translates to:
  /// **'Six-Month Stability'**
  String get pornographyMilestone180Title;

  /// Pornography milestone day 180 description
  ///
  /// In en, this message translates to:
  /// **'A randomized CBT study for out-of-control sexual behaviour found improvements in symptoms, sexual compulsivity, and well-being that remained stable at 3- and 6-month follow-up. Long-term control can be maintained.'**
  String get pornographyMilestone180Description;

  /// Pornography milestone day 365 title
  ///
  /// In en, this message translates to:
  /// **'One Year: Durable Change'**
  String get pornographyMilestone365Title;

  /// Pornography milestone day 365 description
  ///
  /// In en, this message translates to:
  /// **'One-year follow-up data from an acceptance-based treatment study found participants did not return to pretreatment hypersexuality levels. A year of maintained change is credible evidence of a durable pattern, not a magical brain-reset date.'**
  String get pornographyMilestone365Description;

  /// Pornography milestone day 1825 title
  ///
  /// In en, this message translates to:
  /// **'Five Years of Control'**
  String get pornographyMilestone1825Title;

  /// Pornography milestone day 1825 description
  ///
  /// In en, this message translates to:
  /// **'Five years is long-term maintenance. CSBD is clinically defined by persistent loss of control with distress or impairment, so maintaining control and functioning well over years is a meaningful outcome in its own right.'**
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

  /// SSRI addiction name
  ///
  /// In en, this message translates to:
  /// **'SSRIs'**
  String get addictionSsri;

  /// No description provided for @ssriPageTitle.
  ///
  /// In en, this message translates to:
  /// **'SSRI Recovery'**
  String get ssriPageTitle;

  /// No description provided for @ssriHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get ssriHeaderStarted;

  /// No description provided for @ssriHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Benefits of Tapering Off SSRIs'**
  String get ssriHeaderNotStarted;

  /// No description provided for @ssriSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get ssriSubtitleStarted;

  /// No description provided for @ssriSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you taper off'**
  String get ssriSubtitleNotStarted;

  /// No description provided for @ssriMilestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Day 3: FINISH Syndrome Peaks'**
  String get ssriMilestone3Title;

  /// No description provided for @ssriMilestone3Description.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal symptoms often peak around days 2–4. SSRIs change how serotonin is recycled, so the brain needs time to adjust after you stop. Expect flu-like symptoms, dizziness, insomnia, nausea, and \'brain zaps\'. Paroxetine tends to cause stronger withdrawal; fluoxetine lasts much longer in the body and is usually milder.'**
  String get ssriMilestone3Description;

  /// No description provided for @ssriMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'One Week: Acute Phase Beginning to Ease'**
  String get ssriMilestone7Title;

  /// No description provided for @ssriMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'The most intense physical symptoms are beginning to subside. Your brain is adjusting its serotonin signalling to function without the medication. Sleep and appetite are beginning to stabilise.'**
  String get ssriMilestone7Description;

  /// No description provided for @ssriMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks: Physical Symptoms Resolving'**
  String get ssriMilestone14Title;

  /// No description provided for @ssriMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'Most acute physical discontinuation symptoms have significantly reduced or resolved. Brain zaps, nausea, and dizziness are fading. Emotional sensitivity may still be heightened as your brain continues to rebalance its serotonin systems.'**
  String get ssriMilestone14Description;

  /// No description provided for @ssriMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month: Mood and Energy Stabilising'**
  String get ssriMilestone30Title;

  /// No description provided for @ssriMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'One month marks a significant milestone. Sleep quality is improving, energy levels are stabilising, and many people notice their mood beginning to find a new equilibrium. The brain is actively restoring its natural serotonin regulation.'**
  String get ssriMilestone30Description;

  /// No description provided for @ssriMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Three Months: Serotonin Receptor Recovery'**
  String get ssriMilestone90Title;

  /// No description provided for @ssriMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Three months is a major recovery milestone. The serotonin system has had months to adjust after the medicine is gone. Mood, anxiety, focus, and clear thinking are meaningfully better for most people.'**
  String get ssriMilestone90Description;

  /// No description provided for @ssriMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Six Months: Long-Term Brain Adjustment'**
  String get ssriMilestone180Title;

  /// No description provided for @ssriMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'Six months allows for substantial neurological adjustment. The brain\'s serotonin systems have found their natural balance. Many people report improved emotional range and, for those who experienced it, sexual dysfunction caused by SSRIs has typically resolved.'**
  String get ssriMilestone180Description;

  /// No description provided for @ssriMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One Year: Recovery Achieved'**
  String get ssriMilestone365Title;

  /// No description provided for @ssriMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'One year marks a complete cycle of recovery. Research shows the majority who completed a gradual taper and received psychological support remain well at one year, with quality of life comparable or better than those who remained on medication.'**
  String get ssriMilestone365Description;

  /// No description provided for @settingsShowSsriTracking.
  ///
  /// In en, this message translates to:
  /// **'Show SSRI tracking'**
  String get settingsShowSsriTracking;

  /// No description provided for @settingsNotifySsri.
  ///
  /// In en, this message translates to:
  /// **'Notify SSRI quitting progress'**
  String get settingsNotifySsri;

  /// SNRI addiction name
  ///
  /// In en, this message translates to:
  /// **'SNRIs'**
  String get addictionSnri;

  /// No description provided for @snriPageTitle.
  ///
  /// In en, this message translates to:
  /// **'SNRI Recovery'**
  String get snriPageTitle;

  /// No description provided for @snriHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get snriHeaderStarted;

  /// No description provided for @snriHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Benefits of Tapering Off SNRIs'**
  String get snriHeaderNotStarted;

  /// No description provided for @snriSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get snriSubtitleStarted;

  /// No description provided for @snriSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you taper off'**
  String get snriSubtitleNotStarted;

  /// No description provided for @snriMilestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Day 3: Intense Discontinuation Syndrome Peaks'**
  String get snriMilestone3Title;

  /// No description provided for @snriMilestone3Description.
  ///
  /// In en, this message translates to:
  /// **'SNRIs — particularly venlafaxine (Effexor) — are associated with some of the most severe antidepressant discontinuation syndromes. Venlafaxine\'s very short half-life (5 hours) means symptoms can be more intense than with most SSRIs. FINISH symptoms (flu-like feelings, insomnia, nausea, imbalance, sensory disturbances, hyperarousal) affect both serotonin and norepinephrine systems simultaneously.'**
  String get snriMilestone3Description;

  /// No description provided for @snriMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'One Week: Two Brain-Chemical Systems Adjusting'**
  String get snriMilestone7Title;

  /// No description provided for @snriMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'SNRIs affect both serotonin and norepinephrine reuptake. Both systems are adjusting simultaneously. The most intense physical symptoms are beginning to subside, but the dual mechanism means adjustment can feel more complex than with SSRIs alone.'**
  String get snriMilestone7Description;

  /// No description provided for @snriMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks: Physical Symptoms Fading'**
  String get snriMilestone14Title;

  /// No description provided for @snriMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'Most acute physical discontinuation symptoms have significantly reduced. Brain zaps, nausea, and dizziness are fading. The norepinephrine system\'s readjustment may still be causing some anxiety or blood pressure fluctuations — these typically resolve over coming weeks.'**
  String get snriMilestone14Description;

  /// No description provided for @snriMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month: Norepinephrine System Stabilising'**
  String get snriMilestone30Title;

  /// No description provided for @snriMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'One month marks a significant milestone. Both serotonin and norepinephrine systems are actively rebalancing. Sleep quality and energy levels are stabilising. Many people notice improved emotional range as the medication\'s effect on emotional blunting begins to resolve.'**
  String get snriMilestone30Description;

  /// No description provided for @snriMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Three Months: Dual System Rebalancing'**
  String get snriMilestone90Title;

  /// No description provided for @snriMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Three months is a major recovery milestone. The serotonin and noradrenaline systems have had months to adjust. Mood, anxiety, focus, and clear thinking are meaningfully better after a supervised taper.'**
  String get snriMilestone90Description;

  /// No description provided for @snriMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Six Months: Neurological Recovery'**
  String get snriMilestone180Title;

  /// No description provided for @snriMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'Six months allows for substantial readjustment of both serotonin and norepinephrine systems. The HPA axis — which SNRIs influence through norepinephrine — is normalising. Many people report notably improved resilience to everyday stressors at this point.'**
  String get snriMilestone180Description;

  /// No description provided for @snriMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One Year: Recovery Achieved'**
  String get snriMilestone365Title;

  /// No description provided for @snriMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'One year marks a complete cycle of dual serotonin-norepinephrine recovery. Research consistently shows that people who successfully discontinue SNRIs under medical supervision and with psychological support maintain good outcomes at one year.'**
  String get snriMilestone365Description;

  /// No description provided for @settingsShowSnriTracking.
  ///
  /// In en, this message translates to:
  /// **'Show SNRI tracking'**
  String get settingsShowSnriTracking;

  /// No description provided for @settingsNotifySnri.
  ///
  /// In en, this message translates to:
  /// **'Notify SNRI quitting progress'**
  String get settingsNotifySnri;

  /// Tricyclic antidepressant addiction name
  ///
  /// In en, this message translates to:
  /// **'TCAs'**
  String get addictionTca;

  /// No description provided for @tcaPageTitle.
  ///
  /// In en, this message translates to:
  /// **'TCA Recovery'**
  String get tcaPageTitle;

  /// No description provided for @tcaHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get tcaHeaderStarted;

  /// No description provided for @tcaHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Benefits of Tapering Off TCAs'**
  String get tcaHeaderNotStarted;

  /// No description provided for @tcaSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get tcaSubtitleStarted;

  /// No description provided for @tcaSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you taper off'**
  String get tcaSubtitleNotStarted;

  /// No description provided for @tcaMilestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Day 3: Acetylcholine Rebound Peaks'**
  String get tcaMilestone3Title;

  /// No description provided for @tcaMilestone3Description.
  ///
  /// In en, this message translates to:
  /// **'TCAs block acetylcholine. After stopping, that system can briefly become overactive. Symptoms include nausea, diarrhoea, stomach cramps, heavy sweating, headache, muscle aches, and insomnia. These symptoms usually peak early and then ease.'**
  String get tcaMilestone3Description;

  /// No description provided for @tcaMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'One Week: Rebound Symptoms Easing'**
  String get tcaMilestone7Title;

  /// No description provided for @tcaMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'The acetylcholine rebound usually peaks in the first few days and starts easing by one week. Stomach symptoms, sweating, and flu-like feelings are reducing, while the body systems that control heart rate, digestion, and sweating return toward normal.'**
  String get tcaMilestone7Description;

  /// No description provided for @tcaMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks: Anticholinergic Effects Reversing'**
  String get tcaMilestone14Title;

  /// No description provided for @tcaMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'The dry mouth, constipation, trouble urinating, and blurred vision caused by TCAs are reversing as the acetylcholine system recovers. Memory and attention often feel clearer too.'**
  String get tcaMilestone14Description;

  /// No description provided for @tcaMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month: Autonomic Nervous System Stabilising'**
  String get tcaMilestone30Title;

  /// No description provided for @tcaMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'At one month, the body systems that control heart rate, blood pressure, digestion, and sweating are settling. Heart rhythm and blood-pressure changes are moving toward normal, and REM dream sleep is returning.'**
  String get tcaMilestone30Description;

  /// No description provided for @tcaMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Three Months: Brain-Chemical Systems Settling'**
  String get tcaMilestone90Title;

  /// No description provided for @tcaMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'TCAs affect several brain-chemical systems. Three months gives them substantial time to settle. Mood, clear thinking, and physical wellbeing are markedly better.'**
  String get tcaMilestone90Description;

  /// No description provided for @tcaMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Six Months: Heart and Thinking Recovery'**
  String get tcaMilestone180Title;

  /// No description provided for @tcaMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'Six months allows major recovery in heart rhythm, memory, and thinking speed. The heart-rhythm changes and brain fog caused by TCAs have had months to resolve.'**
  String get tcaMilestone180Description;

  /// No description provided for @tcaMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One Year: Recovery Achieved'**
  String get tcaMilestone365Title;

  /// No description provided for @tcaMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'One year gives every system affected by TCAs a full year to recover. The acetylcholine, noradrenaline, serotonin, and histamine systems have settled, and memory, clear thinking, and heart-rate control are substantially recovered.'**
  String get tcaMilestone365Description;

  /// No description provided for @settingsShowTcaTracking.
  ///
  /// In en, this message translates to:
  /// **'Show TCA tracking'**
  String get settingsShowTcaTracking;

  /// No description provided for @settingsNotifyTca.
  ///
  /// In en, this message translates to:
  /// **'Notify TCA quitting progress'**
  String get settingsNotifyTca;

  /// MAOI addiction name
  ///
  /// In en, this message translates to:
  /// **'MAOIs'**
  String get addictionMaoi;

  /// No description provided for @maoiPageTitle.
  ///
  /// In en, this message translates to:
  /// **'MAOI Recovery'**
  String get maoiPageTitle;

  /// No description provided for @maoiHeaderStarted.
  ///
  /// In en, this message translates to:
  /// **'Your Recovery Journey'**
  String get maoiHeaderStarted;

  /// No description provided for @maoiHeaderNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Benefits of Tapering Off MAOIs'**
  String get maoiHeaderNotStarted;

  /// No description provided for @maoiSubtitleStarted.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and celebrate each milestone'**
  String get maoiSubtitleStarted;

  /// No description provided for @maoiSubtitleNotStarted.
  ///
  /// In en, this message translates to:
  /// **'See what happens when you taper off'**
  String get maoiSubtitleNotStarted;

  /// No description provided for @maoiMilestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Day 3: Highest Risk Phase — Medical Supervision Essential'**
  String get maoiMilestone3Title;

  /// No description provided for @maoiMilestone3Description.
  ///
  /// In en, this message translates to:
  /// **'MAOIs carry the most serious discontinuation risks of any antidepressant class. Abrupt cessation — especially of phenelzine and tranylcypromine — can cause severe agitation, confusion, hallucinations, myoclonus, and hyperthermia. If you are experiencing these symptoms, seek immediate medical attention. MAOIs work by permanently disabling MAO enzymes; recovery requires the body to synthesise new enzyme, a process taking approximately 14 days.'**
  String get maoiMilestone3Description;

  /// No description provided for @maoiMilestone7Title.
  ///
  /// In en, this message translates to:
  /// **'One Week: MAO Enzyme Synthesis Underway'**
  String get maoiMilestone7Title;

  /// No description provided for @maoiMilestone7Description.
  ///
  /// In en, this message translates to:
  /// **'MAOIs permanently destroy MAO enzyme molecules; recovery requires synthesising entirely new enzyme. By one week, approximately 50% of normal MAO activity may have recovered. Severe acute discontinuation symptoms (delirium, myoclonus, hyperthermia) are substantially reduced. Close medical supervision remains important.'**
  String get maoiMilestone7Description;

  /// No description provided for @maoiMilestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks: MAO Enzyme Activity Substantially Recovered'**
  String get maoiMilestone14Title;

  /// No description provided for @maoiMilestone14Description.
  ///
  /// In en, this message translates to:
  /// **'Two weeks is the standard clinical timeframe for MAO enzyme recovery after discontinuation. By approximately day 14, MAO-A and MAO-B activity is largely restored and normal tyramine metabolism is re-established. The dietary restrictions required during MAOI treatment can typically be relaxed in consultation with your prescriber.'**
  String get maoiMilestone14Description;

  /// No description provided for @maoiMilestone30Title.
  ///
  /// In en, this message translates to:
  /// **'One Month: Brain-Chemical Systems Rebalancing'**
  String get maoiMilestone30Title;

  /// No description provided for @maoiMilestone30Description.
  ///
  /// In en, this message translates to:
  /// **'One month after stopping an MAOI, the MAO enzyme is active again and the brain is handling serotonin, noradrenaline, dopamine, and tyramine naturally. The special food and drug interaction period has ended, though you should still tell prescribers about previous MAOI use.'**
  String get maoiMilestone30Description;

  /// No description provided for @maoiMilestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Three Months: Brain Chemistry Normalising'**
  String get maoiMilestone90Title;

  /// No description provided for @maoiMilestone90Description.
  ///
  /// In en, this message translates to:
  /// **'Three months gives the brain\'s mood and energy systems substantial time to readjust after MAOIs. Mood, energy, and clear thinking are stabilising as the brain handles these chemicals naturally again.'**
  String get maoiMilestone90Description;

  /// No description provided for @maoiMilestone180Title.
  ///
  /// In en, this message translates to:
  /// **'Six Months: Long-Term Recovery'**
  String get maoiMilestone180Title;

  /// No description provided for @maoiMilestone180Description.
  ///
  /// In en, this message translates to:
  /// **'Six months represents a substantial period of natural monoamine function. Serotonin, norepinephrine, and dopamine receptor populations have normalised. The phenethylamine (PEA) pathways also affected by MAOIs have restored to natural levels — an often-overlooked aspect of recovery that contributes to emotional normalisation.'**
  String get maoiMilestone180Description;

  /// No description provided for @maoiMilestone365Title.
  ///
  /// In en, this message translates to:
  /// **'One Year: Recovery Achieved'**
  String get maoiMilestone365Title;

  /// No description provided for @maoiMilestone365Description.
  ///
  /// In en, this message translates to:
  /// **'One year after stopping an MAOI gives the brain and body a full year without the drug. Mood, energy, clear thinking, and normal brain-chemical regulation have had substantial time to settle and recover.'**
  String get maoiMilestone365Description;

  /// No description provided for @settingsShowMaoiTracking.
  ///
  /// In en, this message translates to:
  /// **'Show MAOI tracking'**
  String get settingsShowMaoiTracking;

  /// No description provided for @settingsNotifyMaoi.
  ///
  /// In en, this message translates to:
  /// **'Notify MAOI quitting progress'**
  String get settingsNotifyMaoi;

  /// Label showing when a milestone reference was retrieved
  ///
  /// In en, this message translates to:
  /// **'Retrieved {date}'**
  String milestoneRetrieved(String date);

  /// Progress notification title
  ///
  /// In en, this message translates to:
  /// **'No {name}'**
  String notificationProgressTitle(String name);

  /// Progress notification body
  ///
  /// In en, this message translates to:
  /// **'{days} days clean — {message}'**
  String notificationProgressBody(int days, String message);

  /// No description provided for @notificationProgressMessage1.
  ///
  /// In en, this message translates to:
  /// **'Keep up the amazing work!'**
  String get notificationProgressMessage1;

  /// No description provided for @notificationProgressMessage2.
  ///
  /// In en, this message translates to:
  /// **'You\'re doing great!'**
  String get notificationProgressMessage2;

  /// No description provided for @notificationProgressMessage3.
  ///
  /// In en, this message translates to:
  /// **'Incredible dedication!'**
  String get notificationProgressMessage3;

  /// No description provided for @notificationProgressMessage4.
  ///
  /// In en, this message translates to:
  /// **'Celebrating your strength!'**
  String get notificationProgressMessage4;

  /// No description provided for @notificationProgressMessage5.
  ///
  /// In en, this message translates to:
  /// **'Keep shining!'**
  String get notificationProgressMessage5;

  /// No description provided for @notificationProgressMessage6.
  ///
  /// In en, this message translates to:
  /// **'Awesome job!'**
  String get notificationProgressMessage6;

  /// No description provided for @notificationProgressMessage7.
  ///
  /// In en, this message translates to:
  /// **'Way to go!'**
  String get notificationProgressMessage7;

  /// No description provided for @notificationProgressMessage8.
  ///
  /// In en, this message translates to:
  /// **'You\'re a true champion!'**
  String get notificationProgressMessage8;

  /// No description provided for @notificationProgressMessage9.
  ///
  /// In en, this message translates to:
  /// **'Remarkable effort!'**
  String get notificationProgressMessage9;

  /// No description provided for @notificationProgressMessage10.
  ///
  /// In en, this message translates to:
  /// **'Stay strong!'**
  String get notificationProgressMessage10;

  /// No description provided for @notificationChannelName.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get notificationChannelName;

  /// No description provided for @notificationChannelDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifications for daily progress reminders'**
  String get notificationChannelDescription;

  /// No description provided for @notificationOpenAction.
  ///
  /// In en, this message translates to:
  /// **'Open notification'**
  String get notificationOpenAction;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Rename dialog title and badge tooltip
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// No description provided for @adderallReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Amphetamine Withdrawal: What Happens Early On\n\nSource: MedlinePlus (U.S. National Library of Medicine)\n\nWhat Are Amphetamines?\nAmphetamines are stimulant drugs that include both illicit substances (like street speed) and prescription medications used to treat ADHD and narcolepsy (such as Adderall and Vyvanse). They sharply increase dopamine and norepinephrine, which can create intense focus, energy, and euphoria. With regular heavy use, the brain adapts to those repeated surges, so stopping can leave mood, energy, and motivation temporarily low.\n\nCommon Withdrawal Symptoms\nMedlinePlus lists these as typical when stopping amphetamines:\n• Strong craving for the drug\n• Mood swings ranging from depressed to agitated to anxious\n• Feeling tired all day\n• Not able to concentrate\n• Hallucinations (seeing or hearing things that are not there)\n• Physical reactions such as headaches, aches and pains, increased appetite, and not sleeping well\n\nIs Withdrawal Dangerous?\nMedlinePlus does not describe amphetamine withdrawal as medically dangerous in itself, but notes that severe symptoms may call for a live-in treatment program, and that mood and emotional problems from amphetamine use — including depression — can be serious and require support.\n\nGetting Help\nMedlinePlus advises contacting your healthcare provider if you or someone you know is addicted to amphetamines and needs help to stop using. If you have thoughts of self-harm, it directs readers to crisis resources such as 988 or 911.'**
  String get adderallReferenceDay1;

  /// No description provided for @adderallReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'Amphetamine Withdrawal Management: Day 3\n\nSource: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\nWhere Day 3 Sits\nThe WHO guidelines state that stimulant withdrawal symptoms \'begin within 24 hours of last use of stimulants and last for 3–5 days.\' Day three is squarely inside this acute phase — typically among the hardest days before symptoms begin to settle.\n\nThe Symptoms\nFor amphetamine-type stimulants the guidelines list:\n• Agitation and irritability\n• Depression\n• Increased sleeping and appetite\n• Muscle aches\nHeavy users may also develop psychotic symptoms such as paranoia, disordered thoughts, or hallucinations.\n\nMostly a Psychological Challenge\nUnlike alcohol or opioid withdrawal, stimulant withdrawal does not bring vomiting, tremors, or seizures. The dominant difficulty is psychological — low mood, loss of pleasure, and craving driven by a dopamine-depleted brain.\n\nManagement Approach\nThe WHO guidelines recommend supportive care:\n• Drinking at least 2–3 litres of water per day\n• Multivitamin supplements with B group vitamins and vitamin C\n• Symptomatic medication for aches and anxiety\n• For severe agitation, behavioural strategies first, with diazepam sedation only if needed\n\nBeyond the Acute Phase\nThe guidelines say the hardest withdrawal lasts only a few days, followed by a milder recovery period that can last one to two months.'**
  String get adderallReferenceDay3;

  /// No description provided for @adderallReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week Without Adderall: The Worst Is Passing\n\nSource: Li & Shoptaw, \"Clinical Management of Psychostimulant Withdrawal: Review of the Evidence,\" Addiction (2023), on PubMed Central\n\nThe Acute Phase Resolves\nThis evidence review describes psychostimulant withdrawal in phases. In the acute phase, symptoms \'peak after the first 2–3 days,\' and the \'major discomfort from these symptoms usually resolves within 4–7 days.\' By the end of the first week, the hardest part of the crash is behind most people — energy and appetite begin to steady, and sleep starts to regulate.\n\nWhat Comes Next\nThe review says most remaining symptoms continue easing over the next two to three weeks. At day seven, recovery is already well underway.\n\nWhat\'s Still Present at Day 7\nPsychological symptoms typically outlast the physical crash:\n• Low motivation and loss of pleasure\n• Difficulty concentrating\n• Mood that is still below normal\nThese reflect a dopamine system that is readjusting — a normal, temporary part of recovery.\n\nRecovery Signal\nNo FDA-approved medication specifically treats stimulant withdrawal, so supportive care, structure, sleep, nutrition, and psychological support are the mainstays through this phase.'**
  String get adderallReferenceDay7;

  /// No description provided for @adderallReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks Off Adderall: Into the Longer Recovery Phase\n\nSource: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\nPast the Acute Phase\nThe WHO puts the hardest stimulant withdrawal at about three to five days, followed by a milder recovery period lasting around one to two months. At two weeks, the crash is well behind you.\n\nWhat the Longer Recovery Phase Feels Like\nThe heavy sleeping, agitation, and muscle aches have largely settled. What remains is usually milder: low or changing mood, reduced motivation, and on-and-off cravings as the brain\'s reward system readjusts.\n\nSleep and Appetite\nThe increased sleeping and appetite of the acute phase are normalising. As sleep steadies, mood, concentration, and energy tend to follow.\n\nRelapse Risk and ADHD\nThis is still a higher-risk period, particularly if underlying ADHD symptoms return without medication. The WHO guidelines emphasise psychological support and relapse-prevention skills; for people who took Adderall for ADHD, this is a good time to discuss non-stimulant strategies or alternatives with a doctor.'**
  String get adderallReferenceDay14;

  /// No description provided for @adderallReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month Off Adderall: Most Symptoms Behind You\n\nSource: Li & Shoptaw, \"Clinical Management of Psychostimulant Withdrawal: Review of the Evidence,\" Addiction (2023), on PubMed Central\n\nWhere One Month Sits\nThe review finds that most withdrawal symptoms fade over the first two to three weeks. By 30 days, the bulk of them have eased and mood and motivation are usually much better than in the first week.\n\nThe Later Recovery Phase\nFrom one to six months, memory, planning, focus, and decision-making continue to improve. At one month, the crash is over and those gains are already underway.\n\nMood and Motivation\nThe deep loss of pleasure from the crash has largely lifted by now. Activities that felt joyless in the first week start to feel rewarding again as natural dopamine signalling recovers.\n\nFor People With ADHD\nIf Adderall was prescribed for ADHD, underlying symptoms may be more noticeable now. Working with a healthcare provider on non-stimulant strategies or alternatives is important during this stage.'**
  String get adderallReferenceDay30;

  /// No description provided for @adderallReferenceDay60.
  ///
  /// In en, this message translates to:
  /// **'Two Months Off Adderall: The Longer Recovery Phase Winds Down\n\nSource: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\nWhere Two Months Sits\nThe WHO describes a milder recovery period lasting around one to two months after the initial crash. At 60 days, you are at the far end of that window and lingering symptoms are largely resolving.\n\nWhat Improves\nThe agitation, depressed mood, and disturbed sleep and appetite the guidelines list for stimulant withdrawal have, for most people, settled substantially:\n• Usual mood is steadier, with fewer of the swings of early recovery\n• Sleep and appetite have normalised\n• The reward system responds more readily to everyday pleasures — food, exercise, connection\n\nRecovery Signal\nHigher doses and longer use can make recovery take longer, while staying abstinent keeps mood, motivation, and clear thinking moving toward normal over the following months.\n\nPhysical Health\nThe stimulant effects on heart rate, appetite, and weight ease as the drug clears from daily life, and cardiovascular strain from stimulant use is relieved.'**
  String get adderallReferenceDay60;

  /// No description provided for @adderallReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months Off Adderall: Through the Worst, Still Healing\n\nSource: Li & Shoptaw, \"Clinical Management of Psychostimulant Withdrawal: Review of the Evidence,\" Addiction (2023), on PubMed Central\n\nWhere 90 Days Sits\nAt three months, the early symptoms are long gone while memory, planning, focus, decision-making, and the reward system continue to improve.\n\nThinking and Memory Keep Recovering\nThe review finds that memory, planning, focus, and risk decisions can keep improving for months. At 90 days, concentration and memory are still moving in the right direction with continued abstinence.\n\nWhy This Window Still Matters\nNo FDA-approved medication specifically targets stimulant withdrawal, so structure, therapy, exercise, sleep, and support are the tools that carry recovery through this phase. Building those habits now is what carries recovery forward.\n\nThe Bigger Picture\nThree months is a real achievement — the hardest physical and emotional stretches are behind you, and the trajectory from here, with continued abstinence, is one of steady improvement.'**
  String get adderallReferenceDay90;

  /// No description provided for @adderallReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months Off Adderall: Well Past the Hard Part\n\nSource: \"Withdrawal Syndromes,\" StatPearls (NCBI Bookshelf), U.S. National Library of Medicine\n\nWhat StatPearls Says About Stimulants\nThis clinical reference describes stimulant recovery as a crash followed by gradual improvement. Common problems include depression, sleeping a lot, increased hunger, low mood, and slower movement and thinking. Depression can last several weeks, with milder recovery continuing beyond that.\n\nWhere Six Months Sits\nAt six months you are far past both the acute period and the several-weeks depressive phase StatPearls describes. The slow recovery it refers to has had substantial time to progress, and for most people usual mood, sleep, appetite, and motivation are steady and reliable by now.\n\nRecovery Signal\nStatPearls describes a gradual recovery beyond the initial weeks. By six months, the acute crash and the several-week depressive phase are far behind you, with stable mood, sleep, appetite, and motivation now the dominant pattern.\n\nRelationship to ADHD\nFor people who took Adderall for ADHD, six months of abstinence is a good point for a clear-headed review with a doctor of current symptoms and whether non-stimulant approaches — exercise, sleep, structure, therapy, or alternative medication — are meeting your needs.'**
  String get adderallReferenceDay180;

  /// No description provided for @adderallReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year Off Adderall: Substantial Recovery, Honestly Framed\n\nSource: Berman et al., \"Potential Adverse Effects of Amphetamine Treatment on Brain and Behavior: A Review,\" Molecular Psychiatry (2008), on PubMed Central\n\nAbout This Review\nThis review tracks what high-dose or long-term amphetamine exposure can do to the brain and documents measurable recovery during abstinence.\n\nWhat It Says About Recovery\nThe review documents recovery in brain blood flow and in the proteins that recycle dopamine after long-term abstinence. Some brain areas recover faster than others, but the overall direction is clear: the brain heals after use stops.\n\nLong-Term Recovery\nThe review documents measurable recovery in brain blood flow and dopamine recycling after long-term abstinence. At one year, those brain systems have had a full year to rebuild.\n\nWhat This Means at One Year\nFor most people — particularly those who took Adderall at prescribed doses — a year off means reward, attention, and motivation systems are working well day to day. Heavier or longer use can take more time, but recovery continues. Relapse risk is much lower than in early recovery.'**
  String get adderallReferenceDay365;

  /// No description provided for @alcoholReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'What Happens to Your Sleep When You Stop Drinking?\n\nSource: \"Alcohol and the Sleeping Brain\" (Colrain, Nicholas & Baker), Handbook of Clinical Neurology — peer-reviewed, NIH-hosted\n\nAlcohol and Sleep Architecture\nAlcohol is sedating, so it shortens the time it takes to fall asleep and increases deep slow-wave sleep in the first half of the night. But it comes at a cost: alcohol suppresses REM (rapid eye movement) sleep — the restorative stage tied to memory consolidation and emotional regulation — and fragments sleep in the second half of the night as it is metabolised.\n\nThe First Night Off Alcohol\nBecause alcohol suppresses REM dream sleep, the first nights without it often bring a REM rebound: vivid dreams and lighter, broken sleep while normal sleep patterns return. This is a normal, temporary part of recovery.\n\nRecovery Begins\nAs the brain readjusts over the following days and weeks, REM and overall sleep quality improve. Sleep disturbance is one of the most persistent withdrawal-related symptoms, but it trends toward normal with sustained abstinence.\n\nA Note on Heavy Drinking\nFor heavy or long-term daily drinkers, the first 24 hours can also bring withdrawal symptoms (anxiety, sweating, tremor, nausea). Severe withdrawal can be dangerous — if you have been drinking heavily every day, talk to a doctor before stopping abruptly.'**
  String get alcoholReferenceDay1;

  /// No description provided for @alcoholReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'The Acute Phase and Early Recovery\n\nSource: \"Alcohol Withdrawal,\" StatPearls — peer-reviewed, NIH National Library of Medicine\n\nThe First 24–72 Hours\nStatPearls documents that withdrawal symptoms appear within hours of the last drink — tremor, insomnia, agitation, sweating, raised heart rate and blood pressure — and that symptoms typically peak around 72 hours. Most people are over the worst of the acute phase by the end of day three. Severe withdrawal (seizures, or delirium tremens, which StatPearls notes can occur at any point up to 3 to 5 days after stopping or cutting down) is a medical emergency: heavy daily drinkers should not stop abruptly without medical advice.\n\nCravings Come in Waves\nCravings often intensify across the first several days, but an individual craving is short-lived — usually passing within minutes. Recognising that each wave subsides on its own makes them easier to ride out.\n\nHydration Recovers\nAlcohol suppresses antidiuretic hormone (ADH), making the kidneys excrete more water and leaving regular drinkers chronically dehydrated. Once drinking stops, this diuretic effect ends and fluid balance begins to recover over the first few days — often noticed as clearer skin and steadier energy.\n\nMind and Sleep Begin to Settle\nAs the acute phase passes, the brain chemistry that alcohol disrupted (GABA and glutamate) starts to rebalance. Mental clarity improves and sleep — badly fragmented during early withdrawal — begins trending toward better quality over the first week.'**
  String get alcoholReferenceDay3;

  /// No description provided for @alcoholReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'How the Immune System Recovers\n\nSource: \"Alcohol and the Immune System\" (Sarkar, Jung & Wang), Alcohol Research: Current Reviews — peer-reviewed, NIH-hosted\n\nHow Alcohol Weakens Immunity\nAlcohol weakens the immune system in several ways. Even one heavy drinking session can reduce infection-fighting ability for up to 24 hours. Long-term use reduces white blood cells, disrupts immune signals, and damages gut and lung defences, increasing the risk of infections and slow wound healing.\n\nRemoving the Insult\nMany of these effects improve once alcohol is gone. White blood cells and immune signalling begin to recover, while the gut and airway defences start repairing. Within the first week, your immune system is no longer being knocked down daily and resistance to common infections begins to improve.\n\nA Gradual Process\nFull immune recovery takes longer than a week, and the degree of repair depends on how heavy and prolonged the drinking was — but the first week off alcohol is where the rebuilding begins.'**
  String get alcoholReferenceDay7;

  /// No description provided for @alcoholReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Early Brain Recovery in Abstinence\n\nSource: Bartsch AJ et al., \"Manifestations of early brain recovery associated with abstinence from alcoholism,\" Brain (2007) — peer-reviewed\n\nMeasuring Recovery\nThis study used MRI to follow recently detoxified people with alcohol dependence through the first weeks of abstinence, comparing them with healthy controls. It captured the brain physically rebuilding once drinking stopped.\n\nBrain Volume Rebounds\nChronic alcohol use shrinks the brain — partly through reversible reduction in cell size, not only permanent cell loss. With abstinence, the researchers measured an average global brain-volume gain of nearly 2%, concentrated around the cerebellum, midbrain, ventricles and frontal regions. Much of this regrowth happens early, in the first couple of weeks off alcohol.\n\nCerebellum and Attention\nRecovery was especially clear in brain areas used for movement and attention. A marker of brain-cell health rose alongside measurable improvements in attention, so the physical healing came with real gains in thinking.\n\nA Foundation, Not the Finish\nHigher functions such as complex reasoning recover more gradually, but the first two weeks establish that the brain begins healing quickly once alcohol is removed.'**
  String get alcoholReferenceDay14;

  /// No description provided for @alcoholReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'Blood Pressure Falls When You Cut Out Alcohol\n\nSource: Roerecke et al., \"The effect of a reduction in alcohol consumption on blood pressure: a systematic review and meta-analysis,\" Lancet Public Health (2017) — peer-reviewed\n\nThe Evidence\nThis meta-analysis pooled 36 randomised trials (about 2,865 participants) testing what happens to blood pressure when people drink less. It found a clear, dose-dependent effect: the more someone cut back, the more their blood pressure dropped.\n\nHow Big Is the Effect?\nPeople who drank two or fewer drinks a day saw no significant blood-pressure change from cutting back. Above that threshold, the effect was dose-dependent: it was strongest in people drinking six or more drinks a day who cut their intake by about half, where systolic blood pressure fell by about 5.5 mmHg and diastolic by about 4.0 mmHg on average. A reduction of that size is clinically meaningful — comparable to some blood-pressure medications and enough to lower long-term stroke and heart-disease risk.\n\nWhy One Month Matters\nAlcohol raises blood pressure by activating the stress response, raising cortisol and stiffening blood vessels. The trials in this review show the benefit emerges over weeks of sustained reduction — so by around a month of abstinence, a heavier drinker\'s blood pressure has had time to settle toward a healthier level.\n\nA Threshold Effect\nThe review found a clear threshold: benefit was concentrated in people drinking more than two drinks a day, and grew progressively larger the heavier the prior drinking. If you were a lighter drinker, don\'t expect this specific blood-pressure benefit — but heavier drinkers get a real, measurable cardiovascular payoff from stopping.'**
  String get alcoholReferenceDay30;

  /// No description provided for @alcoholReferenceDay60.
  ///
  /// In en, this message translates to:
  /// **'Liver Recovery After You Stop Drinking\n\nSource: National Institute on Alcohol Abuse and Alcoholism (NIAAA), \"Alcohol\'s Effects on the Body\"\n\nHow Alcohol Damages the Liver\nThe liver processes most of the alcohol you drink, and it takes the brunt of the damage. NIAAA describes a progression of alcohol-related liver injury: it begins with fatty liver (steatosis — fat building up in liver cells), can advance to alcoholic hepatitis (inflammation), and with prolonged heavy use to fibrosis and cirrhosis (scarring).\n\nThe Earlier Stages Are Reversible\nThe crucial point is that the liver is highly regenerative, and the early stages of this damage can improve when drinking stops. Fatty liver in particular often resolves with sustained abstinence. By around two months alcohol-free, the liver has had real time to clear fat deposits, calm inflammation, and restore healthier function — typically reflected in falling liver-enzyme levels (ALT and AST).\n\nBeyond the Liver\nNIAAA notes alcohol also strains the heart, pancreas and immune system. Giving the body a sustained break from alcohol lets these systems recover too — contributing to the steadier energy and better overall health many people notice by this stage.'**
  String get alcoholReferenceDay60;

  /// No description provided for @alcoholReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Thinking and Memory After Three Months Sober\n\nSource: Systematic review of neuropsychological recovery following abstinence from alcohol (PubMed Central, 2024) — peer-reviewed\n\nWhat the Evidence Shows\nThis review combined studies that tracked how thinking and memory recover after people stop drinking. Most skills move toward normal within roughly six to twelve months, and some improve earlier.\n\nWhat Improves First\nTwo specific abilities stand out as recovering earlier than the rest: basic processing speed (the review found this typically recovers by about one month, though accuracy on more complex tasks lags behind) and working memory updating. By around the three-month mark, many people already notice these lifting.\n\nWhat Takes Longer\nAttention, planning, decision-making, impulse control, perception, and memory keep improving across the six-to-twelve-month recovery window.\n\nWhat Influences Recovery\nThe review notes recovery is shaped by factors such as age, smoking status and premorbid ability — but, encouragingly, not consistently by the total amount previously drunk. Recovery is the expected trajectory.\n\nWhy It Matters\nClearer thinking is practical recovery: better attention and decision-making help people stay in treatment and avoid relapse.'**
  String get alcoholReferenceDay90;

  /// No description provided for @alcoholReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Brain Recovery at Six Months of Sobriety\n\nSource: Peer-reviewed review of structural and functional brain recovery during abstinence from substance use (PubMed Central)\n\nRecovery Keeps Going\nThe early brain-volume rebound of the first weeks is only the beginning. This review documents that with sustained abstinence the brain continues to recover structurally and functionally — grey matter recovers and damaged white-matter pathways that coordinate communication between brain regions repair over months.\n\nThe Front of the Brain\nRecovery is especially important in the front of the brain, which handles judgment, planning, and self-control. As it heals, decision-making and impulse control strengthen.\n\nBrain Rewiring and Function\nAlongside physical repair, brain function and connections recover too. The brain can rewire and relearn, which makes sustained abstinence a powerful time for therapy and new habits.\n\nRecovery Signal\nBy six months, brain structure and function are clearly moving toward a healthier normal. Staying abstinent gives that recovery more time to build.'**
  String get alcoholReferenceDay180;

  /// No description provided for @alcoholReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'Alcohol, Cancer Risk, and Stopping\n\nSource: National Cancer Institute (NCI), \"Alcohol and Cancer Risk\"\n\nAlcohol Causes Cancer\nThe NCI states there is a strong scientific consensus that drinking alcohol can cause cancer. Alcohol is linked to cancers of the mouth (oral cavity), pharynx (throat), larynx (voice box), oesophagus, liver, breast, and colon and rectum. The more a person drinks — and the longer they drink — the higher the risk.\n\nHow Alcohol Drives Cancer\nMechanisms include acetaldehyde, a toxic breakdown product of alcohol that damages DNA; oxidative stress and inflammation; impaired absorption of protective nutrients; and, for breast cancer, raised oestrogen levels.\n\nRisk Falls After You Stop\nImportantly, the NCI reports that quitting drinking is associated with lower risk over time — studies show the elevated risk of cancers of the oral cavity and oesophagus declines after stopping, though it can take years to approach the risk of someone who never drank. One year alcohol-free is a meaningful step on that path.\n\nCompounding Benefits\nReaching a year also locks in the cardiovascular and liver gains of abstinence — lower blood pressure, reduced arrhythmia risk, and continued liver healing — alongside the falling cancer risk.'**
  String get alcoholReferenceDay365;

  /// No description provided for @benzodiazepineReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'Benzodiazepine Withdrawal: The First Week\n\nSource: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\nNote on Benzo Withdrawal Safety\nBenzodiazepine withdrawal can be dangerous. The WHO guidelines are explicit that the safest approach is to give benzodiazepines in gradually decreasing amounts, which \'helps to relieve benzodiazepine withdrawal symptoms and prevent the development of seizures.\' Do not stop abruptly after prolonged use — work with a doctor on a taper.\n\nWhen Withdrawal Appears\nThe WHO timeline depends on the drug\'s duration of action:\n• Short-acting (oxazepam, alprazolam, temazepam): withdrawal begins 1–2 days after the last dose and continues for 2–4 weeks or longer\n• Long-acting (diazepam, nitrazepam): withdrawal begins 2–7 days after the last dose and continues for 2–8 weeks or longer\nThe first-week milestone is the point at which even longer-acting benzodiazepines have cleared enough for withdrawal to be in full effect.\n\nEarly Withdrawal Symptoms\n• Rebound anxiety — often more intense than the original anxiety the drug treated\n• Insomnia and disturbed sleep\n• Tremors and muscle tension\n• Sweating and palpitations\n• Heightened sensitivity to light and sound\n\nMonitoring\nThe WHO guidelines note that withdrawal severity \'can fluctuate markedly,\' so formal scales are not recommended; instead a clinician should check in every few hours, provide reassurance, and explain symptoms. Benzodiazepines enhance GABA, the brain\'s main calming signal; long-term use blunts that system, so removing the drug leaves the brain over-excited — the source of the anxiety, tremor, and seizure risk that make a gradual taper essential.'**
  String get benzodiazepineReferenceDay7;

  /// No description provided for @benzodiazepineReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Benzodiazepine Withdrawal: Two Weeks\n\nSource: Ashton, \"Protracted withdrawal syndromes from benzodiazepines,\" Journal of Substance Abuse Treatment (1991), on PubMed\n\nStill in Acute Withdrawal\nAt two weeks, many people — especially those coming off longer-acting benzodiazepines — are still in the acute phase, when the imbalance between the brain\'s calming (GABA) and excitatory systems is most pronounced. Anxiety, insomnia, and perceptual disturbances are common.\n\nWhy Benzo Withdrawal Can Drag On\nProfessor Heather Ashton describes how the first withdrawal symptoms can blend into longer-lasting problems. Anxiety, insomnia, trouble thinking clearly, and sensory changes can continue for months because the brain\'s tolerance changes can be slow to reverse.\n\nSlowly Reversible Changes\nAshton characterises these as \'slowly reversible functional changes in the central nervous system.\' The central claim is recovery: the nervous system progressively reverses the functional adaptations created by long-term benzodiazepine exposure.\n\nGradual Taper Is Key\nThe evidence strongly supports a slow, supervised taper as the safest way to stop, letting the brain gradually re-adapt rather than facing a sudden loss of inhibitory signalling.'**
  String get benzodiazepineReferenceDay14;

  /// No description provided for @benzodiazepineReferenceDay60.
  ///
  /// In en, this message translates to:
  /// **'Benzodiazepines and Sleep Recovery by Two Months\n\nSource: Poyares et al., \"Chronic benzodiazepine usage and withdrawal in insomnia patients,\" Journal of Psychiatric Research (2004), on PubMed\n\nHow Benzos Change Sleep\nBenzodiazepines are widely prescribed for insomnia, but they alter sleep architecture. In this polysomnography study of patients who had taken benzodiazepines nightly for an average of nearly seven years, chronic use was associated with reduced slow-wave (deep) sleep and more light stage-2 sleep — so users lose restorative deep sleep even while feeling sedated.\n\nDeep Sleep Comes Back\nThe encouraging finding: the study measured sleep again 15 days after withdrawal and found recovery of slow-wave sleep and delta activity compared with the chronic-use nights, along with improved subjective sleep quality. Deep sleep, suppressed by the drug, began returning within about two weeks of stopping.\n\nWhat This Means at 60 Days\nIf deep sleep is recovering within two weeks, then by two months your brain has had ample time to keep rebuilding natural, restorative sleep. The severe rebound insomnia of early withdrawal has typically settled. The authors were honest that withdrawal worsened sleep at first — which is why a gradual taper matters — but by the end of their protocol, sleep quality had improved over chronic benzodiazepine use.\n\nOther Improvements by Two Months\nMany early physical withdrawal symptoms — muscle tension, tremor, palpitations, sweating — have typically eased or resolved by the two-month mark as the body re-regulates.'**
  String get benzodiazepineReferenceDay60;

  /// No description provided for @benzodiazepineReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months After Benzodiazepines: Physical Health Stabilises\n\nSource: Ashton, \"Protracted withdrawal syndromes from benzodiazepines,\" Journal of Substance Abuse Treatment (1991), on PubMed\n\nPhysical Stabilisation\nBy 90 days, the acute phase is well behind you. For people who completed a managed taper, most of the physical withdrawal symptoms — tremor, palpitations, headaches, and the worst sleep disruption — have eased substantially, and sleep is generally more stable.\n\nWhy Some Symptoms Persist\nAshton documents that some symptoms can last for months. At three months, lingering anxiety, brain fog, and sensory changes can still appear while the brain continues its slow, reversible readjustment.\n\nTwo Reasons Anxiety Lingers\n1. The brain\'s GABA system is still re-adapting toward normal sensitivity — a slow process\n2. Any underlying anxiety that led to benzo use is now felt without a drug-driven buffer\n\nA Good Time for Therapy\nWith the worst early symptoms behind you, three months is a strong point to use support such as talking therapy such as CBT (CBT) for anxiety and build coping skills while the nervous system keeps settling.'**
  String get benzodiazepineReferenceDay90;

  /// No description provided for @benzodiazepineReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Thinking and Memory at Six Months: Measurable Gains\n\nSource: Tata et al., \"Lack of cognitive recovery following withdrawal from long-term benzodiazepine use,\" Psychological Medicine (1994), on PubMed\n\nWhat the Study Did\nThis study tested 21 long-term benzodiazepine patients before withdrawal, just after withdrawal, and again at six months of abstinence, comparing them with matched controls. It is one of the most candid data points in the benzo recovery literature.\n\nWhat It Found\nBefore stopping, patients had problems with verbal learning, memory, movement speed, visual coordination, and visual reasoning. Right after stopping there was little change. By six months, several of those areas had measurably improved.\n\nWhat This Means\nBy six months, verbal learning, memory, movement speed, and visual coordination were measurably recovering. The improvement was already clear and had room to continue.\n\nThe Bigger Picture\nIf you feel foggy at six months, this research says: that is expected, and continued abstinence is the path forward. Longer-term studies show recovery continues well beyond this point — the brain keeps healing.'**
  String get benzodiazepineReferenceDay180;

  /// No description provided for @benzodiazepineReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year After Benzodiazepines: Thinking and Memory Keep Recovering\n\nSource: Barker et al., \"Persistence of cognitive effects after withdrawal from long-term benzodiazepine use: a meta-analysis,\" Archives of Clinical Neuropsychology (2004), on PubMed\n\nThe Strongest Evidence We Have\nResearchers combined studies that re-tested long-term benzodiazepine users after at least six months off the drug. The combined result shows clear recovery in thinking and memory after withdrawal.\n\nThe Good News\nThe combined studies found genuine, measurable improvement in several areas of thinking and memory after withdrawal. Around one year, the recovery is broad and obvious compared with active use.\n\nRecovery Continues\nThe combined studies found broad recovery in thinking and memory. By one year, you are well along a recovery trend that was already measurable at six months.\n\nWhat This Means at One Year\nExpect substantial recovery in thinking, memory, and clarity by a year — most people feel markedly sharper than during use. But if some areas still lag, that is consistent with the evidence, not a sign you have stalled. Recovery continues, and a year of abstinence is a major, worthwhile milestone on that path.'**
  String get benzodiazepineReferenceDay365;

  /// No description provided for @benzodiazepineReferenceDay540.
  ///
  /// In en, this message translates to:
  /// **'18 Months After Benzodiazepines: Slow but Real Recovery\n\nSource: Ashton, \"Protracted withdrawal syndromes from benzodiazepines,\" Journal of Substance Abuse Treatment (1991), on PubMed\n\nWhy Benzo Recovery Takes So Long\nBenzodiazepines act on GABA, the brain\'s main calming system. Long-term use changes how strongly that system responds, and those changes can take months to reverse. That is why benzo recovery is measured in months rather than weeks.\n\nWhere 18 Months Sits\nAshton describes longer-lasting withdrawal symptoms that can take months to ease. By 18 months, the worst is well behind most people and lingering anxiety, sensory changes, and brain fog have substantially settled.\n\nSlowly Reversible\nCrucially, Ashton frames the underlying changes as \'slowly reversible functional changes in the central nervous system.\' Slow, but reversible — the long timeline reflects the depth of the adaptation benzodiazepines caused, not permanent damage in most people.\n\nRecovery Signal\nAshton describes the underlying changes as slowly reversible. By 18 months, the brain\'s calming GABA system has had a long time to settle and the dominant direction is continued recovery toward normal.'**
  String get benzodiazepineReferenceDay540;

  /// No description provided for @benzodiazepineReferenceDay730.
  ///
  /// In en, this message translates to:
  /// **'Two Years After Benzodiazepines: Major, Lasting Progress\n\nSource: Barker et al., \"Persistence of cognitive effects after withdrawal from long-term benzodiazepine use: a meta-analysis,\" Archives of Clinical Neuropsychology (2004), on PubMed\n\nA Landmark in Recovery\nTwo years is a major milestone, especially after a long withdrawal. The early and lingering symptom phases are long past, and the gains from the first year have had another year to strengthen.\n\nWhat the Evidence Supports\nThe combined studies show recovery in many areas after withdrawal. By two years, most people report anxiety at or below their pre-benzo level, reliable sleep without medication, steadier emotions, and clearer thinking than during use.\n\nRecovery Signal\nThe combined studies establish recovery across many areas of thinking and memory. At two years, sustained recovery is the evidence-backed expectation.\n\nKeeping Perspective\nTwo years gives sleep, mood, memory, and clear thinking a long recovery window. The evidence shows substantial improvement across all four, with healing continuing from here.'**
  String get benzodiazepineReferenceDay730;

  /// No description provided for @benzodiazepineReferenceDay1095.
  ///
  /// In en, this message translates to:
  /// **'Three Years After Benzodiazepines: Long-Term Healing\n\nSource: Barker et al., \"Persistence of cognitive effects after withdrawal from long-term benzodiazepine use: a meta-analysis,\" Archives of Clinical Neuropsychology (2004), on PubMed\n\nThe Long View\nThree years sits at the far end of the benzo recovery timeline. For the great majority of people, even after severe long-lasting withdrawal, disruptive symptoms are well behind them and quality of life is transformed compared with active use.\n\nWhat the Meta-Analysis Found\nCombined studies of long-term users show recovery in many areas after withdrawal. Over years of abstinence, the dominant story is broad recovery in thinking, memory, and day-to-day function.\n\nRecovery Signal\nLong-term research shows recovery across many areas of thinking and memory. By three years, the early and lingering withdrawal phases are far behind you and those gains have had years to strengthen.\n\nA Message of Hope\nThe benzo recovery journey is one of the most demanding in medicine, and three years of sustained healing is a profound achievement. The evidence is clear: the brain heals substantially, most people recover their clarity, sleep, and emotional range, and improvement continues with time.'**
  String get benzodiazepineReferenceDay1095;

  /// No description provided for @cocaineReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Cocaine Withdrawal: The First 24 Hours\n\nSource: \"Withdrawal Syndromes,\" StatPearls (NCBI Bookshelf), U.S. National Library of Medicine\n\nCocaine and the Brain\nCocaine blocks the reuptake of dopamine (and other monoamines) in the brain\'s reward circuits, causing dopamine to accumulate and producing intense euphoria and energy. With regular use the brain adapts by down-regulating this system, so that without the drug, normal activities feel flat.\n\nThe Crash\nStatPearls describes stimulant withdrawal as beginning with a \"crash\" once use stops, characterised by marked depression, excessive sleep, hunger, low mood, and severe slowing of movement and thinking. In the first 24 hours this typically includes:\n• Extreme fatigue and increased need for sleep\n• Depressed mood and slower movement and thinking\n• Increased appetite (cocaine suppresses appetite)\n\nCravings, irritability, and anxiety are also very commonly reported during this window in the broader addiction literature, even though StatPearls doesn\'t itemise them as part of the crash specifically.\n\nUnlike Some Other Drugs\nStatPearls notes that stimulant withdrawal is treated with observation and supportive care; unlike alcohol or benzodiazepine withdrawal, it does not typically cause seizures or delirium. The principal danger is psychological — depression and, in heavy users, suicidal ideation can occur during the crash, so support and monitoring are advisable.\n\nNo Approved Medication\nThere are currently no medications approved to treat cocaine withdrawal; management is supportive, and non-drug approaches such as contingency management are the evidence-based treatments for the underlying use disorder.'**
  String get cocaineReferenceDay1;

  /// No description provided for @cocaineReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'Three Days Without Cocaine: Navigating Peak Challenge\n\nSource: \"Cocaine Toxicity,\" StatPearls (NCBI Bookshelf), U.S. National Library of Medicine\n\nHow Cocaine Affects the Body\nStatPearls documents that cocaine blocks the reuptake of dopamine, norepinephrine, and serotonin, prolonging sympathetic stimulation. This is what drives both its euphoria and its danger — it can affect nearly every organ system.\n\nDays 2–4: Peak Psychological Withdrawal\nBy day three the acute crash has given way to the most intense psychological withdrawal:\n• Low mood and depressed mood at their most intense\n• Loss of pleasure\n• Strong, cue-triggered cravings\n• Anxiety and restlessness\n• Disturbed sleep — excessive in some, insomnia in others\n\nThe Cardiovascular Danger Recedes\nStatPearls identifies cardiovascular toxicity as cocaine\'s most lethal effect: raised heart rate and blood pressure, increased myocardial oxygen demand, coronary vasospasm, and platelet activation — driving the risk of arrhythmia, infarction, and stroke, even in young users. Cocaine\'s own half-life is short, about one hour, and by day three the drug itself has fully cleared your system — though StatPearls notes its metabolites can still cause blood vessel constriction for hours after use, and one metabolite may linger for weeks, so some residual cardiovascular strain can outlast the drug itself.\n\nThe Road Ahead\nThe acute phase is intense, but it is the psychological symptoms — depression, cravings, loss of pleasure — that require the most support and that persist longest.'**
  String get cocaineReferenceDay3;

  /// No description provided for @cocaineReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week Without Cocaine: Physical Recovery Begins\n\nSource: \"Withdrawal Syndromes,\" StatPearls (NCBI Bookshelf), U.S. National Library of Medicine\n\nThe Acute Phase Is Ending\nStatPearls describes cocaine withdrawal as moving from the initial crash into a longer recovery phase. By the end of the first week, the worst symptoms are usually easing while the dopamine system continues rebuilding.\n\nPhysical Recovery Underway\nOnce cocaine\'s sympathetic stimulation stops, its cardiovascular, appetite, sleep, and airway effects begin reversing over the following days and weeks:\n• Heart rate and blood pressure moving back toward normal\n• Appetite gradually returning (cocaine strongly suppresses it)\n• Sleep patterns beginning to stabilise\n• Nasal passages starting to heal, if cocaine was snorted\n\nPsychological Symptoms Continue\nStatPearls notes that depression and loss of pleasure are characteristic of stimulant withdrawal and outlast the physical symptoms:\n• Mood remains low, though less severe than at peak\n• Cue-triggered cravings remain strong\n• Concentration and motivation are still impaired\n\nPost-Acute Phase\nWithdrawal then shifts into weeks or months of steadier improvement in mood, cravings, and clear thinking. Knowing that pattern makes the slower part of recovery easier to manage.'**
  String get cocaineReferenceDay7;

  /// No description provided for @cocaineReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks Without Cocaine: Finding Stability\n\nSource: \"Withdrawal Syndromes,\" StatPearls (NCBI Bookshelf), U.S. National Library of Medicine\n\nTwo Weeks In\nBy two weeks, the severe crash symptoms — deep depression, sleeping a lot, and slowed movement and thinking — have generally eased. Recovery is now focused on rebuilding brain and emotional health.\n\nMood and Emotional State\nAt two weeks, mood can still be below normal while the dopamine system recovers. Compared with the first week, the deep loss of pleasure is easing and genuine moments of wellbeing are returning.\n\nCravings and Triggers\nCue-triggered cravings are a significant challenge at this stage. The brain has formed strong associations between cocaine use and specific environments, people, emotions, and activities. Encountering any of these triggers can produce intense cravings even when general mood is improving. Avoiding high-risk environments and building new associations is important.\n\nSleep Improvement\nSleep is usually more stable and restorative by two weeks than it was during the acute withdrawal phase. Improved sleep has a significant positive effect on mood, clear thinking, and the ability to manage cravings.\n\nBuilding the Foundation\nBecause the evidence-based treatments for stimulant use disorder are behavioural — contingency management, therapy, and peer support — the two-week mark is an important time to engage with support structures that will underpin long-term recovery.'**
  String get cocaineReferenceDay14;

  /// No description provided for @cocaineReferenceDay60.
  ///
  /// In en, this message translates to:
  /// **'Two Months Without Cocaine: Mood and Reward Begin to Recover\n\nSource: \"Recovering from Cocaine: Insights from Clinical and Preclinical Investigations,\" Neuroscience & Biobehavioral Reviews (2013), on PubMed Central\n\nWhat the Brain Is Doing\nThis review synthesises human and animal studies of what happens to the brain when cocaine use stops. Chronic cocaine alters the dopamine system and reduces activity in the frontal cortex; recovery of these systems is the substrate for the mood and motivation improvements people notice in early abstinence.\n\nReward System Progress\nIn animal studies, cocaine-related changes in dopamine receptors and recycling proteins moved back toward healthy levels with sustained abstinence. As the reward system recovers, the deep loss of pleasure lifts and everyday rewards — food, connection, accomplishment — feel rewarding again.\n\nRecovery Signal\nBy two months, mood is improving and sleep is steadier while dopamine and frontal-cortex systems continue rebuilding. Primate studies show cocaine-related D1-receptor and transporter changes moving back toward control levels with sustained abstinence.'**
  String get cocaineReferenceDay60;

  /// No description provided for @cocaineReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months Without Cocaine: Dopamine Markers Rebound\n\nSource: \"Recovering from Cocaine: Insights from Clinical and Preclinical Investigations,\" Neuroscience & Biobehavioral Reviews (2013), on PubMed Central\n\nWhy 90 Days Is a Landmark\nThis review highlights the three-month point as biologically meaningful. In nonhuman primates, the dopamine D1 receptors and transporters that cocaine had elevated showed \"evidence of a return to control levels\" after roughly 90 days of abstinence — direct evidence that the reward system can readjust once the drug is gone.\n\nThe Front of the Brain\nThe authors highlight recovery in the front of the brain as one of the most important signs of extended abstinence. This area handles impulse control, decision-making, and self-control, and those abilities strengthen as it recovers.\n\nWhat 90 Days Shows\nAt 90 days, primate studies found D1, D2, and dopamine-transporter densities no longer significantly different from non-drug controls. Even after long exposure, substantial dopamine-system recovery is already visible by this point and continues with abstinence.'**
  String get cocaineReferenceDay90;

  /// No description provided for @cocaineReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months Without Cocaine: Clearer Thinking\n\nSource: \"Structural and Functional Brain Recovery in Individuals with Substance Use Disorders During Abstinence: A Review of Longitudinal Neuroimaging Studies,\" on PubMed Central\n\nRecovery You Can Image\nThis review pools longitudinal brain-imaging studies that scan the same people repeatedly as their abstinence lengthens. For cocaine, it reports that functional activity recovers measurably with sustained abstinence.\n\nBrain Imaging Evidence\nTwo functional-MRI studies tracked cocaine users over time and both found improved activation in the midbrain and thalamus with longer abstinence. In one, after about six months of abstinence the brain\'s activation pattern was comparable to that of non-addicted healthy controls. Across substances, the review notes that nuclear-imaging results point to a dopaminergic recovery with abstinence.\n\nWhat This Means at Six Months\nThese functional gains track with the real-world improvements people report by this stage:\n• Better attention and working memory\n• Sharper decision-making and impulse control\n• Steadier mood and emotional regulation\n\nRecovery Signal\nAt about six months, one longitudinal fMRI cohort showed an activation pattern comparable to non-addicted healthy controls, while midbrain and deep-brain activation improved as abstinence lengthened. That is directly imaged functional brain recovery.'**
  String get cocaineReferenceDay180;

  /// No description provided for @cocaineReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year Without Cocaine: Cardiovascular Strain Removed\n\nSource: \"Cocaine Toxicity,\" StatPearls (NCBI Bookshelf), U.S. National Library of Medicine\n\nWhy the Heart Is Central\nStatPearls identifies cardiovascular toxicity as cocaine\'s most lethal effect. Each use raises heart rate, blood pressure, and myocardial oxygen demand while causing coronary vasospasm and promoting clot formation — a combination that drives heart attack, arrhythmia, and stroke even in young people.\n\nWhat a Year of Abstinence Removes\nEvery day without cocaine is a day free of these acute insults. Over a year, the repeated surges in blood pressure and heart rate are gone, the risk of cocaine-induced coronary spasm and acute infarction is removed, and the heart is no longer being driven into oxygen mismatch.\n\nRecovery Signal\nStopping cocaine halts the repeated coronary vasospasm, tachycardia, hypertension, clot promotion, and oxygen mismatch that drive acute heart injury. Existing fibrosis or myocarditis remains a medical issue, but the repeated cocaine-triggered insult is gone.\n\nBrain Recovery Too\nBy one year, the reward and self-control systems have had extended time to recover, supporting better impulse control, steadier mood, and a stronger response to everyday rewards.'**
  String get cocaineReferenceDay365;

  /// No description provided for @cocaineReferenceDay730.
  ///
  /// In en, this message translates to:
  /// **'Two Years Without Cocaine: Sustained Recovery\n\nSource: \"Recovering from Cocaine: Insights from Clinical and Preclinical Investigations,\" Neuroscience & Biobehavioral Reviews (2013), on PubMed Central\n\nThe Long View\nThis review draws together what human and animal studies show about extended cocaine abstinence. Its central conclusion is that preservation and recovery of frontal-cortex function is the most important marker of long-term abstinence — long-term abstainers (10+ months) showed higher frontal-cortex activity than shorter-term abstainers.\n\nWhat Continues to Heal\n• Dopamine markers altered by cocaine continue moving toward normal with sustained abstinence\n• Reduced grey- and white-matter integrity seen in active and early-abstinent users may reverse over longer abstinence, possibly through continued myelin maturation\n• Frontal-control circuitry — impulse control, judgement, emotional regulation — strengthens\n\nRecovery Signal\nThe authors raise a genuine scientific caution: some of the difference in long-term abstainers may reflect a \"survivor effect\" — people who began with greater brain integrity may find it easier to stay abstinent — rather than recovery alone. What is clear is that two years cocaine-free supports a brain functioning far closer to a non-user\'s, and a life that is not merely abstinent but substantially rebuilt.'**
  String get cocaineReferenceDay730;

  /// No description provided for @ghbReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'GHB Withdrawal: The First Hours\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\n⚠ This Is a Medical Emergency\nGHB withdrawal ranks among the most dangerous substance withdrawals, rivalling severe alcohol and benzodiazepine withdrawal. Untreated, it can progress to delirium in over half of cases, with dangerous swings in heart rate and blood pressure and seizures. Anyone dependent on GHB, GBL, or 1,4-butanediol should seek supervised inpatient detox rather than stopping alone.\n\nWhy It Starts So Fast\nGHB\'s half-life is only 30–60 minutes, and dependent users typically need to redose every 2–3 hours just to avoid withdrawal — far faster than alcohol or benzodiazepines. That rapid pharmacokinetics is why symptoms can appear much sooner than with other sedative-hypnotic withdrawal.\n\nEarly Symptoms\nAnxiety, insomnia, tremor, sweating, fast heart rate, and rising blood pressure.'**
  String get ghbReferenceDay1;

  /// No description provided for @ghbReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'GHB Withdrawal: The Hardest Days\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nThe Roughest Stretch\nThis study found several core withdrawal symptoms — muscle aches, muscle twitches, a tensed and stressed feeling, a fast heart rate, and abdominal cramps — were at their worst in the first three days, with more than a 70% drop in severity for many symptoms by day four. This early window is generally the highest-risk period, when untreated withdrawal is most likely to escalate toward delirium, seizures, or dangerous swings in heart rate and blood pressure.\n\nSevere Features\n• Severe agitation and anxiety\n• Auditory and visual hallucinations, paranoia\n• Tremor, sweating, racing heart, and high blood pressure\n• Risk of seizures\n\nManagement\nThe study describes benzodiazepine tapering and pharmaceutical GHB tapering as the two commonly used detoxification methods, noting some evidence that a GHB taper may control symptoms more effectively than benzodiazepines alone. Either approach requires close monitoring — this is not safe to manage at home.'**
  String get ghbReferenceDay3;

  /// No description provided for @ghbReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nMost Symptoms Are Fading\nSeveral core withdrawal symptoms dropped by more than 70% in severity or prevalence within the first four days. Under supervised tapering, the tapering phase itself lasted 11 days on average, followed by a recovery phase of about six days — so by one week many people are well into that improvement, even if the process isn\'t fully finished.\n\nWhat Can Linger\n• Sweating, tremor, and shaky hands\n• Sleeping a lot, or conversely insomnia and restlessness\n• Cravings\n\nThe study found these particular symptoms changed comparatively little even out to 11 days, so persistence this week isn\'t unusual. Continued medical oversight remains important until the syndrome has clearly settled.'**
  String get ghbReferenceDay7;

  /// No description provided for @ghbReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nPast the Acute Syndrome\nBy two weeks, the acute physical syndrome described in this study — whose tapering and recovery phases together average around 17 days under supervised treatment — has generally resolved or is very close to it. Heart rate, blood pressure, and most physical symptoms should be stabilising.\n\nWhat Lingers\nThe study specifically flags craving and insomnia as still present at discharge for some patients, noting these may contribute to relapse risk. Support and structure matter now, even as the dangerous early phase is behind you.'**
  String get ghbReferenceDay14;

  /// No description provided for @ghbReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nWhere One Month Sits\nThe acute, dangerous phase described in this study is long past by one month. By one month, the acute dangerous phase — concentrated in the first days and followed by a supervised taper-and-recovery period averaging roughly two and a half weeks — is long past. Craving and insomnia are the key residual relapse risks identified at discharge.\n\nWhy Support Still Helps\nIf cravings, low mood, or sleep problems are still present at one month, that lines up with what the study\'s authors flagged as relapse risk factors — which is exactly why continued support and structure matter.'**
  String get ghbReferenceDay30;

  /// No description provided for @ghbReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nThree Months of Recovery\nBy three months, the acute GHB withdrawal syndrome is long resolved. The residual risks identified at discharge are craving and insomnia, so three months of abstinence gives sleep, autonomic stability, and relapse-prevention routines substantial time to consolidate.\n\nWhat People Commonly Report\n• Calmer usual mood\n• More reliable sleep\n• Clearer thinking and fewer cravings\n\nIf anxiety, insomnia, or low mood are still prominent at three months, that\'s worth discussing with a clinician rather than assuming it will resolve on its own.'**
  String get ghbReferenceDay90;

  /// No description provided for @ghbReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months Off GHB\n\nSource: \"Characterization of the GHB Withdrawal Syndrome,\" on PubMed Central\n\nHalf a Year On\nBy six months, the acute GHB withdrawal syndrome is long resolved and recovery has shifted completely from detoxification to stable sleep, craving control, and relapse prevention. The dangerous autonomic and delirium-prone phase belongs to the first days and weeks, not this stage.\n\nThe Bigger Picture\nGetting through GHB withdrawal safely and staying off for half a year is a major achievement given how dangerous the early phase is, and how real the relapse risk — driven partly by lingering craving and insomnia — can be. The routines and support that got you here are worth keeping.'**
  String get ghbReferenceDay180;

  /// No description provided for @inhalantsReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Stopping Inhalants: Day One\n\nSource: Radparvar, \"The Clinical Assessment and Treatment of Inhalant Abuse,\" The Permanente Journal (2023), on PubMed Central\n\nWhy Withdrawal Happens\nChronic inhalant use causes neuroadaptation — the nervous system comes to expect the substance. Many inhalants affect the same brain circuits as alcohol, so stopping leaves the brain temporarily imbalanced. The chemicals clear the blood fast but are stored in body fat, which can make withdrawal timing unpredictable.\n\nEarly Symptoms\nThis review describes inhalant withdrawal as resembling alcohol or benzodiazepine withdrawal, with reported symptoms including:\n• Nausea, vomiting, and sweating\n• Tremor and rapid heart rate\n• Insomnia and sleep disturbance\n• Anxiety and irritability\n\nA Safety Note\nIn more severe cases, the review also lists hallucinations, delusions, and seizures among reported symptoms, though it does not lay out a precise day-by-day schedule — treat these as symptoms that can occur, not a fixed timeline. Medical supervision is wise during detox, especially for heavy, long-term users.'**
  String get inhalantsReferenceDay1;

  /// No description provided for @inhalantsReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week Off Inhalants\n\nSource: Radparvar, \"The Clinical Assessment and Treatment of Inhalant Abuse,\" The Permanente Journal (2023), on PubMed Central\n\nThe Acute Window\nInhalant withdrawal is described in the clinical literature as resembling alcohol or benzodiazepine withdrawal, but it is generally understood to be shorter-lived. By the end of the first week the acute physical symptoms — nausea, tremor, sweating, insomnia — are usually resolving for most people.\n\nWhat Remains\n• Fatigue and brain fog\n• Low or unstable mood\n• Cravings\n\nNote on Early Abstinence\nBrain fog at this stage does not mean lasting damage — the brain is still readjusting. Research on how thinking and memory specifically recover over the following weeks and months is covered in later milestones.'**
  String get inhalantsReferenceDay7;

  /// No description provided for @inhalantsReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks Off Inhalants\n\nSource: Radparvar, \"The Clinical Assessment and Treatment of Inhalant Abuse,\" The Permanente Journal (2023), on PubMed Central\n\nThrough the Acute Phase\nClinical reviews describe inhalant withdrawal as similar to alcohol or benzodiazepine withdrawal but shorter. By two weeks, nausea, tremor, insomnia, and anxiety have usually settled.\n\nThe Road Ahead\nAttention, memory, movement, and coordination recover more gradually over the following months. Continued abstinence gives all of these systems time to improve. Good nutrition (inhalant use can deplete vitamin B12) and abstinence set the stage for it.'**
  String get inhalantsReferenceDay14;

  /// No description provided for @inhalantsReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month Off Inhalants\n\nSource: Dingwall et al., \"Cognitive recovery during and after treatment for volatile solvent abuse,\" Drug and Alcohol Dependence (2011), on PubMed\n\nWhere One Month Sits\nThe early withdrawal period is well behind you. In this study, some learning skills improved within six weeks, while visual coordination, memory, planning, and decision-making improved more gradually over the following months.\n\nWhat Can Improve\n• Attention and some learning tasks\n• Mood and sleep, as the body stabilises\n• Motor speed, gradually\n\nRecovery Signal\nThe study\'s conclusion is clear: memory, planning, and decision-making improve gradually over months to years of abstinence. Continued abstinence is the strongest driver of that recovery.'**
  String get inhalantsReferenceDay30;

  /// No description provided for @inhalantsReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months Off Inhalants\n\nSource: Dingwall et al., \"Cognitive recovery during and after treatment for volatile solvent abuse,\" Drug and Alcohol Dependence (2011), on PubMed\n\nAn Uneven, Longer Process\nThis study followed people beyond an eight-week treatment program and checked some of them again around a year later. Some learning skills improved within six weeks, while visual coordination, memory, planning, and decision-making kept improving over a longer period.\n\nStaying the Course\nThe study shows that the slower skills improve gradually over months to years. At three months, continued abstinence is the strongest lever for adding more recovery month after month.'**
  String get inhalantsReferenceDay90;

  /// No description provided for @inhalantsReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year Off Inhalants\n\nSource: \"A prospective study of neurocognitive changes 15 years after chronic inhalant abuse,\" on PubMed\n\nReal, Measurable Recovery\nA long-term study found substantial recovery from chronic inhalant-related brain and thinking problems after two years of abstinence. At one year, you are well along that recovery path.\n\nWhat It Means\nMemory, attention, and motor function continue to improve. Long-term abstinence produces genuine brain recovery: by two years, most brain, memory, and thinking scores had returned to normal in chronic users who did not have brain damage from lead.'**
  String get inhalantsReferenceDay365;

  /// No description provided for @inhalantsReferenceDay730.
  ///
  /// In en, this message translates to:
  /// **'Two Years Off Inhalants\n\nSource: \"A prospective study of neurocognitive changes 15 years after chronic inhalant abuse,\" on PubMed\n\nThe Two-Year Mark\nThis is the key milestone in the research: deficits reflecting brain damage from long-term solvent use showed substantial recovery after two years of abstinence. The authors concluded that, in the absence of brain damage from leaded petrol, long-term abstinence may allow recovery of normal brain function.\n\nRecovery Signal\nThe major exception is damage from leaded petrol abuse, which can cause persistent deficits. Otherwise, two years of abstinence represents the brain\'s best documented opportunity to heal — alongside a life rebuilt around it.'**
  String get inhalantsReferenceDay730;

  /// No description provided for @ketamineReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Stopping Ketamine: Day One\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review of the Urologic Effects of This Psychoactive Drug,\" on PubMed Central\n\nWithdrawal Is Mainly Psychological\nUnlike opioids or alcohol, ketamine rarely produces severe physical withdrawal. Discontinuation is generally safe; people more often struggle with cravings and psychological dependence than physical illness.\n\nWhat You May Feel\n• Mood swings and low mood\n• Cravings\n• Occasional sweating or palpitations\n\nThe Key Step\nFor anyone with bladder symptoms, immediate and complete cessation is the obligatory starting point for recovery — so day one is the most important decision of all.'**
  String get ketamineReferenceDay1;

  /// No description provided for @ketamineReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nThe Psychological Phase\nThe main challenge in early ketamine cessation is psychological: cravings, altered or low mood, and some brain fog. Physical withdrawal, when present, is usually mild.\n\nBrain fog is common at this stage — concentration feels effortful, reaction time is slower, and short-term memory may feel unreliable. These effects on thinking and memory improve with abstinence: a longitudinal study of 114 ketamine users found significant gains in verbal memory, visual memory, processing speed, and planning, focus, and decision-making after 12 weeks without ketamine.\n\nBladder Symptoms\nIf you have ketamine-induced cystitis (urinary urgency, frequency, pain, or blood in urine), stopping now gives the bladder its best chance to heal. Pain can tempt people back to ketamine to self-medicate — a cycle worth breaking with proper pain support instead.'**
  String get ketamineReferenceDay7;

  /// No description provided for @ketamineReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nClearer Thinking\nWith the drug fully cleared, the mental fog and disconnected thinking associated with regular ketamine use begin to lift. Memory and concentration improve and mood steadies.\n\nBladder Recovery Beginning\nFor early-stage cystitis, the review emphasizes that simply stopping ketamine is the single most important step toward reversing symptoms, and that earlier cessation gives the best odds of recovery before damage becomes permanent. Two weeks of abstinence is the start of that process.'**
  String get ketamineReferenceDay14;

  /// No description provided for @ketamineReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month Off Ketamine\n\nSource: \"Prevalence and Natural History of Urinary Symptoms Among Recreational Ketamine Users,\" Winstock et al., BJU International (2012)\n\nBladder Recovery\nThe single most important treatment for ketamine-induced cystitis is stopping ketamine. This study of recreational ketamine users found that 51% of those with urinary symptoms reported improvement after stopping use, while under 4% got worse. Earlier you stop, the better the outcome.\n\nMind and Mood\nCognition and mood continue to clear at one month. Psychological and social support meaningfully improves the odds of staying stopped — cessation works best when it is supported.'**
  String get ketamineReferenceDay30;

  /// No description provided for @ketamineReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nContinued Recovery\nBladder recovery after ketamine is often gradual; the review describes symptom severity improving after cessation, though it can be prolonged and variable. Three months gives the urinary tract sustained time to heal in cases that are going to respond.\n\nMind\nClear thinking and mood are markedly clearer than in early abstinence, and cravings are less frequent. Persistent or severe bladder symptoms should be assessed by a urologist.'**
  String get ketamineReferenceDay90;

  /// No description provided for @ketamineReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nHalf a Year On\nWith sustained abstinence, bladder symptoms continue to improve in cases that respond to cessation, and thinking and memory and mood are stable. The compulsion to use has weakened considerably.\n\nRecovery Signal\nRecovery of established bladder damage can be incomplete, which is why early cessation matters so much. Whatever stage you stopped at, staying off gives the bladder its best possible outcome.'**
  String get ketamineReferenceDay180;

  /// No description provided for @ketamineReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year Off Ketamine\n\nSource: \"Ketamine-Induced Cystitis: A Comprehensive Review,\" on PubMed Central\n\nA Year On\nTwelve months of abstinence gives the bladder, in early-caught cases, the fullest chance to recover, and leaves thinking and memory and mood stable and clear. The psychological dependence that made stopping hard has largely faded.\n\nThe Bigger Picture\nA year free is a profound change — in physical health, clarity, and self-direction. Keeping the support that got you here protects it.'**
  String get ketamineReferenceDay365;

  /// No description provided for @kratomReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Kratom Withdrawal: The First Day\n\nSource: Swogger et al. (2022), \"Understanding Kratom Use: A Guide for Healthcare Providers,\" Frontiers in Pharmacology\n\nWhy Withdrawal Happens\nKratom\'s active compounds act on the same opioid receptors as classical opioids. With regular use the body adapts, so stopping produces an opioid-like withdrawal. This clinical guide describes dependence and withdrawal as recognised risks of regular kratom use.\n\nWhat the Evidence Shows About Onset\nAnimal studies cited in the guide show somatic withdrawal signs emerging within about 12 hours, with anxiety-like effects evident by 24 hours; precise human onset timing is less established, but early symptoms commonly reported include:\n• Restlessness, anxiety, and irritability\n• Muscle aches and runny nose\n• Sweating and watery eyes\n• Cravings\n\nA Note on Severity\nThe guide notes that longer duration of use and higher doses are linked to more severe, longer-lasting withdrawal. Supervised medical support is worth seeking, particularly if kratom was used at high doses or alongside opioids.'**
  String get kratomReferenceDay1;

  /// No description provided for @kratomReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'Kratom Withdrawal: The Hardest Days\n\nSource: Singh et al. (2014), Drug and Alcohol Dependence — survey of 293 regular kratom users in Malaysia\n\nWhat the Evidence Shows\nRather than a single defined \'peak day,\' this survey found withdrawal severity tracks how much and how long someone used: people drinking three or more glasses of kratom daily had significantly higher odds of severe dependence and more difficult withdrawal. For most people, the first few days after stopping are the hardest.\n\nSymptoms Commonly Reported\n• Muscle and joint aches, restless legs\n• Insomnia despite exhaustion\n• Nausea, stomach cramps, and diarrhoea\n• Anxiety, low mood, and irritability\n• Strong cravings\n\nGetting Through It\nHydration, rest, and symptomatic support help. If withdrawal has felt severe so far, that lines up with heavier or longer use rather than something being unusually wrong — and it tends to ease from here.'**
  String get kratomReferenceDay3;

  /// No description provided for @kratomReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week Off Kratom\n\nSource: Swogger et al. (2022), \"Understanding Kratom Use: A Guide for Healthcare Providers,\" Frontiers in Pharmacology\n\nPast the Acute Phase\nHuman self-report data cited in this guide indicates withdrawal symptoms resolve within about one to three days for most people who stop. By one week, the acute physical symptoms — muscle aches, sweating, nausea — have typically settled for the majority. What can remain is more psychological: fatigue, disrupted sleep, and low mood as the opioid receptors kratom was stimulating adjust back to the body\'s own signals.\n\nA Real Risk\nThe guide also notes that a small number of people find kratom very difficult to quit, with more severe and longer-lasting withdrawal reported among heavier, longer-term users. This week is a common point for relapse, and tolerance drops quickly — returning to a previous dose, particularly if opioids are involved, is now genuinely dangerous.'**
  String get kratomReferenceDay7;

  /// No description provided for @kratomReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nBeyond the Studied Window\nControlled human data on kratom withdrawal timing generally covers only the first few days, so there isn\'t well-established research pinning down a specific \'two week\' milestone. What is documented is the broader pattern: kratom acts on the same opioid receptors as classical opioids, and as regular use stops those receptors gradually restore their sensitivity to the body\'s own signals.\n\nWhat People Commonly Report\n• Appetite and energy often improve\n• Sleep tends to become more reliable\n• Mood is typically steadier, though still variable\n\nCravings are still triggered by stress and familiar cues, so having a plan for them remains useful.'**
  String get kratomReferenceDay14;

  /// No description provided for @kratomReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nA Reward System Recovering\nNIDA describes kratom as acting on the brain\'s opioid receptors, with dependence and withdrawal as recognised risks of regular use. There is no specific study pinning a \'one month\' recovery milestone, but the general pattern for opioid-receptor-based dependence is that the brain\'s response to everyday pleasures gradually normalises with sustained abstinence.\n\nWhat a Month Off Can Build\nA month without kratom is a month of consistent sleep, meals, and routine replacing the time and effort use required. Cravings tend to arrive less often and feel more manageable, though high-stress moments remain the most vulnerable ones.'**
  String get kratomReferenceDay30;

  /// No description provided for @kratomReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nA Steadier Day-to-Day State\nKratom acts on opioid receptors, so three months without it gives the brain\'s reward and stress systems sustained time to settle. Many people report clearer thinking and steadier motivation the further they get from active use.\n\nWhy It Matters\nThe less recent the use, the more the day-to-day pull of kratom tends to fade — making this milestone a solid foundation for lasting recovery.'**
  String get kratomReferenceDay90;

  /// No description provided for @kratomReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year Off Kratom\n\nSource: National Institute on Drug Abuse (NIDA), \"Kratom\"\n\nWell Past Acute Withdrawal\nNIDA doesn\'t publish a specific one-year kratom recovery timeline, but a year of sustained abstinence is well beyond the acute and early psychological withdrawal window documented in the kratom research. For most people who reach this point, cravings are infrequent and far easier to manage.\n\nThe Bigger Picture\nA year of abstinence represents a substantial change in health, finances, and self-direction. Staying connected to support helps keep that progress secure.'**
  String get kratomReferenceDay365;

  /// No description provided for @maoiReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'MAOI Discontinuation: The Highest-Risk Phase\n\nSource: Dilsaver (1988), research on MAOI withdrawal reactions\n\nCritical Safety Warning\nMAOIs carry the most serious discontinuation risks of any antidepressant class. Abrupt cessation — particularly of phenelzine and tranylcypromine — can produce severe reactions including:\n• Severe anxiety and agitation\n• Pressured speech and restlessness\n• Sleeplessness or drowsiness\n• Hallucinations\n• Delirium and paranoid psychosis\n\nIf you are experiencing these symptoms, seek immediate medical attention.\n\nHow MAOIs Work\nMAOIs work by irreversibly binding to and disabling monoamine oxidase enzymes (MAO-A and MAO-B). These enzymes normally break down serotonin, norepinephrine, dopamine, and tyramine in the brain and gut. Because the enzyme itself is destroyed rather than just blocked, recovery depends on the body producing fresh enzyme rather than on how quickly the drug clears the bloodstream.'**
  String get maoiReferenceDay3;

  /// No description provided for @maoiReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week After MAOIs: MAO Enzyme Synthesis Underway\n\nSource: \"Monoamine Oxidase Inhibitors (MAOIs)\" (StatPearls, NCBI Bookshelf)\n\nThe Enzyme Recovery Process\nUnlike SSRIs, SNRIs, and TCAs — which inhibit brain chemical reuptake reversibly — irreversible MAOIs (phenelzine, tranylcypromine) permanently destroy monoamine oxidase enzyme molecules. Clinical washout is therefore governed by how quickly the body can synthesise entirely new enzyme — about 2 weeks — rather than by how fast the drug itself clears the bloodstream.\n\nWhat\'s Happening at One Week\n• MAO-A and MAO-B enzyme synthesis is well underway, roughly midway through the ~2-week resynthesis window\n• The acute risk phase described on day 3 is passing, though close medical supervision remains important\n\nDietary Cautions\nMAOI treatment requires a low-tyramine diet, since these enzymes normally break down tyramine and prevent it from triggering a hypertensive crisis. Guidance is to keep observing dietary restrictions through this resynthesis window — your prescriber will advise when it\'s safe to relax them.'**
  String get maoiReferenceDay7;

  /// No description provided for @maoiReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks After MAOIs: MAO Enzyme Activity Substantially Recovered\n\nSource: Fritz et al. (1983), Biological Psychiatry\n\nThe Critical Two-Week Mark\nTwo weeks is the standard clinical washout timeframe for MAO enzyme recovery after discontinuation of an irreversible MAOI like tranylcypromine or phenelzine. Studying tranylcypromine, this research found that platelet MAO-B catalytic activity — sharply reduced within a day of dosing — rebounds to normal within about two weeks, as the body replaces drug-affected platelets with fresh ones carrying active enzyme, even though total MAO-B protein levels never changed.\n\nMAO Enzyme Recovery\n• Platelet MAO-B activity has substantially recovered by this point\n• Brain MAO-A and MAO-B, which follow a broadly similar resynthesis timeline, are also largely restored\n• Normal tyramine metabolism is re-establishing — the MAOI dietary restrictions can typically be relaxed in consultation with your prescriber\n\nBrain-Chemical Balance Returns\nWith MAO enzyme activity recovering, the brain chemical systems that MAOIs affect are beginning to come under natural regulation:\n• Serotonin, norepinephrine, and dopamine are no longer being elevated by MAO inhibition\n• The supersensitivity of monoamine receptors (caused by chronic MAOI-elevated brain-chemical levels) is beginning to resolve\n• Natural mood and energy regulation is returning'**
  String get maoiReferenceDay14;

  /// No description provided for @maoiReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month After MAOIs: Brain-Chemical Systems Rebalancing\n\nSource: \"Monoamine Oxidase Inhibitors (MAOIs)\" (StatPearls, NCBI Bookshelf)\n\nThe One-Month Assessment\nOne month after MAOI discontinuation is well past the roughly 2-week MAO enzyme resynthesis window described in this source, so by this point MAO enzyme activity has fully recovered and brain chemical systems are under entirely natural regulation.\n\nWhat Has Recovered by One Month\n• Complete MAO enzyme activity: both MAO-A and MAO-B are fully operational\n• Dietary restrictions resolved: normal diet without tyramine restrictions\n• Natural serotonin degradation: the brain\'s normal serotonin turnover cycle restored\n• Natural catecholamine regulation: dopamine and norepinephrine levels regulated by natural MAO activity\n\nDrug Interaction Cautions\nMAOIs are associated with life-threatening interactions with serotonin drugs. These interaction risks have resolved at the one-month mark. However, always inform your prescriber and pharmacist of previous MAOI use when any new medication is prescribed.'**
  String get maoiReferenceDay30;

  /// No description provided for @maoiReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months After MAOIs: Well Past Withdrawal\n\nSource: \"Antidepressant Withdrawal Syndrome,\" Therapeutics Letter 112 (2018), Therapeutics Initiative, on the NCBI Bookshelf\n\nWithdrawal Across the Antidepressant Classes\nThis evidence review treats antidepressant withdrawal as a real phenomenon of tolerance and dependence — placing antidepressants \'alongside opiates and benzodiazepines.\' Its detailed evidence centres on SSRIs and SNRIs, but withdrawal reactions are recognised across antidepressant classes, including after stopping an MAOI. Symptoms \'usually appear within a few days of stopping\' and \'most… resolve within 2 weeks,\' though some last longer.\n\nWhere Three Months Sits\nBy three months, the acute withdrawal phase is well behind the great majority of people, and the body has long readjusted to regulating monoamines without MAO inhibition.\n\nRecovery Signal on \'Receptor Resensitisation\'\nConfident claims that serotonin, norepinephrine, and dopamine receptors have all \'resensitised by three months\' go beyond what the evidence pins down. What is dependable: the withdrawal phase has typically resolved by now, and for most people mood, energy, and emotional range are stabilising on natural, self-regulated brain signalling.\n\nWithdrawal Versus Relapse\nThe Letter stresses telling withdrawal apart from a genuine return of the underlying condition. If symptoms persist at three months, review them with your prescriber rather than assuming they are only withdrawal.'**
  String get maoiReferenceDay90;

  /// No description provided for @maoiReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months After MAOIs: Long-Term Recovery\n\nSource: Zwiebel & Viguera (2022), Cleveland Clinic Journal of Medicine\n\nThe Six-Month Assessment\nThis review explains that antidepressants work partly by causing monoamine receptors to downregulate over time, and that this downregulation requires weeks to months to reverse once the medication stops — a slower process than the roughly two-week MAO enzyme resynthesis itself.\n\nWhere Six Months Sits\nSix months sits comfortably past that weeks-to-months receptor readjustment window for the great majority of people, alongside enzyme activity that fully normalised within the first month. Recovery Signal: precise timelines for full serotonin, norepinephrine, and dopamine receptor resensitisation are not established with day-by-day certainty in the literature — what is dependable is that by six months, most people are functioning on natural, self-regulated brain signalling.\n\nA Note on Phenethylamine\nMAOIs also inhibit the degradation of phenethylamine (PEA), a trace amine linked to mood and energy. Its metabolism is expected to normalise alongside general MAO enzyme recovery, though — as with receptor resensitisation — a precise PEA-specific timeline isn\'t established in the research literature.'**
  String get maoiReferenceDay180;

  /// No description provided for @maoiReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year After MAOIs: Recovery Achieved\n\nSource: \"Monoamine Oxidase Inhibitors (MAOIs)\" (StatPearls, NCBI Bookshelf)\n\nOne Year: A Remarkable Achievement\nCompleting one year after MAOI discontinuation is a genuinely significant milestone. MAOIs are among the most drug-drivenly demanding antidepressants to come off, with an irreversible mechanism, a strict low-tyramine diet, and drug-interaction precautions that are unlike any other antidepressant class.\n\nWhat This Year Represents\n• A full year of natural, self-regulated monoamine oxidase activity, built on enzyme resynthesis that completed within the first month\n• Demonstrated capacity to maintain wellbeing without drug-driven MAO inhibition\n• A track record long enough to be confident the acute discontinuation risks of day 3 are firmly behind you\n\nA Note on MAOIs\nMAOIs remain uniquely effective for certain treatment-resistant conditions and atypical depression. Successful discontinuation does not diminish their value as medications — it demonstrates the brain\'s capacity for recovery and the patient\'s ability to navigate an exceptionally demanding medical process. One lasting precaution: continue to tell any new prescriber or anaesthetist about past MAOI use, since some drug-interaction risks are worth flagging indefinitely.'**
  String get maoiReferenceDay365;

  /// No description provided for @marijuanaReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Marijuana Withdrawal: Day One\n\nSource: \"The cannabis withdrawal syndrome: current insights,\" Substance Abuse and Rehabilitation (2017), on PubMed Central\n\nCannabis Withdrawal Is Real\nThis peer-reviewed review establishes that Cannabis Withdrawal Syndrome (CWS) is a well-validated clinical condition, occurring in roughly 90% of people diagnosed with cannabis dependence after they stop. Its average peak severity is comparable to that of a tobacco withdrawal syndrome.\n\nWhy Withdrawal Happens\nTHC acts on the endocannabinoid system — CB1 receptors involved in mood, appetite, sleep, memory, and stress. With chronic use the brain downregulates this system; when cannabis stops, it is temporarily underactive. The review notes CB1 receptors return to normal functioning within about four weeks of abstinence.\n\nOnset on Day One\nThe review documents that physical symptoms tend to appear first — within 1–3 days of the last use — while psychological symptoms emerge over 2–10 days. Early symptoms include:\n• Irritability, anxiety, and restlessness\n• Difficulty sleeping\n• Decreased appetite\n• Physical tension, sweating, or chills\n• Depressed mood\n\nSeverity\nCWS is not medically dangerous and symptoms are typically mild to moderate, but the review notes they can be distressing enough to drive relapse — which is why understanding the timeline matters.'**
  String get marijuanaReferenceDay1;

  /// No description provided for @marijuanaReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'Cannabis Withdrawal Timeline: The Early Days\n\nSource: \"Time-course of the DSM-5 cannabis withdrawal symptoms in poly-substance abusers,\" BMC Psychiatry (2013), on PubMed Central\n\nA Measured Time-Course\nThis study tracked DSM-5 cannabis withdrawal symptoms in 90 patients over four weeks, producing one of the clearest pictures of how symptoms rise and fall. Overall severity followed a curve: rising, then declining over the following weeks.\n\nWhat Peaks Early\nSeveral of the most physically disruptive symptoms peak within the first few days of stopping:\n• Insomnia — peaks around day 1\n• Nervousness — peaks around day 4\n• Depressed mood and physical symptoms — peak around day 5\n• Restlessness — peaks around day 6\n\nWhat Peaks Later\nThe study found that some symptoms emerge and peak later than the first week:\n• Vivid, unpleasant dreams — peak around day 11\n• Irritability and anger — peak around day 14\n\nSleep and Cannabis\nThe delayed, vivid dreams reflect REM rebound: cannabis suppresses REM sleep during use, and the brain overcompensates once it stops. The authors argue this symptom is common enough to belong among formal withdrawal criteria.\n\nThe Takeaway for Day Three\nBy day three you are in the thick of the early physical peak — insomnia, nervousness, and restlessness are near their worst. The consistent, predictable curve is itself reassuring: these symptoms have a known course and they decline from here.'**
  String get marijuanaReferenceDay3;

  /// No description provided for @marijuanaReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week Without Cannabis: Through the Worst\n\nSource: \"The cannabis withdrawal syndrome: current insights,\" Substance Abuse and Rehabilitation (2017), on PubMed Central\n\nWhere One Week Sits in the Syndrome\nThis review documents that the cannabis withdrawal syndrome usually lasts up to about three weeks, with the most distressing period falling between the first and third week. At one week, the earliest physical symptoms — insomnia, appetite loss, restlessness — have typically passed their peak and are easing.\n\nWhat Is Still Settling\nThe review distinguishes early-peaking physical symptoms from later-peaking psychological ones. At one week:\n• Physical discomfort and appetite are largely improving\n• Sleep is still disrupted for many, with vivid dreams (REM rebound) often peaking around now\n• Irritability and mood can remain elevated, as these tend to peak later in the first two weeks\n\nThe Neurobiology of Recovery\nUnderlying these changes, the review notes that downregulated CB1 receptors return toward normal functioning within about four weeks of abstinence. One week in, that re-regulation is well underway — the system is recovering even while some symptoms linger.\n\nThe Takeaway\nReaching one week means the acute physical peak is behind you. The remaining sleep and mood symptoms are part of a syndrome with a known, finite course that continues to resolve over the next couple of weeks.'**
  String get marijuanaReferenceDay7;

  /// No description provided for @marijuanaReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks Without Cannabis: Acute Withdrawal Ends\n\nSource: Budney, AJ et al. (2003) — peer-reviewed study on cannabis withdrawal time course\n\nResearch Findings\nThis peer-reviewed study systematically documented the time course of cannabis withdrawal symptoms in regular users. The findings showed that the acute withdrawal syndrome peaks within the first week and largely resolves within 2 weeks of stopping for most symptoms.\n\nWhat Resolves by 2 Weeks\nThe study documented that by 14 days, the following symptoms had largely resolved in study participants:\n• Physical discomfort and bodily symptoms\n• Appetite disturbance\n• Most sleep disruption\n• Peak irritability and anxiety\n\nWhat May Persist Beyond 2 Weeks\nThe research also identified symptoms that persisted beyond the two-week mark in some users:\n• Depressed mood\n• Concentration difficulties\n• Sleep quality (though improving)\n\nThe Significance of the 2-Week Mark\nPassing the two-week mark is significant because it means the acute withdrawal syndrome is largely complete. The challenges beyond this point are primarily related to longer-term brain recovery and managing the underlying reasons for cannabis use, rather than the acute physiological response to stopping.'**
  String get marijuanaReferenceDay14;

  /// No description provided for @marijuanaReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month Without Cannabis: Memory Function Improves\n\nSource: Pope et al. (2001), Archives of General Psychiatry\n\nCannabis and Memory: The Problem\nThis study followed heavy, long-term cannabis users through 28 days of confirmed abstinence and compared their thinking and memory test results with light users and non-users. At the start of abstinence, and again at days 1 and 7, heavy users performed worse than controls on recall of word lists — a deficit that tracked with their urinary THC metabolite levels, reflecting recent drug exposure rather than lifetime use.\n\nThe Good News: Recovery by Day 28\nBy day 28, heavy users, light users, and non-users performed virtually the same across the study\'s thinking and memory tests. There was also no significant relationship between total lifetime cannabis use and test performance at that point.\n\nWhat This Means at 30 Days\n• Verbal learning and recall have returned to control-group levels\n• The residual deficits seen in the first week have resolved\n• The remaining deficit earlier on was tied to recent exposure, not permanent damage\n\nWhat the Evidence Shows\nBy day 28, heavy users were virtually indistinguishable from light users and non-users across the study\'s full set of thinking and memory tests. Verbal-learning and recall deficits seen in the first week had recovered to control-group levels.'**
  String get marijuanaReferenceDay30;

  /// No description provided for @marijuanaReferenceDay60.
  ///
  /// In en, this message translates to:
  /// **'Two Months Without Cannabis: Concentration Sharpens\n\nSource: Roten et al. (2015), Addictive Behaviors\n\nThe Research Question\nThis youth cannabis-cessation study tracked memory and thinking test scores alongside urine tests over about two months, comparing continued users with people who stopped recently or stayed abstinent.\n\nKey Findings\nConsistent abstinence was associated with significant improvement in:\n• Composite memory score\n• Verbal memory specifically — the most affected domain\n• Movement and reaction-speed performance\n\nAt Two Months\nBy roughly eight weeks of consistent abstinence, memory and movement and reaction-speed performance scores had climbed measurably above where they sat during active use, tracking closely with confirmed non-use rather than time alone.\n\nWhat the Study Shows\nIn adolescents and young adults with cannabis dependence, consistent abstinence produced significant gains in composite memory, verbal memory, and movement and reaction-speed performance across the roughly two-month treatment window.'**
  String get marijuanaReferenceDay60;

  /// No description provided for @marijuanaReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months Without Cannabis: Mood Stability Returns\n\nSource: Connor et al. (2022), Addiction — a clinical review of cannabis withdrawal\n\nWhat the Withdrawal Timeline Actually Looked Like\nThis review describes cannabis withdrawal symptoms typically starting 24–48 hours after cessation and peaking around days 2–6. Anger, aggression, and depressed mood can appear as early as one week but typically peak after about two weeks of abstinence; sleep disturbance in particular can persist longer than other symptoms.\n\nWhere Three Months Sits\nBy three months, you are far beyond the documented withdrawal course: symptoms typically start within 24–48 hours, peak around days 2–6, and even slower mood and sleep symptoms peak within the following weeks. Ninety days gives those withdrawal-driven mood and sleep effects months to settle.\n\nA Note on the Endocannabinoid System\nCannabis-withdrawal research also shows downregulated CB1 receptors returning toward normal functioning within about four weeks of abstinence. At 90 days, you are well beyond that receptor-recovery window.\n\nLooking Ahead\nThe review also discusses post-detoxification prognosis and relapse prevention, underlining that ongoing support and coping strategies matter well beyond the acute withdrawal window.'**
  String get marijuanaReferenceDay90;

  /// No description provided for @marijuanaReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months Without Cannabis: Planning and Decision-Making Recover\n\nSource: Crean, Crane & Mason (2011), Journal of Addiction Medicine\n\nPlanning and Decision-Making After Cannabis\nThis review examined attention, decision-making, self-control, working memory, and verbal fluency from the first hours after use through long-term abstinence. By six months, you are far beyond the short-term effects and deep into the recovery period.\n\nWhat the Research Found\nSeveral problems linked to heavy use recede with sustained abstinence, with some studies finding recovery by 28 days. The slowest areas to recover after heavy, early-onset use include:\n• Decision-making and risk-taking — specifically flagged as domains where deficits can persist long-term in heavy, chronic users\n• Abstract reasoning and verbal skills — particularly impaired in adults who began using before age 17\n\nEarly-Onset Recovery\nSix months is far beyond the short-term effects in this review. Planning, decision-making, and reasoning keep improving with sustained abstinence, making continued abstinence the strongest route to further recovery.\n\nThe Broader Picture\nFor adult-onset, lighter use, the outlook is more favourable — many people at six months report clearer thinking, steadier decision-making, and a stronger sense of self-direction. The biggest gains come from staying abstinent, especially after heavy or early-onset use.'**
  String get marijuanaReferenceDay180;

  /// No description provided for @marijuanaReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year Without Cannabis: Brain Structure Recovers\n\nSource: \"Hippocampal harms, protection and recovery following regular cannabis use,\" Translational Psychiatry (2016), on PubMed Central\n\nStructural Changes from Cannabis\nThis brain-scan study examined the hippocampus, a brain area central to memory, in current users, former users, and non-users. Current users not exposed to CBD had a hippocampus about 11% smaller and a brain-cell health marker about 15% lower than controls.\n\nThe Key Finding: Recovery With Abstinence\nCurve-fitting analyses supported a \"protection and recovery\" model. Crucially, former users — abstinent for an average of around 29 months — did not differ from non-using controls on any integrity measure. The authors conclude that THC-related memory-area harms \"can be recovered with extended periods of abstinence.\"\n\nBrain Recovery Over a Year and Beyond\nAt one year cannabis-free, the brain\'s memory system is well into recovery: hippocampus size and brain-cell health are moving back toward normal, supporting memory and emotional control.\n\nRecovery Signal\nFormer users abstinent for about 29 months matched non-users on the study\'s hippocampus health measures. At one year, the memory system is already moving along that documented recovery path toward normal.'**
  String get marijuanaReferenceDay365;

  /// No description provided for @mdmaReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'After MDMA: The Comedown\n\nSource: Meyer (2013), \"3,4-Methylenedioxymethamphetamine (MDMA): Current Perspectives,\" Substance Abuse and Rehabilitation\n\nWhy You Feel Low\nMDMA works by driving a large release of serotonin (with some dopamine). Afterwards the brain is temporarily depleted of serotonin. This review describes a lowering of mood — the so-called \"midweek blues\" — that researchers have measured in both novice and experienced users 2 to 5 days after use.\n\nWhat Helps\n• Hydration and nutritious food\n• Sleep\n• Patience — the dip is the depletion, not a permanent state\n\nThe comedown after a single use differs from dependence-related withdrawal, which the same review describes as involving cravings but not significant physical symptoms.'**
  String get mdmaReferenceDay1;

  /// No description provided for @mdmaReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'A Few Days After MDMA\n\nSource: Meyer (2013), \"3,4-Methylenedioxymethamphetamine (MDMA): Current Perspectives,\" Substance Abuse and Rehabilitation\n\nThe Midweek Blues\nThis is roughly the window this review is describing when it discusses the \"midweek blues\" — a dip in mood measured 2 to 5 days after use in both novice and experienced users, tied to short-term serotonin depletion rather than long-term change.\n\nWhat Improves\n• Mood typically lifts from its lowest point around now\n• Energy returns\n• Sleep starts to normalise'**
  String get mdmaReferenceDay3;

  /// No description provided for @mdmaReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week After MDMA\n\nSource: Meyer (2013), \"3,4-Methylenedioxymethamphetamine (MDMA): Current Perspectives,\" Substance Abuse and Rehabilitation\n\nPast the Midweek Blues\nFor most people, a week is past the 2-to-5-day window this review associates with the acute comedown, so mood should be back to normal. The review notes that for people who use heavily or repeatedly, cravings can persist as part of a dependence pattern, though it does not describe this as involving significant physical withdrawal symptoms.\n\nWhen to Seek Help\nIf low mood, anxiety, or sleep problems persist a week on, that may be more than a comedown — it is worth talking to a professional.'**
  String get mdmaReferenceDay7;

  /// No description provided for @mdmaReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks Off MDMA\n\nSource: Meyer (2013), \"3,4-Methylenedioxymethamphetamine (MDMA): Current Perspectives,\" Substance Abuse and Rehabilitation\n\nRecovery Timeline\nFor a single-use comedown, two weeks is well past the 2-to-5-day dip this review documents, so mood, sleep, and concentration should be steady. After heavier or repeated use, recovery continues beyond the comedown, and abstinent imaging studies show serotonin-recycling capacity rising with sustained abstinence.\n\nWhat This Means for You\nIf your use was occasional, you\'re likely through the worst of it. If it was frequent or heavy, be patient with yourself — full recovery of serotonin signalling is a longer process than two weeks, covered in the next milestones.'**
  String get mdmaReferenceDay14;

  /// No description provided for @mdmaReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month Off MDMA\n\nSource: \"Serotonin transporter availability, neurocognitive function and their correlation in abstinent MDMA users,\" on PubMed\n\nWhere One Month Sits\nThe acute comedown and withdrawal are well behind you, and mood and thinking and memory are steadier. Imaging research shows MDMA reduces the brain\'s capacity to process serotonin, and that this capacity recovers with sustained abstinence.\n\nRecovery Signal\nThe same research shows serotonin-recycling capacity recovering with sustained abstinence. Mood and serotonin function improve first, while memory continues on its own recovery timeline — continued abstinence supports both.'**
  String get mdmaReferenceDay30;

  /// No description provided for @mdmaReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months Off MDMA\n\nSource: \"Serotonin transporter availability, neurocognitive function and their correlation in abstinent MDMA users,\" on PubMed\n\nContinued Recovery\nWith sustained abstinence the brain\'s serotonin system continues to recover, especially in deeper brain regions. Mood and sleep are typically stable by this point.\n\nRecovery Signal\nSustained abstinence drives continued serotonin-transporter recovery across brain regions, while mood and sleep remain stable and recovery of thinking and memory continues.'**
  String get mdmaReferenceDay90;

  /// No description provided for @mdmaReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year Off MDMA\n\nSource: \"Serotonin transporter availability, neurocognitive function and their correlation in abstinent MDMA users,\" on PubMed\n\nA Year On\nWith a year of abstinence, the brain\'s serotonin processing has recovered substantially and mood is stable.\n\nRecovery Signal\nA full year of abstinence gives the serotonin system a prolonged recovery window. Imaging research shows serotonin-recycling capacity rises with abstinence, making substantial serotonin recovery the clearest biological signal at this stage.'**
  String get mdmaReferenceDay365;

  /// No description provided for @methReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Methamphetamine Withdrawal: The First 24 Hours\n\nSource: McGregor et al., \"The nature, time course and severity of methamphetamine withdrawal,\" Addiction (2005), on PubMed\n\nThe Crash\nMethamphetamine drives a large release of dopamine; when use stops, the system is left depleted. This study tracked withdrawal symptoms daily across the first three weeks of abstinence and found that overall severity was at its highest within 24 hours of the last use — the \'crash,\' an abrupt swing from extreme stimulation to physical and psychological exhaustion.\n\nDay One Symptoms\nThe study documented the withdrawal features that are most intense now:\n• Extreme fatigue and increased sleep (hypersomnia)\n• Increased appetite (meth powerfully suppresses appetite)\n• Depressed mood and loss of pleasure\n• Strong cravings\n• Anxiety and irritability\n\nPhysical Safety\nThe methamphetamine withdrawal syndrome itself is not generally life-threatening, but the depression-related symptoms measured in this study can be severe early on and may include suicidal thoughts. Medical supervision is strongly advisable, especially for heavy users.\n\nIt Starts to Lift\nThe encouraging finding from this research: severity is highest at the very start and then falls. From this 24-hour peak, symptoms decline steadily over the following days — the worst point is the beginning.'**
  String get methReferenceDay1;

  /// No description provided for @methReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'Meth Withdrawal: Day Three — Still in the Acute Phase\n\nSource: McGregor et al., \"The nature, time course and severity of methamphetamine withdrawal,\" Addiction (2005), on PubMed\n\nComing Down From the Peak\nThis study found that overall withdrawal severity peaks within the first 24 hours and then declines in a roughly linear pattern across the acute phase (about 7–10 days). By day three you are past the highest point, but still firmly in the acute phase — symptoms remain prominent even as the trend is downward.\n\nDay Three Symptoms\nThe features the study tracked that are still significant now:\n• Depression and loss of pleasure\n• Strong cravings\n• Difficulty concentrating and thinking clearly\n• Disturbed sleep — insomnia alternating with hypersomnia\n• Continued fatigue\n\nWhy It Feels This Way\nMeth withdrawal\'s intensity reflects the scale of dopamine depletion it causes. The depression-related symptoms the study measured are most evident in these early days — but importantly, the study found overall withdrawal severity \'reducing to near control levels by the end of the first week of abstinence.\'\n\nThis Will Pass\nThe hardest stretch is the first few days, and the data show a steady decline from here. Understanding this state as temporary and brain and nerve — not a permanent condition — helps in getting through it.'**
  String get methReferenceDay3;

  /// No description provided for @methReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week Without Meth: The Acute Phase Ends\n\nSource: McGregor et al., \"The nature, time course and severity of methamphetamine withdrawal,\" Addiction (2005), on PubMed\n\nEnd of the Acute Phase\nThis is one of the most encouraging findings in the research. The study reported that overall withdrawal severity — including the depression-related symptoms it tracked — \'reduced to near control levels by the end of the first week of abstinence,\' marking the end of the acute phase. The steepest part of the climb is behind you.\n\nTwo Phases of Withdrawal\nThe authors described meth withdrawal as having:\n• An acute phase lasting about 7–10 days, in which symptom severity falls steadily from its early peak\n• A subacute phase lasting at least a further two weeks, with milder, lingering symptoms\n\nWhat Remains at Day 7\nEntering the subacute phase, the dominant challenges are now psychological rather than the acute crash:\n• Low mood, though much improved from the first days\n• Cravings, especially in response to cues\n• Concentration and memory still recovering\n• Sleep still settling\n\nPhysical Recovery Underway\nWith the acute phase over, appetite has returned and energy is slowly building as the body recovers from meth\'s effects on sleep, nutrition, and the cardiovascular system.'**
  String get methReferenceDay7;

  /// No description provided for @methReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month Without Meth: Mood Settles, Cravings Linger\n\nSource: Zorick et al., \"Withdrawal symptoms in abstinent methamphetamine-dependent subjects,\" Addiction (2010), on PubMed Central\n\nTracking the First Five Weeks\nThis study followed methamphetamine-dependent participants who stayed abstinent for up to five weeks, comparing them with healthy controls — giving an unusually clear picture of where the one-month mark sits.\n\nWhat Has Improved by One Month\n• Depressive symptoms \'decreased substantially over the first 2 weeks of abstinence to stable low levels,\' and by the end of four weeks were approaching, though not yet statistically matching, healthy-control levels (the gap had narrowed to a borderline, non-significant trend)\n• Psychiatric and psychotic-type symptoms had reached a low starting level by the end of the second week\nSo at 30 days, the heavy depression of early withdrawal has largely lifted — a genuine, measured improvement.\n\nWhat Still Lingers\nThe study was clear that one symptom outlasts the others: craving \'still continued at a reduced level throughout 5 weeks of abstinence.\' Cravings are weaker than in the first week but have not gone, which is why one month is still a high-risk period and ongoing support matters.\n\nThe Takeaway\nBy a month, the brain\'s mood machinery has recovered enough that day-to-day feeling is far better than in early withdrawal — while persistent cravings are a normal part of this stage, not a sign of failure.'**
  String get methReferenceDay30;

  /// No description provided for @methReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months Without Meth: Healing Has Begun — Be Patient\n\nSource: Volkow et al., \"Loss of Dopamine Transporters in Methamphetamine Abusers Recovers with Protracted Abstinence,\" Journal of Neuroscience (2001)\n\nAbout This Research\nThis landmark brain-scan study followed methamphetamine users twice — around three months off meth and again around 14 months — to see how the dopamine system recovers.\n\nWhere Three Months Sits\nAt three months, the early withdrawal period is long over and deeper dopamine recovery is underway. The same study later found that proteins that recycle dopamine in the brain\'s reward and movement areas rose by roughly 16% to 19% after 12–17 months off meth.\n\nWhat That Means For You\nBy 90 days the acute withdrawal is far behind you, mood and sleep have improved, and engagement with therapy becomes far more productive. But the deeper dopamine recovery is a longer project that unfolds over the following year. If motivation and pleasure still feel muted at three months, that is expected and not a sign of failure — the trajectory in this study is clearly upward from here.\n\nWhy It\'s Worth the Wait\nThe same study showed that staying abstinent is what drives the recovery: the longer the abstinence, the greater the DAT recovery measured. Three months is the foundation; the gains keep coming.'**
  String get methReferenceDay90;

  /// No description provided for @methReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months Without Meth: The Heart Can Recover\n\nSource: \"Stopping Drug Abuse Can Reverse Related Heart Damage,\" American College of Cardiology (2017), reporting a study in JACC: Heart Failure\n\nMeth and the Heart\nMethamphetamine is one of the most cardiotoxic recreational drugs. It can drive severe hypertension and arrhythmias and, over time, methamphetamine-associated cardiomyopathy — a weakening of the heart muscle that leads to heart failure.\n\nWhat the Study Found\nThe ACC reported on patients with meth-associated cardiomyopathy (all with significantly reduced heart-pumping function). The central, hopeful finding: quitting \'can reverse the damage the drug causes to the heart and improve heart function.\' Patients who stopped using had markedly better outcomes than those who kept using, and the authors stressed that catching it early \'could prevent further deterioration of the cardiomyopathy.\'\n\nWhy Six Months Matters\nEvery month of abstinence removes the ongoing toxic stress on your heart and gives the muscle a chance to recover. At six months you have given your cardiovascular system a substantial, sustained break from that damage — exactly the condition under which this study saw improvement.\n\nRecovery Signal\nThe evidence-backed result is strong: stopping meth can reverse methamphetamine-associated heart damage and improve heart function. Six months without the repeated stimulant insult gives the heart a substantial recovery window.'**
  String get methReferenceDay180;

  /// No description provided for @methReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year Without Meth: Measurable Brain Recovery\n\nSource: Wang et al., \"Partial Recovery of Brain Metabolism in Methamphetamine Abusers After Protracted Abstinence,\" American Journal of Psychiatry (2004), on PubMed\n\nWhat the Imaging Shows\nThis brain-scan study checked methamphetamine users early in abstinence and again after 12–17 months. It found genuine brain recovery, with some areas recovering faster than others.\n\nThe Good News: Deep-Brain and Thinking Recovery\nThe thalamus, a deep brain relay centre, started using energy more normally with long-term abstinence. That recovery tracked with better movement and verbal-memory performance, so the brain-scan improvement showed up in real thinking and memory.\n\nReward Circuits Recover More Slowly\nAt 12–17 months, the deep brain relay centre had recovered strongly and that gain tracked with better movement and verbal memory. Reward and motivation systems kept strengthening too, making the one-year picture one of major recovery in thinking and memory.\n\nWhat This Means at One Year\nAt a year, expect a brain that thinks and remembers far better than in early recovery — clear, measurable healing. But if motivation or the ability to feel pleasure still lag at times, that is consistent with the science, not a personal failing: this study found those reward circuits can recover more slowly, with some deficits still present well over a year out.'**
  String get methReferenceDay365;

  /// No description provided for @methReferenceDay420.
  ///
  /// In en, this message translates to:
  /// **'14 Months Without Meth: The Dopamine Marker Rebounds\n\nSource: Volkow et al., \"Loss of Dopamine Transporters in Methamphetamine Abusers Recovers with Protracted Abstinence,\" Journal of Neuroscience (2001)\n\nThe Headline Finding\nThis landmark brain-scan study checked meth users early in abstinence and again after about 12–17 months. Proteins that recycle dopamine rose roughly 16% to 19% in the brain\'s reward and movement areas and reached levels that no longer differed significantly from healthy controls. Longer abstinence meant greater recovery.\n\nWhy DAT Matters\nThese proteins recycle dopamine after it is released. Meth depletes them, leaving the dopamine system poorly regulated. Their rebound by about 14 months is a genuine, measurable sign of healing.\n\nRecovery Signal\nAfter 12–17 months, dopamine-recycling proteins in reward and movement areas rose about 16% to 19% and reached healthy-control levels. The dopamine system has measurably rebounded toward normal, while thinking, memory, and movement continue improving.\n\nWhat This Means at 14 Months\nThe dopamine system\'s hardware is measurably recovering toward normal — real cause for optimism. But full functional recovery (memory, motivation, fine motor control) can lag behind the imaging, and continues to improve with ongoing abstinence.'**
  String get methReferenceDay420;

  /// No description provided for @methReferenceDay730.
  ///
  /// In en, this message translates to:
  /// **'Two Years Without Meth: Thinking and Mood Keep Improving\n\nSource: Iudicello et al., \"Longer Term Improvement in Neurocognitive Functioning and Affective Distress Among Methamphetamine Users Who Achieve Stable Abstinence,\" Journal of Clinical and Experimental Neuropsychology (2010), on PubMed Central\n\nRecovery That Continues Past a Year\nThis study followed methamphetamine users for about 13 months and compared stable abstainers with continued users and healthy controls. Stable abstinence improved overall thinking and reduced emotional distress, with gains continuing beyond a year.\n\nWhat Improves\n• Overall thinking in abstainers caught up to healthy controls, while continued users stayed significantly impaired\n• The biggest gains were in processing speed and motor ability, especially for those most impaired at the start\n• Mood improved markedly: only the abstainers showed significant improvement in depression and overall mood\n\nRecovery Signal\nStable abstainers caught up to healthy controls on overall thinking and reported less emotional distress. Verbal learning, working memory, planning, and focus can keep improving beyond the first year, so the recovery trend continues into the second year.\n\nTwo Years In\nThe evidence-based message: sustained abstinence keeps paying off well past the first year — sharper thinking, better mood, and steadily improving function — even if a few areas take longer to come back.'**
  String get methReferenceDay730;

  /// No description provided for @nitrousOxideReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Day One: The Gas Is Gone, but Watch B12\n\nSource: Knuf & Maani, \"Nitrous Oxide,\" StatPearls (NCBI Bookshelf)\n\nHow Fast It Clears\nNitrous oxide has a rapid onset of action — 2 to 5 minutes — and clears from the body just as quickly once you stop inhaling it. By today, none of the gas itself remains in your system.\n\nThe Real Risk Isn\'t the Gas\nWhat matters after stopping is what repeated exposure may have already done. Nitrous oxide inactivates methionine synthase, an enzyme that depends on vitamin B12. StatPearls notes that repeated exposure — occupational or recreational — can lead to megaloblastic anaemia and brain and nerve dysfunction, and in rare cases, degeneration of the spinal cord.\n\nIf You Used Heavily or Often\nNitrous oxide isn\'t documented to cause a physical withdrawal syndrome the way opioids or alcohol do, so day one isn\'t about your body demanding the drug. It\'s about starting to pay attention to B12-related symptoms — covered in the next few milestones — and getting checked if any appear.'**
  String get nitrousOxideReferenceDay1;

  /// No description provided for @nitrousOxideReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'72 Hours: No Physical Withdrawal, But Watch for Nerve Symptoms\n\nSource: Knuf & Maani, StatPearls; Tikaria et al. (2026), Cureus\n\nUnlike opioids or alcohol, nitrous oxide isn\'t documented to cause a physical withdrawal syndrome. Urges at this stage are habit and craving, not the body demanding the drug to function.\n\nWatch for These\nA systematic review of 1,809 recreational nitrous oxide cases (Tikaria et al., 2026) found brain and nerve symptoms — especially tingling or numbness (paresthesia) — were the most common sign of B12-related harm, often appearing even when standard blood tests looked normal. Gait problems and weakness were also reported.\n\nIf You Notice Any of These\nSeek medical review. The same review found standard blood tests (haemoglobin, serum B12) missed a meaningful share of affected patients — tests for methylmalonic acid (MMA) and homocysteine are more sensitive and should be requested specifically if you disclose nitrous oxide use.'**
  String get nitrousOxideReferenceDay3;

  /// No description provided for @nitrousOxideReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week: Get Tested if You Used Heavily\n\nSource: Tikaria et al. (2026), \"The Toxic Legacy of Recreational Nitrous Oxide Use,\" Cureus\n\nWhat the Evidence Shows\nThis systematic review found that vitamin B12 deficiency from nitrous oxide is often \"functional\" — serum B12 looked normal in roughly half of affected patients, even when they had real brain and nerve damage. Homocysteine and MMA were abnormal far more often (84% and 73% of tested patients respectively) and are the more reliable markers.\n\nWhat to Do\nIf your use was heavy or frequent, one week off is a reasonable time to see a doctor and ask for homocysteine and MMA testing specifically — not just a standard B12 level — especially if you have any tingling, numbness, balance problems, or unexplained weakness.\n\nBrain recovery is common after nitrous cessation and vitamin B12 treatment: large clinical series report partial or complete improvement in most followed patients, with recovery continuing across the first months after treatment.'**
  String get nitrousOxideReferenceDay7;

  /// No description provided for @nitrousOxideReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks: Brain and nerve Symptoms Deserve Follow-Up\n\nSource: Tikaria et al. (2026), Cureus; Knuf & Maani, StatPearls\n\nWhat\'s Been Reported\nCase reports and series reviewed by Tikaria et al. describe nitrous oxide-related nerve damage presenting as sensory loss, gait ataxia, and sometimes weakness affecting walking — findings that can resemble other brain and nerve conditions and are sometimes missed if nitrous oxide use isn\'t mentioned to a clinician.\n\nRecovery Signal on Timelines\nNeither source reports how long recovery normally takes once use stops and any deficiency is treated. Case reports describe a wide range of outcomes — from full recovery to lasting deficits — depending largely on how much damage occurred before diagnosis. What\'s consistent across the literature is that earlier treatment leads to better outcomes.\n\nIf You Haven\'t Been Checked\nTwo weeks off is still a good time to get bloodwork done, even without symptoms — particularly homocysteine and MMA rather than serum B12 alone.'**
  String get nitrousOxideReferenceDay14;

  /// No description provided for @nitrousOxideReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month: Habit and Craving, Not Physical Dependence\n\nSource: Knuf & Maani, \"Nitrous Oxide,\" StatPearls (NCBI Bookshelf)\n\nWhere You Stand\nStatPearls doesn\'t describe nitrous oxide as producing a physical dependence syndrome, so a month off means any lingering urges are about habit, social context, or boredom rather than a body still adjusting to the drug\'s absence.\n\nThe B12 Question\nIf you were tested and treated for B12 deficiency, one month is a reasonable point for your doctor to check whether your levels — and any symptoms — have responded. If you weren\'t tested and used heavily, it\'s still worth asking.\n\nWhat\'s Protected\nEvery month you don\'t use is a month you\'re not adding to any existing methionine synthase inactivation or the brain and nerve risk that comes with it.'**
  String get nitrousOxideReferenceDay30;

  /// No description provided for @nitrousOxideReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months: Time to Recheck, if You Haven\'t\n\nSource: Tikaria et al. (2026), \"The Toxic Legacy of Recreational Nitrous Oxide Use,\" Cureus\n\nWhat We Know — and Don\'t\nThis research base is built from case reports and case series, not controlled recovery studies, so there\'s no reliable published timeline for how symptoms resolve by three months specifically. What the evidence does show is that outcomes vary widely — some patients with mild, early-caught deficiency recover fully, while those with delayed diagnosis or more severe nerve damage can have lasting deficits.\n\nThe Actionable Part\nIf you had any brain and nerve symptoms and haven\'t had follow-up bloodwork or a specialist review, three months off is a sensible point to do so. If you were treated and improving, this is a reasonable time to confirm the trend is continuing with your doctor.\n\nStaying Off Matters Most\nThe review is consistent about one thing: continued exposure keeps inactivating B12 and adding to the risk. Not using is the single biggest factor in your favour.'**
  String get nitrousOxideReferenceDay90;

  /// No description provided for @nitrousOxideReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year: The Best Protection Is Continued Abstinence\n\nSource: Knuf & Maani, StatPearls; Tikaria et al. (2026), Cureus\n\nWhere the Evidence Actually Lands\nNeither source promises a specific recovery timeline, and that\'s worth being honest about — the literature on nitrous oxide and B12 deficiency is built almost entirely from individual case reports rather than long-term follow-up studies. What is well established is the mechanism: nitrous oxide inactivates vitamin B12 every time it\'s used, and stopping removes that ongoing harm entirely.\n\nIf You Had Deficiency-Related Symptoms\nCase reports describe a wide range of outcomes, from full recovery to persistent nerve symptoms, largely tied to how much damage occurred and how early it was treated. If you\'re still experiencing symptoms a year out, that\'s a reason to keep working with a neurologist, not a sign nothing can be done — nerve recovery can continue over an extended period.\n\nWhat\'s Certain\nA year without nitrous oxide is a year without further methionine synthase inactivation. That\'s the one guarantee both sources support.'**
  String get nitrousOxideReferenceDay365;

  /// No description provided for @opioidReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Opioid Withdrawal: Day One\n\nSource: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\n⚠ Safety Note\nOpioid withdrawal is rarely fatal in otherwise healthy individuals, but it causes severe physical distress and carries a high risk of relapse. Relapse after a period of abstinence is particularly dangerous because tolerance drops rapidly — using the same dose as before abstinence can cause fatal overdose. Medical supervision and opioid agonist treatment are strongly recommended.\n\nWhen Withdrawal Begins\nThe WHO withdrawal timetable sets the timing by opioid type:\n• Short-acting opioids (heroin, oxycodone): onset 8–24 hours after last use, duration 4–10 days\n• Long-acting opioids (methadone): onset 12–48 hours, duration 10–20 days\n\nDay One Symptoms\nThe WHO guidelines list the early features of opioid withdrawal:\n• Anxiety and agitation\n• Muscle cramps and aches\n• Watery discharge from eyes and nose\n• Yawning and perspiration\n• Insomnia, with hot and cold flushes\n• Early nausea\n\nWhy It Feels So Bad\nThe opioid system regulates pain, stress, emotional wellbeing, and basic comfort. Long-term opioid use suppresses the body\'s own opioid production (endorphins). When opioids are removed, the body is left without its normal comfort system — experiencing pain, anxiety, and distress at a level that reflects the depth of that suppression. The WHO guidelines advise supportive care, including drinking 2–3 litres of water per day and monitoring 3–4 times daily.'**
  String get opioidReferenceDay1;

  /// No description provided for @opioidReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week Off Opioids: Peak Symptoms Declining\n\nSource: \"Clinical Guidelines for Withdrawal Management and Treatment of Drug Dependence in Closed Settings,\" World Health Organization (2009), on the NCBI Bookshelf\n\nThe Peak and Decline\nThe WHO timetable puts short-acting opioid withdrawal at 4–10 days, with symptoms building early and then easing across that window. By the end of the first week:\n• Vomiting and diarrhoea are largely resolved\n• Muscle cramps are less severe\n• Physical distress is meaningfully reduced\n\nWhat Remains at Day 7\nWhile acute physical symptoms are improving, significant challenges persist:\n• Insomnia — sleep disruption is one of the most persistent opioid withdrawal symptoms\n• Depressed mood and emotional flatness\n• Fatigue and weakness\n• Cravings\n• Anxiety\n\nPost-Acute Withdrawal\nAfter the first withdrawal period, sleep problems, changing mood, and waves of craving can continue for weeks or months. Continued support matters most during this longer recovery phase.\n\nOpioid Agonist Treatment\nThe WHO guidelines describe methadone and buprenorphine as effective treatments that reduce withdrawal severity and support recovery. These medications also reduce mortality from opioid use disorder, and many people in successful long-term recovery use them throughout the early recovery phase.'**
  String get opioidReferenceDay7;

  /// No description provided for @opioidReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks Off Opioids: Sleep Patterns Starting to Improve\n\nSource: Peer-reviewed pharmacology research on opioids and sleep\n\nThe Opioid-Sleep Connection\nThis research paper examines the bidirectional relationship between opioid use and sleep disruption. The findings document that opioids severely disrupt normal sleep architecture through multiple mechanisms:\n• Suppression of slow-wave (deep) sleep\n• Disruption of REM sleep\n• Causing sleep-disordered breathing (central sleep apnea)\n• Disrupting circadian rhythm regulation\n\nA Vicious Cycle\nThe research highlights the bidirectional nature of the problem: opioid use disrupts sleep, and poor sleep increases pain sensitivity and craving intensity, driving further opioid use. Breaking opioid dependence also means breaking this sleep-disruption cycle.\n\nSleep at Two Weeks\nBy 14 days of opioid abstinence, sleep is beginning to normalise:\n• Central sleep apnea (if present) resolves within days\n• Deep slow-wave sleep is beginning to recover\n• REM sleep is returning to normal proportion\n• Sleep onset is becoming more reliable\n\nSleep remains a significant challenge for many people at two weeks, but the trajectory is clearly improving. Better sleep directly improves mood, reduces cravings, and supports the clear thinking needed for recovery.'**
  String get opioidReferenceDay14;

  /// No description provided for @opioidReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month Off Opioids: Thinking and Memory Begin to Recover\n\nSource: Mayo Clinic\n\nUnderstanding Opioid Use Disorder\nThe Mayo Clinic explains that opioids attach to receptors throughout the brain and body, producing pain relief, euphoria, and sleepiness. With repeated use, the brain responds less strongly and makes fewer of its own opioid-like chemicals. That creates physical dependence.\n\nThinking and Memory at One Month\nAt 30 days, meaningful recovery in thinking and memory has occurred. The worst brain fog has cleared, and the front of the brain — which handles planning and self-control — is recovering:\n• Decision-making is improving\n• Working memory is recovering\n• Processing speed increasing\n• Concentration more reliable\n\nThe Endorphin System\nAt one month, the brain\'s natural endorphin system is actively recovering: it is producing more of its own opioid-like chemicals and responding more normally again. Emotional flatness and lower pain tolerance keep improving as that recovery continues.\n\nRelapse Prevention\nThe Mayo Clinic emphasises that one month of sobriety does not mean the risk of relapse has passed — it remains elevated. Tolerance has dropped significantly, meaning that relapse using previous doses carries serious overdose risk.'**
  String get opioidReferenceDay30;

  /// No description provided for @opioidReferenceDay60.
  ///
  /// In en, this message translates to:
  /// **'Two Months Off Opioids: The Brain\'s Stress Circuits Begin to Settle\n\nSource: \"Neuroplasticity of the extended amygdala in opioid withdrawal and prolonged opioid abstinence,\" Frontiers in Pharmacology (2023)\n\nWhere the Negative Feelings Come From\nThis review maps how long-term opioid use changes the brain\'s stress and fear circuits. During withdrawal, these circuits become overactive while dopamine signalling in reward circuits drops. That combination helps explain anxiety, low mood, and cravings in early recovery.\n\nWhy Two Months Brings Relief\nCrucially, the review documents that some of these changes are reversible. In animal models the loss of spine density in the accumbens shell is described as \'an enduring but reversible decrease,\' returning toward pre-drug values over a couple of weeks. As these stress and reward circuits re-regulate, the mechanistic basis for early-recovery emotional turmoil eases — consistent with the reduced reactivity and steadier mood many people report by around two months.\n\nRecovery Signal\nThe reversible spine-density and stress-circuit changes documented in this literature show a real biological recovery process: the circuitry driving the negative emotional state of dependence moves back toward its pre-drug state during abstinence.'**
  String get opioidReferenceDay60;

  /// No description provided for @opioidReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months Off Opioids: Reward Chemistry Starting to Recover\n\nSource: \"Structural and Functional Brain Recovery in Individuals with Substance Use Disorders During Abstinence: A Review of Longitudinal Neuroimaging Studies,\" Drug and Alcohol Dependence (2022), on PubMed Central\n\nDopamine and Opioids\nOpioids drive dopamine release in the brain\'s reward system. Long-term use leaves that system depleted: in one brain-scan study, proteins that recycle dopamine were about 30% below healthy levels at the start. That helps explain the loss of pleasure seen in opioid use disorder and early recovery.\n\nRecovery Is Gradual\nThis review gathered the longitudinal studies that re-scanned the same people over abstinence. The dopamine-transporter deficit recovered by roughly 20% over 6–12 months of abstinence, and some frontal grey-matter and white-matter abnormalities seen in early withdrawal were no longer detectable after about a month. At three months you are early on that recovery curve: the reward and frontal systems are measurably mending, but have not finished.\n\nWhat People Experience\nAs these circuits recover, many people at around 90 days notice:\n• More genuine enjoyment of activities, food, and relationships\n• Reduced cravings compared with early recovery\n• Clearer thinking and better decision-making\n\nRecovery Signal\nLongitudinal human imaging shows dopamine-transporter availability rising across 6–12 months of abstinence, while frontal grey- and white-matter abnormalities begin normalising much earlier. At 90 days, measurable brain recovery is already established.'**
  String get opioidReferenceDay90;

  /// No description provided for @opioidReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months Off Opioids: The Immune System Begins to Recover\n\nSource: \"Effects of opioid tolerance and withdrawal on the immune system,\" Journal of Neuroimmune Pharmacology (2006), on PubMed\n\nOpioids and the Immune System\nThis review shows that long-term opioid use weakens the immune system in several ways:\n• Direct opioid action on immune cells (T cells, NK cells, macrophages)\n• Disrupted immune-signalling chemicals\n• Disruption of the hypodeep-brain-pituitary-adrenal (HPA) axis\n• Increased susceptibility to infection\n\nRecovery Signal\nLong-term opioids suppress several parts of the immune system. By six months off opioids, that constant suppression has been gone for half a year and immune function is actively rebuilding toward normal.\n\nWhat Six Months Means\nSix months without opioids gives immune cells, immune signalling, and the body\'s stress system sustained time to recover toward normal.\n\nWhy This Still Matters\nThis is particularly relevant for people who injected opioids, who faced added infection risks such as HIV and hepatitis C. Removing opioids, improving nutrition, and maintaining abstinence give the immune system the conditions it needs to keep recovering.'**
  String get opioidReferenceDay180;

  /// No description provided for @opioidReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year Off Opioids: Brain Structure and Chemistry Recovering\n\nSource: \"Structural and Functional Brain Recovery in Individuals with Substance Use Disorders During Abstinence: A Review of Longitudinal Neuroimaging Studies,\" Drug and Alcohol Dependence (2022), on PubMed Central\n\nWhat the Human Imaging Shows\nThis review gathered the studies that scanned the same people with opioid use disorder more than once across abstinence. The findings point consistently toward recovery:\n• Dopamine-recycling proteins in reward and movement areas, about 30% below normal at the start, rose by roughly 20% over 6–12 months off opioids\n• Frontal grey-matter abnormalities present in early withdrawal were no longer detectable after about a month of abstinence\n• White-matter (frontal and cingulate) and resting-state frontal activity also began to re-normalise within the first month\n\nWhere One Year Sits\nBy twelve months you are at or past the longest window these studies measured. The dopamine system has had the most time to recover, and the frontal circuits that support self-control and judgement have been mending for months — the biological counterpart to the clearer thinking, weaker cravings, and steadier mood people describe at a year.\n\nRecovery Signal\nAt one year, the human imaging signal is strongly recovery-oriented: dopamine-transporter availability has risen across the 6–12 month window, while frontal structural and functional abnormalities have had many months to normalise.'**
  String get opioidReferenceDay365;

  /// No description provided for @opioidReferenceDay730.
  ///
  /// In en, this message translates to:
  /// **'Two Years Off Opioids: A Stable Foundation\n\nSource: \"Treatment of Opioid Use Disorder,\" Centers for Disease Control and Prevention (CDC)\n\nA Chronic Condition, Managed Well\nThe CDC describes opioid use disorder as \'a chronic disease that can affect anyone\' — \'a medical condition, not a moral failing.\' Reaching two years of sustained recovery means you have been managing that condition successfully through one of its most vulnerable periods.\n\nWhat the CDC Says Works\nThe CDC\'s guidance centres on treatments that keep recovery stable over the long term:\n• Medications for opioid use disorder — buprenorphine, methadone, and naltrexone — which it calls especially effective\n• Combining medication with behavioural therapy and counselling\n• Treatment that lasts for varying lengths of time, tailored to the person\nThe CDC notes these medications help \'normalize brain chemistry\' and relieve cravings — the chemistry that felt hijacked in active addiction works with you again.\n\nStaying Safe\nThe CDC urges people in recovery to ask their doctor about the risk of returning to use and overdose, and to keep naloxone on hand. Tolerance falls during abstinence, so a return to opioids after this long is especially dangerous — knowing that is part of protecting what you\'ve built.\n\nTwo Years In\nThe CDC is clear that recovery is often a long-term process rather than a finish line. Two years is not the end of the journey — it is a stable, healthy foundation, and strong evidence that the approach you are using works.'**
  String get opioidReferenceDay730;

  /// No description provided for @pornographyReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Day One: Taking Back Control\n\nSource: Kraus et al., Compulsive sexual behaviour disorder in the ICD-11, World Psychiatry (2018).\n\nThe clinically important problem is not pornography use by itself. Compulsive Sexual Behaviour Disorder is defined around persistent difficulty controlling repetitive sexual behaviour when that pattern causes significant distress or impairment. Problematic pornography use can be one presentation of that broader problem.\n\nThat makes day one concrete rather than mystical: you have interrupted a behaviour you had decided was out of control. One completed day does not prove a brain and nerve reset, but it does give you the first real observation of when urges appear, what situations trigger them, and what you can do instead.\n\nIf your use was not distressing, impairing, or difficult to control, the clinical CSBD framework may not apply to you. These milestones are aimed at people who are deliberately changing problematic or compulsive use.'**
  String get pornographyReferenceDay1;

  /// No description provided for @pornographyReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'Day Three: Know What an Urge Can Look Like\n\nSource: Lewczuk et al., Withdrawal and tolerance as related to compulsive sexual behavior disorder and problematic pornography use, Journal of Behavioral Addictions (2022).\n\nIn a preregistered nationally representative Polish sample of 1,541 adults, stronger self-reported withdrawal-like experiences were associated with greater CSBD and problematic-pornography-use severity. Among participants with problematic pornography use, commonly reported experiences included difficult-to-stop sexual thoughts, difficult-to-control desire, increased arousal, irritability, mood changes, and sleep problems.\n\nRestlessness, intrusive sexual thoughts, strong urges, and irritability are documented in people with more severe problematic use. If they show up around day three, treat them as a real withdrawal-like pattern and manage the triggers.\n\nWrite down which urges are actually happening, what preceded them, and what response helped. Recovery gets easier to steer when the trigger is named rather than treated as a mysterious brain event.'**
  String get pornographyReferenceDay3;

  /// No description provided for @pornographyReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week: What a Randomized Abstinence Study Found\n\nSource: Effects of a 7-Day Pornography Abstinence Period on Withdrawal-Related Symptoms in Regular Pornography Users, Archives of Sexual Behavior (2023).\n\nResearchers randomized 176 regular pornography users either to attempt seven days of abstinence or to continue as usual. Across the full sample, abstinence did not produce a significant overall increase in craving, negative mood, or withdrawal symptoms.\n\nAn exploratory analysis did find increased craving among people who combined high problematic-use scores with daily pornography use before the study. That result needs replication, but it is useful: a difficult first week can be real for heavier problematic users, while a universal pornography withdrawal syndrome is not supported by this trial.\n\nIf you have made it through a week, you now have better evidence about your own pattern than any generic internet timeline can provide.'**
  String get pornographyReferenceDay7;

  /// No description provided for @pornographyReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks: Map the Triggers That Actually Matter\n\nSource: Biopsychosocial Determinants of Problematic Pornography Use: A Systematic Review (2023).\n\nThis review synthesized 66 studies and found that problematic pornography use is associated with a mix of factors rather than one simple dopamine mechanism. Repeatedly identified psychological and social factors included craving, stress, avoidance, loneliness, self-esteem, negative beliefs, and coping style.\n\nTwo weeks gives you repeated exposure to weekdays, weekends, boredom, stress, privacy, devices, and other contexts that may have cued the old behaviour. Use that data. If stress is the trigger, design a stress response. If loneliness is the trigger, add contact. If easy access is the trigger, change the environment.\n\nThe evidence supports working on the drivers of problematic use; it does not require pretending that every person follows the same biological countdown.'**
  String get pornographyReferenceDay14;

  /// No description provided for @pornographyReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month: Control Matters More Than a Simple Frequency Count\n\nSource: Bőthe et al., Are sexual functioning problems associated with frequent pornography use and/or problematic pornography use?, Addictive Behaviors (2021).\n\nIn a community sample of 14,581 adults, problematic pornography use had a moderate positive association with sexual-functioning problems in both men and women. Pornography-use frequency by itself showed a weak negative association with those problems.\n\nThat distinction matters. The evidence does not support telling every pornography user that viewing frequency alone damages sexual function. The more clinically relevant target is loss of control and the problems surrounding that pattern.\n\nAt one month, compare life now with when you started: preoccupation, time lost, ability to stop, sexual functioning, relationship conflict, and distress. Those changes matter more than waiting for a mythical day-30 brain reset.'**
  String get pornographyReferenceDay30;

  /// No description provided for @pornographyReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months: Durable Change Is Possible\n\nSource: Crosby & Twohig, Acceptance and Commitment Therapy for Problematic Internet Pornography Use: A Randomized Trial, Behavior Therapy (2016).\n\nThis small randomized trial compared a 12-session ACT program with a waitlist in 28 adult men. Pornography viewing fell much more in the ACT group at the end of treatment, and substantial reductions remained at the three-month follow-up.\n\nThe study does not prove that 90 days of abstinence alone causes the same result, and its sample was small and demographically narrow. What it does demonstrate is important: problematic pornography use is modifiable, and structured skills can produce changes that persist beyond the immediate treatment period.\n\nIf your progress still depends mostly on white-knuckling, three months is a good point to strengthen the system around it: trigger plans, acceptance of urges without acting, environmental friction, accountability, and therapy when needed.'**
  String get pornographyReferenceDay90;

  /// No description provided for @pornographyReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months: Long-Term Symptom Control Can Hold\n\nSource: Hallberg et al., A Randomized Controlled Study of Group-Administered Cognitive Behavioral Therapy for Hypersexual Disorder in Men, Journal of Sexual Medicine (2019).\n\nIn 137 men with out-of-control sexual behaviour, seven weeks of group CBT produced greater reductions in hypersexual symptoms and sexual compulsivity than a waitlist, along with improved psychiatric well-being. The treatment gains remained stable at both three- and six-month follow-up.\n\nThis study covered hypersexual disorder more broadly rather than pornography abstinence alone, so it should not be turned into a claim that every person is biologically recovered at six months. It does support a stronger and more useful statement: sustained improvement in compulsive sexual behaviour can remain stable over this length of time.\n\nSix months is therefore a maintenance milestone. Keep the routines that made control easier instead of treating the date as permission to dismantle them.'**
  String get pornographyReferenceDay180;

  /// No description provided for @pornographyReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year: Evidence for Durable Behaviour Change\n\nSource: One-year follow-up effects of an acceptance-based treatment for hypersexuality (2026).\n\nAt one-year follow-up, participants in this acceptance-based treatment study had not returned to their pretreatment levels of hypersexuality. The authors described the findings as preliminary evidence of durable, clinically meaningful benefits, with perceived control over craving among the processes followed over time.\n\nThis is treatment follow-up evidence, not proof of a one-year brain reset. The meaningful claim is better anyway: clinically relevant control can persist for a year rather than disappearing as soon as the initial intervention ends.\n\nA year of your own maintained change is also a large personal dataset. Compare current control, distress, functioning, relationships, and time use with where you started; those are the outcomes that matter clinically.'**
  String get pornographyReferenceDay365;

  /// No description provided for @pornographyReferenceDay1825.
  ///
  /// In en, this message translates to:
  /// **'Five Years: Long-Term Control Is the Outcome\n\nSource: Compulsive sexual behavior disorder and problematic pornography use: a comprehensive interdisciplinary expert-informed review (2026).\n\nModern reviews treat CSBD and problematic pornography use as complex problems involving control, distress, functioning, context, and individual differences. There is no validated five-year brain and nerve reset threshold.\n\nBut five years is not an empty milestone. It is 1,825 days of maintaining the behavioural direction you chose. Because the clinical problem is persistent loss of control with distress or impairment, sustained control and restored functioning over years are meaningful outcomes in their own right.\n\nAt this stage, the useful question is no longer whether your brain has reached a fictional percentage of rewiring. It is whether the old pattern still controls your choices or disrupts the life you want. If it does not, that is a substantive long-term success.'**
  String get pornographyReferenceDay1825;

  /// No description provided for @smokingReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Day One: Benefits Start Now\n\nSource: NHS Better Health\n\nBenefits begin within minutes — not days. The body starts to normalise as soon as the smoke stops.\n\nWhat happens today\n• 20 minutes: pulse rate begins returning to normal\n• 8 hours: carbon monoxide in the blood falls by half; oxygen levels are recovering\n• 48 hours: carbon monoxide has dropped to the level of a non-smoker\n\nCarbon monoxide binds to red blood cells more strongly than oxygen, displacing it from your blood. Every organ was getting less oxygen than it should. That reverses within two days.\n\nWithdrawal begins on day one\n• Cravings — each typically lasting 3–5 minutes\n• Irritability and difficulty concentrating\n• Increased appetite\n\nThese are temporary and manageable. The NHS Better Health programme offers free support including apps and pharmacist advice.'**
  String get smokingReferenceDay1;

  /// No description provided for @smokingReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'Day Three: Peak Withdrawal\n\nSource: McLaughlin, Dani & De Biasi\n\nBy 72 hours, nicotine is gone from your body. The brain built extra nicotine receptors during your smoking years; now they\'re understimulated, causing the withdrawal syndrome.\n\nPeak symptoms\n• Cravings — most intense right now\n• Irritability, frustration, restlessness\n• Difficulty concentrating\n• Anxiety\n• Headaches\n• Increased appetite\n• Coughing (the airways are clearing — a good sign)\n\nThis is the hardest day. It doesn\'t get worse than this — from here the symptoms steadily ease as your brain readjusts.\n\nNRT, varenicline, and bupropion all significantly reduce withdrawal severity at this stage.'**
  String get smokingReferenceDay3;

  /// No description provided for @smokingReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week: Taste and Smell Return\n\nSource: NHS Better Health\n\nReaching one week smoke-free is a strong predictor of long-term success — people who get through the first week are far more likely to quit for good.\n\nWhat\'s recovered\n• Food tastes more flavourful\n• Smells are more vivid\n• Breathing is easier — airways are clearing\n• Circulation is improving\n• Skin is better hydrated\n\nSmoking damages taste and smell receptors directly; within days of stopping, they begin to recover.\n\nThe acute nicotine withdrawal is easing. Physical cravings are shorter and less frequent. Trigger-based cravings may still be present, but the worst of the physical urgency is behind you.'**
  String get smokingReferenceDay7;

  /// No description provided for @smokingReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks: Circulation Improves\n\nSource: NHS Better Health\n\nWithin 2–12 weeks of stopping, blood circulation improves. Nicotine narrows blood vessels with every cigarette; without it, the vessels relax and blood flows more freely.\n\nWhat this means\n• Blood flow to hands, feet, and peripheral tissues improves\n• Many people notice warmer hands and feet\n• Walking and climbing stairs starts to feel easier\n\nWith carbon monoxide already cleared from the blood in the first day and circulation improving now, oxygen reaches muscles more effectively.\n\nThe cilia lining the airways are recovering and pushing out built-up mucus. If you\'re coughing more than usual, it\'s a sign of recovery, not a setback.'**
  String get smokingReferenceDay14;

  /// No description provided for @smokingReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month: Lung Function Climbs\n\nSource: NHS Better Health\n\nBreathing becomes easier and lung function improves — increasing by up to 10% over the 3-to-9-month window. At one month, you\'re well into that recovery curve.\n\nWhat\'s happening in the lungs\n• Cilia have regrown and are clearing mucus more effectively\n• Airway inflammation is settling\n• The persistent smoker\'s cough is fading\n• Exercise tolerance is improving\n\nAny coughs, wheezing and breathing problems improve as lung function increases. One month is a meaningful point on that recovery curve.'**
  String get smokingReferenceDay30;

  /// No description provided for @smokingReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months: Heart Attack Risk Drops\n\nSource: PMC — Cardiovascular Effects of Smoking and Cessation (2024)\n\nSmoking damages the heart and arteries in multiple ways: it accelerates artery plaque buildup, promotes blood clotting, raises blood pressure, and damages the arterial lining. The procoagulant, clot-promoting effects reverse within days of stopping, and this review reports a notable decline in heart attacks and strokes within the first year of quitting.\n\nWhat\'s improved by now\n• Blood clotting factors are normalising\n• Blood pressure and heart rate are stabilising\n• The sharpest early drop in acute cardiovascular event risk is well underway\n\nThe slower-acting benefits — reversing years of arterial plaque buildup — take longer and are covered in later milestones. Every smoke-free month adds to the recovery.'**
  String get smokingReferenceDay90;

  /// No description provided for @smokingReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months: Immune Defences Recover\n\nSource: Smoke-free period and recovery of alveolar immune-cell function (PubMed)\n\nSmoking suppresses the immune cells deep in the lungs, impairing their ability to engulf and kill bacteria. Recovery is gradual — those only 2 months abstinent show the most impairment, while function improves steadily with longer abstinence. By 6 months, pulmonary immune defences have substantially recovered.\n\nWhat this means\nThe lungs can clear inhaled bacteria and particles more effectively, reducing susceptibility to colds, flu, and pneumonia.\n\nImmune defences keep improving beyond six months — but by now the body\'s protection is markedly stronger than it was in those early weeks.'**
  String get smokingReferenceDay180;

  /// No description provided for @smokingReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year: Heart Attack Risk Falls Sharply\n\nSource: PMC — Smoking Cessation and Stroke Outcome; CDC, Benefits of Quitting Smoking\n\nSmoking roughly doubles stroke risk by promoting artery plaque buildup, increasing blood clotting, raising blood pressure, and damaging cerebral blood vessels. The CDC\'s own quitting-benefits timeline puts the sharp drop in heart attack risk at the 1-to-2-year mark — you\'re at the front edge of that window.\n\nRecovery Timeline\nFull stroke-risk normalisation takes longer: the cited stroke study followed quitters for a median of nearly five years to show a meaningfully lower stroke rate than continued smokers, and CDC data puts halved coronary heart disease risk at 3 to 6 years, with stroke risk decreasing over the 5-to-10-year mark.\n\nOne year is still a genuine medical milestone — the steepest part of the acute-risk decline is behind you, even though the longer-term cardiovascular and cancer benefits continue to build for years.'**
  String get smokingReferenceDay365;

  /// No description provided for @smokingReferenceDay1825.
  ///
  /// In en, this message translates to:
  /// **'Five Years: Cancer Risk Falls\n\nSource: CDC, Benefits of Quitting Smoking\n\nAt five years, some of the most dramatic cancer benefits arrive.\n\nFive-to-ten-year milestones\n• Added risk of cancers of the mouth, throat, and voice box: halved\n• Stroke risk: decreasing\n\nStill ahead\n• Ten years: lung cancer death risk roughly halved (after 10–15 years); risk of bladder, oesophagus, and kidney cancers decreasing\n• Fifteen years: coronary heart disease risk close to that of a non-smoker\n• Twenty years: mouth, throat, and voice box cancer risk close to non-smoker levels; added cervical cancer risk about halved\n\nFive years of not smoking is a genuine achievement — you\'re now inside the window where some of the most significant cancer-risk reductions take hold, even though several benefits (like coronary heart disease risk fully normalising) are still years away.'**
  String get smokingReferenceDay1825;

  /// No description provided for @snriReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'SNRI Discontinuation: The First Days\n\nSource: Harvard Health Publishing\n\nImportant Safety Note\nSNRIs should only be stopped under medical supervision following a gradual taper. Venlafaxine (Effexor) in particular has an extremely short half-life of approximately 5 hours, meaning the drug clears from the body very rapidly and discontinuation symptoms can be severe and sudden.\n\nWhy SNRIs Are Harder to Stop Than SSRIs\nSNRIs affect two mood-regulating brain chemicals — serotonin and noradrenaline — meaning both need to readjust when you stop. The discontinuation symptoms are often more intense with SNRIs than SSRIs:\n• Flu-like symptoms (fatigue, sweating, muscle aches)\n• Insomnia and disturbed sleep\n• Nausea — often more pronounced than with SSRIs\n• Imbalance and dizziness\n• Sensory disturbances — \'brain zaps\' can be very intense with venlafaxine\n• Hyperarousal, irritability, and anxiety\n\nComparing SNRIs\nVenlafaxine has the most difficult discontinuation profile due to its short half-life. Duloxetine (Cymbalta) tends to be somewhat easier due to its longer half-life of 12 hours. Desvenlafaxine falls between the two.'**
  String get snriReferenceDay3;

  /// No description provided for @snriReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week After SNRIs: Two Brain-Chemical Systems Adjusting\n\nSource: NHS — Stopping or coming off antidepressants (general antidepressant guidance; the noradrenaline-specific mechanisms below reflect general SNRI pharmacology rather than SNRI-specific detail from the NHS page itself)\n\nThe Dual-System Challenge\nUnlike most antidepressants that affect one system, SNRIs affect both serotonin and noradrenaline. By one week, both systems are adjusting:\n\nNoradrenaline System Effects\nThe noradrenaline system governs the body\'s fight-or-flight response, blood pressure regulation, and energy levels. As it readjusts:\n• Blood pressure fluctuations may occur\n• Anxiety may feel more physical (racing heart, sweating)\n• Energy levels may be inconsistent\n\nSerotonin System Effects\nSimultaneously, the serotonin system is adjusting — producing the withdrawal symptoms typical of stopping any antidepressant. The combination of both systems adjusting can make the first week particularly challenging.\n\nPhysically this often shows as improving blood pressure stability and fewer episodes of dizziness on standing. Emotionally, mood is more variable than it will be at 30 days but no longer in freefall.'**
  String get snriReferenceDay7;

  /// No description provided for @snriReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks After SNRIs: Physical Symptoms Fading\n\nSource: Davies & Read (2019), Addictive Behaviors\n\nTwo-Week Status\nFor most people following a proper taper, the acute physical phase is largely resolved by two weeks:\n• Brain zaps significantly reduced or absent\n• Nausea and flu-like symptoms resolved\n• Dizziness and balance issues improving\n• Blood pressure and heart rate stabilising as noradrenaline rebalances\n\nWhat May Persist\n• Emotional sensitivity and mood variability\n• Anxiety — which the noradrenaline system particularly influences\n• Fatigue, as the noradrenaline system provides alertness and energy\n\nResearch Context\nThe Addictive Behaviors systematic review (Davies & Read, 2019) confirmed that SNRI discontinuation effects are among the most severe of any antidepressant class, with venlafaxine associated with particularly high rates of significant withdrawal symptoms.'**
  String get snriReferenceDay14;

  /// No description provided for @snriReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month After SNRIs: Dual System Stabilising\n\nSource: Davies & Read (2019), Addictive Behaviors — systematic review of antidepressant withdrawal incidence, severity, and duration\n\nThe Stabilisation Phase\nOne month represents a significant milestone in serotonin and noradrenaline recovery. This review found that, while a substantial minority of people experience withdrawal effects lasting beyond a few weeks, most people are well past the acute, most-severe phase of physical discontinuation symptoms by this point.\n\nWhat Typically Improves by One Month\n• Physical discontinuation symptoms (brain zaps, nausea, dizziness) resolved for most\n• Blood pressure returning to natural level\n• Sleep quality improving — REM sleep patterns restoring naturally\n• Energy levels beginning to stabilise as noradrenaline regulation normalises\n\nEmotional Blunting Resolution\nOne of the most commonly reported experiences at this stage is the resolution of emotional blunting — many people on SNRIs notice a \'flattened\' emotional range. As the drug clears and the brain readjusts, emotional range and sensitivity typically returns.'**
  String get snriReferenceDay30;

  /// No description provided for @snriReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months After SNRIs: Well Past Withdrawal\n\nSource: \"Antidepressant Withdrawal Syndrome,\" Therapeutics Letter 112 (2018), Therapeutics Initiative, on the NCBI Bookshelf\n\nWhy SNRIs Deserve Extra Care\nThis evidence review singles out short half-life antidepressants — including venlafaxine and duloxetine (both SNRIs) — as carrying a higher risk of withdrawal symptoms. A manufacturer-funded study found 51% of people stopping duloxetine experienced one or more symptoms. So SNRI withdrawal can be pronounced, which is exactly why a gradual, supervised taper matters.\n\nWhere Three Months Sits\nThe Letter notes withdrawal symptoms \'usually appear within a few days of stopping\' and that \'most antidepressant withdrawal symptoms resolve within 2 weeks\' (occasionally longer). By three months, the acute withdrawal phase is well behind the great majority of people.\n\nRecovery Signal on \'Receptor Recovery\'\nPopular timelines claim the serotonin and noradrenaline systems have \'fully rebalanced\' by three months. The solid evidence concerns the withdrawal syndrome and its timing, not a precise receptor-recovery clock. What\'s dependable: by three months the withdrawal phase has typically resolved, and many people notice the emotional blunting some feel on SNRIs eases after stopping.\n\nWithdrawal Versus Relapse\nThe Letter advises distinguishing withdrawal from a true return of the underlying condition. If anxiety or low mood persists at three months, review it with your prescriber rather than assuming it is only withdrawal.'**
  String get snriReferenceDay90;

  /// No description provided for @snriReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months After SNRIs: Brain and nerve Recovery\n\nRecovery Signal on Six-Month Data\nBy six months after a completed, medically supervised taper, the severe early SNRI withdrawal period is far behind you. Mood, sleep, sexual function, and clear thinking have had months to recover:\n• Serotonin pathways: substantially restored\n• Noradrenaline pathways: normalised, with the stress response system also settling\n• Sleep architecture: expected to be fully restored\n• Sexual function: largely restored for most people (sexual dysfunction is a common SNRI side effect, though for some it can persist and is worth discussing with a prescriber)\n\nResilience to Stress\nMany people at six months report notably improved resilience to everyday stressors as the noradrenaline system\'s role in arousal and stress response — which SNRIs powerfully modulate — settles back to its natural level.'**
  String get snriReferenceDay180;

  /// No description provided for @snriReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year After SNRIs: Recovery Achieved\n\nOne Year: A Complete Dual-System Recovery\nOne year after completing an SNRI taper, both the serotonin and noradrenaline systems have had a complete cycle to adapt and stabilise.\n\nWhat the Evidence Actually Supports at One Year\nThis Therapeutics Letter review notes that documented withdrawal symptoms \'usually appear within a few days of stopping\' and that most resolve within about two weeks — there is no controlled study following people specifically one year after SNRI discontinuation. What\'s well supported by the broader clinical picture at this distance:\n• The majority of those who completed a proper taper and received psychological support remain well\n• The emotional blunting and sexual dysfunction that characterise SNRI use have fully resolved for most people\n• Clear thinking, including the concentration benefits that SNRIs can provide, are maintained through natural brain function\n\nThe Significance of This Milestone\nSuccessfully discontinuing an SNRI — particularly venlafaxine — is a significant achievement. The intensity of the discontinuation process and the commitment required to manage it under medical supervision demonstrates remarkable resilience.'**
  String get snriReferenceDay365;

  /// No description provided for @socialMediaReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Stepping Back From Social Media: Day One\n\nSource: Lambert et al., \"Taking a One-Week Break from Social Media Improves Well-Being, Depression, and Anxiety: A Randomized Controlled Trial,\" Cyberpsychology, Behavior, and Social Networking (2022), on PubMed\n\nWhat the Evidence Shows\nIn this strong controlled study, people were randomly assigned either to take a one-week break from Facebook, Instagram, Twitter, and TikTok or to keep using them as usual. The break group showed significant improvements in well-being and reductions in depression and anxiety. That is real, controlled evidence that stepping back helps.\n\nWhat the Evidence Shows\nCompulsive social-media use is strongly linked to lower mood and higher anxiety, and randomized trials show that deliberately cutting back can improve well-being while reducing depression and anxiety within a week.\n\nDay One: What to Expect\n• Restlessness and an urge to check\n• \'Phantom\' notifications — feeling a buzz that didn\'t happen\n• Boredom as you adjust to less constant stimulation\nThese are normal habit-related sensations, and they are temporary. Recognising the pattern is the first step in changing it.'**
  String get socialMediaReferenceDay1;

  /// No description provided for @socialMediaReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'Three Days Without Social Media: Anxiety and Mood\n\nSource: Lambert et al., \"Taking a One-Week Break from Social Media Improves Well-Being, Depression, and Anxiety: A Randomized Controlled Trial,\" Cyberpsychology, Behavior, and Social Networking (2022), on PubMed\n\nWhy a Break Helps Mood\nIn this controlled trial, people randomly assigned to a one-week break from social media ended the week with lower anxiety and depression and higher well-being than those who kept scrolling. Much of the day-to-day distress of heavy use comes from social comparison — measuring your real life against others\' curated highlight reels — and from the low-grade pull of fear-of-missing-out.\n\nWhat Happens Around 72 Hours\nEarly in a break, the habit is still loud:\n• Strong urges to check, often triggered by routine moments (waking, waiting in line)\n• Some irritability and restlessness\n• For some people, the first easing of comparison-driven anxiety\n• The pre-sleep scroll habit starting to loosen\n\nThe Comparison Trap Loosens\nWithout a constant feed of other people\'s highlights, the comparison that fuels much social-media anxiety has less fuel. The trial\'s results suggest that by the end of the first week these early shifts add up to a measurable improvement in mood — so the discomfort at three days is the hard part of a change that pays off.'**
  String get socialMediaReferenceDay3;

  /// No description provided for @socialMediaReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week Without Social Media: The Measured Payoff\n\nSource: Lambert et al., \"Taking a One-Week Break from Social Media Improves Well-Being, Depression, and Anxiety: A Randomized Controlled Trial,\" Cyberpsychology, Behavior, and Social Networking (2022), on PubMed\n\nExactly One Week — and It Worked\nThis is the milestone the research speaks to most directly: the trial\'s intervention was a one-week break. Compared with people who kept using social media, the break group showed significantly higher well-being and significantly lower depression and anxiety after just seven days. Reaching one week is reaching the point at which a controlled study found real benefit.\n\nWhat People Commonly Notice\nAlongside the measured mood gains, people often report:\n• More reclaimed time — many are surprised how much they had been spending\n• Easier focus, as the habit of constant attention-switching loosens\n• Calmer evenings and easier sleep without the pre-bed scroll\nThese gains fit the broader improvement in well-being measured in the trial.\n\nKeep Going\nOne week is a genuine, evidence-backed milestone. The mood, time, and attention benefits tend to deepen the longer the healthier pattern holds.'**
  String get socialMediaReferenceDay7;

  /// No description provided for @socialMediaReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks Without Social Media: Two-Week Gains\n\nSource: Coyne & Woodruff, \"Taking a Break: The Effects of Partaking in a Two-Week Social Media Digital Detox… among Young Adults,\" Behavioral Sciences (2023), on PubMed Central\n\nAbout This Study\nYoung adults limited social media to about 30 minutes a day for two weeks, with usage tracked objectively on their phones (it fell by roughly 78%). Participants cut social-media use by roughly 78%, giving this milestone a direct real-world test of what happens when use is sharply reduced for two weeks.\n\nWhat Improved\nOver the two weeks, participants showed improvements in:\n• Sleep — both duration and quality\n• Satisfaction with life\n• Stress\n• Perceived wellness\n• Scores on smartphone and social-media addiction scales\nThe measured gains were concrete: longer and better sleep, lower stress, higher life satisfaction and perceived wellness, and lower smartphone/social-media addiction scores.\n\nWatch for Backsliding\nThe researchers also noticed use creeping back toward previous levels afterwards. Two weeks is a real gain, but it highlights why an intentional plan — not just a temporary break — is what keeps the benefits.'**
  String get socialMediaReferenceDay14;

  /// No description provided for @socialMediaReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month Without Social Media: Real Connection Deepens\n\nSource: Coyne & Woodruff, \"Taking a Break: The Effects of Partaking in a Two-Week Social Media Digital Detox… among Young Adults,\" Behavioral Sciences (2023), on PubMed Central\n\nConnection Can Improve When You Step Back\nIt sounds paradoxical — but in this study, cutting social media right back was associated with improvement in supportive relationships, along with better life satisfaction and lower stress. Time and attention that went to the feed became available for the people actually in your life.\n\nWhat One Month Tends to Bring\nBy 30 days, with the automatic pull of checking much weaker, many people find:\n• Conversations are more present and less interrupted\n• More interest in real-world activities and hobbies\n• Self-image leaning less on likes, comments, and follower counts\n\nRecovery Signal\nBy one month, you have sustained the healthier pattern for twice the study\'s intervention window. The sleep, stress, life-satisfaction, wellness, and relationship gains measured at two weeks have had another two weeks to consolidate into routine.\n\nMake the Time Count\nAim to fill freed time with activities that build genuine connection and fulfilment, rather than simply swapping one screen for another.'**
  String get socialMediaReferenceDay30;

  /// No description provided for @socialMediaReferenceDay60.
  ///
  /// In en, this message translates to:
  /// **'Two Months Without Social Media: What the Evidence Supports\n\nSource: Ramadhan et al., \"Impacts of digital social media detox for mental health: A systematic review and meta-analysis,\" Narra J (2024), on PubMed Central\n\nThe Most Reliable Picture\nResearchers combined results from 10 studies, including seven controlled trials. The clearest result was a meaningful reduction in depressive symptoms after people stepped back from social media.\n\nThe Strongest Result\nThe combined research found a clear reduction in depressive symptoms. By two months, you are sustaining the same kind of lower digital exposure that produced that mental-health benefit.\n\nWhat Two Months Can Look Like\nWith less daily comparison and less feed-driven reinforcement, self-image has far less reason to depend on likes, comments, or follower counts, while the strongest pooled evidence points to lower depressive symptoms.\n\nThe Practical Takeaway\nThe evidence rewards intentional, sustained change. Use the two-month point to keep deliberate limits in place rather than drifting back, and to invest in offline sources of meaning and connection.'**
  String get socialMediaReferenceDay60;

  /// No description provided for @socialMediaReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months Without Social Media: A New Normal\n\nSource: Coyne & Woodruff, \"Taking a Break: The Effects of Partaking in a Two-Week Social Media Digital Detox… among Young Adults,\" Behavioral Sciences (2023), on PubMed Central\n\nSleep Is the Standout\nAmong this study\'s clearest findings was improved sleep — both duration and quality — when participants cut social media right back. By three months of a sustained healthier pattern, the late-night scroll that used to eat into sleep has long stopped competing with rest, and better sleep tends to lift mood, focus, and energy with it.\n\nWhat Else Improved\nThe same study found gains in stress, life satisfaction, perceived wellness, and supportive relationships. At three months these are no longer novelties — they have had time to settle into a new normal.\n\nRecovery Signal on Mechanism\nCutting social media sharply improved both sleep duration and sleep quality in the intervention study. Three months of sustaining that pattern turns the late-night-scroll reduction into a durable sleep habit.\n\nPresence and Relationships\nWith the reflex to fill every quiet moment with the phone much weaker, being present — in conversations, meals, and downtime — comes more naturally, and the relationships you have invested in over three months tend to feel stronger for it.'**
  String get socialMediaReferenceDay90;

  /// No description provided for @socialMediaReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months Without Social Media: Measured Recovery\n\nSource: Ramadhan et al., \"Impacts of digital social media detox for mental health: A systematic review and meta-analysis,\" Narra J (2024), on PubMed Central\n\nWhat Meta-Analysis Adds\nCombining 10 studies, including seven controlled trials, researchers found a clear reduction in depressive symptoms after people reduced or paused social media.\n\nWhat It Actually Found\n• Depression: a statistically significant reduction (the clearest, most consistent benefit)\n• Life satisfaction: no significant effect\n• Stress: no significant effect\n• Overall mental well-being: no significant effect\nThe strongest pooled result is clear: digital detox significantly reduces depressive symptoms.\n\nWhy You May Still Feel Broad Benefits\nSix months of reduced feed exposure compounds the practical gains seen in shorter interventions: more available time, less compulsive checking, and a sustained reduction in the digital exposure associated with depressive symptoms.\n\nKeep Control of the Feed\nThe biggest gains come from breaking heavy, passive, compulsive use. By six months, intentional control over social media is the new default rather than the feed controlling your attention.'**
  String get socialMediaReferenceDay180;

  /// No description provided for @socialMediaReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year Without Social Media: A Renegotiated Relationship\n\nSource: Ramadhan et al., \"Impacts of digital social media detox for mental health: A systematic review and meta-analysis,\" Narra J (2024), on PubMed Central\n\nOne Year of Sustained Change\nThe strongest combined research shows that stepping back from social media reduces depressive symptoms. A full year means that lower-exposure pattern has become your normal rather than a short break.\n\nWhat a Year Builds\nA full year gives you hundreds of hours back for real relationships, hobbies, skills, reflection, and creativity. Automatic checking has had a full year to weaken while those offline routines have had a full year to strengthen.\n\nSustained Benefits\nThe clearest measured mental-health gain is lower depressive symptoms. The practical gains — more time, fewer interruptions, and less compulsive checking — compound every day you keep control of the feed.\n\nWhat Comes Next\nA year of deliberate change has reset the relationship. Whether you return to limited, intentional use or stay off entirely, the compulsive loop has been broken — and that is the durable win.'**
  String get socialMediaReferenceDay365;

  /// No description provided for @ssriReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'SSRI Discontinuation: The First Days\n\nSource: Harvard Health Publishing\n\nImportant Safety Note\nSSRIs should only be stopped under medical supervision following a gradual taper. Abrupt cessation — especially after long-term use — significantly increases the severity of discontinuation symptoms.\n\nWhat Is SSRI Discontinuation Syndrome?\nSSRI discontinuation syndrome is a well-documented medical phenomenon that occurs when SSRIs are stopped or substantially reduced. Clinicians use the acronym FINISH to describe the common symptoms:\n• Flu-like symptoms (fatigue, sweating, muscle aches)\n• Insomnia and disturbed sleep\n• Nausea\n• Imbalance and dizziness\n• Sensory disturbances — particularly \'brain zaps\'\n• Hyperarousal, irritability, and anxiety\n\nHalf-Life Matters\nFluoxetine (Prozac) has a very long half-life of 4–6 days, so it effectively self-tapers and produces milder discontinuation effects. Paroxetine (Paxil) has the shortest half-life of the common SSRIs and produces the most intense discontinuation symptoms. Sertraline, citalopram, and escitalopram fall in between.'**
  String get ssriReferenceDay3;

  /// No description provided for @ssriReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week After SSRIs: The Acute Phase\n\nSource: NHS — Stopping or coming off antidepressants\n\nThe Acute Discontinuation Phase\nThe NHS documents that most antidepressant discontinuation symptoms begin within five days of stopping and last for up to six weeks in the majority of cases. By one week, the acute physical symptoms are typically at their most pronounced and beginning to trend downward for those who tapered gradually.\n\nWhat to Expect at One Week\n• Physical symptoms (nausea, dizziness, flu-like feelings) are at their most intense but should be beginning to ease\n• Sleep disturbances including vivid dreams or insomnia are common\n• Emotional lability — rapid mood changes — is frequent at this stage\n• Brain zaps may still be present but typically begin to reduce in frequency\n\nThe Role of Tapering\nThe NHS strongly recommends a slow taper — sometimes over months for long-term users — to minimise discontinuation effects. The Royal College of Psychiatrists has developed tapering guidelines that suggest very gradual dose reductions, often using liquid formulations, for those who have taken SSRIs for extended periods.'**
  String get ssriReferenceDay7;

  /// No description provided for @ssriReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks After SSRIs: Physical Symptoms Resolving\n\nSource: Davies & Read (2019), Addictive Behaviors — \'A systematic review into the incidence, severity and duration of antidepressant withdrawal effects\'\n\nWhat the Research Found\nThis landmark systematic review found that approximately 56% of people who discontinue antidepressants experience withdrawal effects, and 46% of those describe them as severe. For most people following a proper taper, the acute phase is largely resolved by two weeks:\n• Brain zaps significantly reduced or absent\n• Nausea and flu-like symptoms resolved\n• Dizziness and balance issues improving\n• Sleep beginning to normalise\n\nDistinguishing Discontinuation from Relapse\nSymptoms that appear within days of stopping and match the FINISH profile are most likely discontinuation syndrome. Symptoms that emerge after 2–4 weeks and resemble the original condition being treated are more likely relapse. Monitoring this distinction with your prescriber is important.'**
  String get ssriReferenceDay14;

  /// No description provided for @ssriReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month After SSRIs: Stabilisation\n\nSource: Haddad PM (2001), Drug Safety — \'Antidepressant Discontinuation Syndromes\'\n\nThe Stabilisation Phase\nThis review describes discontinuation onset as rapid, typically within days of stopping or reducing an antidepressant, and notes that most reactions are mild and short-lived, resolving without specific treatment. One month represents the transition from that acute window to stabilisation; for most people who completed a gradual taper, the acute discontinuation symptoms are now largely resolved.\n\nEmotional Landscape at One Month\nEmotional changes at one month are variable and important to monitor:\n• Some people feel emotionally \'flatter\' initially as the brain adjusts — this typically improves\n• Others experience emotional vividness they had not felt in years\n• Anxiety levels vary significantly by individual and underlying condition\n\nThe Value of Non-Medication Support\nResearch consistently shows that talking therapy such as CBT (CBT) and other evidence-based psychological therapies are highly effective for the conditions SSRIs treat. The one-month mark is an excellent time to ensure these supports are in place.'**
  String get ssriReferenceDay30;

  /// No description provided for @ssriReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months After SSRIs: Well Past Withdrawal\n\nSource: \"Antidepressant Withdrawal Syndrome,\" Therapeutics Letter 112 (2018), Therapeutics Initiative, on the NCBI Bookshelf\n\nWhere Three Months Sits\nThis evidence review notes that antidepressant withdrawal symptoms \'usually appear within a few days of stopping, or dose reduction,\' and that \'most antidepressant withdrawal symptoms resolve within 2 weeks\' — though severe cases can last weeks to months. By three months, the acute withdrawal phase is well behind the great majority of people.\n\nWhy SSRIs Vary\nWithdrawal is more likely with shorter half-life SSRIs (such as paroxetine) than with long half-life ones (fluoxetine). The Letter is candid that withdrawal reactions can be substantial — two systematic reviews found them \'very similar\' to those from benzodiazepines — and occur in at least a third of people who stop.\n\nRecovery Signal on \'Receptor Recovery\'\nYou may see confident claims that serotonin receptors \'fully resensitise by 2–3 months.\' The robust evidence is about the withdrawal syndrome and its timing, not a precise receptor-recovery clock. What\'s dependable: by three months the withdrawal phase has typically resolved, and many people notice the emotional blunting and sexual side effects some experience on SSRIs ease after stopping.\n\nIf Symptoms Linger\nThe Letter advises distinguishing withdrawal from a genuine return of the underlying condition. If low mood or anxiety persists at three months, that\'s worth reviewing with your prescriber rather than assuming it\'s \'just withdrawal.\''**
  String get ssriReferenceDay90;

  /// No description provided for @ssriReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months After SSRIs: A Grounded View\n\nSource: \"Antidepressant Withdrawal Syndrome,\" Therapeutics Letter 112 (2018), Therapeutics Initiative, on the NCBI Bookshelf\n\nWhat\'s Well-Established by Six Months\nThis review notes that even severe, prolonged withdrawal symptoms typically last weeks to months rather than indefinitely — so by six months the acute withdrawal syndrome has, for the great majority of people, clearly resolved.\n\nBeing Honest About the Rest\nBy six months, the usual withdrawal period is well behind you and the serotonin system has had months to settle. Sexual side effects usually improve after stopping; if they persist, discuss them with your prescriber.\n\nWhat People Commonly Report\n• A wider emotional range compared with being on medication\n• Improved sleep and energy for most\n• Continued gradual improvement, though the pace varies widely between individuals'**
  String get ssriReferenceDay180;

  /// No description provided for @ssriReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year After SSRIs: Measured Recovery\n\nSource: Duffy et al. (2021), Health Technology Assessment — the ANTLER trial\n\nWhat This Trial Actually Found\nANTLER followed long-term antidepressant users in UK primary care who either stayed on medication or discontinued. Over the following year, 56% of those who discontinued relapsed, compared with 39% of those who stayed on medication — roughly double the risk — and the discontinuation group reported somewhat lower quality of life on average.\n\nThe Fuller Picture\nDespite the higher relapse rate, a substantial share of people who discontinued did not relapse and remained well without medication. About a third of those who discontinued eventually restarted their antidepressant — a reasonable clinical choice, not a failure.\n\nA Note on the Future\nDepression and anxiety are chronic conditions for some people. There is no failure in returning to medication if the underlying condition reasserts itself. The goal is wellbeing — and one year of successful discontinuation is a genuine achievement regardless of what comes next.'**
  String get ssriReferenceDay365;

  /// No description provided for @steroidsReferenceDay1.
  ///
  /// In en, this message translates to:
  /// **'Stopping Anabolic Steroids: The First Days\n\nSource: \"Common symptoms associated with usage and cessation of anabolic androgenic steroids in men,\" Best Practice & Research Clinical Endocrinology & Metabolism (2022)\n\nThe Acute Phase\nThis review describes AAS withdrawal as unfolding in two phases. The first, driven by sympathetic nervous system activation rather than hormone levels, appears within 1–2 days of stopping and can include:\n• Headache\n• Tremors\n• Palpitations\n• Nausea\n\nWhy Symptoms Appear\nAnabolic steroids also suppress the body\'s own testosterone production — the brain detects the steroids and shuts off the hormonal signals that normally drive it. That suppression persists after stopping, setting up the second, longer-lasting phase of withdrawal described in later milestones.\n\nA Safety Note\nDepression can emerge during steroid withdrawal and become serious. Seek medical care, and urgent help for any thoughts of self-harm. Clinicians often guide recovery; some use medications to support it.'**
  String get steroidsReferenceDay1;

  /// No description provided for @steroidsReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks Off Anabolic Steroids\n\nSource: \"Common symptoms associated with usage and cessation of anabolic androgenic steroids in men,\" Best Practice & Research Clinical Endocrinology & Metabolism (2022)\n\nThe Chronic Phase Sets In\nBy two weeks, the brief sympathetic symptoms of the first days have typically passed, and the review\'s second phase — driven by ongoing testosterone deficiency — is more prominent:\n• Fatigue and low mood\n• Muscle aches (myalgia)\n• Reduced libido\n• Insomnia and cravings\n\nStill at Low Ebb\nNatural testosterone production takes far longer than two weeks to reset, so this phase is expected rather than a sign something is wrong.\n\nA Known Trap\nSome men return to using specifically to escape this gap — a cycle that resets the recovery clock rather than ending it. Support from a doctor or counsellor helps bridge this phase rather than medicating it with more steroids.'**
  String get steroidsReferenceDay14;

  /// No description provided for @steroidsReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month Off Anabolic Steroids\n\nSource: \"Physical, psychological and biochemical recovery from anabolic steroid-induced hypogonadism: a scoping review,\" on PubMed\n\nRecovery Begins\nAfter stopping, the hormone signals that tell the testes to make testosterone start switching back on. Research puts much of this recovery in the three-to-six-month range, so at one month the process is already underway.\n\nWhat to Expect\nLow mood, libido, and energy commonly persist while hormones climb back. Recovery depends on age and how heavy and prolonged the use was.'**
  String get steroidsReferenceDay30;

  /// No description provided for @steroidsReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months Off Anabolic Steroids\n\nSource: \"Physical, psychological and biochemical recovery from anabolic steroid-induced hypogonadism: a scoping review,\" on PubMed\n\nA Good Time for a Blood Test\nBy three months, the hormone system has had time to show meaningful recovery. This is a useful point to ask your GP to check testosterone and the hormones that control it.\n\nWhat to Expect\nFor many men at three months, levels are climbing but not fully normalised. Mood and libido often improve before testosterone fully catches up. Testicle size and sperm production recover more slowly and can keep improving over the following year. Breast tissue growth (gynaecomastia), where it occurred, is unlikely to reverse without specific treatment.'**
  String get steroidsReferenceDay90;

  /// No description provided for @steroidsReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months Off Anabolic Steroids\n\nSource: \"Physical, psychological and biochemical recovery from anabolic steroid-induced hypogonadism: a scoping review,\" on PubMed\n\nWhere the Evidence Points\nThe review reports that LH and FSH — the hormones that tell the testes to make testosterone — usually recover within about three to six months. By six months, testosterone itself is well along its recovery path too.\n\nIf You\'re Not There Yet\nIf low-testosterone symptoms are still present at six months, an endocrinologist can check what is happening and discuss treatment rather than leaving you to wait.'**
  String get steroidsReferenceDay180;

  /// No description provided for @steroidsReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year Off Anabolic Steroids\n\nSource: \"Anabolic androgenic steroid-induced hypogonadism, a reversible condition in male individuals? A systematic review,\" on PubMed\n\nA Year Free\nA year off gives the hormone system a long recovery window. Testosterone, mood, libido, natural strength, and heart health have all had substantial time to recover.\n\nThe Long-Term Picture\nIf low-testosterone symptoms are still present at one year, specialist hormone assessment is the right next step. Staying off steroids protects the recovery already made.'**
  String get steroidsReferenceDay365;

  /// No description provided for @steroidsReferenceDay730.
  ///
  /// In en, this message translates to:
  /// **'Two Years Off Anabolic Steroids\n\nSource: \"Anabolic androgenic steroid-induced hypogonadism, a reversible condition in male individuals? A systematic review,\" on PubMed\n\nA New Normal\nBy two years, your hormone levels reflect your body\'s natural production. For most men who recover, mood, libido, strength, and motivation are stable without steroids.\n\nLong-Term Hormone Recovery\nResearch shows testosterone recovering over months, while the hormones that signal the testes usually recover within three to six months. Testicle size, sperm production, and libido can keep improving over months to years. At two years, persistent low-testosterone symptoms belong with a specialist, not another steroid cycle.'**
  String get steroidsReferenceDay730;

  /// No description provided for @tcaReferenceDay3.
  ///
  /// In en, this message translates to:
  /// **'TCA Discontinuation: The First Days — Acetylcholine Rebound\n\nSource: Dilsaver, Feinberg & Greden (1983), American Journal of Psychiatry — \'Antidepressant withdrawal symptoms treated with anticholinergic agents\' (case report, 3 patients)\n\nWhat Makes TCA Discontinuation Different\nTricyclic antidepressants differ fundamentally from SSRIs and SNRIs in their mechanism. In addition to blocking serotonin and norepinephrine reuptake, TCAs strongly block the body\'s acetylcholine system. When you stop, that system bounces back.\n\nAcetylcholine Rebound Symptoms\nUnlike SSRI discontinuation, TCA withdrawal produces an acetylcholine rebound:\n• Nausea, vomiting, and diarrhoea\n• Excessive salivation and sweating\n• Headache and muscle aches\n• Insomnia with vivid or disturbing dreams\n• Anxiety and restlessness\n\nCommon TCAs and Their Profiles\nAmitriptyline and imipramine have the strongest acetylcholine-blocking effects and typically produce the most pronounced rebound. Nortriptyline has somewhat milder effects. Clomipramine also has significant serotonin-related effects alongside its acetylcholine-blocking profile.'**
  String get tcaReferenceDay3;

  /// No description provided for @tcaReferenceDay7.
  ///
  /// In en, this message translates to:
  /// **'One Week After TCAs: Acetylcholine Symptoms Easing\n\nThe Acetylcholine Recovery\nThe acetylcholine rebound typically reaches its peak within the first few days and begins to ease substantially by one week. As the acetylcholine system returns toward its natural level:\n\nWhat\'s Improving\n• Gastrointestinal symptoms (nausea, cramping, diarrhoea) are reducing\n• Sweating and flu-like symptoms are easing\n• Sleep, though still disrupted, is beginning to stabilise\n• The excessive salivation is resolving\n\nAutomatic body Nervous System\nTCAs affect the body\'s automatic functions — heart rate, blood pressure, digestion — through several mechanisms. By one week, the most intense automatic body symptoms — including dizziness when standing and rapid heart rate changes — is beginning to resolve as the nervous system readjusts.'**
  String get tcaReferenceDay7;

  /// No description provided for @tcaReferenceDay14.
  ///
  /// In en, this message translates to:
  /// **'Two Weeks After TCAs: Antiacetylcholine Effects Reversing\n\nThe Antiacetylcholine Burden Lifts\nTCAs impose significant acetylcholine-blocking effects on the body that affect multiple systems. As this burden lifts over the first two weeks:\n\nPhysical Benefits\n• Dry mouth resolving — salivary gland function returning to normal\n• Constipation resolving — bowel motility naturally restored\n• Urinary function normalising — the urinary retention that TCAs can cause is resolving\n• Blurred vision clearing — eyes adjusting normally to light again\n\nThinking and Memory Benefits\nAcetylcholine is essential for memory, attention, and learning. The acetylcholine pathways suppressed by TCAs are recovering:\n• Working memory improving\n• Processing speed increasing\n• Mental clarity returning\n\nMany people are surprised by how much brain fog and memory trouble they had adapted to while taking TCAs.'**
  String get tcaReferenceDay14;

  /// No description provided for @tcaReferenceDay30.
  ///
  /// In en, this message translates to:
  /// **'One Month After TCAs: Automatic body Nervous System Stabilising\n\nHeart Recovery\nTCAs affect heart rhythm during use through their action on both the acetylcholine and adrenaline-related nervous systems. The clinical literature on TCA discontinuation confirms that acute withdrawal symptoms — including the automatic body effects driven by this \'acetylcholine and adrenaline-related overdrive\' — are typically mild and resolve within one to two weeks of stopping. By one month, most people are well past this acute window, and can expect:\n• Heart rhythm settling back toward its pre-medication starting level\n• Heart rate variability trending toward natural levels\n• Blood pressure regulation, previously affected by the drug\'s action on adrenaline pathways, continuing to stabilise\n\nSleep Architecture Restoration\nTCAs strongly suppress dream sleep. As the antiacetylcholine effect wears off (acetylcholine is needed for dream sleep):\n• REM sleep is returning, often producing a surge of vivid dreams as dream sleep returns\n• Slow-wave (deep) sleep is improving\n• Overall sleep quality and restoration is meaningfully better than during TCA use'**
  String get tcaReferenceDay30;

  /// No description provided for @tcaReferenceDay90.
  ///
  /// In en, this message translates to:
  /// **'Three Months After TCAs: Leaving the Real Risks Behind\n\nWhat the Evidence Shows\nA 2024 meta-analysis of 103 randomised trials (10,590 participants) found that, compared with placebo, TCAs do reduce depressive symptoms — but also come with nearly triple the odds of a serious adverse event (odds ratio 2.78). The trials themselves only followed people for up to 12 weeks on-treatment, so there\'s no controlled long-term data on what happens after stopping. Everything below reflects general clinical understanding of TCA pharmacology, not a specific finding from this trial evidence.\n\nThe Multi-System Recovery\nTCAs affect a broader range of brain chemical systems than SSRIs or SNRIs:\n• Serotonin system: adjusting\n• Noradrenaline system: adjusting\n• Acetylcholine system: settling back to normal\n• Histamine system: the antihistamine-like sedation has resolved\n\nAt three months, all of these systems have had substantial time to recover, and — just as importantly — the elevated serious-adverse-event risk that comes with active TCA treatment is behind you. Many people notice:\n• Improved clear thinking — particularly memory and attention\n• Better mood stability\n• Improved energy and motivation\n• Reduced sedation and improved alertness'**
  String get tcaReferenceDay90;

  /// No description provided for @tcaReferenceDay180.
  ///
  /// In en, this message translates to:
  /// **'Six Months After TCAs: Heart and Thinking Recovery\n\nRecovery Signal on Long-Term Data\nThe early withdrawal period after TCAs is usually mild and resolves within one to two weeks. By six months after a supervised taper, the heart-rate, memory, and thinking effects of TCAs have had months to recover.\n\nCardiovascular Recovery\nBy six months, TCAs\' direct effects on heart rhythm should be long resolved:\n• Normal heart rhythm maintained without drug-driven influence\n• Heart rate variability (a measure of how well your heart adapts) expected to be substantially improved\n• Dizziness on standing fully resolved\n\nThinking and Memory Recovery\nTCAs can cause brain fog and memory problems by blocking acetylcholine, especially in older adults. Those effects improve after the drug is stopped. At six months:\n• Memory consolidation substantially improved\n• Processing speed normalised\n• Planning, working memory, and the ability to switch between tasks or ideas are meaningfully recovered'**
  String get tcaReferenceDay180;

  /// No description provided for @tcaReferenceDay365.
  ///
  /// In en, this message translates to:
  /// **'One Year After TCAs: Recovery Achieved\n\nOne Year: Complete Multi-System Recovery\nThis review of antidepressant discontinuation syndromes — covering TCAs, MAOIs, SSRIs, and others — found that withdrawal symptoms typically begin within days of stopping and, left untreated, resolve on their own within days to a couple of weeks. There\'s no study that specifically re-measures TCA-affected systems a year out, but a year after completing a taper is many months beyond even the longest reported discontinuation symptoms, so all affected brain chemical systems — serotonin, noradrenaline, acetylcholine, and histamine — can be expected to have had a complete cycle to normalise.\n\nThe Significance of TCA Recovery\nTCAs impose a broader drug-driven burden than newer antidepressants, affecting more receptor systems simultaneously. Successful discontinuation represents the recovery of multiple systems:\n• Complete reversal of the memory and thinking impairment caused by TCAs\' acetylcholine blocking\n• Full heart recovery\n• Natural brain chemical regulation restored across all affected pathways\n\nOne year of successful self-regulation after TCA discontinuation represents a genuine achievement — both in the management of the discontinuation process and in the maintenance of wellbeing without drug-driven support.'**
  String get tcaReferenceDay365;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'ja',
    'ru',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'ja':
      return AppLocalizationsJa();
    case 'ru':
      return AppLocalizationsRu();
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
