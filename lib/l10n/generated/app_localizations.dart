import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('fr'),
    Locale('es'),
    Locale('ar'),
    Locale('zh'),
    Locale('pt'),
    Locale('it'),
    Locale('de'),
    Locale('ja'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Multilingual Flutter App'**
  String get appTitle;

  /// Navigation menu item for home
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navigationHome;

  /// Navigation menu item for team
  ///
  /// In en, this message translates to:
  /// **'Our Team'**
  String get navigationTeam;

  /// Navigation menu item for pricing
  ///
  /// In en, this message translates to:
  /// **'Pricing'**
  String get navigationPricing;

  /// Navigation menu item for contacts
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get navigationContacts;

  /// Main title on home section
  ///
  /// In en, this message translates to:
  /// **'Welcome to Our Company'**
  String get homeTitle;

  /// Subtitle on home section
  ///
  /// In en, this message translates to:
  /// **'We provide exceptional services and solutions to help your business grow and succeed in today\'s competitive market.'**
  String get homeSubtitle;

  /// Call to action button text
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get homeCta;

  /// Team section title
  ///
  /// In en, this message translates to:
  /// **'Our Team'**
  String get teamTitle;

  /// CEO job title
  ///
  /// In en, this message translates to:
  /// **'CEO & Founder'**
  String get teamCeo;

  /// CTO job title
  ///
  /// In en, this message translates to:
  /// **'CTO'**
  String get teamCto;

  /// Lead Developer job title
  ///
  /// In en, this message translates to:
  /// **'Lead Developer'**
  String get teamLead;

  /// Pricing section title
  ///
  /// In en, this message translates to:
  /// **'Pricing Plans'**
  String get pricingTitle;

  /// Basic pricing plan name
  ///
  /// In en, this message translates to:
  /// **'Basic'**
  String get pricingBasic;

  /// Pro pricing plan name
  ///
  /// In en, this message translates to:
  /// **'Pro'**
  String get pricingPro;

  /// Enterprise pricing plan name
  ///
  /// In en, this message translates to:
  /// **'Enterprise'**
  String get pricingEnterprise;

  /// Per month pricing suffix
  ///
  /// In en, this message translates to:
  /// **'/month'**
  String get pricingMonth;

  /// Choose plan button text
  ///
  /// In en, this message translates to:
  /// **'Choose Plan'**
  String get pricingChoose;

  /// Contact section title
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactTitle;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactEmail;

  /// Message field label
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get contactMessage;

  /// Send button text
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get contactSend;

  /// Success message after form submission
  ///
  /// In en, this message translates to:
  /// **'Message sent successfully!'**
  String get contactSuccess;

  /// Email field hint text
  ///
  /// In en, this message translates to:
  /// **'your@email.com'**
  String get contactEmailHint;

  /// Message field hint text
  ///
  /// In en, this message translates to:
  /// **'Your message here...'**
  String get contactMessageHint;
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
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'it',
    'ja',
    'pt',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'pt':
      return AppLocalizationsPt();
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
