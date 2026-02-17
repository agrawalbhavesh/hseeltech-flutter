import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
    Locale('ar'),
    Locale('en')
  ];

  /// common.back
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// common.next
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get commonNext;

  /// common.skip
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get commonSkip;

  /// common.done
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get commonDone;

  /// common.save
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// common.cancel
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// common.confirm
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get commonConfirm;

  /// common.close
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// common.search
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get commonSearch;

  /// common.filter
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get commonFilter;

  /// common.viewAll
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get commonViewAll;

  /// common.loading
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get commonLoading;

  /// common.retry
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// common.sar
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get commonSar;

  /// common.comingSoon
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get commonComingSoon;

  /// common.featureComingSoon
  ///
  /// In en, this message translates to:
  /// **'This feature is coming soon!'**
  String get commonFeatureComingSoon;

  /// common.download
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get commonDownload;

  /// common.share
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get commonShare;

  /// common.delete
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// common.edit
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get commonEdit;

  /// common.yes
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get commonYes;

  /// common.no
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get commonNo;

  /// common.ok
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get commonOk;

  /// common.error
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get commonError;

  /// common.success
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get commonSuccess;

  /// common.warning
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get commonWarning;

  /// common.info
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get commonInfo;

  /// common.noData
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get commonNoData;

  /// common.seeMore
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get commonSeeMore;

  /// common.seeLess
  ///
  /// In en, this message translates to:
  /// **'See Less'**
  String get commonSeeLess;

  /// nav.home
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// nav.explore
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get navExplore;

  /// nav.portfolio
  ///
  /// In en, this message translates to:
  /// **'Investments'**
  String get navPortfolio;

  /// nav.rewards
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get navRewards;

  /// nav.profile
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// splash.title
  ///
  /// In en, this message translates to:
  /// **'Hseeltech'**
  String get splashTitle;

  /// splash.subtitle
  ///
  /// In en, this message translates to:
  /// **'Real Estate Investment Made Simple'**
  String get splashSubtitle;

  /// onboarding.slide1.title
  ///
  /// In en, this message translates to:
  /// **'Invest in Premium Real Estate'**
  String get onboardingSlide1Title;

  /// onboarding.slide1.desc
  ///
  /// In en, this message translates to:
  /// **'Access exclusive Saudi real estate opportunities starting from just 500 SAR'**
  String get onboardingSlide1Desc;

  /// onboarding.slide2.title
  ///
  /// In en, this message translates to:
  /// **'Fractional Ownership'**
  String get onboardingSlide2Title;

  /// onboarding.slide2.desc
  ///
  /// In en, this message translates to:
  /// **'Own tokens in premium properties and earn rental income proportionally'**
  String get onboardingSlide2Desc;

  /// onboarding.slide3.title
  ///
  /// In en, this message translates to:
  /// **'Track Your Portfolio'**
  String get onboardingSlide3Title;

  /// onboarding.slide3.desc
  ///
  /// In en, this message translates to:
  /// **'Monitor your investments, returns, and property performance in real-time'**
  String get onboardingSlide3Desc;

  /// onboarding.getStarted
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// onboarding.login
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Log in'**
  String get onboardingLogin;

  /// welcome.title
  ///
  /// In en, this message translates to:
  /// **'Welcome to Hseeltech'**
  String get welcomeTitle;

  /// welcome.subtitle
  ///
  /// In en, this message translates to:
  /// **'Real Estate Investment Made Simple'**
  String get welcomeSubtitle;

  /// welcome.desc
  ///
  /// In en, this message translates to:
  /// **'Invest in premium Saudi real estate starting from just 500 SAR. Build your portfolio with fractional ownership.'**
  String get welcomeDesc;

  /// welcome.feature1
  ///
  /// In en, this message translates to:
  /// **'Explore real estate opportunities'**
  String get welcomeFeature1;

  /// welcome.feature2
  ///
  /// In en, this message translates to:
  /// **'Premium Saudi real estate'**
  String get welcomeFeature2;

  /// welcome.feature3
  ///
  /// In en, this message translates to:
  /// **'Growing investor community'**
  String get welcomeFeature3;

  /// welcome.continue
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get welcomeContinue;

  /// welcome.switchLang
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get welcomeSwitchLang;

  /// register.title
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registerTitle;

  /// register.subtitle
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to get started'**
  String get registerSubtitle;

  /// register.phone
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get registerPhone;

  /// register.phonePlaceholder
  ///
  /// In en, this message translates to:
  /// **'+966 5XX XXX XXXX'**
  String get registerPhonePlaceholder;

  /// register.sendOTP
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get registerSendOTP;

  /// register.verifyOTP
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get registerVerifyOTP;

  /// register.otpSent
  ///
  /// In en, this message translates to:
  /// **'OTP sent to your phone'**
  String get registerOtpSent;

  /// register.enterOTP
  ///
  /// In en, this message translates to:
  /// **'Enter the 4-digit code'**
  String get registerEnterOTP;

  /// register.resendOTP
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get registerResendOTP;

  /// register.resendIn
  ///
  /// In en, this message translates to:
  /// **'Resend in {seconds}s'**
  String registerResendIn(Object seconds);

  /// register.termsAgree
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our'**
  String get registerTermsAgree;

  /// register.termsLink
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get registerTermsLink;

  /// register.privacyLink
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get registerPrivacyLink;

  /// register.and
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get registerAnd;

  /// register.login
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get registerLogin;

  /// register.loginSubtitle
  ///
  /// In en, this message translates to:
  /// **'Welcome back! Enter your phone number'**
  String get registerLoginSubtitle;

  /// pin.createTitle
  ///
  /// In en, this message translates to:
  /// **'Create PIN'**
  String get pinCreateTitle;

  /// pin.createSubtitle
  ///
  /// In en, this message translates to:
  /// **'Set a 4-digit PIN to secure your account'**
  String get pinCreateSubtitle;

  /// pin.confirmTitle
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN'**
  String get pinConfirmTitle;

  /// pin.confirmSubtitle
  ///
  /// In en, this message translates to:
  /// **'Re-enter your 4-digit PIN'**
  String get pinConfirmSubtitle;

  /// pin.enterTitle
  ///
  /// In en, this message translates to:
  /// **'Enter PIN'**
  String get pinEnterTitle;

  /// pin.enterSubtitle
  ///
  /// In en, this message translates to:
  /// **'Enter your 4-digit PIN to continue'**
  String get pinEnterSubtitle;

  /// pin.forgotPin
  ///
  /// In en, this message translates to:
  /// **'Forgot PIN?'**
  String get pinForgotPin;

  /// nafath.title
  ///
  /// In en, this message translates to:
  /// **'Nafath Verification'**
  String get nafathTitle;

  /// nafath.subtitle
  ///
  /// In en, this message translates to:
  /// **'Verify your identity through Nafath'**
  String get nafathSubtitle;

  /// nafath.instructions
  ///
  /// In en, this message translates to:
  /// **'Open the Nafath app and approve the verification request'**
  String get nafathInstructions;

  /// nafath.code
  ///
  /// In en, this message translates to:
  /// **'Your verification number'**
  String get nafathCode;

  /// nafath.waiting
  ///
  /// In en, this message translates to:
  /// **'Waiting for approval...'**
  String get nafathWaiting;

  /// nafath.approved
  ///
  /// In en, this message translates to:
  /// **'Identity verified successfully!'**
  String get nafathApproved;

  /// nafath.openApp
  ///
  /// In en, this message translates to:
  /// **'Open Nafath App'**
  String get nafathOpenApp;

  /// nafath.idNumber
  ///
  /// In en, this message translates to:
  /// **'National ID / Iqama Number'**
  String get nafathIdNumber;

  /// kyc.title
  ///
  /// In en, this message translates to:
  /// **'Complete Your Profile'**
  String get kycTitle;

  /// kyc.subtitle
  ///
  /// In en, this message translates to:
  /// **'We need a few more details to get you started'**
  String get kycSubtitle;

  /// kyc.step1
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get kycStep1;

  /// kyc.step2
  ///
  /// In en, this message translates to:
  /// **'Employment Details'**
  String get kycStep2;

  /// kyc.step3
  ///
  /// In en, this message translates to:
  /// **'Investment Experience'**
  String get kycStep3;

  /// kyc.step4
  ///
  /// In en, this message translates to:
  /// **'Risk Assessment'**
  String get kycStep4;

  /// kyc.fullName
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get kycFullName;

  /// kyc.dob
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get kycDob;

  /// kyc.nationality
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get kycNationality;

  /// kyc.address
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get kycAddress;

  /// kyc.city
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get kycCity;

  /// kyc.employer
  ///
  /// In en, this message translates to:
  /// **'Employer'**
  String get kycEmployer;

  /// kyc.jobTitle
  ///
  /// In en, this message translates to:
  /// **'Job Title'**
  String get kycJobTitle;

  /// kyc.income
  ///
  /// In en, this message translates to:
  /// **'Annual Income'**
  String get kycIncome;

  /// kyc.experience
  ///
  /// In en, this message translates to:
  /// **'Investment Experience'**
  String get kycExperience;

  /// kyc.riskLevel
  ///
  /// In en, this message translates to:
  /// **'Risk Tolerance'**
  String get kycRiskLevel;

  /// kyc.submit
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get kycSubmit;

  /// biometric.title
  ///
  /// In en, this message translates to:
  /// **'Enable Biometric Login'**
  String get biometricTitle;

  /// biometric.subtitle
  ///
  /// In en, this message translates to:
  /// **'Use Face ID or fingerprint for quick access'**
  String get biometricSubtitle;

  /// biometric.enable
  ///
  /// In en, this message translates to:
  /// **'Enable Biometric'**
  String get biometricEnable;

  /// biometric.skip
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get biometricSkip;

  /// biometric.faceId
  ///
  /// In en, this message translates to:
  /// **'Face ID'**
  String get biometricFaceId;

  /// biometric.fingerprint
  ///
  /// In en, this message translates to:
  /// **'Fingerprint'**
  String get biometricFingerprint;

  /// home.greeting
  ///
  /// In en, this message translates to:
  /// **'Hello 👋'**
  String get homeGreeting;

  /// home.totalPortfolio
  ///
  /// In en, this message translates to:
  /// **'Total Portfolio'**
  String get homeTotalPortfolio;

  /// home.totalReturn
  ///
  /// In en, this message translates to:
  /// **'Total Return'**
  String get homeTotalReturn;

  /// home.quickActions
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get homeQuickActions;

  /// home.deposit
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get homeDeposit;

  /// home.withdraw
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get homeWithdraw;

  /// home.wallet
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get homeWallet;

  /// home.referFriend
  ///
  /// In en, this message translates to:
  /// **'Refer'**
  String get homeReferFriend;

  /// home.availableOpportunities
  ///
  /// In en, this message translates to:
  /// **'Available Opportunities'**
  String get homeAvailableOpportunities;

  /// home.viewAll
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get homeViewAll;

  /// home.funded
  ///
  /// In en, this message translates to:
  /// **'{percent}% Funded'**
  String homeFunded(Object percent);

  /// home.annualReturn
  ///
  /// In en, this message translates to:
  /// **'{percent}% Annual Return'**
  String homeAnnualReturn(Object percent);

  /// home.minInvestment
  ///
  /// In en, this message translates to:
  /// **'Min. {amount} SAR'**
  String homeMinInvestment(Object amount);

  /// home.viewDetails
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get homeViewDetails;

  /// home.notifications
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get homeNotifications;

  /// explore.title
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get exploreTitle;

  /// explore.subtitle
  ///
  /// In en, this message translates to:
  /// **'Discover investment opportunities'**
  String get exploreSubtitle;

  /// explore.searchPlaceholder
  ///
  /// In en, this message translates to:
  /// **'Search properties...'**
  String get exploreSearchPlaceholder;

  /// explore.filterAll
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get exploreFilterAll;

  /// explore.filterActive
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get exploreFilterActive;

  /// explore.filterUpcoming
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get exploreFilterUpcoming;

  /// explore.filterCompleted
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get exploreFilterCompleted;

  /// explore.sortBy
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get exploreSortBy;

  /// explore.sortNewest
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get exploreSortNewest;

  /// explore.sortReturn
  ///
  /// In en, this message translates to:
  /// **'Highest Return'**
  String get exploreSortReturn;

  /// explore.sortFunding
  ///
  /// In en, this message translates to:
  /// **'Most Funded'**
  String get exploreSortFunding;

  /// explore.noResults
  ///
  /// In en, this message translates to:
  /// **'No opportunities found'**
  String get exploreNoResults;

  /// explore.properties
  ///
  /// In en, this message translates to:
  /// **'Properties'**
  String get exploreProperties;

  /// explore.viewReport
  ///
  /// In en, this message translates to:
  /// **'View Report'**
  String get exploreViewReport;

  /// explore.fullyFunded
  ///
  /// In en, this message translates to:
  /// **'Fully Funded'**
  String get exploreFullyFunded;

  /// explore.targetReturn
  ///
  /// In en, this message translates to:
  /// **'Target Return'**
  String get exploreTargetReturn;

  /// explore.location
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get exploreLocation;

  /// explore.propertyType
  ///
  /// In en, this message translates to:
  /// **'Property Type'**
  String get explorePropertyType;

  /// detail.investNow
  ///
  /// In en, this message translates to:
  /// **'Invest Now'**
  String get detailInvestNow;

  /// detail.overview
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get detailOverview;

  /// detail.financials
  ///
  /// In en, this message translates to:
  /// **'Financials'**
  String get detailFinancials;

  /// detail.location
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get detailLocation;

  /// detail.documents
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get detailDocuments;

  /// detail.gallery
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get detailGallery;

  /// detail.propertyType
  ///
  /// In en, this message translates to:
  /// **'Property Type'**
  String get detailPropertyType;

  /// detail.totalValue
  ///
  /// In en, this message translates to:
  /// **'Total Value'**
  String get detailTotalValue;

  /// detail.tokenPrice
  ///
  /// In en, this message translates to:
  /// **'Token Price'**
  String get detailTokenPrice;

  /// detail.availableShares
  ///
  /// In en, this message translates to:
  /// **'Available Tokens'**
  String get detailAvailableShares;

  /// detail.totalShares
  ///
  /// In en, this message translates to:
  /// **'Total Tokens'**
  String get detailTotalShares;

  /// detail.expectedReturn
  ///
  /// In en, this message translates to:
  /// **'Expected Annual Return'**
  String get detailExpectedReturn;

  /// detail.fundingProgress
  ///
  /// In en, this message translates to:
  /// **'Funding Progress'**
  String get detailFundingProgress;

  /// detail.investors
  ///
  /// In en, this message translates to:
  /// **'Investors'**
  String get detailInvestors;

  /// detail.minInvestment
  ///
  /// In en, this message translates to:
  /// **'Minimum Investment'**
  String get detailMinInvestment;

  /// detail.closingDate
  ///
  /// In en, this message translates to:
  /// **'Closing Date'**
  String get detailClosingDate;

  /// detail.propertySize
  ///
  /// In en, this message translates to:
  /// **'Property Size'**
  String get detailPropertySize;

  /// detail.bedrooms
  ///
  /// In en, this message translates to:
  /// **'Bedrooms'**
  String get detailBedrooms;

  /// detail.bathrooms
  ///
  /// In en, this message translates to:
  /// **'Bathrooms'**
  String get detailBathrooms;

  /// detail.yearBuilt
  ///
  /// In en, this message translates to:
  /// **'Year Built'**
  String get detailYearBuilt;

  /// detail.viewFullReport
  ///
  /// In en, this message translates to:
  /// **'View Full Report'**
  String get detailViewFullReport;

  /// detail.fullyFundedClosed
  ///
  /// In en, this message translates to:
  /// **'Fully Funded — Closed'**
  String get detailFullyFundedClosed;

  /// detail.completedBadge
  ///
  /// In en, this message translates to:
  /// **'Fully Funded'**
  String get detailCompletedBadge;

  /// detail.riskDisclosure
  ///
  /// In en, this message translates to:
  /// **'Risk Disclosure'**
  String get detailRiskDisclosure;

  /// detail.expectedReturns
  ///
  /// In en, this message translates to:
  /// **'Expected Returns'**
  String get detailExpectedReturns;

  /// detail.notGuaranteed
  ///
  /// In en, this message translates to:
  /// **'estimates, not guaranteed'**
  String get detailNotGuaranteed;

  /// detail.aboutArea
  ///
  /// In en, this message translates to:
  /// **'About the Area'**
  String get detailAboutArea;

  /// detail.nearbyLandmarks
  ///
  /// In en, this message translates to:
  /// **'Nearby Landmarks'**
  String get detailNearbyLandmarks;

  /// detail.savedToFavorites
  ///
  /// In en, this message translates to:
  /// **'Saved to favorites'**
  String get detailSavedToFavorites;

  /// detail.removedFromFavorites
  ///
  /// In en, this message translates to:
  /// **'Removed from favorites'**
  String get detailRemovedFromFavorites;

  /// opportunityCard.title
  ///
  /// In en, this message translates to:
  /// **'Available Opportunities'**
  String get opportunityCardTitle;

  /// opportunityCard.subtitle
  ///
  /// In en, this message translates to:
  /// **'Browse all investment opportunities'**
  String get opportunityCardSubtitle;

  /// invest.title
  ///
  /// In en, this message translates to:
  /// **'Invest'**
  String get investTitle;

  /// invest.selectAmount
  ///
  /// In en, this message translates to:
  /// **'Select Amount'**
  String get investSelectAmount;

  /// invest.tokens
  ///
  /// In en, this message translates to:
  /// **'Tokens'**
  String get investTokens;

  /// invest.totalAmount
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get investTotalAmount;

  /// invest.paymentMethod
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get investPaymentMethod;

  /// invest.walletBalance
  ///
  /// In en, this message translates to:
  /// **'Wallet Balance'**
  String get investWalletBalance;

  /// invest.bankTransfer
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get investBankTransfer;

  /// invest.review
  ///
  /// In en, this message translates to:
  /// **'Review Investment'**
  String get investReview;

  /// invest.confirmInvestment
  ///
  /// In en, this message translates to:
  /// **'Confirm Investment'**
  String get investConfirmInvestment;

  /// invest.processing
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get investProcessing;

  /// invest.summary
  ///
  /// In en, this message translates to:
  /// **'Investment Summary'**
  String get investSummary;

  /// invest.property
  ///
  /// In en, this message translates to:
  /// **'Property'**
  String get investProperty;

  /// invest.amount
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get investAmount;

  /// invest.tokensCount
  ///
  /// In en, this message translates to:
  /// **'Number of Tokens'**
  String get investTokensCount;

  /// invest.estimatedReturn
  ///
  /// In en, this message translates to:
  /// **'Estimated Annual Return'**
  String get investEstimatedReturn;

  /// invest.agreeTerms
  ///
  /// In en, this message translates to:
  /// **'I agree to the investment terms and risk disclosure'**
  String get investAgreeTerms;

  /// investSuccess.title
  ///
  /// In en, this message translates to:
  /// **'Investment Successful!'**
  String get investSuccessTitle;

  /// investSuccess.subtitle
  ///
  /// In en, this message translates to:
  /// **'Congratulations! Your investment has been confirmed.'**
  String get investSuccessSubtitle;

  /// investSuccess.viewInvestment
  ///
  /// In en, this message translates to:
  /// **'View Investment'**
  String get investSuccessViewInvestment;

  /// investSuccess.backToHome
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get investSuccessBackToHome;

  /// portfolio.title
  ///
  /// In en, this message translates to:
  /// **'My Investments'**
  String get portfolioTitle;

  /// portfolio.totalValue
  ///
  /// In en, this message translates to:
  /// **'Total Portfolio Value'**
  String get portfolioTotalValue;

  /// portfolio.totalReturn
  ///
  /// In en, this message translates to:
  /// **'Total Return'**
  String get portfolioTotalReturn;

  /// portfolio.investments
  ///
  /// In en, this message translates to:
  /// **'Investments'**
  String get portfolioInvestments;

  /// portfolio.filterAll
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get portfolioFilterAll;

  /// portfolio.filterProcessing
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get portfolioFilterProcessing;

  /// portfolio.filterConfirmed
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get portfolioFilterConfirmed;

  /// portfolio.statusProcessing
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get portfolioStatusProcessing;

  /// portfolio.statusConfirmed
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get portfolioStatusConfirmed;

  /// portfolio.tokensOwned
  ///
  /// In en, this message translates to:
  /// **'Tokens Owned'**
  String get portfolioTokensOwned;

  /// portfolio.currentValue
  ///
  /// In en, this message translates to:
  /// **'Current Value'**
  String get portfolioCurrentValue;

  /// portfolio.returnRate
  ///
  /// In en, this message translates to:
  /// **'Return Rate'**
  String get portfolioReturnRate;

  /// portfolio.viewDetails
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get portfolioViewDetails;

  /// portfolio.noInvestments
  ///
  /// In en, this message translates to:
  /// **'No investments yet'**
  String get portfolioNoInvestments;

  /// portfolio.startInvesting
  ///
  /// In en, this message translates to:
  /// **'Start Investing'**
  String get portfolioStartInvesting;

  /// portfolio.ownershipCertificate
  ///
  /// In en, this message translates to:
  /// **'Ownership Certificate'**
  String get portfolioOwnershipCertificate;

  /// investmentDetail.title
  ///
  /// In en, this message translates to:
  /// **'Investment Details'**
  String get investmentDetailTitle;

  /// investmentDetail.overview
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get investmentDetailOverview;

  /// investmentDetail.returns
  ///
  /// In en, this message translates to:
  /// **'Returns'**
  String get investmentDetailReturns;

  /// investmentDetail.documents
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get investmentDetailDocuments;

  /// investmentDetail.timeline
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get investmentDetailTimeline;

  /// investmentDetail.statusProcessing
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get investmentDetailStatusProcessing;

  /// investmentDetail.statusConfirmed
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get investmentDetailStatusConfirmed;

  /// investmentDetail.investmentDate
  ///
  /// In en, this message translates to:
  /// **'Investment Date'**
  String get investmentDetailInvestmentDate;

  /// investmentDetail.tokensOwned
  ///
  /// In en, this message translates to:
  /// **'Tokens Owned'**
  String get investmentDetailTokensOwned;

  /// investmentDetail.investedAmount
  ///
  /// In en, this message translates to:
  /// **'Invested Amount'**
  String get investmentDetailInvestedAmount;

  /// investmentDetail.currentValue
  ///
  /// In en, this message translates to:
  /// **'Current Value'**
  String get investmentDetailCurrentValue;

  /// investmentDetail.totalReturn
  ///
  /// In en, this message translates to:
  /// **'Total Return'**
  String get investmentDetailTotalReturn;

  /// investmentDetail.downloadCertificate
  ///
  /// In en, this message translates to:
  /// **'Download Certificate'**
  String get investmentDetailDownloadCertificate;

  /// investmentDetail.viewProperty
  ///
  /// In en, this message translates to:
  /// **'View Property'**
  String get investmentDetailViewProperty;

  /// investmentDetail.nextPayout
  ///
  /// In en, this message translates to:
  /// **'Next Payout'**
  String get investmentDetailNextPayout;

  /// investmentDetail.payoutHistory
  ///
  /// In en, this message translates to:
  /// **'Payout History'**
  String get investmentDetailPayoutHistory;

  /// completedReport.title
  ///
  /// In en, this message translates to:
  /// **'Investment Report'**
  String get completedReportTitle;

  /// completedReport.overview
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get completedReportOverview;

  /// completedReport.returns
  ///
  /// In en, this message translates to:
  /// **'Returns'**
  String get completedReportReturns;

  /// completedReport.timeline
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get completedReportTimeline;

  /// completedReport.documents
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get completedReportDocuments;

  /// completedReport.totalInvested
  ///
  /// In en, this message translates to:
  /// **'Total Invested'**
  String get completedReportTotalInvested;

  /// completedReport.totalReturns
  ///
  /// In en, this message translates to:
  /// **'Total Returns'**
  String get completedReportTotalReturns;

  /// completedReport.roi
  ///
  /// In en, this message translates to:
  /// **'ROI'**
  String get completedReportRoi;

  /// completedReport.duration
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get completedReportDuration;

  /// completedReport.status
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get completedReportStatus;

  /// completedReport.completed
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completedReportCompleted;

  /// completedReport.quarterlyReturns
  ///
  /// In en, this message translates to:
  /// **'Quarterly Returns'**
  String get completedReportQuarterlyReturns;

  /// completedReport.downloadReport
  ///
  /// In en, this message translates to:
  /// **'Download Full Report'**
  String get completedReportDownloadReport;

  /// completedReport.downloadPdf
  ///
  /// In en, this message translates to:
  /// **'Download PDF'**
  String get completedReportDownloadPdf;

  /// wallet.title
  ///
  /// In en, this message translates to:
  /// **'My Wallet'**
  String get walletTitle;

  /// wallet.balance
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get walletBalance;

  /// wallet.deposit
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get walletDeposit;

  /// wallet.withdraw
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get walletWithdraw;

  /// wallet.transactions
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get walletTransactions;

  /// wallet.recentTransactions
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get walletRecentTransactions;

  /// wallet.viewAll
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get walletViewAll;

  /// wallet.noTransactions
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get walletNoTransactions;

  /// wallet.bankAccount
  ///
  /// In en, this message translates to:
  /// **'Bank Account'**
  String get walletBankAccount;

  /// deposit.title
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get depositTitle;

  /// deposit.subtitle
  ///
  /// In en, this message translates to:
  /// **'Add funds to your wallet'**
  String get depositSubtitle;

  /// deposit.amount
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get depositAmount;

  /// deposit.amountPlaceholder
  ///
  /// In en, this message translates to:
  /// **'Enter amount'**
  String get depositAmountPlaceholder;

  /// deposit.method
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get depositMethod;

  /// deposit.bankTransfer
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get depositBankTransfer;

  /// deposit.mada
  ///
  /// In en, this message translates to:
  /// **'Mada Card'**
  String get depositMada;

  /// deposit.apple
  ///
  /// In en, this message translates to:
  /// **'Apple Pay'**
  String get depositApple;

  /// deposit.confirm
  ///
  /// In en, this message translates to:
  /// **'Confirm Deposit'**
  String get depositConfirm;

  /// deposit.minAmount
  ///
  /// In en, this message translates to:
  /// **'Minimum deposit: 100 SAR'**
  String get depositMinAmount;

  /// withdraw.title
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get withdrawTitle;

  /// withdraw.subtitle
  ///
  /// In en, this message translates to:
  /// **'Withdraw funds to your bank account'**
  String get withdrawSubtitle;

  /// withdraw.amount
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get withdrawAmount;

  /// withdraw.amountPlaceholder
  ///
  /// In en, this message translates to:
  /// **'Enter amount'**
  String get withdrawAmountPlaceholder;

  /// withdraw.bankAccount
  ///
  /// In en, this message translates to:
  /// **'Bank Account'**
  String get withdrawBankAccount;

  /// withdraw.confirm
  ///
  /// In en, this message translates to:
  /// **'Confirm Withdrawal'**
  String get withdrawConfirm;

  /// withdraw.availableBalance
  ///
  /// In en, this message translates to:
  /// **'Available: {amount} SAR'**
  String withdrawAvailableBalance(Object amount);

  /// withdraw.processingTime
  ///
  /// In en, this message translates to:
  /// **'Processing time: 1-3 business days'**
  String get withdrawProcessingTime;

  /// transactions.title
  ///
  /// In en, this message translates to:
  /// **'Transaction History'**
  String get transactionsTitle;

  /// transactions.all
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get transactionsAll;

  /// transactions.deposits
  ///
  /// In en, this message translates to:
  /// **'Deposits'**
  String get transactionsDeposits;

  /// transactions.withdrawals
  ///
  /// In en, this message translates to:
  /// **'Withdrawals'**
  String get transactionsWithdrawals;

  /// transactions.investments
  ///
  /// In en, this message translates to:
  /// **'Investments'**
  String get transactionsInvestments;

  /// transactions.returns
  ///
  /// In en, this message translates to:
  /// **'Returns'**
  String get transactionsReturns;

  /// transactions.noTransactions
  ///
  /// In en, this message translates to:
  /// **'No transactions found'**
  String get transactionsNoTransactions;

  /// bankAccount.title
  ///
  /// In en, this message translates to:
  /// **'Bank Account'**
  String get bankAccountTitle;

  /// bankAccount.subtitle
  ///
  /// In en, this message translates to:
  /// **'Manage your linked bank account'**
  String get bankAccountSubtitle;

  /// bankAccount.bankName
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bankAccountBankName;

  /// bankAccount.accountNumber
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get bankAccountAccountNumber;

  /// bankAccount.iban
  ///
  /// In en, this message translates to:
  /// **'IBAN'**
  String get bankAccountIban;

  /// bankAccount.accountHolder
  ///
  /// In en, this message translates to:
  /// **'Account Holder'**
  String get bankAccountAccountHolder;

  /// bankAccount.addAccount
  ///
  /// In en, this message translates to:
  /// **'Add Bank Account'**
  String get bankAccountAddAccount;

  /// bankAccount.editAccount
  ///
  /// In en, this message translates to:
  /// **'Edit Bank Account'**
  String get bankAccountEditAccount;

  /// bankAccount.linked
  ///
  /// In en, this message translates to:
  /// **'Linked'**
  String get bankAccountLinked;

  /// rewards.title
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get rewardsTitle;

  /// rewards.balance
  ///
  /// In en, this message translates to:
  /// **'Rewards Balance'**
  String get rewardsBalance;

  /// rewards.availableToInvest
  ///
  /// In en, this message translates to:
  /// **'Available to invest'**
  String get rewardsAvailableToInvest;

  /// rewards.totalEarned
  ///
  /// In en, this message translates to:
  /// **'Total Earned'**
  String get rewardsTotalEarned;

  /// rewards.referFriend
  ///
  /// In en, this message translates to:
  /// **'Refer a Friend'**
  String get rewardsReferFriend;

  /// rewards.referralCode
  ///
  /// In en, this message translates to:
  /// **'Your Referral Code'**
  String get rewardsReferralCode;

  /// rewards.copyCode
  ///
  /// In en, this message translates to:
  /// **'Copy Code'**
  String get rewardsCopyCode;

  /// rewards.shareLink
  ///
  /// In en, this message translates to:
  /// **'Share Link'**
  String get rewardsShareLink;

  /// rewards.howItWorks
  ///
  /// In en, this message translates to:
  /// **'How It Works'**
  String get rewardsHowItWorks;

  /// rewards.tiers
  ///
  /// In en, this message translates to:
  /// **'Reward Tiers'**
  String get rewardsTiers;

  /// rewards.policy
  ///
  /// In en, this message translates to:
  /// **'Rewards Policy'**
  String get rewardsPolicy;

  /// rewards.history
  ///
  /// In en, this message translates to:
  /// **'Rewards History'**
  String get rewardsHistory;

  /// rewards.myEarnings
  ///
  /// In en, this message translates to:
  /// **'My Earnings'**
  String get rewardsMyEarnings;

  /// rewards.learnTiers
  ///
  /// In en, this message translates to:
  /// **'Learn About Tiers'**
  String get rewardsLearnTiers;

  /// rewards.viewFullHistory
  ///
  /// In en, this message translates to:
  /// **'View full history in wallet'**
  String get rewardsViewFullHistory;

  /// profile.title
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// profile.editProfile
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileEditProfile;

  /// profile.personalInfo
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get profilePersonalInfo;

  /// profile.fullName
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get profileFullName;

  /// profile.email
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profileEmail;

  /// profile.phone
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get profilePhone;

  /// profile.nationality
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get profileNationality;

  /// profile.idNumber
  ///
  /// In en, this message translates to:
  /// **'ID Number'**
  String get profileIdNumber;

  /// profile.settings
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileSettings;

  /// profile.notifications
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profileNotifications;

  /// profile.security
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get profileSecurity;

  /// profile.language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profileLanguage;

  /// profile.helpCenter
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get profileHelpCenter;

  /// profile.about
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get profileAbout;

  /// profile.logout
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get profileLogout;

  /// profile.logoutConfirm
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get profileLogoutConfirm;

  /// profile.version
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get profileVersion;

  /// profile.investorSince
  ///
  /// In en, this message translates to:
  /// **'Investor since'**
  String get profileInvestorSince;

  /// profile.kycVerified
  ///
  /// In en, this message translates to:
  /// **'KYC Verified'**
  String get profileKycVerified;

  /// editProfile.title
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfileTitle;

  /// editProfile.save
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get editProfileSave;

  /// editProfile.firstName
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get editProfileFirstName;

  /// editProfile.lastName
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get editProfileLastName;

  /// editProfile.email
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get editProfileEmail;

  /// editProfile.phone
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get editProfilePhone;

  /// editProfile.changePhoto
  ///
  /// In en, this message translates to:
  /// **'Change Photo'**
  String get editProfileChangePhoto;

  /// settings.title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// settings.language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// settings.switchToArabic
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get settingsSwitchToArabic;

  /// settings.switchToEnglish
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsSwitchToEnglish;

  /// settings.notifications
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// settings.pushNotifications
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get settingsPushNotifications;

  /// settings.emailNotifications
  ///
  /// In en, this message translates to:
  /// **'Email Notifications'**
  String get settingsEmailNotifications;

  /// settings.smsNotifications
  ///
  /// In en, this message translates to:
  /// **'SMS Notifications'**
  String get settingsSmsNotifications;

  /// settings.security
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get settingsSecurity;

  /// settings.changePin
  ///
  /// In en, this message translates to:
  /// **'Change PIN'**
  String get settingsChangePin;

  /// settings.biometric
  ///
  /// In en, this message translates to:
  /// **'Biometric Login'**
  String get settingsBiometric;

  /// settings.twoFactor
  ///
  /// In en, this message translates to:
  /// **'Two-Factor Authentication'**
  String get settingsTwoFactor;

  /// settings.privacy
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get settingsPrivacy;

  /// settings.privacyPolicy
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settingsPrivacyPolicy;

  /// settings.termsConditions
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get settingsTermsConditions;

  /// settings.riskDisclosure
  ///
  /// In en, this message translates to:
  /// **'Risk Disclosure'**
  String get settingsRiskDisclosure;

  /// settings.about
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// settings.appVersion
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get settingsAppVersion;

  /// settings.contactUs
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get settingsContactUs;

  /// settings.rateApp
  ///
  /// In en, this message translates to:
  /// **'Rate the App'**
  String get settingsRateApp;

  /// settings.managePreferences
  ///
  /// In en, this message translates to:
  /// **'Manage your app preferences'**
  String get settingsManagePreferences;

  /// settings.languageRegion
  ///
  /// In en, this message translates to:
  /// **'Language & Region'**
  String get settingsLanguageRegion;

  /// settings.appLanguage
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get settingsAppLanguage;

  /// settings.newInvestmentAlerts
  ///
  /// In en, this message translates to:
  /// **'New Investment Alerts'**
  String get settingsNewInvestmentAlerts;

  /// settings.returnAlerts
  ///
  /// In en, this message translates to:
  /// **'Return Distribution Alerts'**
  String get settingsReturnAlerts;

  /// settings.showBalance
  ///
  /// In en, this message translates to:
  /// **'Show Balance on Home'**
  String get settingsShowBalance;

  /// settings.appearance
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// settings.darkMode
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get settingsDarkMode;

  /// settings.account
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccount;

  /// settings.signOut
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get settingsSignOut;

  /// settings.deleteAccount
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get settingsDeleteAccount;

  /// settings.currentLanguage
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsCurrentLanguage;

  /// settings.switchLanguage
  ///
  /// In en, this message translates to:
  /// **'Switch to العربية'**
  String get settingsSwitchLanguage;

  /// settings.languageChanged
  ///
  /// In en, this message translates to:
  /// **'Language changed successfully'**
  String get settingsLanguageChanged;

  /// more.title
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get moreTitle;

  /// more.faq
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get moreFaq;

  /// more.helpCenter
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get moreHelpCenter;

  /// more.contactUs
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get moreContactUs;

  /// more.about
  ///
  /// In en, this message translates to:
  /// **'About Hseeltech'**
  String get moreAbout;

  /// more.legal
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get moreLegal;

  /// more.termsConditions
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get moreTermsConditions;

  /// more.privacyPolicy
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get morePrivacyPolicy;

  /// more.riskDisclosure
  ///
  /// In en, this message translates to:
  /// **'Risk Disclosure'**
  String get moreRiskDisclosure;

  /// more.regulatoryInfo
  ///
  /// In en, this message translates to:
  /// **'Regulatory Information'**
  String get moreRegulatoryInfo;

  /// more.socialMedia
  ///
  /// In en, this message translates to:
  /// **'Follow Us'**
  String get moreSocialMedia;

  /// notifications.title
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// notifications.today
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get notificationsToday;

  /// notifications.yesterday
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get notificationsYesterday;

  /// notifications.earlier
  ///
  /// In en, this message translates to:
  /// **'Earlier'**
  String get notificationsEarlier;

  /// notifications.markAllRead
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get notificationsMarkAllRead;

  /// notifications.noNotifications
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get notificationsNoNotifications;

  /// notifications.investmentConfirmed
  ///
  /// In en, this message translates to:
  /// **'Investment Confirmed'**
  String get notificationsInvestmentConfirmed;

  /// notifications.payoutReceived
  ///
  /// In en, this message translates to:
  /// **'Payout Received'**
  String get notificationsPayoutReceived;

  /// notifications.newOpportunity
  ///
  /// In en, this message translates to:
  /// **'New Opportunity'**
  String get notificationsNewOpportunity;

  /// notifications.documentReady
  ///
  /// In en, this message translates to:
  /// **'Document Ready'**
  String get notificationsDocumentReady;

  /// notifications.viewDetails
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get notificationsViewDetails;

  /// notificationDetail.title
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notificationDetailTitle;

  /// notificationDetail.viewInvestment
  ///
  /// In en, this message translates to:
  /// **'View Investment'**
  String get notificationDetailViewInvestment;

  /// notificationDetail.downloadDocument
  ///
  /// In en, this message translates to:
  /// **'Download Document'**
  String get notificationDetailDownloadDocument;

  /// faq.title
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faqTitle;

  /// faq.subtitle
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get faqSubtitle;

  /// faq.searchPlaceholder
  ///
  /// In en, this message translates to:
  /// **'Search questions...'**
  String get faqSearchPlaceholder;

  /// legal.privacyPolicy
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get legalPrivacyPolicy;

  /// legal.termsConditions
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get legalTermsConditions;

  /// legal.riskDisclosure
  ///
  /// In en, this message translates to:
  /// **'Risk Disclosure'**
  String get legalRiskDisclosure;

  /// darkMode.title
  ///
  /// In en, this message translates to:
  /// **'Dark Mode Preview'**
  String get darkModeTitle;

  /// darkMode.explore
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get darkModeExplore;

  /// darkMode.portfolio
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get darkModePortfolio;

  /// empty.noInvestments
  ///
  /// In en, this message translates to:
  /// **'No investments yet'**
  String get emptyNoInvestments;

  /// empty.noInvestmentsDesc
  ///
  /// In en, this message translates to:
  /// **'Start exploring opportunities to build your portfolio'**
  String get emptyNoInvestmentsDesc;

  /// empty.noTransactions
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get emptyNoTransactions;

  /// empty.noTransactionsDesc
  ///
  /// In en, this message translates to:
  /// **'Your transaction history will appear here'**
  String get emptyNoTransactionsDesc;

  /// empty.noNotifications
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get emptyNoNotifications;

  /// empty.noNotificationsDesc
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up!'**
  String get emptyNoNotificationsDesc;

  /// empty.startExploring
  ///
  /// In en, this message translates to:
  /// **'Start Exploring'**
  String get emptyStartExploring;

  /// error.generic
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorGeneric;

  /// error.genericDesc
  ///
  /// In en, this message translates to:
  /// **'Please try again later'**
  String get errorGenericDesc;

  /// error.network
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get errorNetwork;

  /// error.networkDesc
  ///
  /// In en, this message translates to:
  /// **'Please check your connection and try again'**
  String get errorNetworkDesc;

  /// error.notFound
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get errorNotFound;

  /// error.notFoundDesc
  ///
  /// In en, this message translates to:
  /// **'The page you\'re looking for doesn\'t exist'**
  String get errorNotFoundDesc;

  /// error.retry
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get errorRetry;

  /// error.goHome
  ///
  /// In en, this message translates to:
  /// **'Go Home'**
  String get errorGoHome;

  /// skeleton.loading
  ///
  /// In en, this message translates to:
  /// **'Loading content...'**
  String get skeletonLoading;

  /// download.title
  ///
  /// In en, this message translates to:
  /// **'Download Document'**
  String get downloadTitle;

  /// download.preparing
  ///
  /// In en, this message translates to:
  /// **'Preparing download...'**
  String get downloadPreparing;

  /// download.downloading
  ///
  /// In en, this message translates to:
  /// **'Downloading...'**
  String get downloadDownloading;

  /// download.complete
  ///
  /// In en, this message translates to:
  /// **'Download Complete!'**
  String get downloadComplete;

  /// download.openFile
  ///
  /// In en, this message translates to:
  /// **'Open File'**
  String get downloadOpenFile;

  /// download.close
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get downloadClose;

  /// download.failed
  ///
  /// In en, this message translates to:
  /// **'Download Failed'**
  String get downloadFailed;

  /// download.retry
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get downloadRetry;

  /// download.ownershipCertificate
  ///
  /// In en, this message translates to:
  /// **'Ownership Certificate'**
  String get downloadOwnershipCertificate;

  /// download.valuationReport
  ///
  /// In en, this message translates to:
  /// **'Valuation Report'**
  String get downloadValuationReport;

  /// download.investmentContract
  ///
  /// In en, this message translates to:
  /// **'Investment Contract'**
  String get downloadInvestmentContract;

  /// download.annualReport
  ///
  /// In en, this message translates to:
  /// **'Annual Report'**
  String get downloadAnnualReport;

  /// download.taxStatement
  ///
  /// In en, this message translates to:
  /// **'Tax Statement'**
  String get downloadTaxStatement;

  /// download.propertyAppraisal
  ///
  /// In en, this message translates to:
  /// **'Property Appraisal'**
  String get downloadPropertyAppraisal;

  /// home.goodMorning
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get homeGoodMorning;

  /// home.mohammed
  ///
  /// In en, this message translates to:
  /// **'Mohammed'**
  String get homeMohammed;

  /// home.monthlyReturn
  ///
  /// In en, this message translates to:
  /// **'Monthly Return'**
  String get homeMonthlyReturn;

  /// home.expectedAnnual
  ///
  /// In en, this message translates to:
  /// **'Expected Annual'**
  String get homeExpectedAnnual;

  /// home.topOpportunities
  ///
  /// In en, this message translates to:
  /// **'Top Opportunities'**
  String get homeTopOpportunities;

  /// home.recentActivity
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get homeRecentActivity;

  /// home.investedIn
  ///
  /// In en, this message translates to:
  /// **'Invested in'**
  String get homeInvestedIn;

  /// home.returnReceived
  ///
  /// In en, this message translates to:
  /// **'Return received'**
  String get homeReturnReceived;

  /// home.depositCompleted
  ///
  /// In en, this message translates to:
  /// **'Deposit completed'**
  String get homeDepositCompleted;

  /// home.totalPortfolioValue
  ///
  /// In en, this message translates to:
  /// **'Total Portfolio Value'**
  String get homeTotalPortfolioValue;

  /// home.activeInvestments
  ///
  /// In en, this message translates to:
  /// **'Active Investments'**
  String get homeActiveInvestments;

  /// home.properties
  ///
  /// In en, this message translates to:
  /// **'properties'**
  String get homeProperties;

  /// detail.alOlayaTowers
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya Towers'**
  String get detailAlOlayaTowers;

  /// detail.investmentCalculator
  ///
  /// In en, this message translates to:
  /// **'Investment Calculator'**
  String get detailInvestmentCalculator;

  /// detail.numberOfShares
  ///
  /// In en, this message translates to:
  /// **'Number of Tokens'**
  String get detailNumberOfShares;

  /// detail.yourInvestment
  ///
  /// In en, this message translates to:
  /// **'Your Investment'**
  String get detailYourInvestment;

  /// detail.holdPeriod
  ///
  /// In en, this message translates to:
  /// **'Hold Period (Years)'**
  String get detailHoldPeriod;

  /// detail.annualRental
  ///
  /// In en, this message translates to:
  /// **'Annual Rental %'**
  String get detailAnnualRental;

  /// detail.appreciation
  ///
  /// In en, this message translates to:
  /// **'Appreciation %'**
  String get detailAppreciation;

  /// detail.projectedTotalValue
  ///
  /// In en, this message translates to:
  /// **'Projected Total Value'**
  String get detailProjectedTotalValue;

  /// detail.totalReturn
  ///
  /// In en, this message translates to:
  /// **'Total Return'**
  String get detailTotalReturn;

  /// detail.annualizedROI
  ///
  /// In en, this message translates to:
  /// **'Annualized ROI'**
  String get detailAnnualizedROI;

  /// detail.rentalIncome
  ///
  /// In en, this message translates to:
  /// **'Rental Income'**
  String get detailRentalIncome;

  /// detail.capitalGain
  ///
  /// In en, this message translates to:
  /// **'Capital Gain'**
  String get detailCapitalGain;

  /// detail.fundingClosed
  ///
  /// In en, this message translates to:
  /// **'Funding Closed'**
  String get detailFundingClosed;

  /// detail.propertyDetails
  ///
  /// In en, this message translates to:
  /// **'Property Details'**
  String get detailPropertyDetails;

  /// detail.holdingPeriod
  ///
  /// In en, this message translates to:
  /// **'Holding Period'**
  String get detailHoldingPeriod;

  /// detail.residential
  ///
  /// In en, this message translates to:
  /// **'Residential'**
  String get detailResidential;

  /// detail.commercial
  ///
  /// In en, this message translates to:
  /// **'Commercial'**
  String get detailCommercial;

  /// detail.years
  ///
  /// In en, this message translates to:
  /// **'years'**
  String get detailYears;

  /// detail.perToken
  ///
  /// In en, this message translates to:
  /// **'per token'**
  String get detailPerToken;

  /// detail.tokens
  ///
  /// In en, this message translates to:
  /// **'tokens'**
  String get detailTokens;

  /// detail.updates
  ///
  /// In en, this message translates to:
  /// **'Updates'**
  String get detailUpdates;

  /// detail.aboutProperty
  ///
  /// In en, this message translates to:
  /// **'About this Property'**
  String get detailAboutProperty;

  /// detail.keyHighlights
  ///
  /// In en, this message translates to:
  /// **'Key Highlights'**
  String get detailKeyHighlights;

  /// detail.riskFactors
  ///
  /// In en, this message translates to:
  /// **'Risk Factors'**
  String get detailRiskFactors;

  /// detail.legalDisclaimer
  ///
  /// In en, this message translates to:
  /// **'Legal Disclaimer'**
  String get detailLegalDisclaimer;

  /// explore.discoverOpportunities
  ///
  /// In en, this message translates to:
  /// **'Discover real estate investment opportunities'**
  String get exploreDiscoverOpportunities;

  /// explore.alOlaya
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya, Riyadh'**
  String get exploreAlOlaya;

  /// explore.alMalqa
  ///
  /// In en, this message translates to:
  /// **'Al-Malqa, Riyadh'**
  String get exploreAlMalqa;

  /// explore.nakheel
  ///
  /// In en, this message translates to:
  /// **'Al-Nakheel, Riyadh'**
  String get exploreNakheel;

  /// portfolio.activeProperties
  ///
  /// In en, this message translates to:
  /// **'Active Properties'**
  String get portfolioActiveProperties;

  /// portfolio.yourInvestments
  ///
  /// In en, this message translates to:
  /// **'Your Investments'**
  String get portfolioYourInvestments;

  /// portfolio.invested
  ///
  /// In en, this message translates to:
  /// **'Invested'**
  String get portfolioInvested;

  /// portfolio.return
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get portfolioReturn;

  /// investFlow.selectShares
  ///
  /// In en, this message translates to:
  /// **'Select Tokens'**
  String get investFlowSelectShares;

  /// investFlow.review
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get investFlowReview;

  /// investFlow.payment
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get investFlowPayment;

  /// investFlow.confirm
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get investFlowConfirm;

  /// investFlow.howManyShares
  ///
  /// In en, this message translates to:
  /// **'How many tokens?'**
  String get investFlowHowManyShares;

  /// investFlow.pricePerShare
  ///
  /// In en, this message translates to:
  /// **'Price per token'**
  String get investFlowPricePerShare;

  /// investFlow.totalAmount
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get investFlowTotalAmount;

  /// investFlow.availableBalance
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get investFlowAvailableBalance;

  /// investFlow.continue
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get investFlowContinue;

  /// investFlow.reviewOrder
  ///
  /// In en, this message translates to:
  /// **'Review Your Order'**
  String get investFlowReviewOrder;

  /// investFlow.property
  ///
  /// In en, this message translates to:
  /// **'Property'**
  String get investFlowProperty;

  /// investFlow.quantity
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get investFlowQuantity;

  /// investFlow.unitPrice
  ///
  /// In en, this message translates to:
  /// **'Unit Price'**
  String get investFlowUnitPrice;

  /// investFlow.total
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get investFlowTotal;

  /// investFlow.paymentMethod
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get investFlowPaymentMethod;

  /// investFlow.walletBalance
  ///
  /// In en, this message translates to:
  /// **'Wallet Balance'**
  String get investFlowWalletBalance;

  /// investFlow.confirmInvestment
  ///
  /// In en, this message translates to:
  /// **'Confirm Investment'**
  String get investFlowConfirmInvestment;

  /// investFlow.termsAgree
  ///
  /// In en, this message translates to:
  /// **'I agree to the terms and conditions'**
  String get investFlowTermsAgree;

  /// investFlow.riskAcknowledge
  ///
  /// In en, this message translates to:
  /// **'I acknowledge the investment risks'**
  String get investFlowRiskAcknowledge;

  /// investFlow.processingPayment
  ///
  /// In en, this message translates to:
  /// **'Processing payment...'**
  String get investFlowProcessingPayment;

  /// investFlow.pleaseWait
  ///
  /// In en, this message translates to:
  /// **'Please wait while we process your investment'**
  String get investFlowPleaseWait;

  /// investFlow.back
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get investFlowBack;

  /// investFlow.step
  ///
  /// In en, this message translates to:
  /// **'Step'**
  String get investFlowStep;

  /// investFlow.of
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get investFlowOf;

  /// investFlow.estimatedReturn
  ///
  /// In en, this message translates to:
  /// **'Estimated Annual Return'**
  String get investFlowEstimatedReturn;

  /// investFlow.holdingPeriod
  ///
  /// In en, this message translates to:
  /// **'Holding Period'**
  String get investFlowHoldingPeriod;

  /// investFlow.platformFee
  ///
  /// In en, this message translates to:
  /// **'Platform Fee'**
  String get investFlowPlatformFee;

  /// investFlow.netInvestment
  ///
  /// In en, this message translates to:
  /// **'Net Investment'**
  String get investFlowNetInvestment;

  /// investFlow.orderSummary
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get investFlowOrderSummary;

  /// investFlow.investmentDetails
  ///
  /// In en, this message translates to:
  /// **'Investment Details'**
  String get investFlowInvestmentDetails;

  /// investSuccess.goToPortfolio
  ///
  /// In en, this message translates to:
  /// **'Go to Portfolio'**
  String get investSuccessGoToPortfolio;

  /// investSuccess.backToExplore
  ///
  /// In en, this message translates to:
  /// **'Back to Explore'**
  String get investSuccessBackToExplore;

  /// investmentDetail.propertyInfo
  ///
  /// In en, this message translates to:
  /// **'Property Information'**
  String get investmentDetailPropertyInfo;

  /// investmentDetail.investmentSummary
  ///
  /// In en, this message translates to:
  /// **'Investment Summary'**
  String get investmentDetailInvestmentSummary;

  /// investmentDetail.purchaseDate
  ///
  /// In en, this message translates to:
  /// **'Purchase Date'**
  String get investmentDetailPurchaseDate;

  /// investmentDetail.purchasePrice
  ///
  /// In en, this message translates to:
  /// **'Purchase Price'**
  String get investmentDetailPurchasePrice;

  /// investmentDetail.status
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get investmentDetailStatus;

  /// investmentDetail.confirmed
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get investmentDetailConfirmed;

  /// investmentDetail.pending
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get investmentDetailPending;

  /// investmentDetail.ownershipCertificate
  ///
  /// In en, this message translates to:
  /// **'Ownership Certificate'**
  String get investmentDetailOwnershipCertificate;

  /// investmentDetail.issued
  ///
  /// In en, this message translates to:
  /// **'Issued'**
  String get investmentDetailIssued;

  /// investmentDetail.pendingIssuance
  ///
  /// In en, this message translates to:
  /// **'Pending Issuance'**
  String get investmentDetailPendingIssuance;

  /// completedReport.propertyDetails
  ///
  /// In en, this message translates to:
  /// **'Property Details'**
  String get completedReportPropertyDetails;

  /// completedReport.investorStatistics
  ///
  /// In en, this message translates to:
  /// **'Investor Statistics'**
  String get completedReportInvestorStatistics;

  /// completedReport.totalReturnsAchieved
  ///
  /// In en, this message translates to:
  /// **'Total Returns Achieved'**
  String get completedReportTotalReturnsAchieved;

  /// completedReport.rentalIncome
  ///
  /// In en, this message translates to:
  /// **'Rental Income'**
  String get completedReportRentalIncome;

  /// completedReport.capitalAppreciation
  ///
  /// In en, this message translates to:
  /// **'Capital Appreciation'**
  String get completedReportCapitalAppreciation;

  /// completedReport.quarterlyPerformance
  ///
  /// In en, this message translates to:
  /// **'Quarterly Performance'**
  String get completedReportQuarterlyPerformance;

  /// completedReport.rental
  ///
  /// In en, this message translates to:
  /// **'Rental'**
  String get completedReportRental;

  /// completedReport.appreciation
  ///
  /// In en, this message translates to:
  /// **'Appreciation'**
  String get completedReportAppreciation;

  /// completedReport.total
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get completedReportTotal;

  /// completedReport.returnComposition
  ///
  /// In en, this message translates to:
  /// **'Return Composition'**
  String get completedReportReturnComposition;

  /// completedReport.investmentTimeline
  ///
  /// In en, this message translates to:
  /// **'Investment Timeline'**
  String get completedReportInvestmentTimeline;

  /// completedReport.durationSummary
  ///
  /// In en, this message translates to:
  /// **'Duration Summary'**
  String get completedReportDurationSummary;

  /// completedReport.downloadAllDocuments
  ///
  /// In en, this message translates to:
  /// **'Download All Documents'**
  String get completedReportDownloadAllDocuments;

  /// completedReport.alNakheelResidences
  ///
  /// In en, this message translates to:
  /// **'Al-Nakheel Residences'**
  String get completedReportAlNakheelResidences;

  /// kyc.step1Title
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get kycStep1Title;

  /// kyc.step2Title
  ///
  /// In en, this message translates to:
  /// **'ID Verification'**
  String get kycStep2Title;

  /// kyc.step3Title
  ///
  /// In en, this message translates to:
  /// **'Address Verification'**
  String get kycStep3Title;

  /// kyc.step4Title
  ///
  /// In en, this message translates to:
  /// **'Financial Information'**
  String get kycStep4Title;

  /// kyc.step5Title
  ///
  /// In en, this message translates to:
  /// **'Review & Submit'**
  String get kycStep5Title;

  /// kyc.dateOfBirth
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get kycDateOfBirth;

  /// kyc.idType
  ///
  /// In en, this message translates to:
  /// **'ID Type'**
  String get kycIdType;

  /// kyc.idNumber
  ///
  /// In en, this message translates to:
  /// **'ID Number'**
  String get kycIdNumber;

  /// kyc.uploadFront
  ///
  /// In en, this message translates to:
  /// **'Upload Front'**
  String get kycUploadFront;

  /// kyc.uploadBack
  ///
  /// In en, this message translates to:
  /// **'Upload Back'**
  String get kycUploadBack;

  /// kyc.postalCode
  ///
  /// In en, this message translates to:
  /// **'Postal Code'**
  String get kycPostalCode;

  /// kyc.employmentStatus
  ///
  /// In en, this message translates to:
  /// **'Employment Status'**
  String get kycEmploymentStatus;

  /// kyc.annualIncome
  ///
  /// In en, this message translates to:
  /// **'Annual Income'**
  String get kycAnnualIncome;

  /// kyc.sourceOfFunds
  ///
  /// In en, this message translates to:
  /// **'Source of Funds'**
  String get kycSourceOfFunds;

  /// kyc.investmentExperience
  ///
  /// In en, this message translates to:
  /// **'Investment Experience'**
  String get kycInvestmentExperience;

  /// kyc.next
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get kycNext;

  /// kyc.previous
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get kycPrevious;

  /// kyc.verificationComplete
  ///
  /// In en, this message translates to:
  /// **'Verification Complete'**
  String get kycVerificationComplete;

  /// kyc.reviewInfo
  ///
  /// In en, this message translates to:
  /// **'Review your information'**
  String get kycReviewInfo;

  /// kyc.employed
  ///
  /// In en, this message translates to:
  /// **'Employed'**
  String get kycEmployed;

  /// kyc.selfEmployed
  ///
  /// In en, this message translates to:
  /// **'Self-Employed'**
  String get kycSelfEmployed;

  /// kyc.saudiId
  ///
  /// In en, this message translates to:
  /// **'Saudi National ID'**
  String get kycSaudiId;

  /// kyc.iqama
  ///
  /// In en, this message translates to:
  /// **'Iqama (Resident ID)'**
  String get kycIqama;

  /// kyc.saudi
  ///
  /// In en, this message translates to:
  /// **'Saudi'**
  String get kycSaudi;

  /// wallet.copyAll
  ///
  /// In en, this message translates to:
  /// **'Copy All'**
  String get walletCopyAll;

  /// wallet.partnerBank
  ///
  /// In en, this message translates to:
  /// **'Partner Bank'**
  String get walletPartnerBank;

  /// wallet.verified
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get walletVerified;

  /// wallet.ibanNumber
  ///
  /// In en, this message translates to:
  /// **'IBAN Number'**
  String get walletIbanNumber;

  /// wallet.all
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get walletAll;

  /// wallet.in
  ///
  /// In en, this message translates to:
  /// **'In'**
  String get walletIn;

  /// wallet.out
  ///
  /// In en, this message translates to:
  /// **'Out'**
  String get walletOut;

  /// wallet.refer
  ///
  /// In en, this message translates to:
  /// **'Refer'**
  String get walletRefer;

  /// deposit.arabNationalBank
  ///
  /// In en, this message translates to:
  /// **'Arab National Bank'**
  String get depositArabNationalBank;

  /// deposit.partnerBank
  ///
  /// In en, this message translates to:
  /// **'Partner Bank'**
  String get depositPartnerBank;

  /// deposit.madaDebitCard
  ///
  /// In en, this message translates to:
  /// **'mada Debit Card'**
  String get depositMadaDebitCard;

  /// deposit.instantDeposit
  ///
  /// In en, this message translates to:
  /// **'Instant deposit via payment gateway'**
  String get depositInstantDeposit;

  /// withdraw.toAccount
  ///
  /// In en, this message translates to:
  /// **'To Account'**
  String get withdrawToAccount;

  /// withdraw.estimatedTime
  ///
  /// In en, this message translates to:
  /// **'Estimated processing time'**
  String get withdrawEstimatedTime;

  /// withdraw.businessDays
  ///
  /// In en, this message translates to:
  /// **'1-3 business days'**
  String get withdrawBusinessDays;

  /// bankAccount.alRajhiBank
  ///
  /// In en, this message translates to:
  /// **'Al Rajhi Bank'**
  String get bankAccountAlRajhiBank;

  /// bankAccount.primaryAccount
  ///
  /// In en, this message translates to:
  /// **'Primary Account'**
  String get bankAccountPrimaryAccount;

  /// bankAccount.manage
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get bankAccountManage;

  /// bankAccount.editDetails
  ///
  /// In en, this message translates to:
  /// **'Edit details'**
  String get bankAccountEditDetails;

  /// bankAccount.remove
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get bankAccountRemove;

  /// bankAccount.deleteAccount
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get bankAccountDeleteAccount;

  /// bankAccount.newBankAccount
  ///
  /// In en, this message translates to:
  /// **'New Bank Account'**
  String get bankAccountNewBankAccount;

  /// bankAccount.selectBank
  ///
  /// In en, this message translates to:
  /// **'Select bank...'**
  String get bankAccountSelectBank;

  /// bankAccount.snb
  ///
  /// In en, this message translates to:
  /// **'Saudi National Bank (SNB)'**
  String get bankAccountSnb;

  /// bankAccount.riyadBank
  ///
  /// In en, this message translates to:
  /// **'Riyad Bank'**
  String get bankAccountRiyadBank;

  /// bankAccount.alBilad
  ///
  /// In en, this message translates to:
  /// **'Al Bilad Bank'**
  String get bankAccountAlBilad;

  /// bankAccount.alinma
  ///
  /// In en, this message translates to:
  /// **'Alinma Bank'**
  String get bankAccountAlinma;

  /// bankAccount.save
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get bankAccountSave;

  /// bankAccount.addedOn
  ///
  /// In en, this message translates to:
  /// **'Added on'**
  String get bankAccountAddedOn;

  /// rewards.inviteFriends
  ///
  /// In en, this message translates to:
  /// **'Invite Friends & Earn'**
  String get rewardsInviteFriends;

  /// rewards.earnPerReferral
  ///
  /// In en, this message translates to:
  /// **'Earn 100 SAR per referral'**
  String get rewardsEarnPerReferral;

  /// rewards.shareYourCode
  ///
  /// In en, this message translates to:
  /// **'Share your referral code'**
  String get rewardsShareYourCode;

  /// rewards.copied
  ///
  /// In en, this message translates to:
  /// **'Copied!'**
  String get rewardsCopied;

  /// rewards.step1
  ///
  /// In en, this message translates to:
  /// **'Share your code with friends'**
  String get rewardsStep1;

  /// rewards.step2
  ///
  /// In en, this message translates to:
  /// **'Friend signs up & invests'**
  String get rewardsStep2;

  /// rewards.step3
  ///
  /// In en, this message translates to:
  /// **'Both earn 100 SAR reward'**
  String get rewardsStep3;

  /// rewards.totalReferrals
  ///
  /// In en, this message translates to:
  /// **'Total Referrals'**
  String get rewardsTotalReferrals;

  /// rewards.pendingRewards
  ///
  /// In en, this message translates to:
  /// **'Pending Rewards'**
  String get rewardsPendingRewards;

  /// rewards.completedRewards
  ///
  /// In en, this message translates to:
  /// **'Completed Rewards'**
  String get rewardsCompletedRewards;

  /// profile.investorProfile
  ///
  /// In en, this message translates to:
  /// **'Investor Profile'**
  String get profileInvestorProfile;

  /// profile.memberSince
  ///
  /// In en, this message translates to:
  /// **'Member since'**
  String get profileMemberSince;

  /// profile.totalInvested
  ///
  /// In en, this message translates to:
  /// **'Total Invested'**
  String get profileTotalInvested;

  /// profile.portfolioValue
  ///
  /// In en, this message translates to:
  /// **'Portfolio Value'**
  String get profilePortfolioValue;

  /// profile.accountSettings
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get profileAccountSettings;

  /// profile.myDocuments
  ///
  /// In en, this message translates to:
  /// **'My Documents'**
  String get profileMyDocuments;

  /// profile.referralProgram
  ///
  /// In en, this message translates to:
  /// **'Referral Program'**
  String get profileReferralProgram;

  /// profile.support
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get profileSupport;

  /// profile.privacySecurity
  ///
  /// In en, this message translates to:
  /// **'Privacy & Security'**
  String get profilePrivacySecurity;

  /// profile.notificationPreferences
  ///
  /// In en, this message translates to:
  /// **'Notification Preferences'**
  String get profileNotificationPreferences;

  /// profile.linkedBankAccount
  ///
  /// In en, this message translates to:
  /// **'Linked Bank Account'**
  String get profileLinkedBankAccount;

  /// profile.changePassword
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get profileChangePassword;

  /// profile.twoFactorAuth
  ///
  /// In en, this message translates to:
  /// **'Two-Factor Authentication'**
  String get profileTwoFactorAuth;

  /// profile.enabled
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get profileEnabled;

  /// profile.contactSupport
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get profileContactSupport;

  /// profile.faq
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get profileFaq;

  /// profile.reportIssue
  ///
  /// In en, this message translates to:
  /// **'Report an Issue'**
  String get profileReportIssue;

  /// editProfile.tapToChange
  ///
  /// In en, this message translates to:
  /// **'Tap to change photo'**
  String get editProfileTapToChange;

  /// editProfile.enterFullName
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get editProfileEnterFullName;

  /// editProfile.enterEmail
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get editProfileEnterEmail;

  /// editProfile.enterPhone
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get editProfileEnterPhone;

  /// editProfile.saveChanges
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get editProfileSaveChanges;

  /// more.investorResources
  ///
  /// In en, this message translates to:
  /// **'Investor Resources'**
  String get moreInvestorResources;

  /// more.educationCenter
  ///
  /// In en, this message translates to:
  /// **'Education Center'**
  String get moreEducationCenter;

  /// more.marketInsights
  ///
  /// In en, this message translates to:
  /// **'Market Insights'**
  String get moreMarketInsights;

  /// more.investmentGuide
  ///
  /// In en, this message translates to:
  /// **'Investment Guide'**
  String get moreInvestmentGuide;

  /// more.companyInfo
  ///
  /// In en, this message translates to:
  /// **'Company Information'**
  String get moreCompanyInfo;

  /// more.aboutHseeltech
  ///
  /// In en, this message translates to:
  /// **'About Hseeltech'**
  String get moreAboutHseeltech;

  /// more.careers
  ///
  /// In en, this message translates to:
  /// **'Careers'**
  String get moreCareers;

  /// more.pressMedia
  ///
  /// In en, this message translates to:
  /// **'Press & Media'**
  String get morePressMedia;

  /// more.legalDocuments
  ///
  /// In en, this message translates to:
  /// **'Legal Documents'**
  String get moreLegalDocuments;

  /// more.followUs
  ///
  /// In en, this message translates to:
  /// **'Follow Us'**
  String get moreFollowUs;

  /// more.appVersion
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get moreAppVersion;

  /// biometric.authMethods
  ///
  /// In en, this message translates to:
  /// **'Authentication Methods'**
  String get biometricAuthMethods;

  /// biometric.touchId
  ///
  /// In en, this message translates to:
  /// **'Touch ID authentication'**
  String get biometricTouchId;

  /// biometric.useFor
  ///
  /// In en, this message translates to:
  /// **'Use Biometric For'**
  String get biometricUseFor;

  /// biometric.appLogin
  ///
  /// In en, this message translates to:
  /// **'App Login'**
  String get biometricAppLogin;

  /// biometric.quickAccess
  ///
  /// In en, this message translates to:
  /// **'Quick access to your account'**
  String get biometricQuickAccess;

  /// biometric.investConfirm
  ///
  /// In en, this message translates to:
  /// **'Investment Confirmation'**
  String get biometricInvestConfirm;

  /// biometric.verifyBefore
  ///
  /// In en, this message translates to:
  /// **'Verify before investing'**
  String get biometricVerifyBefore;

  /// biometric.confirmWithdrawal
  ///
  /// In en, this message translates to:
  /// **'Confirm withdrawal requests'**
  String get biometricConfirmWithdrawal;

  /// biometric.securityNote
  ///
  /// In en, this message translates to:
  /// **'Security Note'**
  String get biometricSecurityNote;

  /// biometric.developerNote
  ///
  /// In en, this message translates to:
  /// **'Developer Note'**
  String get biometricDeveloperNote;

  /// notificationDetail.investmentUpdate
  ///
  /// In en, this message translates to:
  /// **'Investment Update'**
  String get notificationDetailInvestmentUpdate;

  /// notificationDetail.actionRequired
  ///
  /// In en, this message translates to:
  /// **'Action Required'**
  String get notificationDetailActionRequired;

  /// notificationDetail.viewProperty
  ///
  /// In en, this message translates to:
  /// **'View Property'**
  String get notificationDetailViewProperty;

  /// notificationDetail.dismiss
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get notificationDetailDismiss;

  /// notificationDetail.markAsRead
  ///
  /// In en, this message translates to:
  /// **'Mark as Read'**
  String get notificationDetailMarkAsRead;

  /// register.createAccount
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registerCreateAccount;

  /// register.alreadyHaveAccount
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get registerAlreadyHaveAccount;

  /// register.signIn
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get registerSignIn;

  /// transactionHistory.title
  ///
  /// In en, this message translates to:
  /// **'Transaction History'**
  String get transactionHistoryTitle;

  /// transactionHistory.all
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get transactionHistoryAll;

  /// transactionHistory.deposits
  ///
  /// In en, this message translates to:
  /// **'Deposits'**
  String get transactionHistoryDeposits;

  /// transactionHistory.withdrawals
  ///
  /// In en, this message translates to:
  /// **'Withdrawals'**
  String get transactionHistoryWithdrawals;

  /// transactionHistory.investments
  ///
  /// In en, this message translates to:
  /// **'Investments'**
  String get transactionHistoryInvestments;

  /// transactionHistory.returns
  ///
  /// In en, this message translates to:
  /// **'Returns'**
  String get transactionHistoryReturns;

  /// transactionHistory.noTransactions
  ///
  /// In en, this message translates to:
  /// **'No transactions found'**
  String get transactionHistoryNoTransactions;

  /// transactionHistory.filterBy
  ///
  /// In en, this message translates to:
  /// **'Filter by'**
  String get transactionHistoryFilterBy;

  /// transactionHistory.dateRange
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get transactionHistoryDateRange;

  /// darkMode.goodMorning
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get darkModeGoodMorning;

  /// darkMode.mohammed
  ///
  /// In en, this message translates to:
  /// **'Mohammed'**
  String get darkModeMohammed;

  /// darkMode.monthlyReturn
  ///
  /// In en, this message translates to:
  /// **'Monthly Return'**
  String get darkModeMonthlyReturn;

  /// darkMode.expectedAnnual
  ///
  /// In en, this message translates to:
  /// **'Expected Annual'**
  String get darkModeExpectedAnnual;

  /// darkMode.expectedReturn
  ///
  /// In en, this message translates to:
  /// **'Expected Return'**
  String get darkModeExpectedReturn;

  /// darkMode.minInvestment
  ///
  /// In en, this message translates to:
  /// **'Min. Investment'**
  String get darkModeMinInvestment;

  /// darkMode.funded
  ///
  /// In en, this message translates to:
  /// **'funded'**
  String get darkModeFunded;

  /// darkMode.residential
  ///
  /// In en, this message translates to:
  /// **'Residential'**
  String get darkModeResidential;

  /// darkMode.netReturn
  ///
  /// In en, this message translates to:
  /// **'Net Return'**
  String get darkModeNetReturn;

  /// darkMode.alOlayaTowers
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya Towers'**
  String get darkModeAlOlayaTowers;

  /// darkMode.alOlayaRiyadh
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya, Riyadh'**
  String get darkModeAlOlayaRiyadh;

  /// errorStates.title
  ///
  /// In en, this message translates to:
  /// **'Error States'**
  String get errorStatesTitle;

  /// errorStates.networkError
  ///
  /// In en, this message translates to:
  /// **'Network Error'**
  String get errorStatesNetworkError;

  /// errorStates.serverError
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get errorStatesServerError;

  /// errorStates.notFound
  ///
  /// In en, this message translates to:
  /// **'Not Found'**
  String get errorStatesNotFound;

  /// errorStates.unauthorized
  ///
  /// In en, this message translates to:
  /// **'Unauthorized'**
  String get errorStatesUnauthorized;

  /// errorStates.maintenance
  ///
  /// In en, this message translates to:
  /// **'Under Maintenance'**
  String get errorStatesMaintenance;

  /// errorStates.tryAgain
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get errorStatesTryAgain;

  /// errorStates.goBack
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get errorStatesGoBack;

  /// errorStates.contactSupport
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get errorStatesContactSupport;

  /// emptyStates.noData
  ///
  /// In en, this message translates to:
  /// **'No Data Available'**
  String get emptyStatesNoData;

  /// emptyStates.startInvesting
  ///
  /// In en, this message translates to:
  /// **'Start investing today'**
  String get emptyStatesStartInvesting;

  /// skeleton.loadingContent
  ///
  /// In en, this message translates to:
  /// **'Loading content...'**
  String get skeletonLoadingContent;

  /// skeleton.pleaseWait
  ///
  /// In en, this message translates to:
  /// **'Please wait'**
  String get skeletonPleaseWait;

  /// faq.searchQuestions
  ///
  /// In en, this message translates to:
  /// **'Search questions...'**
  String get faqSearchQuestions;

  /// faq.generalQuestions
  ///
  /// In en, this message translates to:
  /// **'General Questions'**
  String get faqGeneralQuestions;

  /// property.alOlayaTowers
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya Towers'**
  String get propertyAlOlayaTowers;

  /// property.alOlayaRiyadh
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya, Riyadh'**
  String get propertyAlOlayaRiyadh;

  /// property.kingFahdPark
  ///
  /// In en, this message translates to:
  /// **'King Fahd Business Park'**
  String get propertyKingFahdPark;

  /// property.kingFahdRoad
  ///
  /// In en, this message translates to:
  /// **'King Fahd Road, Riyadh'**
  String get propertyKingFahdRoad;

  /// property.cornicheResidences
  ///
  /// In en, this message translates to:
  /// **'Corniche Residences'**
  String get propertyCornicheResidences;

  /// property.cornicheJeddah
  ///
  /// In en, this message translates to:
  /// **'Corniche, Jeddah'**
  String get propertyCornicheJeddah;

  /// property.kafdOfficeTower
  ///
  /// In en, this message translates to:
  /// **'KAFD Office Tower'**
  String get propertyKafdOfficeTower;

  /// property.kafdRiyadh
  ///
  /// In en, this message translates to:
  /// **'KAFD, Riyadh'**
  String get propertyKafdRiyadh;

  /// property.alHamraMall
  ///
  /// In en, this message translates to:
  /// **'Al-Hamra Mall'**
  String get propertyAlHamraMall;

  /// property.alHamraRiyadh
  ///
  /// In en, this message translates to:
  /// **'Al-Hamra, Riyadh'**
  String get propertyAlHamraRiyadh;

  /// property.alNakheelResidences
  ///
  /// In en, this message translates to:
  /// **'Al-Nakheel Residences'**
  String get propertyAlNakheelResidences;

  /// property.alNakheelRiyadh
  ///
  /// In en, this message translates to:
  /// **'Al-Nakheel, Riyadh'**
  String get propertyAlNakheelRiyadh;

  /// property.jeddahWaterfront
  ///
  /// In en, this message translates to:
  /// **'Jeddah Waterfront'**
  String get propertyJeddahWaterfront;

  /// property.jeddahCorniche
  ///
  /// In en, this message translates to:
  /// **'Jeddah Corniche'**
  String get propertyJeddahCorniche;

  /// property.alYasminTower
  ///
  /// In en, this message translates to:
  /// **'Al Yasmin Tower – Riyadh'**
  String get propertyAlYasminTower;

  /// property.palmResidences
  ///
  /// In en, this message translates to:
  /// **'Palm Residences'**
  String get propertyPalmResidences;

  /// property.palmResidencesLocation
  ///
  /// In en, this message translates to:
  /// **'Al-Nakheel, Riyadh'**
  String get propertyPalmResidencesLocation;

  /// propertyType.residential
  ///
  /// In en, this message translates to:
  /// **'Residential'**
  String get propertyTypeResidential;

  /// propertyType.commercial
  ///
  /// In en, this message translates to:
  /// **'Commercial'**
  String get propertyTypeCommercial;

  /// propertyType.retail
  ///
  /// In en, this message translates to:
  /// **'Retail'**
  String get propertyTypeRetail;

  /// propertyType.all
  ///
  /// In en, this message translates to:
  /// **'All Types'**
  String get propertyTypeAll;

  /// status.available
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get statusAvailable;

  /// status.completed
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// status.almostFull
  ///
  /// In en, this message translates to:
  /// **'Almost Full'**
  String get statusAlmostFull;

  /// status.new
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get statusNew;

  /// status.fullyFunded
  ///
  /// In en, this message translates to:
  /// **'Fully Funded'**
  String get statusFullyFunded;

  /// status.processing
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get statusProcessing;

  /// status.confirmed
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get statusConfirmed;

  /// status.closed
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get statusClosed;

  /// status.ownershipIssued
  ///
  /// In en, this message translates to:
  /// **'Ownership Certificates Issued'**
  String get statusOwnershipIssued;

  /// sort.highestReturn
  ///
  /// In en, this message translates to:
  /// **'Highest Return'**
  String get sortHighestReturn;

  /// sort.lowestPrice
  ///
  /// In en, this message translates to:
  /// **'Lowest Price'**
  String get sortLowestPrice;

  /// sort.mostFunded
  ///
  /// In en, this message translates to:
  /// **'Most Funded'**
  String get sortMostFunded;

  /// sort.newest
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get sortNewest;

  /// financial.annualReturn
  ///
  /// In en, this message translates to:
  /// **'Annual Return'**
  String get financialAnnualReturn;

  /// financial.expectedReturn
  ///
  /// In en, this message translates to:
  /// **'Expected Return'**
  String get financialExpectedReturn;

  /// financial.annualRentalReturn
  ///
  /// In en, this message translates to:
  /// **'Expected Annual Rental Return'**
  String get financialAnnualRentalReturn;

  /// financial.netAnnualReturn
  ///
  /// In en, this message translates to:
  /// **'Expected Net Annual Return'**
  String get financialNetAnnualReturn;

  /// financial.fiveYearReturn
  ///
  /// In en, this message translates to:
  /// **'Expected 5-Year Total Return'**
  String get financialFiveYearReturn;

  /// financial.distributionSchedule
  ///
  /// In en, this message translates to:
  /// **'Distribution Schedule'**
  String get financialDistributionSchedule;

  /// financial.holdPeriod
  ///
  /// In en, this message translates to:
  /// **'Hold Period'**
  String get financialHoldPeriod;

  /// financial.quarterly
  ///
  /// In en, this message translates to:
  /// **'Quarterly'**
  String get financialQuarterly;

  /// financial.fiveYears
  ///
  /// In en, this message translates to:
  /// **'5 Years'**
  String get financialFiveYears;

  /// financial.tokenPrice
  ///
  /// In en, this message translates to:
  /// **'Token Price'**
  String get financialTokenPrice;

  /// financial.minInvestment
  ///
  /// In en, this message translates to:
  /// **'Min Investment'**
  String get financialMinInvestment;

  /// financial.perToken
  ///
  /// In en, this message translates to:
  /// **'/token'**
  String get financialPerToken;

  /// financial.funded
  ///
  /// In en, this message translates to:
  /// **'funded'**
  String get financialFunded;

  /// financial.distribution
  ///
  /// In en, this message translates to:
  /// **'Distribution'**
  String get financialDistribution;

  /// financial.totalInvested
  ///
  /// In en, this message translates to:
  /// **'Total Invested'**
  String get financialTotalInvested;

  /// financial.currentValue
  ///
  /// In en, this message translates to:
  /// **'Current Value'**
  String get financialCurrentValue;

  /// financial.totalReturns
  ///
  /// In en, this message translates to:
  /// **'Total Returns'**
  String get financialTotalReturns;

  /// financial.investmentDate
  ///
  /// In en, this message translates to:
  /// **'Investment Date'**
  String get financialInvestmentDate;

  /// document.investmentMemorandum
  ///
  /// In en, this message translates to:
  /// **'Investment Memorandum'**
  String get documentInvestmentMemorandum;

  /// document.valuationReport
  ///
  /// In en, this message translates to:
  /// **'Property Valuation Report'**
  String get documentValuationReport;

  /// document.financialProjections
  ///
  /// In en, this message translates to:
  /// **'Financial Projections'**
  String get documentFinancialProjections;

  /// document.legalStructure
  ///
  /// In en, this message translates to:
  /// **'Legal Structure'**
  String get documentLegalStructure;

  /// document.riskDisclosure
  ///
  /// In en, this message translates to:
  /// **'Risk Disclosure'**
  String get documentRiskDisclosure;

  /// document.investmentAgreement
  ///
  /// In en, this message translates to:
  /// **'Investment Agreement'**
  String get documentInvestmentAgreement;

  /// document.ownershipCertificate
  ///
  /// In en, this message translates to:
  /// **'Ownership Certificate'**
  String get documentOwnershipCertificate;

  /// document.annualReport
  ///
  /// In en, this message translates to:
  /// **'Annual Report'**
  String get documentAnnualReport;

  /// landmark.kingdomCentre
  ///
  /// In en, this message translates to:
  /// **'Kingdom Centre'**
  String get landmarkKingdomCentre;

  /// landmark.alFaisaliyah
  ///
  /// In en, this message translates to:
  /// **'Al Faisaliyah Tower'**
  String get landmarkAlFaisaliyah;

  /// landmark.kingFahdRoad
  ///
  /// In en, this message translates to:
  /// **'King Fahd Road'**
  String get landmarkKingFahdRoad;

  /// landmark.riyadhMetro
  ///
  /// In en, this message translates to:
  /// **'Riyadh Metro Station'**
  String get landmarkRiyadhMetro;

  /// landmark.panoramaMall
  ///
  /// In en, this message translates to:
  /// **'Panorama Mall'**
  String get landmarkPanoramaMall;

  /// explore.opportunitiesFound
  ///
  /// In en, this message translates to:
  /// **'{count} opportunities found'**
  String exploreOpportunitiesFound(Object count);

  /// explore.opportunityFound
  ///
  /// In en, this message translates to:
  /// **'{count} opportunity found'**
  String exploreOpportunityFound(Object count);

  /// explore.noResultsTitle
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get exploreNoResultsTitle;

  /// explore.noResultsSubtitle
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search or filters'**
  String get exploreNoResultsSubtitle;

  /// explore.viewDetails
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get exploreViewDetails;

  /// quickAction.deposit
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get quickActionDeposit;

  /// quickAction.withdraw
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get quickActionWithdraw;

  /// quickAction.wallet
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get quickActionWallet;

  /// quickAction.more
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get quickActionMore;

  /// notification.investmentConfirmed
  ///
  /// In en, this message translates to:
  /// **'Investment Confirmed'**
  String get notificationInvestmentConfirmed;

  /// notification.investmentProcessing
  ///
  /// In en, this message translates to:
  /// **'Investment Processing'**
  String get notificationInvestmentProcessing;

  /// notification.depositReceived
  ///
  /// In en, this message translates to:
  /// **'Deposit Received'**
  String get notificationDepositReceived;

  /// notification.withdrawalProcessed
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Processed'**
  String get notificationWithdrawalProcessed;

  /// notification.newOpportunity
  ///
  /// In en, this message translates to:
  /// **'New Opportunity Available'**
  String get notificationNewOpportunity;

  /// notification.rentalDistribution
  ///
  /// In en, this message translates to:
  /// **'Rental Distribution'**
  String get notificationRentalDistribution;

  /// notification.priceAlert
  ///
  /// In en, this message translates to:
  /// **'Price Alert'**
  String get notificationPriceAlert;

  /// notification.kycApproved
  ///
  /// In en, this message translates to:
  /// **'KYC Approved'**
  String get notificationKycApproved;

  /// transaction.deposit
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get transactionDeposit;

  /// transaction.withdrawal
  ///
  /// In en, this message translates to:
  /// **'Withdrawal'**
  String get transactionWithdrawal;

  /// transaction.investment
  ///
  /// In en, this message translates to:
  /// **'Investment'**
  String get transactionInvestment;

  /// transaction.return
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get transactionReturn;

  /// transaction.rentalIncome
  ///
  /// In en, this message translates to:
  /// **'Rental Income'**
  String get transactionRentalIncome;

  /// transaction.capitalGain
  ///
  /// In en, this message translates to:
  /// **'Capital Gain'**
  String get transactionCapitalGain;

  /// faq.investment
  ///
  /// In en, this message translates to:
  /// **'Investment'**
  String get faqInvestment;

  /// faq.securityKyc
  ///
  /// In en, this message translates to:
  /// **'Security & KYC'**
  String get faqSecurityKyc;

  /// faq.wallet
  ///
  /// In en, this message translates to:
  /// **'Wallet & Payments'**
  String get faqWallet;

  /// faq.returns
  ///
  /// In en, this message translates to:
  /// **'Returns & Distributions'**
  String get faqReturns;

  /// more.securityPin
  ///
  /// In en, this message translates to:
  /// **'Security & PIN'**
  String get moreSecurityPin;

  /// more.investmentPerformance
  ///
  /// In en, this message translates to:
  /// **'Investment performance & returns'**
  String get moreInvestmentPerformance;

  /// more.investmentRisks
  ///
  /// In en, this message translates to:
  /// **'Investment risks & warnings'**
  String get moreInvestmentRisks;

  /// kyc.annualIncomeSar
  ///
  /// In en, this message translates to:
  /// **'Annual Income (SAR)'**
  String get kycAnnualIncomeSar;

  /// kyc.selectRange
  ///
  /// In en, this message translates to:
  /// **'Select range'**
  String get kycSelectRange;

  /// kyc.district
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get kycDistrict;

  /// kyc.region
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get kycRegion;

  /// kyc.riyadhRegion
  ///
  /// In en, this message translates to:
  /// **'Riyadh Region'**
  String get kycRiyadhRegion;

  /// errorStates.timeoutMessage
  ///
  /// In en, this message translates to:
  /// **'The server took too long to respond. This might be due to a slow connection.'**
  String get errorStatesTimeoutMessage;

  /// errorStates.notFoundMessage
  ///
  /// In en, this message translates to:
  /// **'The page you\'re looking for doesn\'t exist or has been moved.'**
  String get errorStatesNotFoundMessage;

  /// errorStates.networkMessage
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again.'**
  String get errorStatesNetworkMessage;

  /// errorStates.serverMessage
  ///
  /// In en, this message translates to:
  /// **'Something went wrong on our end. Please try again later.'**
  String get errorStatesServerMessage;

  /// errorStates.unauthorizedMessage
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please log in again.'**
  String get errorStatesUnauthorizedMessage;

  /// errorStates.maintenanceMessage
  ///
  /// In en, this message translates to:
  /// **'We\'re performing scheduled maintenance. Please check back soon.'**
  String get errorStatesMaintenanceMessage;

  /// biometric.scanningFace
  ///
  /// In en, this message translates to:
  /// **'Scanning Face...'**
  String get biometricScanningFace;

  /// biometric.scanning
  ///
  /// In en, this message translates to:
  /// **'Scanning...'**
  String get biometricScanning;

  /// biometric.setup
  ///
  /// In en, this message translates to:
  /// **'Setup'**
  String get biometricSetup;

  /// biometric.identityVerified
  ///
  /// In en, this message translates to:
  /// **'Your identity has been verified successfully'**
  String get biometricIdentityVerified;

  /// biometric.useFaceId
  ///
  /// In en, this message translates to:
  /// **'Use facial recognition for quick and secure access to your account'**
  String get biometricUseFaceId;

  /// biometric.useFingerprint
  ///
  /// In en, this message translates to:
  /// **'Use your fingerprint to quickly and securely access your account'**
  String get biometricUseFingerprint;

  /// biometric.lookAtDevice
  ///
  /// In en, this message translates to:
  /// **'Look at your device to authenticate'**
  String get biometricLookAtDevice;

  /// biometric.placeFingerOnSensor
  ///
  /// In en, this message translates to:
  /// **'Place your finger on the sensor'**
  String get biometricPlaceFingerOnSensor;

  /// detail.availableStakes
  ///
  /// In en, this message translates to:
  /// **'Available Stakes'**
  String get detailAvailableStakes;

  /// detail.capitalProtection
  ///
  /// In en, this message translates to:
  /// **'Capital Protection'**
  String get detailCapitalProtection;

  /// detail.cashflow
  ///
  /// In en, this message translates to:
  /// **'Cashflow'**
  String get detailCashflow;

  /// detail.diversification
  ///
  /// In en, this message translates to:
  /// **'Diversification'**
  String get detailDiversification;

  /// detail.firstDistribution
  ///
  /// In en, this message translates to:
  /// **'First Distribution'**
  String get detailFirstDistribution;

  /// detail.floor
  ///
  /// In en, this message translates to:
  /// **'Floor'**
  String get detailFloor;

  /// detail.fundingCloses
  ///
  /// In en, this message translates to:
  /// **'Funding Closes'**
  String get detailFundingCloses;

  /// detail.fundingOpens
  ///
  /// In en, this message translates to:
  /// **'Funding Opens'**
  String get detailFundingOpens;

  /// detail.growth
  ///
  /// In en, this message translates to:
  /// **'Growth'**
  String get detailGrowth;

  /// detail.propertyAcquisition
  ///
  /// In en, this message translates to:
  /// **'Property Acquisition'**
  String get detailPropertyAcquisition;

  /// detail.stableReturns
  ///
  /// In en, this message translates to:
  /// **'Historically stable returns with low volatility'**
  String get detailStableReturns;

  /// detail.diversifiedPortfolio
  ///
  /// In en, this message translates to:
  /// **'Spread risk across multiple property types'**
  String get detailDiversifiedPortfolio;

  /// detail.regularIncome
  ///
  /// In en, this message translates to:
  /// **'Regular quarterly rental distributions'**
  String get detailRegularIncome;

  /// detail.regulatedAsset
  ///
  /// In en, this message translates to:
  /// **'CMA-regulated fractional ownership structure'**
  String get detailRegulatedAsset;

  /// empty.noResults
  ///
  /// In en, this message translates to:
  /// **'No Results Found'**
  String get emptyNoResults;

  /// empty.noSaved
  ///
  /// In en, this message translates to:
  /// **'No Saved Opportunities'**
  String get emptyNoSaved;

  /// empty.browseOpportunities
  ///
  /// In en, this message translates to:
  /// **'Browse Opportunities'**
  String get emptyBrowseOpportunities;

  /// empty.exploreOpportunities
  ///
  /// In en, this message translates to:
  /// **'Explore Opportunities'**
  String get emptyExploreOpportunities;

  /// empty.makeDeposit
  ///
  /// In en, this message translates to:
  /// **'Make a Deposit'**
  String get emptyMakeDeposit;

  /// empty.clearFilters
  ///
  /// In en, this message translates to:
  /// **'Clear Filters'**
  String get emptyClearFilters;

  /// empty.notificationSettings
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get emptyNotificationSettings;

  /// empty.savedDescription
  ///
  /// In en, this message translates to:
  /// **'Save opportunities you\'re interested in to review them later. Tap the star icon on any opportunity to save it.'**
  String get emptySavedDescription;

  /// empty.investmentsDescription
  ///
  /// In en, this message translates to:
  /// **'Start your investment journey by exploring available opportunities.'**
  String get emptyInvestmentsDescription;

  /// empty.transactionsDescription
  ///
  /// In en, this message translates to:
  /// **'Your transaction history will appear here once you make your first deposit or investment.'**
  String get emptyTransactionsDescription;

  /// empty.notificationsDescription
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up! New notifications will appear here.'**
  String get emptyNotificationsDescription;

  /// empty.resultsDescription
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search or filters to find what you\'re looking for.'**
  String get emptyResultsDescription;

  /// error.noInternet
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get errorNoInternet;

  /// error.pageNotFound
  ///
  /// In en, this message translates to:
  /// **'Page Not Found'**
  String get errorPageNotFound;

  /// error.requestTimeout
  ///
  /// In en, this message translates to:
  /// **'Request Timed Out'**
  String get errorRequestTimeout;

  /// error.serverError
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get errorServerError;

  /// error.maintenance
  ///
  /// In en, this message translates to:
  /// **'Maintenance'**
  String get errorMaintenance;

  /// error.checkConnection
  ///
  /// In en, this message translates to:
  /// **'Check Connection'**
  String get errorCheckConnection;

  /// error.goBack
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get errorGoBack;

  /// error.checkStatus
  ///
  /// In en, this message translates to:
  /// **'Check Status'**
  String get errorCheckStatus;

  /// error.reportIssue
  ///
  /// In en, this message translates to:
  /// **'Report Issue'**
  String get errorReportIssue;

  /// error.openSettings
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get errorOpenSettings;

  /// faq.properties
  ///
  /// In en, this message translates to:
  /// **'Properties'**
  String get faqProperties;

  /// faq.rewardsReferrals
  ///
  /// In en, this message translates to:
  /// **'Rewards & Referrals'**
  String get faqRewardsReferrals;

  /// investFlow.proceedToPayment
  ///
  /// In en, this message translates to:
  /// **'Proceed to Payment'**
  String get investFlowProceedToPayment;

  /// investFlow.bankTransfer
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get investFlowBankTransfer;

  /// investFlow.payWithMada
  ///
  /// In en, this message translates to:
  /// **'Pay with mada'**
  String get investFlowPayWithMada;

  /// investFlow.topUpAndPay
  ///
  /// In en, this message translates to:
  /// **'Top Up & Pay'**
  String get investFlowTopUpAndPay;

  /// investFlow.totalInvestment
  ///
  /// In en, this message translates to:
  /// **'Total Investment'**
  String get investFlowTotalInvestment;

  /// investFlow.expectedRentalYield
  ///
  /// In en, this message translates to:
  /// **'Expected Rental Yield'**
  String get investFlowExpectedRentalYield;

  /// investFlow.numberOfShares
  ///
  /// In en, this message translates to:
  /// **'Number of Tokens'**
  String get investFlowNumberOfShares;

  /// investFlow.expectedAnnualReturn
  ///
  /// In en, this message translates to:
  /// **'Expected Annual Return'**
  String get investFlowExpectedAnnualReturn;

  /// investSuccess.transactionId
  ///
  /// In en, this message translates to:
  /// **'Transaction ID'**
  String get investSuccessTransactionId;

  /// investSuccess.investmentDate
  ///
  /// In en, this message translates to:
  /// **'Investment Date'**
  String get investSuccessInvestmentDate;

  /// investSuccess.nextDistribution
  ///
  /// In en, this message translates to:
  /// **'Next Distribution'**
  String get investSuccessNextDistribution;

  /// investSuccess.paymentMethod
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get investSuccessPaymentMethod;

  /// investmentDetail.amountInvested
  ///
  /// In en, this message translates to:
  /// **'Amount Invested'**
  String get investmentDetailAmountInvested;

  /// investmentDetail.returnRate
  ///
  /// In en, this message translates to:
  /// **'Return Rate'**
  String get investmentDetailReturnRate;

  /// investmentDetail.totalProfit
  ///
  /// In en, this message translates to:
  /// **'Total Profit'**
  String get investmentDetailTotalProfit;

  /// investmentDetail.distributionsReceived
  ///
  /// In en, this message translates to:
  /// **'Distributions Received'**
  String get investmentDetailDistributionsReceived;

  /// investmentDetail.payment
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get investmentDetailPayment;

  /// investmentDetail.verification
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get investmentDetailVerification;

  /// investmentDetail.registration
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get investmentDetailRegistration;

  /// investmentDetail.certificate
  ///
  /// In en, this message translates to:
  /// **'Certificate'**
  String get investmentDetailCertificate;

  /// investmentDetail.investmentAgreement
  ///
  /// In en, this message translates to:
  /// **'Investment Agreement'**
  String get investmentDetailInvestmentAgreement;

  /// investmentDetail.paymentReceipt
  ///
  /// In en, this message translates to:
  /// **'Payment Receipt'**
  String get investmentDetailPaymentReceipt;

  /// investmentDetail.processing
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get investmentDetailProcessing;

  /// investmentDetail.yourInvestmentsProcessing
  ///
  /// In en, this message translates to:
  /// **'Your investments are still being processed.'**
  String get investmentDetailYourInvestmentsProcessing;

  /// kyc.customerInfo
  ///
  /// In en, this message translates to:
  /// **'Customer Information'**
  String get kycCustomerInfo;

  /// kyc.addressInfo
  ///
  /// In en, this message translates to:
  /// **'Address Information'**
  String get kycAddressInfo;

  /// kyc.employmentInfo
  ///
  /// In en, this message translates to:
  /// **'Employment Information'**
  String get kycEmploymentInfo;

  /// kyc.employerName
  ///
  /// In en, this message translates to:
  /// **'Employer Name'**
  String get kycEmployerName;

  /// kyc.employerPhone
  ///
  /// In en, this message translates to:
  /// **'Employer Phone'**
  String get kycEmployerPhone;

  /// kyc.employerAddress
  ///
  /// In en, this message translates to:
  /// **'Employer Address'**
  String get kycEmployerAddress;

  /// kyc.buildingNumber
  ///
  /// In en, this message translates to:
  /// **'Building Number'**
  String get kycBuildingNumber;

  /// kyc.additionalNumber
  ///
  /// In en, this message translates to:
  /// **'Additional Number'**
  String get kycAdditionalNumber;

  /// kyc.educationLevel
  ///
  /// In en, this message translates to:
  /// **'Education Level'**
  String get kycEducationLevel;

  /// notification.dividendPayment
  ///
  /// In en, this message translates to:
  /// **'Dividend Payment Received'**
  String get notificationDividendPayment;

  /// notification.documentReady
  ///
  /// In en, this message translates to:
  /// **'Document Ready'**
  String get notificationDocumentReady;

  /// notification.newLoginDetected
  ///
  /// In en, this message translates to:
  /// **'New Login Detected'**
  String get notificationNewLoginDetected;

  /// notification.securityAlert
  ///
  /// In en, this message translates to:
  /// **'Security Alert'**
  String get notificationSecurityAlert;

  /// notification.systemUpdate
  ///
  /// In en, this message translates to:
  /// **'System Update'**
  String get notificationSystemUpdate;

  /// notification.viewInvestment
  ///
  /// In en, this message translates to:
  /// **'View Investment'**
  String get notificationViewInvestment;

  /// notification.viewTransaction
  ///
  /// In en, this message translates to:
  /// **'View Transaction'**
  String get notificationViewTransaction;

  /// notification.downloadCertificate
  ///
  /// In en, this message translates to:
  /// **'Download Certificate'**
  String get notificationDownloadCertificate;

  /// notification.reviewActivity
  ///
  /// In en, this message translates to:
  /// **'Review Activity'**
  String get notificationReviewActivity;

  /// notification.viewOpportunity
  ///
  /// In en, this message translates to:
  /// **'View Opportunity'**
  String get notificationViewOpportunity;

  /// notification.trackStatus
  ///
  /// In en, this message translates to:
  /// **'Track Status'**
  String get notificationTrackStatus;

  /// notification.unread
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get notificationUnread;

  /// onboarding.browseInvest
  ///
  /// In en, this message translates to:
  /// **'Browse & Invest in Minutes'**
  String get onboardingBrowseInvest;

  /// onboarding.digitalWallet
  ///
  /// In en, this message translates to:
  /// **'Digital Wallet'**
  String get onboardingDigitalWallet;

  /// onboarding.earnRewards
  ///
  /// In en, this message translates to:
  /// **'Earn Rewards'**
  String get onboardingEarnRewards;

  /// onboarding.manageFunds
  ///
  /// In en, this message translates to:
  /// **'Manage Your Funds Easily'**
  String get onboardingManageFunds;

  /// onboarding.exploreDescription
  ///
  /// In en, this message translates to:
  /// **'Explore curated real estate opportunities, review detailed financials, and invest with just a few taps.'**
  String get onboardingExploreDescription;

  /// onboarding.walletDescription
  ///
  /// In en, this message translates to:
  /// **'Deposit via VIBAN or mada card, track your transactions, and withdraw to your personal bank account anytime.'**
  String get onboardingWalletDescription;

  /// onboarding.rewardsDescription
  ///
  /// In en, this message translates to:
  /// **'Earn points for every investment, referral, and milestone. Unlock exclusive tiers and benefits.'**
  String get onboardingRewardsDescription;

  /// profile.addressProof
  ///
  /// In en, this message translates to:
  /// **'Address Proof'**
  String get profileAddressProof;

  /// profile.incomeProof
  ///
  /// In en, this message translates to:
  /// **'Income Proof'**
  String get profileIncomeProof;

  /// profile.kycVerification
  ///
  /// In en, this message translates to:
  /// **'KYC & Verification'**
  String get profileKycVerification;

  /// profile.notUploaded
  ///
  /// In en, this message translates to:
  /// **'Not Uploaded'**
  String get profileNotUploaded;

  /// rewards.launch
  ///
  /// In en, this message translates to:
  /// **'Launch'**
  String get rewardsLaunch;

  /// rewards.pioneer
  ///
  /// In en, this message translates to:
  /// **'Pioneer'**
  String get rewardsPioneer;

  /// rewards.broker
  ///
  /// In en, this message translates to:
  /// **'Broker'**
  String get rewardsBroker;

  /// rewards.aqili
  ///
  /// In en, this message translates to:
  /// **'Aqili'**
  String get rewardsAqili;

  /// rewards.distinguished
  ///
  /// In en, this message translates to:
  /// **'Distinguished'**
  String get rewardsDistinguished;

  /// transaction.quarterlyReturn
  ///
  /// In en, this message translates to:
  /// **'Quarterly Return'**
  String get transactionQuarterlyReturn;

  /// transaction.referralBonus
  ///
  /// In en, this message translates to:
  /// **'Referral Bonus'**
  String get transactionReferralBonus;

  /// portfolio.avgReturn
  ///
  /// In en, this message translates to:
  /// **'Avg Return'**
  String get portfolioAvgReturn;

  /// portfolio.upcomingDistribution
  ///
  /// In en, this message translates to:
  /// **'Upcoming Distribution'**
  String get portfolioUpcomingDistribution;

  /// portfolio.expectedDate
  ///
  /// In en, this message translates to:
  /// **'Expected on March 15, 2026'**
  String get portfolioExpectedDate;

  /// portfolio.allocation
  ///
  /// In en, this message translates to:
  /// **'Portfolio Allocation'**
  String get portfolioAllocation;

  /// portfolio.myInvestments
  ///
  /// In en, this message translates to:
  /// **'My Investments'**
  String get portfolioMyInvestments;

  /// portfolio.performanceSummary
  ///
  /// In en, this message translates to:
  /// **'Performance Summary'**
  String get portfolioPerformanceSummary;

  /// portfolio.allConfirmed
  ///
  /// In en, this message translates to:
  /// **'All your investments have been confirmed!'**
  String get portfolioAllConfirmed;

  /// portfolio.stillProcessing
  ///
  /// In en, this message translates to:
  /// **'Your investments are still being processed.'**
  String get portfolioStillProcessing;

  /// portfolio.pending
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get portfolioPending;

  /// portfolio.totalProfit
  ///
  /// In en, this message translates to:
  /// **'Total Profit'**
  String get portfolioTotalProfit;

  /// portfolio.rentalIncome
  ///
  /// In en, this message translates to:
  /// **'Rental Income'**
  String get portfolioRentalIncome;

  /// portfolio.capitalGain
  ///
  /// In en, this message translates to:
  /// **'Capital Gain'**
  String get portfolioCapitalGain;

  /// portfolio.distributionsReceived
  ///
  /// In en, this message translates to:
  /// **'Distributions Received'**
  String get portfolioDistributionsReceived;

  /// profile.myProfile
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get profileMyProfile;

  /// profile.bankAccount
  ///
  /// In en, this message translates to:
  /// **'Bank Account'**
  String get profileBankAccount;

  /// profile.referralCode
  ///
  /// In en, this message translates to:
  /// **'Referral Code'**
  String get profileReferralCode;

  /// profile.helpSupport
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get profileHelpSupport;

  /// rewards.launchTier
  ///
  /// In en, this message translates to:
  /// **'Launch (Al-Iitlaq) tier'**
  String get rewardsLaunchTier;

  /// rewards.startInvesting
  ///
  /// In en, this message translates to:
  /// **'Start investing to upgrade your tier'**
  String get rewardsStartInvesting;

  /// rewards.referEarn
  ///
  /// In en, this message translates to:
  /// **'Refer and earn'**
  String get rewardsReferEarn;

  /// rewards.referMessage
  ///
  /// In en, this message translates to:
  /// **'Join me on Hseeltech and receive SAR 150 instantly to invest in income-generating real estate! Let\'s grow our wealth together.'**
  String get rewardsReferMessage;

  /// rewards.rewardPolicy
  ///
  /// In en, this message translates to:
  /// **'Reward Policy'**
  String get rewardsRewardPolicy;

  /// rewards.tierLevels
  ///
  /// In en, this message translates to:
  /// **'TIER LEVELS'**
  String get rewardsTierLevels;

  /// rewards.current
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get rewardsCurrent;

  /// rewards.builder
  ///
  /// In en, this message translates to:
  /// **'Builder (Al-Bani)'**
  String get rewardsBuilder;

  /// rewards.elite
  ///
  /// In en, this message translates to:
  /// **'Elite (Al-Nakhba)'**
  String get rewardsElite;

  /// faq.general
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get faqGeneral;

  /// faq.walletPayments
  ///
  /// In en, this message translates to:
  /// **'Wallet & Payments'**
  String get faqWalletPayments;

  /// faq.stillQuestions
  ///
  /// In en, this message translates to:
  /// **'Still have questions?'**
  String get faqStillQuestions;

  /// faq.supportHelp
  ///
  /// In en, this message translates to:
  /// **'Our support team is here to help'**
  String get faqSupportHelp;

  /// faq.contactSupport
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get faqContactSupport;

  /// notification.dividendDistributed
  ///
  /// In en, this message translates to:
  /// **'Dividend Distributed'**
  String get notificationDividendDistributed;

  /// notification.referralBonus
  ///
  /// In en, this message translates to:
  /// **'Referral Bonus Earned'**
  String get notificationReferralBonus;

  /// notification.valuationUpdate
  ///
  /// In en, this message translates to:
  /// **'Property Valuation Update'**
  String get notificationValuationUpdate;

  /// notification.documentUploaded
  ///
  /// In en, this message translates to:
  /// **'Document Uploaded'**
  String get notificationDocumentUploaded;

  /// invest.stepOf
  ///
  /// In en, this message translates to:
  /// **'Step {step} of {total}'**
  String investStepOf(Object step, Object total);

  /// detail.highlight.growth
  ///
  /// In en, this message translates to:
  /// **'Growth'**
  String get detailHighlightGrowth;

  /// detail.highlight.growthDesc
  ///
  /// In en, this message translates to:
  /// **'Prime location appreciation'**
  String get detailHighlightGrowthDesc;

  /// detail.highlight.cashflow
  ///
  /// In en, this message translates to:
  /// **'Cashflow'**
  String get detailHighlightCashflow;

  /// detail.highlight.cashflowDesc
  ///
  /// In en, this message translates to:
  /// **'Quarterly distributions'**
  String get detailHighlightCashflowDesc;

  /// detail.highlight.capitalProtection
  ///
  /// In en, this message translates to:
  /// **'Capital Protection'**
  String get detailHighlightCapitalProtection;

  /// detail.highlight.capitalProtectionDesc
  ///
  /// In en, this message translates to:
  /// **'Structured investment'**
  String get detailHighlightCapitalProtectionDesc;

  /// detail.highlight.diversification
  ///
  /// In en, this message translates to:
  /// **'Diversification'**
  String get detailHighlightDiversification;

  /// detail.highlight.diversificationDesc
  ///
  /// In en, this message translates to:
  /// **'Real estate exposure'**
  String get detailHighlightDiversificationDesc;

  /// detail.prop.propertyType
  ///
  /// In en, this message translates to:
  /// **'Property Type'**
  String get detailPropPropertyType;

  /// detail.prop.residentialApartment
  ///
  /// In en, this message translates to:
  /// **'Residential Apartment'**
  String get detailPropResidentialApartment;

  /// detail.prop.totalArea
  ///
  /// In en, this message translates to:
  /// **'Total Area'**
  String get detailPropTotalArea;

  /// detail.prop.bedrooms
  ///
  /// In en, this message translates to:
  /// **'Bedrooms'**
  String get detailPropBedrooms;

  /// detail.prop.bathrooms
  ///
  /// In en, this message translates to:
  /// **'Bathrooms'**
  String get detailPropBathrooms;

  /// detail.prop.floor
  ///
  /// In en, this message translates to:
  /// **'Floor'**
  String get detailPropFloor;

  /// detail.prop.yearBuilt
  ///
  /// In en, this message translates to:
  /// **'Year Built'**
  String get detailPropYearBuilt;

  /// detail.prop.parking
  ///
  /// In en, this message translates to:
  /// **'Parking'**
  String get detailPropParking;

  /// detail.prop.dedicatedSpot
  ///
  /// In en, this message translates to:
  /// **'1 Dedicated Spot'**
  String get detailPropDedicatedSpot;

  /// detail.deal.propertyPrice
  ///
  /// In en, this message translates to:
  /// **'Property Price'**
  String get detailDealPropertyPrice;

  /// detail.deal.totalStakes
  ///
  /// In en, this message translates to:
  /// **'Total Stakes'**
  String get detailDealTotalStakes;

  /// detail.deal.pricePerShare
  ///
  /// In en, this message translates to:
  /// **'Price Per Token'**
  String get detailDealPricePerShare;

  /// detail.deal.minInvestment
  ///
  /// In en, this message translates to:
  /// **'Min Investment'**
  String get detailDealMinInvestment;

  /// detail.deal.maxInvestment
  ///
  /// In en, this message translates to:
  /// **'Max Investment'**
  String get detailDealMaxInvestment;

  /// detail.deal.availableStakes
  ///
  /// In en, this message translates to:
  /// **'Available Stakes'**
  String get detailDealAvailableStakes;

  /// detail.timeline.fundingOpens
  ///
  /// In en, this message translates to:
  /// **'Funding Opens'**
  String get detailTimelineFundingOpens;

  /// detail.timeline.fundingCloses
  ///
  /// In en, this message translates to:
  /// **'Funding Closes'**
  String get detailTimelineFundingCloses;

  /// detail.timeline.propertyAcquisition
  ///
  /// In en, this message translates to:
  /// **'Property Acquisition'**
  String get detailTimelinePropertyAcquisition;

  /// detail.timeline.firstDistribution
  ///
  /// In en, this message translates to:
  /// **'First Distribution'**
  String get detailTimelineFirstDistribution;

  /// detail.whyInvest.stableReturns
  ///
  /// In en, this message translates to:
  /// **'Historically stable returns with low volatility'**
  String get detailWhyInvestStableReturns;

  /// detail.whyInvest.tangibleAsset
  ///
  /// In en, this message translates to:
  /// **'Tangible asset backed by physical property'**
  String get detailWhyInvestTangibleAsset;

  /// detail.whyInvest.inflationHedge
  ///
  /// In en, this message translates to:
  /// **'Natural hedge against inflation'**
  String get detailWhyInvestInflationHedge;

  /// invest.selectShares
  ///
  /// In en, this message translates to:
  /// **'SELECT NUMBER OF TOKENS'**
  String get investSelectShares;

  /// invest.token
  ///
  /// In en, this message translates to:
  /// **'token'**
  String get investToken;

  /// invest.totalInvestment
  ///
  /// In en, this message translates to:
  /// **'Total Investment'**
  String get investTotalInvestment;

  /// invest.available
  ///
  /// In en, this message translates to:
  /// **'AVAILABLE'**
  String get investAvailable;

  /// invest.sufficient
  ///
  /// In en, this message translates to:
  /// **'Sufficient'**
  String get investSufficient;

  /// invest.insufficient
  ///
  /// In en, this message translates to:
  /// **'Insufficient'**
  String get investInsufficient;

  /// investSuccess.congratulations
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get investSuccessCongratulations;

  /// investSuccess.successMessage
  ///
  /// In en, this message translates to:
  /// **'Your investment has been successfully processed'**
  String get investSuccessSuccessMessage;

  /// investSuccess.status
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get investSuccessStatus;

  /// investSuccess.completed
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get investSuccessCompleted;

  /// investSuccess.viewPortfolio
  ///
  /// In en, this message translates to:
  /// **'View Portfolio'**
  String get investSuccessViewPortfolio;

  /// investSuccess.backHome
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get investSuccessBackHome;

  /// welcome.nafathVerified
  ///
  /// In en, this message translates to:
  /// **'Nafath Verified'**
  String get welcomeNafathVerified;

  /// welcome.premiumProperties
  ///
  /// In en, this message translates to:
  /// **'Premium Properties'**
  String get welcomePremiumProperties;

  /// welcome.secureTrusted
  ///
  /// In en, this message translates to:
  /// **'Secure & Trusted'**
  String get welcomeSecureTrusted;

  /// detail.estQuarterlyDistribution
  ///
  /// In en, this message translates to:
  /// **'Est. Quarterly Distribution'**
  String get detailEstQuarterlyDistribution;

  /// detail.highlights
  ///
  /// In en, this message translates to:
  /// **'Opportunity Highlights'**
  String get detailHighlights;

  /// detail.whyInvest
  ///
  /// In en, this message translates to:
  /// **'Why Invest in Real Estate?'**
  String get detailWhyInvest;

  /// detail.dealTerms
  ///
  /// In en, this message translates to:
  /// **'Deal Terms'**
  String get detailDealTerms;

  /// rewards.learn
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get rewardsLearn;

  /// rewards.ourTiers
  ///
  /// In en, this message translates to:
  /// **'Our tiers'**
  String get rewardsOurTiers;

  /// rewards.learnMore
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get rewardsLearnMore;

  /// rewards.totalEarnings
  ///
  /// In en, this message translates to:
  /// **'Total Earnings'**
  String get rewardsTotalEarnings;

  /// rewards.rewardBalance
  ///
  /// In en, this message translates to:
  /// **'Reward balance available for investment'**
  String get rewardsRewardBalance;

  /// rewards.breakdown
  ///
  /// In en, this message translates to:
  /// **'Breakdown'**
  String get rewardsBreakdown;

  /// rewards.referralRewards
  ///
  /// In en, this message translates to:
  /// **'Referral Rewards'**
  String get rewardsReferralRewards;

  /// rewards.buildingRewards
  ///
  /// In en, this message translates to:
  /// **'Building Rewards'**
  String get rewardsBuildingRewards;

  /// rewards.bonusCredits
  ///
  /// In en, this message translates to:
  /// **'Bonus Credits'**
  String get rewardsBonusCredits;

  /// rewards.referralDashboard
  ///
  /// In en, this message translates to:
  /// **'Referral Dashboard'**
  String get rewardsReferralDashboard;

  /// rewards.friendsInvited
  ///
  /// In en, this message translates to:
  /// **'Friends Invited'**
  String get rewardsFriendsInvited;

  /// rewards.signedUp
  ///
  /// In en, this message translates to:
  /// **'Signed Up'**
  String get rewardsSignedUp;

  /// rewards.totalRewardsEarned
  ///
  /// In en, this message translates to:
  /// **'Total rewards earned'**
  String get rewardsTotalRewardsEarned;

  /// profile.completeVerification
  ///
  /// In en, this message translates to:
  /// **'Complete your verification to start investing'**
  String get profileCompleteVerification;

  /// profile.investorClassification
  ///
  /// In en, this message translates to:
  /// **'Investor Classification'**
  String get profileInvestorClassification;

  /// profile.individualInvestor
  ///
  /// In en, this message translates to:
  /// **'Individual Investor'**
  String get profileIndividualInvestor;

  /// profile.eligible
  ///
  /// In en, this message translates to:
  /// **'Eligible'**
  String get profileEligible;

  /// profile.saudiResident
  ///
  /// In en, this message translates to:
  /// **'Saudi resident, eligible for real estate investment opportunities'**
  String get profileSaudiResident;

  /// profile.verificationSteps
  ///
  /// In en, this message translates to:
  /// **'Verification Steps'**
  String get profileVerificationSteps;

  /// profile.yourReferralCode
  ///
  /// In en, this message translates to:
  /// **'Your referral code'**
  String get profileYourReferralCode;

  /// profile.referralStats
  ///
  /// In en, this message translates to:
  /// **'Referral Stats'**
  String get profileReferralStats;

  /// profile.successful
  ///
  /// In en, this message translates to:
  /// **'Successful'**
  String get profileSuccessful;

  /// profile.pending
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get profilePending;

  /// profile.earnings
  ///
  /// In en, this message translates to:
  /// **'Earnings'**
  String get profileEarnings;

  /// profile.investedCampaign
  ///
  /// In en, this message translates to:
  /// **'Invested Campaign'**
  String get profileInvestedCampaign;

  /// profile.savedCampaign
  ///
  /// In en, this message translates to:
  /// **'Saved Campaign'**
  String get profileSavedCampaign;

  /// profile.editInfo
  ///
  /// In en, this message translates to:
  /// **'Edit Information'**
  String get profileEditInfo;

  /// profile.shareCode
  ///
  /// In en, this message translates to:
  /// **'Share your code'**
  String get profileShareCode;

  /// profile.uploadDocuments
  ///
  /// In en, this message translates to:
  /// **'Upload Missing Documents'**
  String get profileUploadDocuments;

  /// invest.continuePayment
  ///
  /// In en, this message translates to:
  /// **'Continue to Payment'**
  String get investContinuePayment;

  /// invest.payNow
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get investPayNow;

  /// invest.secureTransaction
  ///
  /// In en, this message translates to:
  /// **'Secure Transaction'**
  String get investSecureTransaction;

  /// investSuccess.transactionDetails
  ///
  /// In en, this message translates to:
  /// **'Transaction Details'**
  String get investSuccessTransactionDetails;

  /// investSuccess.copyTransactionId
  ///
  /// In en, this message translates to:
  /// **'Copy Transaction ID'**
  String get investSuccessCopyTransactionId;

  /// investSuccess.downloadReceipt
  ///
  /// In en, this message translates to:
  /// **'Download Receipt'**
  String get investSuccessDownloadReceipt;

  /// investSuccess.exploreMore
  ///
  /// In en, this message translates to:
  /// **'Explore More Opportunities'**
  String get investSuccessExploreMore;

  /// faq.tryDifferent
  ///
  /// In en, this message translates to:
  /// **'Try different keywords'**
  String get faqTryDifferent;

  /// wallet.txn.deposit
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get walletTxnDeposit;

  /// wallet.txn.vibanTransfer
  ///
  /// In en, this message translates to:
  /// **'VIBAN Transfer - ANB'**
  String get walletTxnVibanTransfer;

  /// wallet.txn.investmentAlOlaya
  ///
  /// In en, this message translates to:
  /// **'Investment - Al-Olaya Heights'**
  String get walletTxnInvestmentAlOlaya;

  /// wallet.txn.tokensPurchased
  ///
  /// In en, this message translates to:
  /// **'2 tokens purchased'**
  String get walletTxnTokensPurchased;

  /// wallet.txn.quarterlyReturn
  ///
  /// In en, this message translates to:
  /// **'Quarterly Return'**
  String get walletTxnQuarterlyReturn;

  /// wallet.txn.alMalqaResidences
  ///
  /// In en, this message translates to:
  /// **'Al-Malqa Residences'**
  String get walletTxnAlMalqaResidences;

  /// wallet.txn.referralBonus
  ///
  /// In en, this message translates to:
  /// **'Referral Bonus'**
  String get walletTxnReferralBonus;

  /// wallet.txn.ahmedJoined
  ///
  /// In en, this message translates to:
  /// **'Ahmed joined via your link'**
  String get walletTxnAhmedJoined;

  /// wallet.txn.withdrawal
  ///
  /// In en, this message translates to:
  /// **'Withdrawal'**
  String get walletTxnWithdrawal;

  /// wallet.txn.toVerifiedIban
  ///
  /// In en, this message translates to:
  /// **'To Verified IBAN ****7823'**
  String get walletTxnToVerifiedIban;

  /// wallet.txn.madaPayment
  ///
  /// In en, this message translates to:
  /// **'mada Payment'**
  String get walletTxnMadaPayment;

  /// notification.dividendTitle
  ///
  /// In en, this message translates to:
  /// **'Dividend Distributed'**
  String get notificationDividendTitle;

  /// notification.dividendMsg
  ///
  /// In en, this message translates to:
  /// **'Your Q4 2025 rental dividend of 312.50 SAR for Al Olaya Towers has been credited to your wallet.'**
  String get notificationDividendMsg;

  /// notification.depositTitle
  ///
  /// In en, this message translates to:
  /// **'Deposit Received'**
  String get notificationDepositTitle;

  /// notification.depositMsg
  ///
  /// In en, this message translates to:
  /// **'Your bank transfer of 10,000 SAR has been received and credited to your wallet.'**
  String get notificationDepositMsg;

  /// notification.tierTitle
  ///
  /// In en, this message translates to:
  /// **'Tier Upgrade!'**
  String get notificationTierTitle;

  /// notification.tierMsg
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You\'ve been upgraded to Pioneer tier. Enjoy enhanced benefits and priority access.'**
  String get notificationTierMsg;

  /// notification.newOpportunityTitle
  ///
  /// In en, this message translates to:
  /// **'New Opportunity Available'**
  String get notificationNewOpportunityTitle;

  /// notification.newOpportunityMsg
  ///
  /// In en, this message translates to:
  /// **'Al-Nakheel Commercial Center is now open for investment. Target return: 9.2% annually.'**
  String get notificationNewOpportunityMsg;

  /// notification.kycTitle
  ///
  /// In en, this message translates to:
  /// **'KYC Approved'**
  String get notificationKycTitle;

  /// notification.kycMsg
  ///
  /// In en, this message translates to:
  /// **'Your identity verification has been approved. You can now invest and withdraw funds.'**
  String get notificationKycMsg;

  /// notification.priceTitle
  ///
  /// In en, this message translates to:
  /// **'Price Update'**
  String get notificationPriceTitle;

  /// notification.priceMsg
  ///
  /// In en, this message translates to:
  /// **'The token price of Al-Malqa Residences has been updated to reflect the latest property valuation.'**
  String get notificationPriceMsg;

  /// notification.maintenanceTitle
  ///
  /// In en, this message translates to:
  /// **'Scheduled Maintenance'**
  String get notificationMaintenanceTitle;

  /// notification.maintenanceMsg
  ///
  /// In en, this message translates to:
  /// **'The platform will undergo scheduled maintenance on Feb 15 from 2:00 AM to 4:00 AM.'**
  String get notificationMaintenanceMsg;

  /// notification.viewDetails
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get notificationViewDetails;

  /// notifDetail.ownershipCert
  ///
  /// In en, this message translates to:
  /// **'Ownership Certificate'**
  String get notifDetailOwnershipCert;

  /// notifDetail.investConfirmed
  ///
  /// In en, this message translates to:
  /// **'Investment Confirmed'**
  String get notifDetailInvestConfirmed;

  /// notifDetail.investConfirmedBody
  ///
  /// In en, this message translates to:
  /// **'Your investment of 5,000 SAR in Al-Olaya Business Tower has been confirmed. Ownership certificate has been issued by the Real Estate Registration Authority.'**
  String get notifDetailInvestConfirmedBody;

  /// notifDetail.viewInvestment
  ///
  /// In en, this message translates to:
  /// **'View Investment'**
  String get notifDetailViewInvestment;

  /// notifDetail.dividendTitle
  ///
  /// In en, this message translates to:
  /// **'Dividend Payment Received'**
  String get notifDetailDividendTitle;

  /// notifDetail.dividendBody
  ///
  /// In en, this message translates to:
  /// **'You have received a dividend payment of 625 SAR from Al-Malqa Residential Complex. The amount has been credited to your wallet.'**
  String get notifDetailDividendBody;

  /// notifDetail.viewTransaction
  ///
  /// In en, this message translates to:
  /// **'View Transaction'**
  String get notifDetailViewTransaction;

  /// notifDetail.newOpportunityTitle
  ///
  /// In en, this message translates to:
  /// **'New Investment Opportunity'**
  String get notifDetailNewOpportunityTitle;

  /// notifDetail.newOpportunityBody
  ///
  /// In en, this message translates to:
  /// **'Al-Nakheel Commercial Center in Riyadh is now open for investment. This Grade A commercial property offers an expected annual return of 9.2%.'**
  String get notifDetailNewOpportunityBody;

  /// notifDetail.viewOpportunity
  ///
  /// In en, this message translates to:
  /// **'View Opportunity'**
  String get notifDetailViewOpportunity;

  /// notifDetail.kycTitle
  ///
  /// In en, this message translates to:
  /// **'KYC Verification Complete'**
  String get notifDetailKycTitle;

  /// notifDetail.kycBody
  ///
  /// In en, this message translates to:
  /// **'Your identity verification through Nafath has been successfully completed. All documents have been verified and your account is now fully activated.'**
  String get notifDetailKycBody;

  /// notifDetail.completeProfile
  ///
  /// In en, this message translates to:
  /// **'Complete Profile'**
  String get notifDetailCompleteProfile;

  /// txHistory.deposit
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get txHistoryDeposit;

  /// txHistory.investment
  ///
  /// In en, this message translates to:
  /// **'Investment'**
  String get txHistoryInvestment;

  /// txHistory.return
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get txHistoryReturn;

  /// txHistory.referral
  ///
  /// In en, this message translates to:
  /// **'Referral'**
  String get txHistoryReferral;

  /// txHistory.withdrawal
  ///
  /// In en, this message translates to:
  /// **'Withdrawal'**
  String get txHistoryWithdrawal;

  /// txHistory.tokensPurchased
  ///
  /// In en, this message translates to:
  /// **'{count} tokens purchased'**
  String txHistoryTokensPurchased(Object count);

  /// txHistory.toVerifiedIban
  ///
  /// In en, this message translates to:
  /// **'To Verified IBAN'**
  String get txHistoryToVerifiedIban;

  /// more.transfer
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get moreTransfer;

  /// more.statement
  ///
  /// In en, this message translates to:
  /// **'Statement'**
  String get moreStatement;

  /// more.bankAccounts
  ///
  /// In en, this message translates to:
  /// **'Bank Accounts'**
  String get moreBankAccounts;

  /// more.manageBankAccounts
  ///
  /// In en, this message translates to:
  /// **'Manage linked IBAN accounts'**
  String get moreManageBankAccounts;

  /// more.personalProfile
  ///
  /// In en, this message translates to:
  /// **'Personal Profile'**
  String get morePersonalProfile;

  /// more.personalInfo
  ///
  /// In en, this message translates to:
  /// **'Personal information & address'**
  String get morePersonalInfo;

  /// more.identityVerification
  ///
  /// In en, this message translates to:
  /// **'Identity Verification'**
  String get moreIdentityVerification;

  /// more.complete
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get moreComplete;

  /// more.managePin
  ///
  /// In en, this message translates to:
  /// **'Manage PIN & biometric access'**
  String get moreManagePin;

  /// more.appSettings
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get moreAppSettings;

  /// more.managePreferences
  ///
  /// In en, this message translates to:
  /// **'Language, notifications & display'**
  String get moreManagePreferences;

  /// more.helpSupport
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get moreHelpSupport;

  /// more.faqContact
  ///
  /// In en, this message translates to:
  /// **'FAQ, contact & feedback'**
  String get moreFaqContact;

  /// more.aboutApp
  ///
  /// In en, this message translates to:
  /// **'About Hseeltech'**
  String get moreAboutApp;

  /// more.legalInfo
  ///
  /// In en, this message translates to:
  /// **'Legal information & version'**
  String get moreLegalInfo;

  /// more.signOut
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get moreSignOut;

  /// completedReport.overviewTab
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get completedReportOverviewTab;

  /// completedReport.returnsTab
  ///
  /// In en, this message translates to:
  /// **'Returns'**
  String get completedReportReturnsTab;

  /// completedReport.timelineTab
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get completedReportTimelineTab;

  /// completedReport.documentsTab
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get completedReportDocumentsTab;

  /// completedReport.opportunityListed
  ///
  /// In en, this message translates to:
  /// **'Opportunity Listed'**
  String get completedReportOpportunityListed;

  /// completedReport.opportunityListedDesc
  ///
  /// In en, this message translates to:
  /// **'Property listed on Hseeltech platform'**
  String get completedReportOpportunityListedDesc;

  /// completedReport.fundingStarted
  ///
  /// In en, this message translates to:
  /// **'Funding Started'**
  String get completedReportFundingStarted;

  /// completedReport.fundingStartedDesc
  ///
  /// In en, this message translates to:
  /// **'Investment window opened'**
  String get completedReportFundingStartedDesc;

  /// completedReport.fullyFunded
  ///
  /// In en, this message translates to:
  /// **'Fully Funded'**
  String get completedReportFullyFunded;

  /// completedReport.fullyFundedDesc
  ///
  /// In en, this message translates to:
  /// **'Target of 12,500,000 SAR reached'**
  String get completedReportFullyFundedDesc;

  /// completedReport.ownershipRegistered
  ///
  /// In en, this message translates to:
  /// **'Ownership Registered'**
  String get completedReportOwnershipRegistered;

  /// completedReport.ownershipRegisteredDesc
  ///
  /// In en, this message translates to:
  /// **'Certificates issued via Real Estate Registration'**
  String get completedReportOwnershipRegisteredDesc;

  /// completedReport.firstDistribution
  ///
  /// In en, this message translates to:
  /// **'First Distribution'**
  String get completedReportFirstDistribution;

  /// completedReport.firstDistributionDesc
  ///
  /// In en, this message translates to:
  /// **'Q3 rental income distributed'**
  String get completedReportFirstDistributionDesc;

  /// completedReport.secondDistribution
  ///
  /// In en, this message translates to:
  /// **'Second Distribution'**
  String get completedReportSecondDistribution;

  /// completedReport.secondDistributionDesc
  ///
  /// In en, this message translates to:
  /// **'Q4 rental income distributed'**
  String get completedReportSecondDistributionDesc;

  /// completedReport.thirdDistribution
  ///
  /// In en, this message translates to:
  /// **'Third Distribution'**
  String get completedReportThirdDistribution;

  /// completedReport.thirdDistributionDesc
  ///
  /// In en, this message translates to:
  /// **'Q1 2025 rental income distributed'**
  String get completedReportThirdDistributionDesc;

  /// completedReport.fourthDistribution
  ///
  /// In en, this message translates to:
  /// **'Fourth Distribution'**
  String get completedReportFourthDistribution;

  /// completedReport.fourthDistributionDesc
  ///
  /// In en, this message translates to:
  /// **'Q2 2025 rental income distributed'**
  String get completedReportFourthDistributionDesc;

  /// completedReport.exitCompleted
  ///
  /// In en, this message translates to:
  /// **'Exit Completed'**
  String get completedReportExitCompleted;

  /// completedReport.exitCompletedDesc
  ///
  /// In en, this message translates to:
  /// **'Property sold, proceeds distributed'**
  String get completedReportExitCompletedDesc;

  /// profile.referralCodeTitle
  ///
  /// In en, this message translates to:
  /// **'Referral Code'**
  String get profileReferralCodeTitle;

  /// profile.copied
  ///
  /// In en, this message translates to:
  /// **'Copied!'**
  String get profileCopied;

  /// profile.copy
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get profileCopy;

  /// profile.newInvestment
  ///
  /// In en, this message translates to:
  /// **'New Investment'**
  String get profileNewInvestment;

  /// profile.newComment
  ///
  /// In en, this message translates to:
  /// **'New Comment'**
  String get profileNewComment;

  /// profile.newUpdateFromOwner
  ///
  /// In en, this message translates to:
  /// **'New Update From Owner'**
  String get profileNewUpdateFromOwner;

  /// profile.helpSupportTitle
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get profileHelpSupportTitle;

  /// notification.filterAll
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get notificationFilterAll;

  /// notification.filterInvestment
  ///
  /// In en, this message translates to:
  /// **'Investment'**
  String get notificationFilterInvestment;

  /// notification.filterWallet
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get notificationFilterWallet;

  /// notification.filterRewards
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get notificationFilterRewards;

  /// notification.filterSystem
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get notificationFilterSystem;

  /// notification.withdrawalTitle
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Processed'**
  String get notificationWithdrawalTitle;

  /// notification.withdrawalMsg
  ///
  /// In en, this message translates to:
  /// **'Your withdrawal of 5,000 SAR has been processed and sent to your verified bank account.'**
  String get notificationWithdrawalMsg;

  /// notification.referralBonusTitle
  ///
  /// In en, this message translates to:
  /// **'Referral Bonus Earned'**
  String get notificationReferralBonusTitle;

  /// notification.referralBonusMsg
  ///
  /// In en, this message translates to:
  /// **'Your friend Mohammed joined and completed KYC. You\'ve earned 50 SAR referral bonus!'**
  String get notificationReferralBonusMsg;

  /// notification.valuationTitle
  ///
  /// In en, this message translates to:
  /// **'Property Valuation Update'**
  String get notificationValuationTitle;

  /// notification.valuationMsg
  ///
  /// In en, this message translates to:
  /// **'Al Olaya Towers property valuation has increased by 3.2%. Your token value has been updated.'**
  String get notificationValuationMsg;

  /// notification.documentTitle
  ///
  /// In en, this message translates to:
  /// **'Document Uploaded'**
  String get notificationDocumentTitle;

  /// notification.documentMsg
  ///
  /// In en, this message translates to:
  /// **'Your National ID document has been successfully uploaded and is under review.'**
  String get notificationDocumentMsg;

  /// notification.securityTitle
  ///
  /// In en, this message translates to:
  /// **'Security Alert'**
  String get notificationSecurityTitle;

  /// notification.securityMsg
  ///
  /// In en, this message translates to:
  /// **'A new device was used to log in to your account. If this wasn\'t you, please contact support.'**
  String get notificationSecurityMsg;

  /// wallet.totalIn
  ///
  /// In en, this message translates to:
  /// **'Total In'**
  String get walletTotalIn;

  /// wallet.totalOut
  ///
  /// In en, this message translates to:
  /// **'Total Out'**
  String get walletTotalOut;

  /// transactionHistory.search
  ///
  /// In en, this message translates to:
  /// **'Search transactions...'**
  String get transactionHistorySearch;

  /// invest.type
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get investType;

  /// invest.description
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get investDescription;

  /// invest.date
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get investDate;

  /// invest.reference
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get investReference;

  /// explore.property1.name
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya Business Tower'**
  String get exploreProperty1Name;

  /// explore.property1.location
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya, Riyadh'**
  String get exploreProperty1Location;

  /// explore.property2.name
  ///
  /// In en, this message translates to:
  /// **'Al-Malqa Residences'**
  String get exploreProperty2Name;

  /// explore.property2.location
  ///
  /// In en, this message translates to:
  /// **'Al-Malqa, Riyadh'**
  String get exploreProperty2Location;

  /// financial.netYield
  ///
  /// In en, this message translates to:
  /// **'Net Yield'**
  String get financialNetYield;

  /// property.beds
  ///
  /// In en, this message translates to:
  /// **'beds'**
  String get propertyBeds;

  /// property.baths
  ///
  /// In en, this message translates to:
  /// **'baths'**
  String get propertyBaths;

  /// property.sqm
  ///
  /// In en, this message translates to:
  /// **'sqm'**
  String get propertySqm;

  /// property.rooms
  ///
  /// In en, this message translates to:
  /// **'rooms'**
  String get propertyRooms;

  /// explore.funded
  ///
  /// In en, this message translates to:
  /// **'Funded'**
  String get exploreFunded;

  /// common.tokens
  ///
  /// In en, this message translates to:
  /// **'tokens'**
  String get commonTokens;

  /// propertyType.hospitality
  ///
  /// In en, this message translates to:
  /// **'Hospitality'**
  String get propertyTypeHospitality;

  /// detail.tabOverview
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get detailTabOverview;

  /// detail.tabFinancials
  ///
  /// In en, this message translates to:
  /// **'Financials'**
  String get detailTabFinancials;

  /// detail.tabLocation
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get detailTabLocation;

  /// detail.tabDocuments
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get detailTabDocuments;

  /// detail.aboutDescription
  ///
  /// In en, this message translates to:
  /// **'A premium residential tower in the heart of Riyadh\'s Al-Olaya district, offering luxury apartments with stunning city views. The property features modern amenities, 24/7 security, and proximity to major business centers.'**
  String get detailAboutDescription;

  /// detail.raised
  ///
  /// In en, this message translates to:
  /// **'raised'**
  String get detailRaised;

  /// detail.of
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get detailOf;

  /// detail.prop.floor15
  ///
  /// In en, this message translates to:
  /// **'15th Floor'**
  String get detailPropFloor15;

  /// invest.investmentBreakdown
  ///
  /// In en, this message translates to:
  /// **'Investment Breakdown'**
  String get investInvestmentBreakdown;

  /// invest.numberOfShares
  ///
  /// In en, this message translates to:
  /// **'Number of Tokens'**
  String get investNumberOfShares;

  /// invest.insufficientBalance
  ///
  /// In en, this message translates to:
  /// **'Insufficient Balance'**
  String get investInsufficientBalance;

  /// invest.needMore
  ///
  /// In en, this message translates to:
  /// **'You need more to complete this investment.'**
  String get investNeedMore;

  /// invest.proceedToPayment
  ///
  /// In en, this message translates to:
  /// **'Proceed to Payment'**
  String get investProceedToPayment;

  /// invest.topUpAndPay
  ///
  /// In en, this message translates to:
  /// **'Top Up & Pay'**
  String get investTopUpAndPay;

  /// invest.stepReview
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get investStepReview;

  /// invest.stepPayment
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get investStepPayment;

  /// invest.stepConfirm
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get investStepConfirm;

  /// invest.stepDone
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get investStepDone;

  /// invest.investmentAmount
  ///
  /// In en, this message translates to:
  /// **'Investment Amount'**
  String get investInvestmentAmount;

  /// invest.investmentDuration
  ///
  /// In en, this message translates to:
  /// **'Investment Duration'**
  String get investInvestmentDuration;

  /// invest.months
  ///
  /// In en, this message translates to:
  /// **'months'**
  String get investMonths;

  /// invest.expectedTotalReturn
  ///
  /// In en, this message translates to:
  /// **'Expected Total Return'**
  String get investExpectedTotalReturn;

  /// invest.transactionId
  ///
  /// In en, this message translates to:
  /// **'Transaction ID'**
  String get investTransactionId;

  /// invest.whatsNext
  ///
  /// In en, this message translates to:
  /// **'What\'s Next?'**
  String get investWhatsNext;

  /// invest.processingMessage
  ///
  /// In en, this message translates to:
  /// **'Your investment is being processed. Once the ownership certificate is issued by the Real Estate Registration Authority, your investment status will change to Confirmed in your portfolio.'**
  String get investProcessingMessage;

  /// rewards.tier.launch.benefit1
  ///
  /// In en, this message translates to:
  /// **'Unlock access to investment opportunities'**
  String get rewardsTierLaunchBenefit1;

  /// rewards.tier.launch.benefit2
  ///
  /// In en, this message translates to:
  /// **'Access to referral program'**
  String get rewardsTierLaunchBenefit2;

  /// rewards.tier.launch.message
  ///
  /// In en, this message translates to:
  /// **'Start investing to upgrade your tier'**
  String get rewardsTierLaunchMessage;

  /// rewards.tier.pioneer.benefit1
  ///
  /// In en, this message translates to:
  /// **'Early notifications of new listings'**
  String get rewardsTierPioneerBenefit1;

  /// rewards.tier.pioneer.message
  ///
  /// In en, this message translates to:
  /// **'Your actions are inspiring others'**
  String get rewardsTierPioneerMessage;

  /// rewards.tier.broker.benefit1
  ///
  /// In en, this message translates to:
  /// **'Priority access to select deals'**
  String get rewardsTierBrokerBenefit1;

  /// rewards.tier.broker.benefit2
  ///
  /// In en, this message translates to:
  /// **'Bonus referral rewards'**
  String get rewardsTierBrokerBenefit2;

  /// rewards.tier.broker.message
  ///
  /// In en, this message translates to:
  /// **'Your market presence is growing'**
  String get rewardsTierBrokerMessage;

  /// rewards.tier.aqili.benefit1
  ///
  /// In en, this message translates to:
  /// **'Access to exclusive real estate deals'**
  String get rewardsTierAqiliBenefit1;

  /// rewards.tier.aqili.benefit2
  ///
  /// In en, this message translates to:
  /// **'Priority customer support'**
  String get rewardsTierAqiliBenefit2;

  /// rewards.tier.aqili.message
  ///
  /// In en, this message translates to:
  /// **'You\'ve influenced many investors'**
  String get rewardsTierAqiliMessage;

  /// rewards.tier.distinguished.benefit1
  ///
  /// In en, this message translates to:
  /// **'Dedicated relationship manager'**
  String get rewardsTierDistinguishedBenefit1;

  /// rewards.tier.distinguished.benefit2
  ///
  /// In en, this message translates to:
  /// **'Invitations to private investment rounds'**
  String get rewardsTierDistinguishedBenefit2;

  /// rewards.tier.distinguished.message
  ///
  /// In en, this message translates to:
  /// **'One of the platform\'s top investors'**
  String get rewardsTierDistinguishedMessage;

  /// rewards.tier.current
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get rewardsTierCurrent;

  /// rewards.tier.unlockDesc
  ///
  /// In en, this message translates to:
  /// **'Unlock access to investment opportunities and referral program'**
  String get rewardsTierUnlockDesc;

  /// rewards.successfulReferrals
  ///
  /// In en, this message translates to:
  /// **'successful referrals'**
  String get rewardsSuccessfulReferrals;

  /// rewards.unlockMore
  ///
  /// In en, this message translates to:
  /// **'Unlock more with'**
  String get rewardsUnlockMore;

  /// rewards.youreA
  ///
  /// In en, this message translates to:
  /// **'You\'re a'**
  String get rewardsYoureA;

  /// rewards.member
  ///
  /// In en, this message translates to:
  /// **'member'**
  String get rewardsMember;

  /// rewards.referrals
  ///
  /// In en, this message translates to:
  /// **'referrals'**
  String get rewardsReferrals;

  /// rewards.checkHistory
  ///
  /// In en, this message translates to:
  /// **'Check full history in wallet'**
  String get rewardsCheckHistory;

  /// rewards.tier
  ///
  /// In en, this message translates to:
  /// **'tier'**
  String get rewardsTier;

  /// kyc.identityNumber
  ///
  /// In en, this message translates to:
  /// **'User Identity Number (National ID / Iqama)'**
  String get kycIdentityNumber;

  /// kyc.alternatePhone
  ///
  /// In en, this message translates to:
  /// **'Do you have an alternate phone number?'**
  String get kycAlternatePhone;

  /// kyc.selectEducation
  ///
  /// In en, this message translates to:
  /// **'Select education level'**
  String get kycSelectEducation;

  /// kyc.primaryIncome
  ///
  /// In en, this message translates to:
  /// **'Primary Source of Income'**
  String get kycPrimaryIncome;

  /// kyc.selectSource
  ///
  /// In en, this message translates to:
  /// **'Select source'**
  String get kycSelectSource;

  /// kyc.netWorth
  ///
  /// In en, this message translates to:
  /// **'Net Worth (SAR)'**
  String get kycNetWorth;

  /// kyc.maritalStatus
  ///
  /// In en, this message translates to:
  /// **'Marital Status'**
  String get kycMaritalStatus;

  /// kyc.selectStatus
  ///
  /// In en, this message translates to:
  /// **'Select status'**
  String get kycSelectStatus;

  /// kyc.streetName
  ///
  /// In en, this message translates to:
  /// **'Street Name'**
  String get kycStreetName;

  /// kyc.enterStreet
  ///
  /// In en, this message translates to:
  /// **'Enter street name'**
  String get kycEnterStreet;

  /// kyc.optional
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get kycOptional;

  /// kyc.enterEmployer
  ///
  /// In en, this message translates to:
  /// **'Enter employer name'**
  String get kycEnterEmployer;

  /// kyc.enterEmployerAddress
  ///
  /// In en, this message translates to:
  /// **'Enter employer address'**
  String get kycEnterEmployerAddress;

  /// kyc.enterEmployerPhone
  ///
  /// In en, this message translates to:
  /// **'Enter employer phone'**
  String get kycEnterEmployerPhone;

  /// kyc.currentlyEmployed
  ///
  /// In en, this message translates to:
  /// **'Are you currently employed?'**
  String get kycCurrentlyEmployed;

  /// kyc.serviceDuration
  ///
  /// In en, this message translates to:
  /// **'Service Duration'**
  String get kycServiceDuration;

  /// kyc.serviceDurationPlaceholder
  ///
  /// In en, this message translates to:
  /// **'e.g., 3 years'**
  String get kycServiceDurationPlaceholder;

  /// kyc.generalInfo
  ///
  /// In en, this message translates to:
  /// **'General Information'**
  String get kycGeneralInfo;

  /// kyc.financialExperience
  ///
  /// In en, this message translates to:
  /// **'Do you have other financial sector experience?'**
  String get kycFinancialExperience;

  /// kyc.boardMember
  ///
  /// In en, this message translates to:
  /// **'Are you currently a board member of any financial institution?'**
  String get kycBoardMember;

  /// kyc.workedFinancial
  ///
  /// In en, this message translates to:
  /// **'Have you worked in the financial sector in the last 5 years?'**
  String get kycWorkedFinancial;

  /// kyc.pepRelation
  ///
  /// In en, this message translates to:
  /// **'Do you have a close relation with a politically exposed person (PEP)?'**
  String get kycPepRelation;

  /// kyc.seniorExecutive
  ///
  /// In en, this message translates to:
  /// **'Are you a board member, audit committee member, or senior executive in a listed company?'**
  String get kycSeniorExecutive;

  /// kyc.outstandingDebts
  ///
  /// In en, this message translates to:
  /// **'Do you have any outstanding debts or financial obligations that may affect your investment capacity?'**
  String get kycOutstandingDebts;

  /// kyc.select
  ///
  /// In en, this message translates to:
  /// **'Select...'**
  String get kycSelect;

  /// kyc.stepOf
  ///
  /// In en, this message translates to:
  /// **'Step {step} of {total}'**
  String kycStepOf(Object step, Object total);

  /// kyc.nafathNotice
  ///
  /// In en, this message translates to:
  /// **'Fields marked with {icon} are auto-filled from Nafath'**
  String kycNafathNotice(Object icon);

  /// kyc.addressNafathNotice
  ///
  /// In en, this message translates to:
  /// **'Address may be pre-filled from Nafath records'**
  String get kycAddressNafathNotice;

  /// kyc.employmentNafathNotice
  ///
  /// In en, this message translates to:
  /// **'Employment data may be pre-filled from Nafath'**
  String get kycEmploymentNafathNotice;

  /// kyc.notEmployed
  ///
  /// In en, this message translates to:
  /// **'I am currently not employed'**
  String get kycNotEmployed;

  /// kyc.startDate
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get kycStartDate;

  /// kyc.endDate
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get kycEndDate;

  /// kyc.selectDate
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get kycSelectDate;

  /// kyc.present
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get kycPresent;

  /// kyc.reviewSubmit
  ///
  /// In en, this message translates to:
  /// **'Review & Submit'**
  String get kycReviewSubmit;

  /// kyc.phoneVerification
  ///
  /// In en, this message translates to:
  /// **'Phone Verification'**
  String get kycPhoneVerification;

  /// kyc.otpNotice
  ///
  /// In en, this message translates to:
  /// **'We will send an OTP to your registered phone number for verification.'**
  String get kycOtpNotice;

  /// kyc.otpSentTo
  ///
  /// In en, this message translates to:
  /// **'OTP sent to +966 5XX XXX XX78'**
  String get kycOtpSentTo;

  /// kyc.termsConfirm
  ///
  /// In en, this message translates to:
  /// **'I confirm that all information provided is accurate and complete. I agree to the Terms & Conditions and Privacy Policy.'**
  String get kycTermsConfirm;

  /// kyc.employment
  ///
  /// In en, this message translates to:
  /// **'Employment'**
  String get kycEmployment;

  /// kyc.questionsAnswered
  ///
  /// In en, this message translates to:
  /// **'6 questions answered'**
  String get kycQuestionsAnswered;

  /// kyc.noFlags
  ///
  /// In en, this message translates to:
  /// **'No flags raised'**
  String get kycNoFlags;

  /// kyc.enterJobTitle
  ///
  /// In en, this message translates to:
  /// **'Enter your job title'**
  String get kycEnterJobTitle;

  /// kyc.identityVerified
  ///
  /// In en, this message translates to:
  /// **'Your identity has been successfully verified'**
  String get kycIdentityVerified;

  /// kyc.completedOn
  ///
  /// In en, this message translates to:
  /// **'Completed on Feb 10, 2026'**
  String get kycCompletedOn;

  /// kyc.verified
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get kycVerified;

  /// kyc.updateInfo
  ///
  /// In en, this message translates to:
  /// **'Update Information'**
  String get kycUpdateInfo;

  /// invest.payWithMada
  ///
  /// In en, this message translates to:
  /// **'Pay with mada'**
  String get investPayWithMada;

  /// invest.terms.ownership
  ///
  /// In en, this message translates to:
  /// **'By proceeding with this investment, you acknowledge that you are purchasing fractional ownership tokens in the specified real estate property through Hseeltech\'s platform.'**
  String get investTermsOwnership;

  /// invest.terms.returns
  ///
  /// In en, this message translates to:
  /// **'Rental returns are distributed quarterly based on actual rental income collected. The expected return rate is an estimate and not guaranteed. Past performance does not guarantee future results.'**
  String get investTermsReturns;

  /// invest.terms.holding
  ///
  /// In en, this message translates to:
  /// **'Investments are subject to a minimum holding period of 12 months. After the lock-up period, tokens may be transferred through the platform\'s secondary market.'**
  String get investTermsHolding;

  /// invest.terms.management
  ///
  /// In en, this message translates to:
  /// **'Hseeltech manages all aspects of property operations including tenant relations, maintenance, and financial reporting.'**
  String get investTermsManagement;

  /// invest.terms.risks
  ///
  /// In en, this message translates to:
  /// **'Real estate investments carry inherent risks including market fluctuations, vacancy periods, and potential capital loss. Investors should carefully consider their risk tolerance before investing.'**
  String get investTermsRisks;

  /// invest.currentBalance
  ///
  /// In en, this message translates to:
  /// **'Current Balance'**
  String get investCurrentBalance;

  /// invest.requiredAmount
  ///
  /// In en, this message translates to:
  /// **'Required Amount'**
  String get investRequiredAmount;

  /// invest.amountNeeded
  ///
  /// In en, this message translates to:
  /// **'Amount Needed'**
  String get investAmountNeeded;

  /// invest.terms.title
  ///
  /// In en, this message translates to:
  /// **'Investment Agreement'**
  String get investTermsTitle;

  /// invest.terms.section1
  ///
  /// In en, this message translates to:
  /// **'1. Investment Terms'**
  String get investTermsSection1;

  /// invest.terms.section2
  ///
  /// In en, this message translates to:
  /// **'2. Returns & Distributions'**
  String get investTermsSection2;

  /// invest.terms.section3
  ///
  /// In en, this message translates to:
  /// **'3. Lock-up Period'**
  String get investTermsSection3;

  /// invest.terms.section4
  ///
  /// In en, this message translates to:
  /// **'4. Property Management'**
  String get investTermsSection4;

  /// invest.terms.section5
  ///
  /// In en, this message translates to:
  /// **'5. Risk Factors'**
  String get investTermsSection5;

  /// invest.terms.riskDisclosure
  ///
  /// In en, this message translates to:
  /// **'Risk Disclosure:'**
  String get investTermsRiskDisclosure;

  /// invest.terms.riskDisclosureText
  ///
  /// In en, this message translates to:
  /// **'Investing in real estate involves risk, including the potential loss of principal. All returns shown are estimated and not guaranteed. Past performance does not guarantee future results.'**
  String get investTermsRiskDisclosureText;

  /// explore.property4.name
  ///
  /// In en, this message translates to:
  /// **'King Abdullah Financial District Tower'**
  String get exploreProperty4Name;

  /// explore.property4.location
  ///
  /// In en, this message translates to:
  /// **'KAFD, Riyadh'**
  String get exploreProperty4Location;

  /// portfolio.inDays
  ///
  /// In en, this message translates to:
  /// **'In {days} days'**
  String portfolioInDays(Object days);

  /// portfolio.noProcessing
  ///
  /// In en, this message translates to:
  /// **'No processing investments'**
  String get portfolioNoProcessing;

  /// portfolio.noConfirmed
  ///
  /// In en, this message translates to:
  /// **'No confirmed investments'**
  String get portfolioNoConfirmed;

  /// wallet.filterAll
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get walletFilterAll;

  /// wallet.filterIn
  ///
  /// In en, this message translates to:
  /// **'In'**
  String get walletFilterIn;

  /// wallet.filterOut
  ///
  /// In en, this message translates to:
  /// **'Out'**
  String get walletFilterOut;

  /// wallet.depositFunds
  ///
  /// In en, this message translates to:
  /// **'Deposit Funds'**
  String get walletDepositFunds;

  /// wallet.withdrawFunds
  ///
  /// In en, this message translates to:
  /// **'Withdraw Funds'**
  String get walletWithdrawFunds;

  /// wallet.availableToWithdraw
  ///
  /// In en, this message translates to:
  /// **'Available to Withdraw'**
  String get walletAvailableToWithdraw;

  /// wallet.withdrawalAmount
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Amount'**
  String get walletWithdrawalAmount;

  /// wallet.withdrawAll
  ///
  /// In en, this message translates to:
  /// **'Withdraw All'**
  String get walletWithdrawAll;

  /// wallet.depositDisclaimer
  ///
  /// In en, this message translates to:
  /// **'Deposit may take from a few minutes to 24 hours. Make sure the transfer is from a bank account under your personal name. Transfers from third-party accounts will not be accepted.'**
  String get walletDepositDisclaimer;

  /// wallet.withdrawTo
  ///
  /// In en, this message translates to:
  /// **'Withdraw To'**
  String get walletWithdrawTo;

  /// wallet.personalBankAccount
  ///
  /// In en, this message translates to:
  /// **'Personal Bank Account'**
  String get walletPersonalBankAccount;

  /// wallet.verifiedDuringKYC
  ///
  /// In en, this message translates to:
  /// **'Verified during KYC'**
  String get walletVerifiedDuringKYC;

  /// wallet.bank
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get walletBank;

  /// wallet.withdrawIbanNote
  ///
  /// In en, this message translates to:
  /// **'Withdrawals are only sent to your pre-verified personal IBAN'**
  String get walletWithdrawIbanNote;

  /// wallet.withdrawProcessingTime
  ///
  /// In en, this message translates to:
  /// **'Withdrawals are processed within 1-3 business days'**
  String get walletWithdrawProcessingTime;

  /// wallet.bankTransfer
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get walletBankTransfer;

  /// wallet.payWithMada
  ///
  /// In en, this message translates to:
  /// **'Pay with mada'**
  String get walletPayWithMada;

  /// profile.emailAddress
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get profileEmailAddress;

  /// profile.nationalId
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get profileNationalId;

  /// profile.nationalIdPlaceholder
  ///
  /// In en, this message translates to:
  /// **'National ID number'**
  String get profileNationalIdPlaceholder;

  /// profile.saudiArabia
  ///
  /// In en, this message translates to:
  /// **'Saudi Arabia'**
  String get profileSaudiArabia;

  /// profile.nationalityPlaceholder
  ///
  /// In en, this message translates to:
  /// **'Your nationality'**
  String get profileNationalityPlaceholder;

  /// editProfile.nafathNote
  ///
  /// In en, this message translates to:
  /// **'National ID, Date of Birth, and Nationality are verified through Nafath and cannot be edited manually.'**
  String get editProfileNafathNote;

  /// invest.payFromWallet
  ///
  /// In en, this message translates to:
  /// **'Pay from Wallet'**
  String get investPayFromWallet;

  /// invest.remainingBalance
  ///
  /// In en, this message translates to:
  /// **'Remaining Balance'**
  String get investRemainingBalance;

  /// invest.topUpWallet
  ///
  /// In en, this message translates to:
  /// **'Top Up Wallet'**
  String get investTopUpWallet;

  /// invest.topUpAmount
  ///
  /// In en, this message translates to:
  /// **'Top-Up Amount'**
  String get investTopUpAmount;

  /// invest.instantTopUp
  ///
  /// In en, this message translates to:
  /// **'Instant top-up via payment gateway'**
  String get investInstantTopUp;

  /// invest.termsAgree
  ///
  /// In en, this message translates to:
  /// **'I have read and agree to the'**
  String get investTermsAgree;

  /// invest.termsLink
  ///
  /// In en, this message translates to:
  /// **'Investment Terms & Conditions'**
  String get investTermsLink;

  /// invest.confirmSign
  ///
  /// In en, this message translates to:
  /// **'Confirm & Sign'**
  String get investConfirmSign;

  /// investDetail.processingInvestment
  ///
  /// In en, this message translates to:
  /// **'Processing Investment'**
  String get investDetailProcessingInvestment;

  /// investDetail.certificateNo
  ///
  /// In en, this message translates to:
  /// **'Certificate No.'**
  String get investDetailCertificateNo;

  /// investDetail.issuedDate
  ///
  /// In en, this message translates to:
  /// **'Issued Date'**
  String get investDetailIssuedDate;

  /// investDetail.issuingAuthority
  ///
  /// In en, this message translates to:
  /// **'Issuing Authority'**
  String get investDetailIssuingAuthority;

  /// investDetail.realEstateRegistration
  ///
  /// In en, this message translates to:
  /// **'Real Estate Registration'**
  String get investDetailRealEstateRegistration;

  /// investDetail.pendingActions
  ///
  /// In en, this message translates to:
  /// **'Pending Actions'**
  String get investDetailPendingActions;

  /// investDetail.ownershipRegistration
  ///
  /// In en, this message translates to:
  /// **'Ownership Registration'**
  String get investDetailOwnershipRegistration;

  /// investDetail.ownershipRegistrationDesc
  ///
  /// In en, this message translates to:
  /// **'Your ownership is being registered with the Real Estate Registration authority'**
  String get investDetailOwnershipRegistrationDesc;

  /// investDetail.certificateIssuance
  ///
  /// In en, this message translates to:
  /// **'Certificate Issuance'**
  String get investDetailCertificateIssuance;

  /// investDetail.certificateIssuanceDesc
  ///
  /// In en, this message translates to:
  /// **'Ownership certificate will be issued upon Real Estate Registration approval (est. 5-7 business days)'**
  String get investDetailCertificateIssuanceDesc;

  /// investDetail.notifyMeWhenReady
  ///
  /// In en, this message translates to:
  /// **'Notify Me When Ready'**
  String get investDetailNotifyMeWhenReady;

  /// investDetail.returnsNotAvailable
  ///
  /// In en, this message translates to:
  /// **'Returns Not Available Yet'**
  String get investDetailReturnsNotAvailable;

  /// investDetail.returnsBreakdown
  ///
  /// In en, this message translates to:
  /// **'Returns Breakdown'**
  String get investDetailReturnsBreakdown;

  /// investDetail.rentalIncome
  ///
  /// In en, this message translates to:
  /// **'Rental Income'**
  String get investDetailRentalIncome;

  /// investDetail.capitalAppreciation
  ///
  /// In en, this message translates to:
  /// **'Capital Appreciation'**
  String get investDetailCapitalAppreciation;

  /// investDetail.nextDistribution
  ///
  /// In en, this message translates to:
  /// **'Next Distribution'**
  String get investDetailNextDistribution;

  /// investDetail.distributionsReceived
  ///
  /// In en, this message translates to:
  /// **'Distributions Received'**
  String get investDetailDistributionsReceived;

  /// investDetail.returns
  ///
  /// In en, this message translates to:
  /// **'Returns'**
  String get investDetailReturns;

  /// investDetail.sincePurchase
  ///
  /// In en, this message translates to:
  /// **'since purchase'**
  String get investDetailSincePurchase;

  /// profile.searchHelp
  ///
  /// In en, this message translates to:
  /// **'Search for help...'**
  String get profileSearchHelp;

  /// profile.emailSupport
  ///
  /// In en, this message translates to:
  /// **'Email Support'**
  String get profileEmailSupport;

  /// profile.supportTicket
  ///
  /// In en, this message translates to:
  /// **'Support Ticket'**
  String get profileSupportTicket;

  /// profile.supportTicketDesc
  ///
  /// In en, this message translates to:
  /// **'Submit a ticket and we\'ll respond within 24 hours'**
  String get profileSupportTicketDesc;

  /// profile.chatAvailability
  ///
  /// In en, this message translates to:
  /// **'Available 9am - 6pm'**
  String get profileChatAvailability;

  /// invest.digitalSignature
  ///
  /// In en, this message translates to:
  /// **'Digital Signature'**
  String get investDigitalSignature;

  /// invest.clearSignature
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get investClearSignature;

  /// invest.processingInvestment
  ///
  /// In en, this message translates to:
  /// **'Processing Investment'**
  String get investProcessingInvestment;

  /// invest.tokensPurchased
  ///
  /// In en, this message translates to:
  /// **'Tokens Purchased'**
  String get investTokensPurchased;

  /// invest.tokenCertificate
  ///
  /// In en, this message translates to:
  /// **'Token Certificate'**
  String get investTokenCertificate;

  /// bank.accountHolderName
  ///
  /// In en, this message translates to:
  /// **'Account Holder Name'**
  String get bankAccountHolderName;

  /// bank.ibanNote
  ///
  /// In en, this message translates to:
  /// **'Must start with SA followed by 22 digits'**
  String get bankIbanNote;

  /// bank.important
  ///
  /// In en, this message translates to:
  /// **'Important'**
  String get bankImportant;

  /// bank.addedOn
  ///
  /// In en, this message translates to:
  /// **'Added on'**
  String get bankAddedOn;

  /// about.description
  ///
  /// In en, this message translates to:
  /// **'Invest in income-generating real estate opportunities across Saudi Arabia.'**
  String get aboutDescription;

  /// bank.alJazira
  ///
  /// In en, this message translates to:
  /// **'Bank AlJazira'**
  String get bankAlJazira;

  /// bank.sab
  ///
  /// In en, this message translates to:
  /// **'Saudi Awwal Bank (SAB)'**
  String get bankSab;

  /// bank.asShownOnRecords
  ///
  /// In en, this message translates to:
  /// **'As shown on bank records'**
  String get bankAsShownOnRecords;

  /// bank.verifyAndAdd
  ///
  /// In en, this message translates to:
  /// **'Verify & Add Account'**
  String get bankVerifyAndAdd;

  /// bank.importantNote
  ///
  /// In en, this message translates to:
  /// **'Bank account must be in your name. Withdrawals are only processed to verified accounts. Verification may take 1-2 business days.'**
  String get bankImportantNote;

  /// biometric.facialRecognition
  ///
  /// In en, this message translates to:
  /// **'Facial recognition'**
  String get biometricFacialRecognition;

  /// invest.agreementText
  ///
  /// In en, this message translates to:
  /// **'Investment Agreement'**
  String get investAgreementText;

  /// invest.platformFee
  ///
  /// In en, this message translates to:
  /// **'Platform Fee (0%)'**
  String get investPlatformFee;

  /// invest.freeLabel
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get investFreeLabel;

  /// invest.confirmPin
  ///
  /// In en, this message translates to:
  /// **'Enter your PIN or use biometric to confirm'**
  String get investConfirmPin;

  /// invest.soonLabel
  ///
  /// In en, this message translates to:
  /// **'Soon'**
  String get investSoonLabel;

  /// withdraw.personalBank
  ///
  /// In en, this message translates to:
  /// **'Personal Bank Account'**
  String get withdrawPersonalBank;

  /// withdraw.verifiedKYC
  ///
  /// In en, this message translates to:
  /// **'Verified during KYC'**
  String get withdrawVerifiedKYC;

  /// withdraw.bankLabel
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get withdrawBankLabel;

  /// darkMode.themePreview
  ///
  /// In en, this message translates to:
  /// **'Theme Preview'**
  String get darkModeThemePreview;

  /// investDetail.investmentAmount
  ///
  /// In en, this message translates to:
  /// **'Investment Amount'**
  String get investDetailInvestmentAmount;

  /// explore.target
  ///
  /// In en, this message translates to:
  /// **'Target'**
  String get exploreTarget;

  /// explore.rentalYield
  ///
  /// In en, this message translates to:
  /// **'Rental Yield'**
  String get exploreRentalYield;

  /// explore.distribution
  ///
  /// In en, this message translates to:
  /// **'Distribution'**
  String get exploreDistribution;

  /// settings.englishUS
  ///
  /// In en, this message translates to:
  /// **'English (United States)'**
  String get settingsEnglishUS;

  /// settings.arabicSA
  ///
  /// In en, this message translates to:
  /// **'Arabic (Saudi Arabia)'**
  String get settingsArabicSA;

  /// investDetail.ownershipRegistering
  ///
  /// In en, this message translates to:
  /// **'Your ownership is being registered with the Real Estate Registration authority'**
  String get investDetailOwnershipRegistering;

  /// investDetail.ownershipCertificate
  ///
  /// In en, this message translates to:
  /// **'Ownership certificate will be issued upon Real Estate Registration approval (est. 5-7 business days)'**
  String get investDetailOwnershipCertificate;

  /// empty.noOpportunities
  ///
  /// In en, this message translates to:
  /// **'No Opportunities Available'**
  String get emptyNoOpportunities;

  /// empty.noOpportunitiesDesc
  ///
  /// In en, this message translates to:
  /// **'Check back soon for new investment opportunities'**
  String get emptyNoOpportunitiesDesc;

  /// empty.noSavedOpportunities
  ///
  /// In en, this message translates to:
  /// **'No Saved Opportunities'**
  String get emptyNoSavedOpportunities;

  /// empty.noSavedDesc
  ///
  /// In en, this message translates to:
  /// **'Save opportunities you\'re interested in to review them later. Tap the bookmark icon on any opportunity.'**
  String get emptyNoSavedDesc;

  /// empty.startInvesting
  ///
  /// In en, this message translates to:
  /// **'Start Investing'**
  String get emptyStartInvesting;

  /// empty.walletEmpty
  ///
  /// In en, this message translates to:
  /// **'Wallet is Empty'**
  String get emptyWalletEmpty;

  /// empty.walletEmptyDesc
  ///
  /// In en, this message translates to:
  /// **'Add funds to your wallet to start investing in real estate opportunities.'**
  String get emptyWalletEmptyDesc;

  /// empty.addFunds
  ///
  /// In en, this message translates to:
  /// **'Add Funds'**
  String get emptyAddFunds;

  /// empty.noInternet
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get emptyNoInternet;

  /// empty.noInternetDesc
  ///
  /// In en, this message translates to:
  /// **'Please check your connection and try again.'**
  String get emptyNoInternetDesc;

  /// empty.somethingWrong
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong'**
  String get emptySomethingWrong;

  /// empty.somethingWrongDesc
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get emptySomethingWrongDesc;

  /// empty.sessionExpired
  ///
  /// In en, this message translates to:
  /// **'Session Expired'**
  String get emptySessionExpired;

  /// empty.sessionExpiredDesc
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please log in again.'**
  String get emptySessionExpiredDesc;

  /// empty.loginAgain
  ///
  /// In en, this message translates to:
  /// **'Log In Again'**
  String get emptyLoginAgain;

  /// empty.underMaintenance
  ///
  /// In en, this message translates to:
  /// **'Under Maintenance'**
  String get emptyUnderMaintenance;

  /// empty.underMaintenanceDesc
  ///
  /// In en, this message translates to:
  /// **'We\'re performing scheduled maintenance. Please check back soon.'**
  String get emptyUnderMaintenanceDesc;

  /// empty.tryAgain
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get emptyTryAgain;

  /// empty.refresh
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get emptyRefresh;

  /// empty.goHome
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get emptyGoHome;

  /// notif.investmentConfirmed
  ///
  /// In en, this message translates to:
  /// **'Investment Confirmed'**
  String get notifInvestmentConfirmed;

  /// notif.investmentConfirmedDesc
  ///
  /// In en, this message translates to:
  /// **'Your investment of 10,000 SAR in Al-Olaya Heights has been confirmed.'**
  String get notifInvestmentConfirmedDesc;

  /// notif.distributionReceived
  ///
  /// In en, this message translates to:
  /// **'Distribution Received'**
  String get notifDistributionReceived;

  /// notif.distributionReceivedDesc
  ///
  /// In en, this message translates to:
  /// **'You\'ve received a quarterly distribution of 450 SAR from Al-Malqa Residences.'**
  String get notifDistributionReceivedDesc;

  /// notif.priceAlert
  ///
  /// In en, this message translates to:
  /// **'Price Alert'**
  String get notifPriceAlert;

  /// notif.priceAlertDesc
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya Heights token price has increased by 5.2% this month.'**
  String get notifPriceAlertDesc;

  /// notif.kycApproved
  ///
  /// In en, this message translates to:
  /// **'KYC Approved'**
  String get notifKycApproved;

  /// notif.kycApprovedDesc
  ///
  /// In en, this message translates to:
  /// **'Your identity verification has been approved. You can now start investing.'**
  String get notifKycApprovedDesc;

  /// notif.referralBonus
  ///
  /// In en, this message translates to:
  /// **'Referral Bonus'**
  String get notifReferralBonus;

  /// notif.referralBonusDesc
  ///
  /// In en, this message translates to:
  /// **'Your friend Mohammed joined Hseeltech! You\'ve earned 150 SAR.'**
  String get notifReferralBonusDesc;

  /// notif.newOpportunity
  ///
  /// In en, this message translates to:
  /// **'New Opportunity'**
  String get notifNewOpportunity;

  /// notif.newOpportunityDesc
  ///
  /// In en, this message translates to:
  /// **'A new investment opportunity is now available: Riyadh Gate Tower.'**
  String get notifNewOpportunityDesc;

  /// notif.documentReady
  ///
  /// In en, this message translates to:
  /// **'Document Ready'**
  String get notifDocumentReady;

  /// notif.documentReadyDesc
  ///
  /// In en, this message translates to:
  /// **'Your investment certificate for Al-Olaya Heights is ready to download.'**
  String get notifDocumentReadyDesc;

  /// notif.maintenanceNotice
  ///
  /// In en, this message translates to:
  /// **'Maintenance Notice'**
  String get notifMaintenanceNotice;

  /// notif.maintenanceNoticeDesc
  ///
  /// In en, this message translates to:
  /// **'Scheduled maintenance on Feb 15, 2026 from 2:00 AM to 4:00 AM.'**
  String get notifMaintenanceNoticeDesc;

  /// notif.notUploaded
  ///
  /// In en, this message translates to:
  /// **'Not Uploaded'**
  String get notifNotUploaded;

  /// notif.verified
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get notifVerified;

  /// notif.uploaded
  ///
  /// In en, this message translates to:
  /// **'Uploaded'**
  String get notifUploaded;

  /// notif.newInvestment
  ///
  /// In en, this message translates to:
  /// **'New Investment'**
  String get notifNewInvestment;

  /// notif.newComment
  ///
  /// In en, this message translates to:
  /// **'New Comment'**
  String get notifNewComment;

  /// notif.newUpdateFromOwner
  ///
  /// In en, this message translates to:
  /// **'New Update From Owner'**
  String get notifNewUpdateFromOwner;

  /// biometric.authenticated
  ///
  /// In en, this message translates to:
  /// **'Authenticated!'**
  String get biometricAuthenticated;

  /// biometric.fingerprintDesc
  ///
  /// In en, this message translates to:
  /// **'Use your fingerprint to quickly and securely access your account'**
  String get biometricFingerprintDesc;

  /// biometric.faceIdDesc
  ///
  /// In en, this message translates to:
  /// **'Use facial recognition for quick and secure access to your account'**
  String get biometricFaceIdDesc;

  /// wallet.investmentOlaya
  ///
  /// In en, this message translates to:
  /// **'Investment - Al-Olaya Heights'**
  String get walletInvestmentOlaya;

  /// wallet.tokensPurchased2
  ///
  /// In en, this message translates to:
  /// **'2 tokens purchased'**
  String get walletTokensPurchased2;

  /// wallet.quarterlyReturn
  ///
  /// In en, this message translates to:
  /// **'Quarterly Return'**
  String get walletQuarterlyReturn;

  /// wallet.alMalqaResidences
  ///
  /// In en, this message translates to:
  /// **'Al-Malqa Residences'**
  String get walletAlMalqaResidences;

  /// wallet.referralBonusTx
  ///
  /// In en, this message translates to:
  /// **'Referral Bonus'**
  String get walletReferralBonusTx;

  /// wallet.withdrawal
  ///
  /// In en, this message translates to:
  /// **'Withdrawal'**
  String get walletWithdrawal;

  /// wallet.investmentRiyadhGate
  ///
  /// In en, this message translates to:
  /// **'Investment - Riyadh Gate'**
  String get walletInvestmentRiyadhGate;

  /// wallet.tokensPurchased1
  ///
  /// In en, this message translates to:
  /// **'1 token purchased'**
  String get walletTokensPurchased1;

  /// wallet.alOlayaHeights
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya Heights'**
  String get walletAlOlayaHeights;

  /// wallet.type
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get walletType;

  /// wallet.description
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get walletDescription;

  /// wallet.date
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get walletDate;

  /// wallet.time
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get walletTime;

  /// wallet.reference
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get walletReference;

  /// wallet.status
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get walletStatus;

  /// tx.investmentMalqa
  ///
  /// In en, this message translates to:
  /// **'Investment - Al-Malqa Residences'**
  String get txInvestmentMalqa;

  /// tx.tokensPurchased3
  ///
  /// In en, this message translates to:
  /// **'3 tokens purchased'**
  String get txTokensPurchased3;

  /// tx.riyadhGate
  ///
  /// In en, this message translates to:
  /// **'Riyadh Gate'**
  String get txRiyadhGate;

  /// tx.download
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get txDownload;

  /// rewards.tierLaunch
  ///
  /// In en, this message translates to:
  /// **'Launch'**
  String get rewardsTierLaunch;

  /// rewards.tierLaunchFull
  ///
  /// In en, this message translates to:
  /// **'Launch (Al-Iitlaq)'**
  String get rewardsTierLaunchFull;

  /// rewards.tierPioneer
  ///
  /// In en, this message translates to:
  /// **'Pioneer'**
  String get rewardsTierPioneer;

  /// rewards.tierPioneerFull
  ///
  /// In en, this message translates to:
  /// **'Pioneer (Al-Raed)'**
  String get rewardsTierPioneerFull;

  /// rewards.tierBroker
  ///
  /// In en, this message translates to:
  /// **'Broker'**
  String get rewardsTierBroker;

  /// rewards.tierBrokerFull
  ///
  /// In en, this message translates to:
  /// **'Broker (Al-Simsar)'**
  String get rewardsTierBrokerFull;

  /// rewards.tierAqili
  ///
  /// In en, this message translates to:
  /// **'Aqili'**
  String get rewardsTierAqili;

  /// rewards.tierAqiliFull
  ///
  /// In en, this message translates to:
  /// **'Aqili (Al-Oqail)'**
  String get rewardsTierAqiliFull;

  /// rewards.tierDistinguished
  ///
  /// In en, this message translates to:
  /// **'Distinguished'**
  String get rewardsTierDistinguished;

  /// rewards.tierDistinguishedFull
  ///
  /// In en, this message translates to:
  /// **'Distinguished (Al-Wajeeh)'**
  String get rewardsTierDistinguishedFull;

  /// rewards.firstLogin
  ///
  /// In en, this message translates to:
  /// **'First Login,'**
  String get rewardsFirstLogin;

  /// rewards.completed5Tasks
  ///
  /// In en, this message translates to:
  /// **'Completed 5 Tasks'**
  String get rewardsCompleted5Tasks;

  /// kyc.alOlaya
  ///
  /// In en, this message translates to:
  /// **'Al Olaya'**
  String get kycAlOlaya;

  /// kyc.riyadh
  ///
  /// In en, this message translates to:
  /// **'Riyadh'**
  String get kycRiyadh;

  /// kyc.addressCity
  ///
  /// In en, this message translates to:
  /// **'Riyadh, 12244'**
  String get kycAddressCity;

  /// kyc.company
  ///
  /// In en, this message translates to:
  /// **'ABC Corporation'**
  String get kycCompany;

  /// kyc.position
  ///
  /// In en, this message translates to:
  /// **'Senior Manager'**
  String get kycPosition;

  /// investDetail.jeddahWaterfront
  ///
  /// In en, this message translates to:
  /// **'Jeddah Waterfront'**
  String get investDetailJeddahWaterfront;

  /// investDetail.cornicheJeddah
  ///
  /// In en, this message translates to:
  /// **'Corniche, Jeddah'**
  String get investDetailCornicheJeddah;

  /// investDetail.hospitality
  ///
  /// In en, this message translates to:
  /// **'Hospitality'**
  String get investDetailHospitality;

  /// investDetail.alOlayaTowers
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya Towers'**
  String get investDetailAlOlayaTowers;

  /// investDetail.alOlayaRiyadh
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya, Riyadh'**
  String get investDetailAlOlayaRiyadh;

  /// investDetail.residential
  ///
  /// In en, this message translates to:
  /// **'Residential'**
  String get investDetailResidential;

  /// investDetail.ownershipCert
  ///
  /// In en, this message translates to:
  /// **'Ownership Certificate'**
  String get investDetailOwnershipCert;

  /// investDetail.notifications
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get investDetailNotifications;

  /// invest.balanceAmount
  ///
  /// In en, this message translates to:
  /// **'Balance: 12,500 SAR'**
  String get investBalanceAmount;

  /// invest.visaCard
  ///
  /// In en, this message translates to:
  /// **'Visa •••• 4532'**
  String get investVisaCard;

  /// invest.alYasminTower
  ///
  /// In en, this message translates to:
  /// **'Al Yasmin Tower – Riyadh'**
  String get investAlYasminTower;

  /// invest.residentialType
  ///
  /// In en, this message translates to:
  /// **'Residential'**
  String get investResidentialType;

  /// invest.completed
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get investCompleted;

  /// invest.transactionDetails
  ///
  /// In en, this message translates to:
  /// **'Transaction Details'**
  String get investTransactionDetails;

  /// invest.copyTransactionId
  ///
  /// In en, this message translates to:
  /// **'Copy Transaction ID'**
  String get investCopyTransactionId;

  /// invest.downloadReceipt
  ///
  /// In en, this message translates to:
  /// **'Download Receipt'**
  String get investDownloadReceipt;

  /// portfolio.sarValue
  ///
  /// In en, this message translates to:
  /// **'{value} SAR'**
  String portfolioSarValue(Object value);

  /// more.settingsDesc
  ///
  /// In en, this message translates to:
  /// **'Language, notifications & security'**
  String get moreSettingsDesc;

  /// more.termsDesc
  ///
  /// In en, this message translates to:
  /// **'Investor rights & obligations'**
  String get moreTermsDesc;

  /// more.privacyDesc
  ///
  /// In en, this message translates to:
  /// **'Data protection & compliance'**
  String get morePrivacyDesc;

  /// more.riskDesc
  ///
  /// In en, this message translates to:
  /// **'Investment risks & warnings'**
  String get moreRiskDesc;

  /// home.sar
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get homeSar;

  /// home.property
  ///
  /// In en, this message translates to:
  /// **'Property'**
  String get homeProperty;

  /// detail.property
  ///
  /// In en, this message translates to:
  /// **'Property'**
  String get detailProperty;

  /// detail.saveToFavorites
  ///
  /// In en, this message translates to:
  /// **'Save to favorites'**
  String get detailSaveToFavorites;

  /// detail.locationMap
  ///
  /// In en, this message translates to:
  /// **'Location Map'**
  String get detailLocationMap;

  /// common.goBack
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get commonGoBack;

  /// common.copy
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get commonCopy;

  /// auth.requestExpired
  ///
  /// In en, this message translates to:
  /// **'Request Expired'**
  String get authRequestExpired;

  /// auth.waitingVerification
  ///
  /// In en, this message translates to:
  /// **'Waiting for Verification'**
  String get authWaitingVerification;

  /// auth.verificationExpiredDesc
  ///
  /// In en, this message translates to:
  /// **'The verification time has expired. Please resend the request and try again.'**
  String get authVerificationExpiredDesc;

  /// auth.phoneHint
  ///
  /// In en, this message translates to:
  /// **'1XXXXXXXXX'**
  String get authPhoneHint;

  /// deposit.copied
  ///
  /// In en, this message translates to:
  /// **'Copied!'**
  String get depositCopied;

  /// deposit.copyAll
  ///
  /// In en, this message translates to:
  /// **'Copy All'**
  String get depositCopyAll;

  /// settings.selectLanguage
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get settingsSelectLanguage;

  /// settings.languageApplied
  ///
  /// In en, this message translates to:
  /// **'Language will be applied to all screens instantly'**
  String get settingsLanguageApplied;

  /// profile.phoneHint
  ///
  /// In en, this message translates to:
  /// **'+966 5X XXX XXXX'**
  String get profilePhoneHint;

  /// pin.useFingerprint
  ///
  /// In en, this message translates to:
  /// **'Use fingerprint'**
  String get pinUseFingerprint;

  /// faq.q.howToStart
  ///
  /// In en, this message translates to:
  /// **'How do I start investing?'**
  String get faqQHowToStart;

  /// faq.a.howToStart
  ///
  /// In en, this message translates to:
  /// **'Create an account, complete KYC verification, deposit funds, and browse available opportunities.'**
  String get faqAHowToStart;

  /// faq.q.minInvestment
  ///
  /// In en, this message translates to:
  /// **'What is the minimum investment?'**
  String get faqQMinInvestment;

  /// faq.a.minInvestment
  ///
  /// In en, this message translates to:
  /// **'The minimum investment starts from SAR 500, depending on the opportunity.'**
  String get faqAMinInvestment;

  /// faq.q.howReturns
  ///
  /// In en, this message translates to:
  /// **'How are returns distributed?'**
  String get faqQHowReturns;

  /// faq.a.howReturns
  ///
  /// In en, this message translates to:
  /// **'Returns are distributed quarterly based on rental income from the property.'**
  String get faqAHowReturns;

  /// faq.q.sellShares
  ///
  /// In en, this message translates to:
  /// **'Can I sell my tokens?'**
  String get faqQSellShares;

  /// faq.a.sellShares
  ///
  /// In en, this message translates to:
  /// **'Yes, you can sell your tokens through the secondary market when available.'**
  String get faqASellShares;

  /// faq.q.isRegulated
  ///
  /// In en, this message translates to:
  /// **'Is Hseeltech regulated?'**
  String get faqQIsRegulated;

  /// faq.a.isRegulated
  ///
  /// In en, this message translates to:
  /// **'Hseeltech operates within the Real Estate General Authority\'s regulatory sandbox.'**
  String get faqAIsRegulated;

  /// bank.check
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get bankCheck;

  /// biometric.simulateScan
  ///
  /// In en, this message translates to:
  /// **'Simulate Scan'**
  String get biometricSimulateScan;

  /// biometric.usePinInstead
  ///
  /// In en, this message translates to:
  /// **'Use PIN instead'**
  String get biometricUsePinInstead;

  /// auth.createAccount
  ///
  /// In en, this message translates to:
  /// **'Create New Account'**
  String get authCreateAccount;

  /// auth.verifyWithNafath
  ///
  /// In en, this message translates to:
  /// **'Verify with Nafath'**
  String get authVerifyWithNafath;

  /// auth.nafathVerifyInfo
  ///
  /// In en, this message translates to:
  /// **'Your identity will be verified through the national Nafath service. Please ensure your registered ID number is up to date.'**
  String get authNafathVerifyInfo;

  /// auth.mustBe10Digits
  ///
  /// In en, this message translates to:
  /// **'Must be 10 digits'**
  String get authMustBe10Digits;

  /// auth.iAgreeTo
  ///
  /// In en, this message translates to:
  /// **'I agree to the'**
  String get authIAgreeTo;

  /// common.and
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get commonAnd;

  /// auth.poweredBy
  ///
  /// In en, this message translates to:
  /// **'Powered by'**
  String get authPoweredBy;

  /// auth.afterVerificationNote
  ///
  /// In en, this message translates to:
  /// **'After successful verification, you will be asked to complete your personal information (mobile number and email).'**
  String get authAfterVerificationNote;

  /// invest.hseeltechWallet
  ///
  /// In en, this message translates to:
  /// **'Hseeltech Wallet'**
  String get investHseeltechWallet;

  /// investDetail.expectedReturn
  ///
  /// In en, this message translates to:
  /// **'Expected Return'**
  String get investDetailExpectedReturn;

  /// notif.dividendDistributed
  ///
  /// In en, this message translates to:
  /// **'Dividend Distributed'**
  String get notifDividendDistributed;

  /// notif.dividendMsg
  ///
  /// In en, this message translates to:
  /// **'Your Q4 2025 rental dividend of 312.50 SAR for Al Olaya Towers has been credited to your wallet.'**
  String get notifDividendMsg;

  /// notif.depositReceived
  ///
  /// In en, this message translates to:
  /// **'Deposit Received'**
  String get notifDepositReceived;

  /// notif.depositMsg
  ///
  /// In en, this message translates to:
  /// **'Your deposit of SAR 25,000 has been successfully credited to your Hseeltech wallet.'**
  String get notifDepositMsg;

  /// notif.newOpportunityMsg
  ///
  /// In en, this message translates to:
  /// **'Al Yasmin Tower in Riyadh is now open for investment. Starting from SAR 500 per token.'**
  String get notifNewOpportunityMsg;

  /// notif.withdrawalProcessed
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Processed'**
  String get notifWithdrawalProcessed;

  /// notif.withdrawalMsg
  ///
  /// In en, this message translates to:
  /// **'Your withdrawal of SAR 10,000 has been processed and will arrive in 1-2 business days.'**
  String get notifWithdrawalMsg;

  /// notif.referralMsg
  ///
  /// In en, this message translates to:
  /// **'You earned SAR 250 referral bonus! Ahmed has completed their first investment.'**
  String get notifReferralMsg;

  /// notif.valuationUpdate
  ///
  /// In en, this message translates to:
  /// **'Property Valuation Update'**
  String get notifValuationUpdate;

  /// notif.valuationMsg
  ///
  /// In en, this message translates to:
  /// **'Al-Malqa Residences property valuation has increased by 4.2% based on latest market assessment.'**
  String get notifValuationMsg;

  /// notif.documentUploaded
  ///
  /// In en, this message translates to:
  /// **'Document Uploaded'**
  String get notifDocumentUploaded;

  /// notif.documentMsg
  ///
  /// In en, this message translates to:
  /// **'Your National ID verification document has been uploaded and is pending review.'**
  String get notifDocumentMsg;

  /// notif.securityAlert
  ///
  /// In en, this message translates to:
  /// **'Security Alert'**
  String get notifSecurityAlert;

  /// notif.securityMsg
  ///
  /// In en, this message translates to:
  /// **'New login detected from Riyadh, Saudi Arabia. If this wasn\'t you, please secure your account.'**
  String get notifSecurityMsg;

  /// notif.timeAgo2h
  ///
  /// In en, this message translates to:
  /// **'2 hours ago'**
  String get notifTimeAgo2h;

  /// notif.timeAgo5h
  ///
  /// In en, this message translates to:
  /// **'5 hours ago'**
  String get notifTimeAgo5h;

  /// notif.timeAgoYesterday
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get notifTimeAgoYesterday;

  /// notif.timeAgo2d
  ///
  /// In en, this message translates to:
  /// **'2 days ago'**
  String get notifTimeAgo2d;

  /// notif.timeAgo3d
  ///
  /// In en, this message translates to:
  /// **'3 days ago'**
  String get notifTimeAgo3d;

  /// notif.timeAgo1w
  ///
  /// In en, this message translates to:
  /// **'1 week ago'**
  String get notifTimeAgo1w;

  /// wallet.txDeposit
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get walletTxDeposit;

  /// wallet.txInvestment
  ///
  /// In en, this message translates to:
  /// **'Investment'**
  String get walletTxInvestment;

  /// wallet.txQuarterlyReturn
  ///
  /// In en, this message translates to:
  /// **'Quarterly Return'**
  String get walletTxQuarterlyReturn;

  /// wallet.txReferralBonus
  ///
  /// In en, this message translates to:
  /// **'Referral Bonus'**
  String get walletTxReferralBonus;

  /// wallet.txWithdrawal
  ///
  /// In en, this message translates to:
  /// **'Withdrawal'**
  String get walletTxWithdrawal;

  /// wallet.txVIBAN
  ///
  /// In en, this message translates to:
  /// **'VIBAN Transfer - ANB'**
  String get walletTxVIBAN;

  /// wallet.txAlOlaya
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya Heights'**
  String get walletTxAlOlaya;

  /// wallet.txAlMalqa
  ///
  /// In en, this message translates to:
  /// **'Al-Malqa Residences'**
  String get walletTxAlMalqa;

  /// wallet.txAhmedJoined
  ///
  /// In en, this message translates to:
  /// **'Ahmed joined via your link'**
  String get walletTxAhmedJoined;

  /// wallet.txToSAB
  ///
  /// In en, this message translates to:
  /// **'To SAB Account'**
  String get walletTxToSAB;

  /// wallet.txApplePay
  ///
  /// In en, this message translates to:
  /// **'Apple Pay'**
  String get walletTxApplePay;

  /// wallet.txRiyadhGate
  ///
  /// In en, this message translates to:
  /// **'Riyadh Gate'**
  String get walletTxRiyadhGate;

  /// wallet.txAlYasmin
  ///
  /// In en, this message translates to:
  /// **'Al-Yasmin Tower'**
  String get walletTxAlYasmin;

  /// wallet.detailType
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get walletDetailType;

  /// wallet.detailDescription
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get walletDetailDescription;

  /// wallet.detailDate
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get walletDetailDate;

  /// wallet.detailTime
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get walletDetailTime;

  /// notif.tierUpgrade
  ///
  /// In en, this message translates to:
  /// **'Tier Upgrade!'**
  String get notifTierUpgrade;

  /// notif.tierUpgradeMsg
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You\'ve been upgraded to Pioneer tier. Enjoy enhanced benefits and priority access.'**
  String get notifTierUpgradeMsg;

  /// notif.kycComplete
  ///
  /// In en, this message translates to:
  /// **'KYC Verification Complete'**
  String get notifKycComplete;

  /// notif.kycCompleteMsg
  ///
  /// In en, this message translates to:
  /// **'Your identity verification has been approved. You can now invest and withdraw funds.'**
  String get notifKycCompleteMsg;

  /// notif.timeAgo4d
  ///
  /// In en, this message translates to:
  /// **'4 days ago'**
  String get notifTimeAgo4d;

  /// notif.timeAgo5d
  ///
  /// In en, this message translates to:
  /// **'5 days ago'**
  String get notifTimeAgo5d;

  /// notifications.unread
  ///
  /// In en, this message translates to:
  /// **'unread'**
  String get notificationsUnread;

  /// notifications.allCaughtUp
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up! Check back later for updates.'**
  String get notificationsAllCaughtUp;

  /// wallet.detailReference
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get walletDetailReference;

  /// wallet.detailStatus
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get walletDetailStatus;

  /// wallet.transactionDetails
  ///
  /// In en, this message translates to:
  /// **'Transaction Details'**
  String get walletTransactionDetails;

  /// onboarding.welcome
  ///
  /// In en, this message translates to:
  /// **'Welcome to Hseeltech'**
  String get onboardingWelcome;

  /// onboarding.subtitle
  ///
  /// In en, this message translates to:
  /// **'Real Estate Investment Made Simple'**
  String get onboardingSubtitle;

  /// onboarding.smartInvesting
  ///
  /// In en, this message translates to:
  /// **'Smart Investing'**
  String get onboardingSmartInvesting;

  /// onboarding.smartInvestingTitle
  ///
  /// In en, this message translates to:
  /// **'Browse & Invest in Minutes'**
  String get onboardingSmartInvestingTitle;

  /// onboarding.smartInvestingDesc
  ///
  /// In en, this message translates to:
  /// **'Explore curated real estate opportunities, review detailed financials, and invest with just a few taps.'**
  String get onboardingSmartInvestingDesc;

  /// onboarding.earnRewardsTitle
  ///
  /// In en, this message translates to:
  /// **'Refer Friends & Earn Together'**
  String get onboardingEarnRewardsTitle;

  /// onboarding.digitalWalletTitle
  ///
  /// In en, this message translates to:
  /// **'Manage Your Funds Easily'**
  String get onboardingDigitalWalletTitle;

  /// onboarding.digitalWalletDesc
  ///
  /// In en, this message translates to:
  /// **'Deposit via VIBAN or mada card, track your transactions, and withdraw to your personal bank account anytime.'**
  String get onboardingDigitalWalletDesc;

  /// onboarding.skip
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// onboarding.next
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// notifDetail.investConfirmedMsg
  ///
  /// In en, this message translates to:
  /// **'Your investment of 5,000 SAR in Al-Olaya Business Tower has been confirmed. Ownership certificate has been issued by the Real Estate Registration Authority.'**
  String get notifDetailInvestConfirmedMsg;

  /// notifDetail.dividendPayment
  ///
  /// In en, this message translates to:
  /// **'Dividend Payment Received'**
  String get notifDetailDividendPayment;

  /// notifDetail.documentReady
  ///
  /// In en, this message translates to:
  /// **'Document Ready'**
  String get notifDetailDocumentReady;

  /// notifDetail.documentReadyMsg
  ///
  /// In en, this message translates to:
  /// **'Your ownership certificate for Al-Olaya Business Tower is now available for download. This document is officially registered with the Real Estate Registration Authority.'**
  String get notifDetailDocumentReadyMsg;

  /// notifDetail.downloadCert
  ///
  /// In en, this message translates to:
  /// **'Download Certificate'**
  String get notifDetailDownloadCert;

  /// notifDetail.newLogin
  ///
  /// In en, this message translates to:
  /// **'New Login Detected'**
  String get notifDetailNewLogin;

  /// notifDetail.reviewActivity
  ///
  /// In en, this message translates to:
  /// **'Review Activity'**
  String get notifDetailReviewActivity;

  /// notifDetail.newOpportunity
  ///
  /// In en, this message translates to:
  /// **'New Opportunity Available'**
  String get notifDetailNewOpportunity;

  /// notifDetail.investProcessing
  ///
  /// In en, this message translates to:
  /// **'Investment Processing'**
  String get notifDetailInvestProcessing;

  /// notifDetail.notifications
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifDetailNotifications;

  /// oppCard.alMalqa
  ///
  /// In en, this message translates to:
  /// **'Al-Malqa Residences'**
  String get oppCardAlMalqa;

  /// oppCard.alMalqaLoc
  ///
  /// In en, this message translates to:
  /// **'Al-Malqa, Riyadh'**
  String get oppCardAlMalqaLoc;

  /// oppCard.residential
  ///
  /// In en, this message translates to:
  /// **'Residential'**
  String get oppCardResidential;

  /// oppCard.highYield
  ///
  /// In en, this message translates to:
  /// **'High Yield'**
  String get oppCardHighYield;

  /// oppCard.available
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get oppCardAvailable;

  /// oppCard.quarterly
  ///
  /// In en, this message translates to:
  /// **'Quarterly'**
  String get oppCardQuarterly;

  /// oppCard.kingFahd
  ///
  /// In en, this message translates to:
  /// **'King Fahd Business Park'**
  String get oppCardKingFahd;

  /// oppCard.kingFahdLoc
  ///
  /// In en, this message translates to:
  /// **'Riyadh, Saudi Arabia'**
  String get oppCardKingFahdLoc;

  /// oppCard.officeSpace
  ///
  /// In en, this message translates to:
  /// **'Office Space'**
  String get oppCardOfficeSpace;

  /// oppCard.growth
  ///
  /// In en, this message translates to:
  /// **'Growth'**
  String get oppCardGrowth;

  /// oppCard.monthly
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get oppCardMonthly;

  /// oppCard.jeddahHotel
  ///
  /// In en, this message translates to:
  /// **'Jeddah Corniche Hotel'**
  String get oppCardJeddahHotel;

  /// oppCard.jeddahHotelLoc
  ///
  /// In en, this message translates to:
  /// **'Jeddah, Saudi Arabia'**
  String get oppCardJeddahHotelLoc;

  /// oppCard.hotel
  ///
  /// In en, this message translates to:
  /// **'Hotel'**
  String get oppCardHotel;

  /// oppCard.premium
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get oppCardPremium;

  /// oppCard.semiAnnual
  ///
  /// In en, this message translates to:
  /// **'Semi-Annual'**
  String get oppCardSemiAnnual;

  /// investDetail.jeddahLoc
  ///
  /// In en, this message translates to:
  /// **'Corniche, Jeddah'**
  String get investDetailJeddahLoc;

  /// investDetail.alOlayaLoc
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya, Riyadh'**
  String get investDetailAlOlayaLoc;

  /// investDetail.nextDistDate
  ///
  /// In en, this message translates to:
  /// **'March 15, 2026'**
  String get investDetailNextDistDate;

  /// skeleton.home
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get skeletonHome;

  /// skeleton.explore
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get skeletonExplore;

  /// skeleton.portfolio
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get skeletonPortfolio;

  /// legal.lastUpdated
  ///
  /// In en, this message translates to:
  /// **'Last Updated: February 2026'**
  String get legalLastUpdated;

  /// legal.back
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get legalBack;

  /// legal.english
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get legalEnglish;

  /// legal.risk.intro
  ///
  /// In en, this message translates to:
  /// **'Please read this Risk Disclosure carefully before making any investment through the Hseeltech platform. Investing in real estate involves significant risks, and you should fully understand these risks before proceeding.'**
  String get legalRiskIntro;

  /// legal.riskMarket
  ///
  /// In en, this message translates to:
  /// **'Market Risk'**
  String get legalRiskMarket;

  /// legal.riskReturn
  ///
  /// In en, this message translates to:
  /// **'Return Risk'**
  String get legalRiskReturn;

  /// legal.riskLiquidity
  ///
  /// In en, this message translates to:
  /// **'Liquidity Risk'**
  String get legalRiskLiquidity;

  /// legal.riskRegulatory
  ///
  /// In en, this message translates to:
  /// **'Regulatory Risk'**
  String get legalRiskRegulatory;

  /// legal.riskCapital
  ///
  /// In en, this message translates to:
  /// **'Capital Risk'**
  String get legalRiskCapital;

  /// legal.riskConcentration
  ///
  /// In en, this message translates to:
  /// **'Concentration Risk'**
  String get legalRiskConcentration;

  /// legal.riskOperational
  ///
  /// In en, this message translates to:
  /// **'Operational Risk'**
  String get legalRiskOperational;

  /// legal.riskForceMajeure
  ///
  /// In en, this message translates to:
  /// **'Force Majeure'**
  String get legalRiskForceMajeure;

  /// legal.risk.disclaimer
  ///
  /// In en, this message translates to:
  /// **'This Risk Disclosure does not cover all possible risks associated with real estate investment. You should carefully consider your financial situation, investment objectives, and risk tolerance before investing. We strongly recommend seeking independent financial and legal advice before making any investment decision.'**
  String get legalRiskDisclaimer;

  /// legal.riskAcknowledge
  ///
  /// In en, this message translates to:
  /// **'By investing through Hseeltech, you acknowledge that you have read, understood, and accepted all the risks described in this disclosure.'**
  String get legalRiskAcknowledge;

  /// legal.pdplNote
  ///
  /// In en, this message translates to:
  /// **'This policy is prepared in accordance with the Saudi Personal Data Protection Law (PDPL) issued by Royal Decree No. (M/19) dated 9/2/1443H and its implementing regulations.'**
  String get legalPdplNote;

  /// onboarding.welcomeDesc
  ///
  /// In en, this message translates to:
  /// **'Invest in premium Saudi real estate starting from just 500 SAR. Build your portfolio with fractional ownership.'**
  String get onboardingWelcomeDesc;

  /// onboarding.earnRewardsDesc
  ///
  /// In en, this message translates to:
  /// **'Climb through 5 reward tiers from Launch to Distinguished. Earn bonuses for every friend who invests.'**
  String get onboardingEarnRewardsDesc;

  /// onboarding.feature.exploreOpportunities
  ///
  /// In en, this message translates to:
  /// **'Explore real estate opportunities'**
  String get onboardingFeatureExploreOpportunities;

  /// onboarding.feature.premiumRealEstate
  ///
  /// In en, this message translates to:
  /// **'Premium Saudi real estate'**
  String get onboardingFeaturePremiumRealEstate;

  /// onboarding.feature.growingCommunity
  ///
  /// In en, this message translates to:
  /// **'Growing investor community'**
  String get onboardingFeatureGrowingCommunity;

  /// onboarding.feature.curatedProperties
  ///
  /// In en, this message translates to:
  /// **'Curated properties'**
  String get onboardingFeatureCuratedProperties;

  /// onboarding.feature.interactiveCalc
  ///
  /// In en, this message translates to:
  /// **'Interactive calculator'**
  String get onboardingFeatureInteractiveCalc;

  /// onboarding.feature.transparentPricing
  ///
  /// In en, this message translates to:
  /// **'Transparent pricing'**
  String get onboardingFeatureTransparentPricing;

  /// onboarding.feature.rewardTiers
  ///
  /// In en, this message translates to:
  /// **'5 reward tiers'**
  String get onboardingFeatureRewardTiers;

  /// onboarding.feature.referralBonuses
  ///
  /// In en, this message translates to:
  /// **'Referral bonuses'**
  String get onboardingFeatureReferralBonuses;

  /// onboarding.feature.buildingRewards
  ///
  /// In en, this message translates to:
  /// **'Building rewards'**
  String get onboardingFeatureBuildingRewards;

  /// onboarding.feature.anbViban
  ///
  /// In en, this message translates to:
  /// **'ANB VIBAN integration'**
  String get onboardingFeatureAnbViban;

  /// onboarding.feature.madaCard
  ///
  /// In en, this message translates to:
  /// **'mada card support'**
  String get onboardingFeatureMadaCard;

  /// onboarding.feature.realTimeTracking
  ///
  /// In en, this message translates to:
  /// **'Real-time tracking'**
  String get onboardingFeatureRealTimeTracking;

  /// faq.q.howWithdraw
  ///
  /// In en, this message translates to:
  /// **'How do I withdraw my returns?'**
  String get faqQHowWithdraw;

  /// faq.a.howWithdraw
  ///
  /// In en, this message translates to:
  /// **'Go to your wallet, select \'Withdraw\', choose your bank account, and enter the amount. Withdrawals are processed within 2-3 business days.'**
  String get faqAHowWithdraw;

  /// faq.q.referralProgram
  ///
  /// In en, this message translates to:
  /// **'How does the referral program work?'**
  String get faqQReferralProgram;

  /// faq.a.referralProgram
  ///
  /// In en, this message translates to:
  /// **'Share your referral code with friends. When they sign up and make their first investment, both of you receive SAR 150 in rewards.'**
  String get faqAReferralProgram;

  /// oppCard.alOlayaTowers
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya Towers'**
  String get oppCardAlOlayaTowers;

  /// oppCard.alOlayaLoc
  ///
  /// In en, this message translates to:
  /// **'Riyadh, Saudi Arabia'**
  String get oppCardAlOlayaLoc;

  /// oppCard.apartment
  ///
  /// In en, this message translates to:
  /// **'Apartment'**
  String get oppCardApartment;

  /// oppCard.funded
  ///
  /// In en, this message translates to:
  /// **'Funded'**
  String get oppCardFunded;

  /// oppCard.balanced
  ///
  /// In en, this message translates to:
  /// **'Balanced'**
  String get oppCardBalanced;

  /// rewards.testDisclaimer
  ///
  /// In en, this message translates to:
  /// **'The following types of rewards may be generated or simulated during testing: Points are assigned based on simulated user actions. Badges are earned for hitting test milestones. Simulated Coupons appear as discounts but are not functional. Leaderboard Rankings are used to test UI components.'**
  String get rewardsTestDisclaimer;

  /// profile.newInvestmentNotif
  ///
  /// In en, this message translates to:
  /// **'New Investment'**
  String get profileNewInvestmentNotif;

  /// profile.newCommentNotif
  ///
  /// In en, this message translates to:
  /// **'New Comment'**
  String get profileNewCommentNotif;

  /// profile.newUpdateFromOwnerNotif
  ///
  /// In en, this message translates to:
  /// **'New Update From Owner'**
  String get profileNewUpdateFromOwnerNotif;

  /// profile.faqQ1
  ///
  /// In en, this message translates to:
  /// **'How do I start investing?'**
  String get profileFaqQ1;

  /// profile.faqA1
  ///
  /// In en, this message translates to:
  /// **'Create an account, complete KYC verification, add funds to your wallet, and browse available opportunities to start investing.'**
  String get profileFaqA1;

  /// profile.faqQ2
  ///
  /// In en, this message translates to:
  /// **'What is the minimum investment?'**
  String get profileFaqQ2;

  /// profile.faqA2
  ///
  /// In en, this message translates to:
  /// **'The minimum investment varies by opportunity, typically starting from SAR 500.'**
  String get profileFaqA2;

  /// profile.faqQ3
  ///
  /// In en, this message translates to:
  /// **'How do I withdraw my returns?'**
  String get profileFaqQ3;

  /// profile.faqA3
  ///
  /// In en, this message translates to:
  /// **'Go to your wallet, select \'Withdraw\', choose your bank account, and enter the amount. Withdrawals are processed within 2-3 business days.'**
  String get profileFaqA3;

  /// profile.faqQ4
  ///
  /// In en, this message translates to:
  /// **'How does the referral program work?'**
  String get profileFaqQ4;

  /// profile.faqA4
  ///
  /// In en, this message translates to:
  /// **'Share your referral code with friends. When they sign up and make their first investment, both of you receive SAR 150 in rewards.'**
  String get profileFaqA4;

  /// welcome.secureAndTrusted
  ///
  /// In en, this message translates to:
  /// **'Secure & Trusted'**
  String get welcomeSecureAndTrusted;

  /// profile.update
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get profileUpdate;

  /// profile.identityVerification
  ///
  /// In en, this message translates to:
  /// **'Identity Verification (Nafath)'**
  String get profileIdentityVerification;

  /// profile.kycStatus
  ///
  /// In en, this message translates to:
  /// **'KYC Status'**
  String get profileKycStatus;

  /// profile.verified
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get profileVerified;

  /// profile.underReview
  ///
  /// In en, this message translates to:
  /// **'Under Review'**
  String get profileUnderReview;

  /// profile.uploaded
  ///
  /// In en, this message translates to:
  /// **'Uploaded'**
  String get profileUploaded;

  /// profile.appVersion
  ///
  /// In en, this message translates to:
  /// **'App Version 1.0.0'**
  String get profileAppVersion;

  /// profile.bankAccountDesc
  ///
  /// In en, this message translates to:
  /// **'Your bank account is used for deposits and withdrawals'**
  String get profileBankAccountDesc;

  /// profile.documentsDesc
  ///
  /// In en, this message translates to:
  /// **'Your documents are securely stored and encrypted. We comply with Saudi PDPL regulations.'**
  String get profileDocumentsDesc;

  /// profile.stepsCompleted
  ///
  /// In en, this message translates to:
  /// **'3 of 4 steps completed'**
  String get profileStepsCompleted;

  /// oppCard.bed
  ///
  /// In en, this message translates to:
  /// **'Bed'**
  String get oppCardBed;

  /// oppCard.bath
  ///
  /// In en, this message translates to:
  /// **'Bath'**
  String get oppCardBath;

  /// oppCard.parking
  ///
  /// In en, this message translates to:
  /// **'Parking'**
  String get oppCardParking;

  /// oppCard.rooms
  ///
  /// In en, this message translates to:
  /// **'Rooms'**
  String get oppCardRooms;

  /// oppCard.stars
  ///
  /// In en, this message translates to:
  /// **'Stars'**
  String get oppCardStars;

  /// darkMode.dark
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkModeDark;

  /// darkMode.light
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get darkModeLight;

  /// faq.q.whatIsHseeltech
  ///
  /// In en, this message translates to:
  /// **'What is Hseeltech?'**
  String get faqQWhatIsHseeltech;

  /// faq.a.whatIsHseeltech
  ///
  /// In en, this message translates to:
  /// **'Hseeltech is a fractional real estate investment platform. We enable investors to own tokens in premium Saudi real estate properties starting from as low as SAR 500.'**
  String get faqAWhatIsHseeltech;

  /// faq.q.whoCanInvest
  ///
  /// In en, this message translates to:
  /// **'Who can invest on Hseeltech?'**
  String get faqQWhoCanInvest;

  /// faq.a.whoCanInvest
  ///
  /// In en, this message translates to:
  /// **'Saudi nationals and residents aged 18+ with a valid national ID or Iqama can invest. You must complete the Nafath identity verification and KYC questionnaire before making investments.'**
  String get faqAWhoCanInvest;

  /// faq.q.expectedReturns
  ///
  /// In en, this message translates to:
  /// **'What are the expected returns?'**
  String get faqQExpectedReturns;

  /// faq.a.expectedReturns
  ///
  /// In en, this message translates to:
  /// **'Expected annual returns vary by property, typically ranging from 7% to 12%. These include rental yield and potential capital appreciation. All projections are estimates based on current data and are not guaranteed.'**
  String get faqAExpectedReturns;

  /// faq.q.howPropertiesSelected
  ///
  /// In en, this message translates to:
  /// **'How are properties selected?'**
  String get faqQHowPropertiesSelected;

  /// faq.a.howPropertiesSelected
  ///
  /// In en, this message translates to:
  /// **'Our team conducts thorough due diligence including property valuation, market analysis, legal review, and risk assessment. Only properties meeting our strict criteria are listed on the platform.'**
  String get faqAHowPropertiesSelected;

  /// faq.q.whoManagesProperties
  ///
  /// In en, this message translates to:
  /// **'Who manages the properties?'**
  String get faqQWhoManagesProperties;

  /// faq.a.whoManagesProperties
  ///
  /// In en, this message translates to:
  /// **'Professional property management companies handle day-to-day operations including tenant management, maintenance, and rent collection. Investors receive regular performance reports.'**
  String get faqAWhoManagesProperties;

  /// faq.q.dataProtected
  ///
  /// In en, this message translates to:
  /// **'How is my data protected?'**
  String get faqQDataProtected;

  /// faq.a.dataProtected
  ///
  /// In en, this message translates to:
  /// **'We comply with Saudi Arabia\'s Personal Data Protection Law (PDPL). All data is encrypted in transit and at rest. We use Nafath for identity verification and implement multi-factor authentication.'**
  String get faqADataProtected;

  /// faq.q.kycProcess
  ///
  /// In en, this message translates to:
  /// **'What is the KYC process?'**
  String get faqQKycProcess;

  /// faq.a.kycProcess
  ///
  /// In en, this message translates to:
  /// **'KYC (Know Your Customer) involves 5 steps: personal information, financial profile, investment experience, risk assessment, and document verification. Most fields are auto-filled via Nafath integration.'**
  String get faqAKycProcess;

  /// faq.q.fundWallet
  ///
  /// In en, this message translates to:
  /// **'How do I fund my wallet?'**
  String get faqQFundWallet;

  /// faq.a.fundWallet
  ///
  /// In en, this message translates to:
  /// **'You can fund your wallet via bank transfer (IBAN), Apple Pay, or mada debit card. Deposits are typically processed within 1-2 business days for bank transfers and instantly for card payments.'**
  String get faqAFundWallet;

  /// faq.q.withdrawFunds
  ///
  /// In en, this message translates to:
  /// **'How do I withdraw funds?'**
  String get faqQWithdrawFunds;

  /// faq.a.withdrawFunds
  ///
  /// In en, this message translates to:
  /// **'Withdrawals are processed to your registered bank account within 2-3 business days. You can request a withdrawal from the Wallet screen at any time for available balance.'**
  String get faqAWithdrawFunds;

  /// faq.q.rewardTiers
  ///
  /// In en, this message translates to:
  /// **'What are the reward tiers?'**
  String get faqQRewardTiers;

  /// faq.a.rewardTiers
  ///
  /// In en, this message translates to:
  /// **'There are 4 tiers: Launch (Al-Iitlaq), Pioneer (Al-Raed), Expert (Al-Khabir), and Elite (Al-Nakhba). Each tier unlocks additional benefits like reduced fees, priority access, and higher referral bonuses.'**
  String get faqARewardTiers;

  /// invest.escrowNotice
  ///
  /// In en, this message translates to:
  /// **'Your investment is protected by Hseeltech\'s escrow system. Funds are held securely until the property is fully funded.'**
  String get investEscrowNotice;

  /// more.version
  ///
  /// In en, this message translates to:
  /// **'Hseeltech Version 1.0.0'**
  String get moreVersion;

  /// profile.aboutDesc
  ///
  /// In en, this message translates to:
  /// **'Hseeltech is a fractional real estate investment platform.'**
  String get profileAboutDesc;

  /// profile.copyright
  ///
  /// In en, this message translates to:
  /// **'© 2025 Hseeltech. All rights reserved.'**
  String get profileCopyright;

  /// more.allServices
  ///
  /// In en, this message translates to:
  /// **'All services and settings'**
  String get moreAllServices;

  /// more.quickServices
  ///
  /// In en, this message translates to:
  /// **'Quick Services'**
  String get moreQuickServices;

  /// more.settingsLegal
  ///
  /// In en, this message translates to:
  /// **'Settings & Legal'**
  String get moreSettingsLegal;

  /// invest.transferDisclaimer
  ///
  /// In en, this message translates to:
  /// **'Transfer at least {amount} SAR from your personal bank account. Transfers from third-party accounts will not be accepted.'**
  String investTransferDisclaimer(Object amount);

  /// invest.topUpContinue
  ///
  /// In en, this message translates to:
  /// **'Top Up & Continue — {amount} SAR'**
  String investTopUpContinue(Object amount);

  /// invest.afterTopUp
  ///
  /// In en, this message translates to:
  /// **'After top-up, you\'ll proceed to confirm your investment'**
  String get investAfterTopUp;

  /// invest.riskAcknowledge
  ///
  /// In en, this message translates to:
  /// **'I acknowledge the {link} and understand the risks involved'**
  String investRiskAcknowledge(Object link);

  /// invest.agreeAndContinue
  ///
  /// In en, this message translates to:
  /// **'I Agree & Continue'**
  String get investAgreeAndContinue;

  /// invest.drawSignature
  ///
  /// In en, this message translates to:
  /// **'Draw your signature above'**
  String get investDrawSignature;

  /// invest.signConfirm
  ///
  /// In en, this message translates to:
  /// **'Sign & Confirm Investment'**
  String get investSignConfirm;

  /// invest.processingWait
  ///
  /// In en, this message translates to:
  /// **'Please wait while we process your investment. This may take a few moments...'**
  String get investProcessingWait;

  /// invest.certificateDesc
  ///
  /// In en, this message translates to:
  /// **'Your digital token certificate will be available in your portfolio within 24 hours.'**
  String get investCertificateDesc;

  /// invest.viewPortfolio
  ///
  /// In en, this message translates to:
  /// **'View My Investments'**
  String get investViewPortfolio;

  /// invest.confirmPaymentAmount
  ///
  /// In en, this message translates to:
  /// **'Confirm Payment — {amount} SAR'**
  String investConfirmPaymentAmount(Object amount);

  /// invest.annuallyLabel
  ///
  /// In en, this message translates to:
  /// **'annually'**
  String get investAnnuallyLabel;

  /// invest.riskWarningText
  ///
  /// In en, this message translates to:
  /// **'Real estate investments carry risks including potential loss of capital. Past performance does not guarantee future results. Please review the full risk disclosure before investing.'**
  String get investRiskWarningText;

  /// invest.biometricAuth
  ///
  /// In en, this message translates to:
  /// **'Or use biometric authentication'**
  String get investBiometricAuth;

  /// invest.transactionEncrypted
  ///
  /// In en, this message translates to:
  /// **'Your transaction is encrypted and protected. Ownership will be registered with the Real Estate Registration Authority.'**
  String get investTransactionEncrypted;

  /// invest.devNoteText
  ///
  /// In en, this message translates to:
  /// **'After payment, create the investment record with status PROCESSING. Update to CONFIRMED after ownership registration is verified via the Real Estate Registration Authority API.'**
  String get investDevNoteText;

  /// invest.iHaveReadAgree
  ///
  /// In en, this message translates to:
  /// **'I have read and agree to the'**
  String get investIHaveReadAgree;

  /// wallet.hseeltechViban
  ///
  /// In en, this message translates to:
  /// **'Hseeltech VIBAN'**
  String get walletHseeltechViban;

  /// wallet.bankTransferTime
  ///
  /// In en, this message translates to:
  /// **'Bank transfers typically arrive within a few minutes to 24 hours'**
  String get walletBankTransferTime;

  /// wallet.instantDepositNote
  ///
  /// In en, this message translates to:
  /// **'Instant deposit — funds credited immediately'**
  String get walletInstantDepositNote;

  /// legal.terms.title
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get legalTermsTitle;

  /// legal.terms.lastUpdated
  ///
  /// In en, this message translates to:
  /// **'Last Updated: February 2026'**
  String get legalTermsLastUpdated;

  /// legal.terms.s1.title
  ///
  /// In en, this message translates to:
  /// **'1. Acceptance of Terms'**
  String get legalTermsS1Title;

  /// legal.terms.s1.body
  ///
  /// In en, this message translates to:
  /// **'By accessing or using the Hseeltech platform (\"Platform\"), you agree to be bound by these Terms and Conditions (\"Terms\"). If you do not agree to these Terms, you must not use the Platform.\n\nThese Terms constitute a legally binding agreement between you (\"Investor\", \"you\") and Hseeltech Company (\"Hseeltech\", \"we\", \"us\").'**
  String get legalTermsS1Body;

  /// legal.terms.s2.title
  ///
  /// In en, this message translates to:
  /// **'2. Platform Description'**
  String get legalTermsS2Title;

  /// legal.terms.s2.body
  ///
  /// In en, this message translates to:
  /// **'Hseeltech operates a fractional real estate investment platform that allows qualified investors to invest in real estate opportunities in the Kingdom of Saudi Arabia. The Platform enables investors to purchase fractional ownership tokens in curated real estate properties starting from SAR 500.\n\nThe Platform is currently operating within REGA\'s Regulatory Sandbox. This product/service is being tested within the regulatory sandbox environment and is not formally licensed or endorsed by the General Real Estate Authority.'**
  String get legalTermsS2Body;

  /// legal.terms.s3.title
  ///
  /// In en, this message translates to:
  /// **'3. Investor Eligibility'**
  String get legalTermsS3Title;

  /// legal.terms.s3.body
  ///
  /// In en, this message translates to:
  /// **'To use the Platform, you must meet the following eligibility criteria:\n\n• You must be at least 18 years of age.\n• You must be a resident of the Kingdom of Saudi Arabia or a qualified non-resident investor as permitted by applicable regulations.\n• You must have a valid Saudi national ID or Iqama, verifiable through Nafath.\n• You must successfully complete the Know Your Customer (KYC) and Anti-Money Laundering (AML) verification process.\n• You must have a valid Saudi bank account in your name.\n• You must not be on any sanctions or restricted persons lists.\n\nHseeltech reserves the right to refuse service to any individual who does not meet these criteria or whose participation may pose a risk to the Platform or other investors.'**
  String get legalTermsS3Body;

  /// legal.terms.s4.title
  ///
  /// In en, this message translates to:
  /// **'4. Investment Risks'**
  String get legalTermsS4Title;

  /// legal.terms.s4.body
  ///
  /// In en, this message translates to:
  /// **'By investing through the Platform, you acknowledge and accept the following risks:\n\n• Real estate investments are subject to market fluctuations and may decrease in value.\n• All returns displayed on the Platform are estimated/expected and are not guaranteed.\n• Past performance is not indicative of future results.\n• Your invested capital is at risk and you may lose part or all of your investment.\n• Real estate investments are inherently illiquid (see Section 7 - Secondary Market).\n• Regulatory changes may affect the Platform\'s operations or your investments.\n• There is no guarantee that Hseeltech will receive a formal license from REGA after the sandbox period.\n\nYou should only invest amounts that you can afford to lose and should consider seeking independent financial advice.'**
  String get legalTermsS4Body;

  /// legal.terms.s5.title
  ///
  /// In en, this message translates to:
  /// **'5. Account & Security'**
  String get legalTermsS5Title;

  /// legal.terms.s5.body
  ///
  /// In en, this message translates to:
  /// **'You are responsible for maintaining the confidentiality of your account credentials, including your PIN and any authentication methods. You must notify us immediately of any unauthorized access to your account.\n\nHseeltech is not liable for any losses resulting from unauthorized access to your account due to your failure to maintain the security of your credentials.'**
  String get legalTermsS5Body;

  /// legal.terms.s6.title
  ///
  /// In en, this message translates to:
  /// **'6. Fees & Charges'**
  String get legalTermsS6Title;

  /// legal.terms.s6.body
  ///
  /// In en, this message translates to:
  /// **'Fees associated with each investment opportunity are disclosed on the opportunity detail page before you confirm your investment. These may include:\n\n• Platform service fees.\n• Property management fees.\n• Transaction processing fees.\n• Exit/disposal fees upon property sale.\n\nAll applicable fees will be clearly displayed before you confirm any transaction. Hseeltech reserves the right to modify its fee structure with prior notice to investors.'**
  String get legalTermsS6Body;

  /// legal.terms.s7.title
  ///
  /// In en, this message translates to:
  /// **'7. Secondary Market'**
  String get legalTermsS7Title;

  /// legal.terms.s7.body
  ///
  /// In en, this message translates to:
  /// **'A secondary market for trading fractional ownership tokens is currently under development and will be available soon. Until the secondary market is launched:\n\n• Investments should be considered illiquid.\n• You may not be able to sell or transfer your tokens immediately.\n• The investment holding period depends on the specific opportunity terms.\n\nWe will notify all investors when the secondary market becomes available.'**
  String get legalTermsS7Body;

  /// legal.terms.s8.title
  ///
  /// In en, this message translates to:
  /// **'8. Distributions & Returns'**
  String get legalTermsS8Title;

  /// legal.terms.s8.body
  ///
  /// In en, this message translates to:
  /// **'Rental income distributions are made according to the schedule specified in each investment opportunity. Distribution amounts depend on actual rental income received, property expenses, and management costs.\n\nAll returns mentioned on the Platform are estimated and subject to change based on actual property performance. Hseeltech does not guarantee any specific return on investment.'**
  String get legalTermsS8Body;

  /// legal.terms.s9.title
  ///
  /// In en, this message translates to:
  /// **'9. Intellectual Property'**
  String get legalTermsS9Title;

  /// legal.terms.s9.body
  ///
  /// In en, this message translates to:
  /// **'All content on the Platform, including but not limited to text, graphics, logos, images, and software, is the property of Hseeltech and is protected by applicable intellectual property laws. You may not reproduce, distribute, or create derivative works from any Platform content without our prior written consent.'**
  String get legalTermsS9Body;

  /// legal.terms.s10.title
  ///
  /// In en, this message translates to:
  /// **'10. Limitation of Liability'**
  String get legalTermsS10Title;

  /// legal.terms.s10.body
  ///
  /// In en, this message translates to:
  /// **'To the maximum extent permitted by law, Hseeltech shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising from your use of the Platform or any investment made through it.\n\nHseeltech\'s total liability to you for any claims arising from these Terms shall not exceed the total fees paid by you to Hseeltech in the 12 months preceding the claim.'**
  String get legalTermsS10Body;

  /// legal.terms.s11.title
  ///
  /// In en, this message translates to:
  /// **'11. Communication & Support'**
  String get legalTermsS11Title;

  /// legal.terms.s11.body
  ///
  /// In en, this message translates to:
  /// **'For questions, complaints, or support requests, you can reach us through:\n\n• In-App Support: Available through the Profile > Support section.\n• Email: support@hseeltech.com\n• Phone: +966 XX XXX XXXX\n• Response Time: We aim to respond to all inquiries within 2 business days.\n\nFor urgent matters related to your investments or account security, please contact us immediately via phone.'**
  String get legalTermsS11Body;

  /// legal.terms.s12.title
  ///
  /// In en, this message translates to:
  /// **'12. Governing Law'**
  String get legalTermsS12Title;

  /// legal.terms.s12.body
  ///
  /// In en, this message translates to:
  /// **'These Terms are governed by and construed in accordance with the laws of the Kingdom of Saudi Arabia. Any disputes arising from these Terms shall be subject to the exclusive jurisdiction of the competent courts in the Kingdom of Saudi Arabia.'**
  String get legalTermsS12Body;

  /// legal.terms.s13.title
  ///
  /// In en, this message translates to:
  /// **'13. Amendments'**
  String get legalTermsS13Title;

  /// legal.terms.s13.body
  ///
  /// In en, this message translates to:
  /// **'Hseeltech reserves the right to amend these Terms at any time. Material changes will be communicated to you via the Platform or email at least 30 days before they take effect. Your continued use of the Platform after such changes constitutes your acceptance of the amended Terms.'**
  String get legalTermsS13Body;

  /// legal.privacy.title
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get legalPrivacyTitle;

  /// legal.privacy.lastUpdated
  ///
  /// In en, this message translates to:
  /// **'Last Updated: February 2026'**
  String get legalPrivacyLastUpdated;

  /// legal.privacy.s1.title
  ///
  /// In en, this message translates to:
  /// **'1. Introduction'**
  String get legalPrivacyS1Title;

  /// legal.privacy.s1.body
  ///
  /// In en, this message translates to:
  /// **'Hseeltech (\"we\", \"us\", \"our\") operates a fractional real estate investment platform in the Kingdom of Saudi Arabia. We are committed to protecting your personal data in accordance with the Saudi Personal Data Protection Law (PDPL) issued by Royal Decree No. (M/19) dated 9/2/1443H, and all applicable regulations including Anti-Money Laundering (AML) and Know Your Customer (KYC) requirements.\n\nThis Privacy Policy explains how we collect, use, store, protect, and dispose of your personal data. By using our platform, you acknowledge that you have read and understood this policy.'**
  String get legalPrivacyS1Body;

  /// legal.privacy.s2.title
  ///
  /// In en, this message translates to:
  /// **'2. Data We Collect'**
  String get legalPrivacyS2Title;

  /// legal.privacy.s2.body
  ///
  /// In en, this message translates to:
  /// **'We collect the following categories of personal data:\n\n• Identity Data: Full legal name, national ID number (via Nafath verification), date of birth, nationality, and address.\n\n• Financial Data: Bank account details, source of funds, investment history, transaction records, and credit-related information.\n\n• Contact Data: Phone number, email address, and communication preferences.\n\n• Technical Data: IP address, device type, operating system, browser type, and app usage analytics.\n\n• Verification Data: Nafath authentication records, KYC documentation, and AML screening results.\n\nWe collect only the minimum data necessary to provide our services (data minimization principle, PDPL Article 11).'**
  String get legalPrivacyS2Body;

  /// legal.privacy.s3.title
  ///
  /// In en, this message translates to:
  /// **'3. Purpose of Data Collection'**
  String get legalPrivacyS3Title;

  /// legal.privacy.s3.body
  ///
  /// In en, this message translates to:
  /// **'Your personal data is collected and processed for the following purposes:\n\n• Account registration and identity verification (KYC compliance).\n• Anti-money laundering screening and ongoing monitoring (AML compliance).\n• Processing investments and managing your portfolio.\n• Executing financial transactions (deposits, withdrawals, distributions).\n• Communicating important account updates and notifications.\n• Improving our platform and user experience.\n• Complying with regulatory requirements and legal obligations.\n\nWe will not process your data for purposes other than those stated above without obtaining your prior consent (PDPL Article 5).'**
  String get legalPrivacyS3Body;

  /// legal.privacy.s4.title
  ///
  /// In en, this message translates to:
  /// **'4. Legal Basis for Processing'**
  String get legalPrivacyS4Title;

  /// legal.privacy.s4.body
  ///
  /// In en, this message translates to:
  /// **'We process your personal data based on the following legal grounds under the PDPL:\n\n• Your explicit consent provided during registration.\n• Contractual necessity to fulfill our investment services agreement.\n• Legal obligations under Saudi financial regulations, AML/KYC requirements, and REGA sandbox conditions.\n• Legitimate interests in maintaining platform security and preventing fraud.'**
  String get legalPrivacyS4Body;

  /// legal.privacy.s5.title
  ///
  /// In en, this message translates to:
  /// **'5. Your Rights'**
  String get legalPrivacyS5Title;

  /// legal.privacy.s5.body
  ///
  /// In en, this message translates to:
  /// **'Under the PDPL (Article 4), you have the following rights:\n\n• Right to Know: You have the right to be informed about the legal basis and purpose of collecting your data.\n\n• Right to Access: You may request a copy of your personal data held by us, free of charge.\n\n• Right to Correction: You may request correction, completion, or updating of your personal data.\n\n• Right to Deletion: You may request destruction of your personal data when it is no longer needed for its original purpose, subject to legal retention requirements.\n\n• Right to Withdraw Consent: You may withdraw your consent at any time. This will not affect the lawfulness of processing carried out before withdrawal.\n\n• Right to Object to Marketing: You may opt out of receiving marketing communications at any time.\n\nTo exercise any of these rights, contact us at privacy@hseeltech.com.'**
  String get legalPrivacyS5Body;

  /// legal.privacy.s6.title
  ///
  /// In en, this message translates to:
  /// **'6. Data Storage & Security'**
  String get legalPrivacyS6Title;

  /// legal.privacy.s6.body
  ///
  /// In en, this message translates to:
  /// **'Your personal data is stored securely within the Kingdom of Saudi Arabia. We implement appropriate organizational, administrative, and technical measures to protect your data (PDPL Article 19), including:\n\n• Encryption of data in transit and at rest.\n• Access controls limiting data access to authorized personnel only.\n• Regular security assessments and vulnerability testing.\n• Secure backup procedures with controlled access.\n\nWe retain your data only for as long as necessary to fulfill the purposes for which it was collected, or as required by applicable laws and regulations. Upon expiry of the retention period, data will be securely destroyed (PDPL Article 18).'**
  String get legalPrivacyS6Body;

  /// legal.privacy.s7.title
  ///
  /// In en, this message translates to:
  /// **'7. Data Sharing & Disclosure'**
  String get legalPrivacyS7Title;

  /// legal.privacy.s7.body
  ///
  /// In en, this message translates to:
  /// **'We do not sell your personal data. We may share your data only in the following circumstances (PDPL Article 15):\n\n• With regulatory authorities (REGA, SAMA, SDAIA) as required by law.\n• With identity verification providers (Nafath) for KYC purposes.\n• With banking partners to process financial transactions.\n• With authorized service providers who process data on our behalf, under strict contractual obligations.\n• When required by court order or legal proceedings.\n\nWe do not transfer your personal data outside the Kingdom of Saudi Arabia unless required by law and with appropriate safeguards in place.'**
  String get legalPrivacyS7Body;

  /// legal.privacy.s8.title
  ///
  /// In en, this message translates to:
  /// **'8. Marketing Communications'**
  String get legalPrivacyS8Title;

  /// legal.privacy.s8.body
  ///
  /// In en, this message translates to:
  /// **'We will only send you marketing or promotional materials with your explicit consent (PDPL Article 25). You may withdraw this consent at any time through:\n\n• The notification settings in your account.\n• Clicking the \"unsubscribe\" link in any marketing email.\n• Contacting us at privacy@hseeltech.com.\n\nEssential service communications (account updates, transaction confirmations, regulatory notices) are not considered marketing and will continue regardless of your marketing preferences.'**
  String get legalPrivacyS8Body;

  /// legal.privacy.s9.title
  ///
  /// In en, this message translates to:
  /// **'9. Data Breach Notification'**
  String get legalPrivacyS9Title;

  /// legal.privacy.s9.body
  ///
  /// In en, this message translates to:
  /// **'In the event of a data breach that may result in serious harm to your personal data or to you personally, we will notify you promptly in accordance with PDPL Article 20. We will also notify the relevant regulatory authority immediately upon becoming aware of any breach.'**
  String get legalPrivacyS9Body;

  /// legal.privacy.s10.title
  ///
  /// In en, this message translates to:
  /// **'10. Children\'s Data'**
  String get legalPrivacyS10Title;

  /// legal.privacy.s10.body
  ///
  /// In en, this message translates to:
  /// **'Our platform is not intended for individuals under the age of 18. We do not knowingly collect personal data from minors. If we become aware that we have collected data from a minor, we will take immediate steps to delete it.'**
  String get legalPrivacyS10Body;

  /// legal.privacy.s11.title
  ///
  /// In en, this message translates to:
  /// **'11. Policy Updates'**
  String get legalPrivacyS11Title;

  /// legal.privacy.s11.body
  ///
  /// In en, this message translates to:
  /// **'We may update this Privacy Policy from time to time to reflect changes in our practices or applicable laws. We will notify you of any material changes through the app or via email. The updated policy will be effective from the date of publication.'**
  String get legalPrivacyS11Body;

  /// legal.privacy.s12.title
  ///
  /// In en, this message translates to:
  /// **'12. Contact Us'**
  String get legalPrivacyS12Title;

  /// legal.privacy.s12.body
  ///
  /// In en, this message translates to:
  /// **'For questions, complaints, or to exercise your data protection rights:\n\n• Email: privacy@hseeltech.com\n• Phone: +966 XX XXX XXXX\n• Address: Riyadh, Kingdom of Saudi Arabia\n\nWe will respond to your request within the timeframe specified by the PDPL and its implementing regulations.'**
  String get legalPrivacyS12Body;

  /// legal.risk.title
  ///
  /// In en, this message translates to:
  /// **'Risk Disclosure'**
  String get legalRiskTitle;

  /// legal.risk.lastUpdated
  ///
  /// In en, this message translates to:
  /// **'Last Updated: February 2026'**
  String get legalRiskLastUpdated;

  /// legal.risk.s1.title
  ///
  /// In en, this message translates to:
  /// **'Market Risk'**
  String get legalRiskS1Title;

  /// legal.risk.s1.icon
  ///
  /// In en, this message translates to:
  /// **'📉'**
  String get legalRiskS1Icon;

  /// legal.risk.s1.body
  ///
  /// In en, this message translates to:
  /// **'Real estate values are subject to fluctuations due to economic conditions, market supply and demand, interest rates, and other factors. The value of your investment may decrease, and you may receive less than your original investment amount upon exit.'**
  String get legalRiskS1Body;

  /// legal.risk.s2.title
  ///
  /// In en, this message translates to:
  /// **'Return Risk'**
  String get legalRiskS2Title;

  /// legal.risk.s2.icon
  ///
  /// In en, this message translates to:
  /// **'📊'**
  String get legalRiskS2Icon;

  /// legal.risk.s2.body
  ///
  /// In en, this message translates to:
  /// **'All returns displayed on the Platform are estimated/expected returns based on projections and historical data. These are NOT guaranteed. Actual returns may be significantly lower than projected, or you may receive no returns at all. Factors affecting returns include:\n\n• Vacancy rates and tenant defaults.\n• Property maintenance and unexpected repair costs.\n• Changes in rental market conditions.\n• Property management performance.\n• Economic downturns affecting property values.'**
  String get legalRiskS2Body;

  /// legal.risk.s3.title
  ///
  /// In en, this message translates to:
  /// **'Liquidity Risk'**
  String get legalRiskS3Title;

  /// legal.risk.s3.icon
  ///
  /// In en, this message translates to:
  /// **'🔒'**
  String get legalRiskS3Icon;

  /// legal.risk.s3.body
  ///
  /// In en, this message translates to:
  /// **'Real estate investments are inherently illiquid. Unlike stocks or bonds, you cannot easily sell your fractional ownership tokens on demand. The secondary market is currently under development (coming soon). Until it is available, you should consider your investment as locked for the duration of the investment term.\n\nYou should only invest funds that you do not need for immediate or short-term expenses.'**
  String get legalRiskS3Body;

  /// legal.risk.s4.title
  ///
  /// In en, this message translates to:
  /// **'Regulatory Risk'**
  String get legalRiskS4Title;

  /// legal.risk.s4.icon
  ///
  /// In en, this message translates to:
  /// **'⚖️'**
  String get legalRiskS4Icon;

  /// legal.risk.s4.body
  ///
  /// In en, this message translates to:
  /// **'Hseeltech currently operates within REGA\'s Regulatory Sandbox. This means:\n\n• The platform is being tested under regulatory supervision.\n• There is no guarantee that Hseeltech will receive a formal license after the sandbox period.\n• Regulatory changes may affect the platform\'s ability to operate or the terms of your investment.\n• New regulations may impose additional costs or restrictions.'**
  String get legalRiskS4Body;

  /// legal.risk.s5.title
  ///
  /// In en, this message translates to:
  /// **'Capital Risk'**
  String get legalRiskS5Title;

  /// legal.risk.s5.icon
  ///
  /// In en, this message translates to:
  /// **'💰'**
  String get legalRiskS5Icon;

  /// legal.risk.s5.body
  ///
  /// In en, this message translates to:
  /// **'Your invested capital is at risk. You may lose part or all of your investment. Real estate investments do not carry deposit protection or government guarantees. Hseeltech does not guarantee the return of your principal investment.'**
  String get legalRiskS5Body;

  /// legal.risk.s6.title
  ///
  /// In en, this message translates to:
  /// **'Concentration Risk'**
  String get legalRiskS6Title;

  /// legal.risk.s6.icon
  ///
  /// In en, this message translates to:
  /// **'🏢'**
  String get legalRiskS6Icon;

  /// legal.risk.s6.body
  ///
  /// In en, this message translates to:
  /// **'Investing a large portion of your portfolio in a single property or asset class increases your exposure to specific risks. We recommend diversifying your investments across multiple opportunities to manage risk.'**
  String get legalRiskS6Body;

  /// legal.risk.s7.title
  ///
  /// In en, this message translates to:
  /// **'Operational Risk'**
  String get legalRiskS7Title;

  /// legal.risk.s7.icon
  ///
  /// In en, this message translates to:
  /// **'⚙️'**
  String get legalRiskS7Icon;

  /// legal.risk.s7.body
  ///
  /// In en, this message translates to:
  /// **'Operational risks include potential issues with property management, tenant relations, regulatory compliance, technology failures, or other operational challenges that may affect the performance of your investment.'**
  String get legalRiskS7Body;

  /// legal.risk.s8.title
  ///
  /// In en, this message translates to:
  /// **'Force Majeure'**
  String get legalRiskS8Title;

  /// legal.risk.s8.icon
  ///
  /// In en, this message translates to:
  /// **'🌍'**
  String get legalRiskS8Icon;

  /// legal.risk.s8.body
  ///
  /// In en, this message translates to:
  /// **'Events beyond our control, such as natural disasters, pandemics, wars, or significant economic disruptions, may adversely affect property values, rental income, and the overall performance of your investment.'**
  String get legalRiskS8Body;

  /// legal.risk.acknowledgment
  ///
  /// In en, this message translates to:
  /// **'By investing through Hseeltech, you acknowledge that you have read, understood, and accepted all the risks described in this disclosure.'**
  String get legalRiskAcknowledgment;

  /// portfolio.prop1.name
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya Towers'**
  String get portfolioProp1Name;

  /// portfolio.prop1.type
  ///
  /// In en, this message translates to:
  /// **'Residential'**
  String get portfolioProp1Type;

  /// portfolio.prop2.name
  ///
  /// In en, this message translates to:
  /// **'King Fahd Business Complex'**
  String get portfolioProp2Name;

  /// portfolio.prop2.type
  ///
  /// In en, this message translates to:
  /// **'Commercial'**
  String get portfolioProp2Type;

  /// portfolio.prop3.name
  ///
  /// In en, this message translates to:
  /// **'Jeddah Waterfront'**
  String get portfolioProp3Name;

  /// portfolio.prop3.type
  ///
  /// In en, this message translates to:
  /// **'Hospitality'**
  String get portfolioProp3Type;

  /// investDetail.ownershipRegBody
  ///
  /// In en, this message translates to:
  /// **'Real Estate Registration'**
  String get investDetailOwnershipRegBody;

  /// investDetail.investmentAgreement
  ///
  /// In en, this message translates to:
  /// **'Investment Agreement'**
  String get investDetailInvestmentAgreement;

  /// investDetail.paymentReceipt
  ///
  /// In en, this message translates to:
  /// **'Payment Receipt'**
  String get investDetailPaymentReceipt;

  /// investDetail.valuationReport
  ///
  /// In en, this message translates to:
  /// **'Valuation Report'**
  String get investDetailValuationReport;

  /// investDetail.riskDisclosure
  ///
  /// In en, this message translates to:
  /// **'Risk Disclosure'**
  String get investDetailRiskDisclosure;

  /// completedReport.currentValue
  ///
  /// In en, this message translates to:
  /// **'Current Value'**
  String get completedReportCurrentValue;

  /// completedReport.totalReturn
  ///
  /// In en, this message translates to:
  /// **'Total Return'**
  String get completedReportTotalReturn;

  /// completedReport.annualYield
  ///
  /// In en, this message translates to:
  /// **'Annual Yield'**
  String get completedReportAnnualYield;

  /// completedReport.totalStakes
  ///
  /// In en, this message translates to:
  /// **'Total Stakes'**
  String get completedReportTotalStakes;

  /// completedReport.tokensUnit
  ///
  /// In en, this message translates to:
  /// **'tokens'**
  String get completedReportTokensUnit;

  /// completedReport.totalInvestors
  ///
  /// In en, this message translates to:
  /// **'Total Investors'**
  String get completedReportTotalInvestors;

  /// completedReport.investorsUnit
  ///
  /// In en, this message translates to:
  /// **'investors'**
  String get completedReportInvestorsUnit;

  /// completedReport.fundingDate
  ///
  /// In en, this message translates to:
  /// **'Funding Date'**
  String get completedReportFundingDate;

  /// completedReport.distributions
  ///
  /// In en, this message translates to:
  /// **'Distributions'**
  String get completedReportDistributions;

  /// completedReport.distributionsCompleted
  ///
  /// In en, this message translates to:
  /// **'completed'**
  String get completedReportDistributionsCompleted;

  /// completedReport.avgInvestment
  ///
  /// In en, this message translates to:
  /// **'Avg Investment'**
  String get completedReportAvgInvestment;

  /// completedReport.largestStake
  ///
  /// In en, this message translates to:
  /// **'Largest Stake'**
  String get completedReportLargestStake;

  /// completedReport.fundingPeriod
  ///
  /// In en, this message translates to:
  /// **'Funding Period'**
  String get completedReportFundingPeriod;

  /// completedReport.daysUnit
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get completedReportDaysUnit;

  /// completedReport.nextDistributionLabel
  ///
  /// In en, this message translates to:
  /// **'Next Distribution'**
  String get completedReportNextDistributionLabel;

  /// completedReport.targetReached
  ///
  /// In en, this message translates to:
  /// **'Target Reached'**
  String get completedReportTargetReached;

  /// completedReport.targetReachedDesc
  ///
  /// In en, this message translates to:
  /// **'100% funding achieved'**
  String get completedReportTargetReachedDesc;

  /// completedReport.ownershipTransferred
  ///
  /// In en, this message translates to:
  /// **'Ownership Transferred'**
  String get completedReportOwnershipTransferred;

  /// completedReport.ownershipTransferredDesc
  ///
  /// In en, this message translates to:
  /// **'Certificates issued to investors'**
  String get completedReportOwnershipTransferredDesc;

  /// completedReport.propertyName
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya Towers'**
  String get completedReportPropertyName;

  /// completedReport.propertyLocation
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya, Riyadh'**
  String get completedReportPropertyLocation;

  /// completedReport.propertyType
  ///
  /// In en, this message translates to:
  /// **'Residential'**
  String get completedReportPropertyType;

  /// notifDetail.investmentConfirmed
  ///
  /// In en, this message translates to:
  /// **'Investment Confirmed'**
  String get notifDetailInvestmentConfirmed;

  /// notifDetail.investmentConfirmedMsg
  ///
  /// In en, this message translates to:
  /// **'Your investment of 10,000 SAR in Al-Olaya Towers has been confirmed. Ownership certificate will be issued within 5-7 business days.'**
  String get notifDetailInvestmentConfirmedMsg;

  /// notifDetail.dividendReceived
  ///
  /// In en, this message translates to:
  /// **'Dividend Payment Received'**
  String get notifDetailDividendReceived;

  /// notifDetail.dividendReceivedMsg
  ///
  /// In en, this message translates to:
  /// **'You received a dividend payment of 837 SAR from Al-Olaya Towers for Q4 2025.'**
  String get notifDetailDividendReceivedMsg;

  /// notifDetail.downloadCertificate
  ///
  /// In en, this message translates to:
  /// **'Download Certificate'**
  String get notifDetailDownloadCertificate;

  /// notifDetail.securityAlert
  ///
  /// In en, this message translates to:
  /// **'New Login Detected'**
  String get notifDetailSecurityAlert;

  /// notifDetail.securityAlertMsg
  ///
  /// In en, this message translates to:
  /// **'A new login was detected from Riyadh, Saudi Arabia. If this wasn\'t you, please secure your account immediately.'**
  String get notifDetailSecurityAlertMsg;

  /// notifDetail.newOpportunityMsg
  ///
  /// In en, this message translates to:
  /// **'A new investment opportunity in KAFD Office Tower is now available. Expected annual return: 10.1%.'**
  String get notifDetailNewOpportunityMsg;

  /// transaction.alOlayaTowers
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya Towers'**
  String get transactionAlOlayaTowers;

  /// transaction.kingFahdComplex
  ///
  /// In en, this message translates to:
  /// **'King Fahd Business Complex'**
  String get transactionKingFahdComplex;

  /// transaction.jeddahWaterfront
  ///
  /// In en, this message translates to:
  /// **'Jeddah Waterfront'**
  String get transactionJeddahWaterfront;

  /// transaction.walletDeposit
  ///
  /// In en, this message translates to:
  /// **'Wallet Deposit'**
  String get transactionWalletDeposit;

  /// transaction.walletWithdrawal
  ///
  /// In en, this message translates to:
  /// **'Wallet Withdrawal'**
  String get transactionWalletWithdrawal;

  /// transaction.q4Dividend
  ///
  /// In en, this message translates to:
  /// **'Q4 Dividend'**
  String get transactionQ4Dividend;

  /// transaction.q3Dividend
  ///
  /// In en, this message translates to:
  /// **'Q3 Dividend'**
  String get transactionQ3Dividend;

  /// transaction.referralReward
  ///
  /// In en, this message translates to:
  /// **'Referral Reward'**
  String get transactionReferralReward;

  /// transaction.allTypes
  ///
  /// In en, this message translates to:
  /// **'All Types'**
  String get transactionAllTypes;

  /// transaction.investments
  ///
  /// In en, this message translates to:
  /// **'Investments'**
  String get transactionInvestments;

  /// transaction.dividends
  ///
  /// In en, this message translates to:
  /// **'Dividends'**
  String get transactionDividends;

  /// transaction.deposits
  ///
  /// In en, this message translates to:
  /// **'Deposits'**
  String get transactionDeposits;

  /// transaction.withdrawals
  ///
  /// In en, this message translates to:
  /// **'Withdrawals'**
  String get transactionWithdrawals;

  /// transaction.thisMonth
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get transactionThisMonth;

  /// transaction.lastMonth
  ///
  /// In en, this message translates to:
  /// **'Last Month'**
  String get transactionLastMonth;

  /// transaction.last3Months
  ///
  /// In en, this message translates to:
  /// **'Last 3 Months'**
  String get transactionLast3Months;

  /// transaction.allTime
  ///
  /// In en, this message translates to:
  /// **'All Time'**
  String get transactionAllTime;

  /// transaction.exportPdf
  ///
  /// In en, this message translates to:
  /// **'Export PDF'**
  String get transactionExportPdf;

  /// transaction.noTransactions
  ///
  /// In en, this message translates to:
  /// **'No transactions found'**
  String get transactionNoTransactions;

  /// transaction.adjustFilters
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your filters'**
  String get transactionAdjustFilters;

  /// darkMode.available
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get darkModeAvailable;

  /// darkMode.completed
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get darkModeCompleted;

  /// darkMode.allTypes
  ///
  /// In en, this message translates to:
  /// **'All Types'**
  String get darkModeAllTypes;

  /// darkMode.commercial
  ///
  /// In en, this message translates to:
  /// **'Commercial'**
  String get darkModeCommercial;

  /// darkMode.alHamraMall
  ///
  /// In en, this message translates to:
  /// **'Al-Hamra Mall'**
  String get darkModeAlHamraMall;

  /// darkMode.alHamraLoc
  ///
  /// In en, this message translates to:
  /// **'Al-Hamra, Riyadh'**
  String get darkModeAlHamraLoc;

  /// darkMode.retail
  ///
  /// In en, this message translates to:
  /// **'Retail'**
  String get darkModeRetail;

  /// darkMode.kafdOfficeTower
  ///
  /// In en, this message translates to:
  /// **'KAFD Office Tower'**
  String get darkModeKafdOfficeTower;

  /// darkMode.kafdLoc
  ///
  /// In en, this message translates to:
  /// **'KAFD, Riyadh'**
  String get darkModeKafdLoc;

  /// darkMode.new
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get darkModeNew;

  /// darkMode.alOlayaLoc
  ///
  /// In en, this message translates to:
  /// **'Al-Olaya, Riyadh'**
  String get darkModeAlOlayaLoc;

  /// darkMode.alNakheelResidences
  ///
  /// In en, this message translates to:
  /// **'Al-Nakheel Residences'**
  String get darkModeAlNakheelResidences;

  /// darkMode.alNakheelLoc
  ///
  /// In en, this message translates to:
  /// **'Al-Nakheel, Riyadh'**
  String get darkModeAlNakheelLoc;

  /// errorStates.networkErrorDesc
  ///
  /// In en, this message translates to:
  /// **'Unable to connect to the server. Please check your internet connection and try again.'**
  String get errorStatesNetworkErrorDesc;

  /// errorStates.serverErrorDesc
  ///
  /// In en, this message translates to:
  /// **'Something went wrong on our end. Our team has been notified and is working on a fix.'**
  String get errorStatesServerErrorDesc;

  /// errorStates.notFoundDesc
  ///
  /// In en, this message translates to:
  /// **'The page you\'re looking for doesn\'t exist or has been moved.'**
  String get errorStatesNotFoundDesc;

  /// errorStates.sessionExpired
  ///
  /// In en, this message translates to:
  /// **'Session Expired'**
  String get errorStatesSessionExpired;

  /// errorStates.sessionExpiredDesc
  ///
  /// In en, this message translates to:
  /// **'Your session has expired for security reasons. Please log in again to continue.'**
  String get errorStatesSessionExpiredDesc;

  /// errorStates.maintenanceMode
  ///
  /// In en, this message translates to:
  /// **'Under Maintenance'**
  String get errorStatesMaintenanceMode;

  /// errorStates.maintenanceModeDesc
  ///
  /// In en, this message translates to:
  /// **'We\'re performing scheduled maintenance to improve your experience. We\'ll be back shortly.'**
  String get errorStatesMaintenanceModeDesc;

  /// errorStates.goHome
  ///
  /// In en, this message translates to:
  /// **'Go Home'**
  String get errorStatesGoHome;

  /// errorStates.loginAgain
  ///
  /// In en, this message translates to:
  /// **'Login Again'**
  String get errorStatesLoginAgain;

  /// rewards.tierStarter
  ///
  /// In en, this message translates to:
  /// **'Starter'**
  String get rewardsTierStarter;

  /// rewards.tierStarterFull
  ///
  /// In en, this message translates to:
  /// **'Starter (Al-Iitlaq)'**
  String get rewardsTierStarterFull;

  /// rewards.tierElite
  ///
  /// In en, this message translates to:
  /// **'Elite'**
  String get rewardsTierElite;

  /// rewards.tierEliteFull
  ///
  /// In en, this message translates to:
  /// **'Elite (Al-Oqail)'**
  String get rewardsTierEliteFull;

  /// rewards.tierVIP
  ///
  /// In en, this message translates to:
  /// **'VIP'**
  String get rewardsTierVIP;

  /// rewards.tierVIPFull
  ///
  /// In en, this message translates to:
  /// **'VIP (Al-Wajeeh)'**
  String get rewardsTierVIPFull;

  /// common.switchToArabic
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get commonSwitchToArabic;

  /// common.switchToEnglish
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get commonSwitchToEnglish;

  /// common.nafath
  ///
  /// In en, this message translates to:
  /// **'Nafath'**
  String get commonNafath;

  /// skeleton.loadingPortfolio
  ///
  /// In en, this message translates to:
  /// **'Loading Portfolio'**
  String get skeletonLoadingPortfolio;

  /// skeleton.loadingOpportunities
  ///
  /// In en, this message translates to:
  /// **'Loading Opportunities'**
  String get skeletonLoadingOpportunities;

  /// skeleton.loadingProfile
  ///
  /// In en, this message translates to:
  /// **'Loading Profile'**
  String get skeletonLoadingProfile;

  /// profile.aboutHseeltech
  ///
  /// In en, this message translates to:
  /// **'About Hseeltech'**
  String get profileAboutHseeltech;

  /// profile.riskNotice
  ///
  /// In en, this message translates to:
  /// **'Investing in real estate involves risks. Past performance does not guarantee future results. Please read all documents carefully before investing.'**
  String get profileRiskNotice;

  /// download.readyToDownload
  ///
  /// In en, this message translates to:
  /// **'Ready to download'**
  String get downloadReadyToDownload;

  /// download.fileFormat
  ///
  /// In en, this message translates to:
  /// **'File Format'**
  String get downloadFileFormat;

  /// download.fileSize
  ///
  /// In en, this message translates to:
  /// **'File Size'**
  String get downloadFileSize;

  /// download.issueDate
  ///
  /// In en, this message translates to:
  /// **'Issue Date'**
  String get downloadIssueDate;

  /// download.done
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get downloadDone;

  /// download.savedToDownloads
  ///
  /// In en, this message translates to:
  /// **'Saved to Downloads folder'**
  String get downloadSavedToDownloads;

  /// download.downloadPdf
  ///
  /// In en, this message translates to:
  /// **'Download PDF'**
  String get downloadDownloadPdf;

  /// common.pending
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get commonPending;

  /// regulatory.disclosure
  ///
  /// In en, this message translates to:
  /// **'This product/service is currently being tested within REGA\'s Regulatory Sandbox and is not formally licensed or endorsed by the Authority.'**
  String get regulatoryDisclosure;

  /// welcome.heroTitle
  ///
  /// In en, this message translates to:
  /// **'Welcome to Hseeltech'**
  String get welcomeHeroTitle;

  /// welcome.heroSubtitle
  ///
  /// In en, this message translates to:
  /// **'Real Estate Investment Made Simple'**
  String get welcomeHeroSubtitle;

  /// welcome.createAccount
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get welcomeCreateAccount;

  /// welcome.nafathNote
  ///
  /// In en, this message translates to:
  /// **'Verify your identity quickly and securely through Nafath, the national single sign-on system.'**
  String get welcomeNafathNote;

  /// welcome.regulatoryNote
  ///
  /// In en, this message translates to:
  /// **'This product is being tested within REGA\'s Regulatory Sandbox and is not formally licensed.'**
  String get welcomeRegulatoryNote;

  /// auth.signInViaNafath
  ///
  /// In en, this message translates to:
  /// **'Sign in via Nafath'**
  String get authSignInViaNafath;

  /// auth.sendVerification
  ///
  /// In en, this message translates to:
  /// **'Send Verification'**
  String get authSendVerification;

  /// auth.nationalSSO
  ///
  /// In en, this message translates to:
  /// **'National Single Sign-On'**
  String get authNationalSSO;

  /// auth.waitingDesc
  ///
  /// In en, this message translates to:
  /// **'Waiting for verification from Nafath app...'**
  String get authWaitingDesc;

  /// auth.expiredDesc
  ///
  /// In en, this message translates to:
  /// **'Verification request has expired. Please try again.'**
  String get authExpiredDesc;

  /// auth.resendRequest
  ///
  /// In en, this message translates to:
  /// **'Resend Request'**
  String get authResendRequest;

  /// auth.timeRemaining
  ///
  /// In en, this message translates to:
  /// **'Time remaining'**
  String get authTimeRemaining;

  /// auth.nafathInstructions
  ///
  /// In en, this message translates to:
  /// **'Open the Nafath app and approve the verification request.'**
  String get authNafathInstructions;

  /// common.notApplicable
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get commonNotApplicable;

  /// common.off
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get commonOff;

  /// common.on
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get commonOn;

  /// common.times
  ///
  /// In en, this message translates to:
  /// **'times'**
  String get commonTimes;

  /// about.altLogo
  ///
  /// In en, this message translates to:
  /// **'Hseeltech Logo'**
  String get aboutAltLogo;

  /// about.copyright
  ///
  /// In en, this message translates to:
  /// **'© 2024 Hseeltech. All rights reserved.'**
  String get aboutCopyright;

  /// explore.search
  ///
  /// In en, this message translates to:
  /// **'Search properties...'**
  String get exploreSearch;

  /// explore.saved
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get exploreSaved;

  /// explore.property.alMalqaResidences
  ///
  /// In en, this message translates to:
  /// **'Al Malqa Residences'**
  String get explorePropertyAlMalqaResidences;

  /// explore.property.alOlayaHeights
  ///
  /// In en, this message translates to:
  /// **'Al Olaya Heights'**
  String get explorePropertyAlOlayaHeights;

  /// explore.property.riyadhGate
  ///
  /// In en, this message translates to:
  /// **'Riyadh Gate'**
  String get explorePropertyRiyadhGate;

  /// invest.creditDebitCard
  ///
  /// In en, this message translates to:
  /// **'Credit/Debit Card'**
  String get investCreditDebitCard;

  /// invest.topUpRequired
  ///
  /// In en, this message translates to:
  /// **'Top-up required to complete investment'**
  String get investTopUpRequired;

  /// investDetail.processingDesc
  ///
  /// In en, this message translates to:
  /// **'Your payment has been received. Ownership certificate is being processed.'**
  String get investDetailProcessingDesc;

  /// investDetail.confirmedDesc
  ///
  /// In en, this message translates to:
  /// **'Ownership certificate issued. You are now a registered co-owner.'**
  String get investDetailConfirmedDesc;

  /// investmentDetail.performanceChart
  ///
  /// In en, this message translates to:
  /// **'Performance Chart'**
  String get investmentDetailPerformanceChart;

  /// investmentDetail.chartPlaceholder
  ///
  /// In en, this message translates to:
  /// **'Chart will display historical performance data'**
  String get investmentDetailChartPlaceholder;

  /// investmentDetail.returnBreakdown
  ///
  /// In en, this message translates to:
  /// **'Return Breakdown'**
  String get investmentDetailReturnBreakdown;

  /// investmentDetail.rentalIncome
  ///
  /// In en, this message translates to:
  /// **'Rental Income'**
  String get investmentDetailRentalIncome;

  /// investmentDetail.capitalGains
  ///
  /// In en, this message translates to:
  /// **'Capital Gains'**
  String get investmentDetailCapitalGains;

  /// investmentDetail.totalDistributions
  ///
  /// In en, this message translates to:
  /// **'Total Distributions'**
  String get investmentDetailTotalDistributions;

  /// investmentDetail.nextDistributionDate
  ///
  /// In en, this message translates to:
  /// **'Next Distribution Date'**
  String get investmentDetailNextDistributionDate;

  /// investmentDetail.certificatePending
  ///
  /// In en, this message translates to:
  /// **'Certificate Pending'**
  String get investmentDetailCertificatePending;

  /// investmentDetail.certificatePendingDesc
  ///
  /// In en, this message translates to:
  /// **'Your ownership certificate is being processed by the Real Estate Registration authority.'**
  String get investmentDetailCertificatePendingDesc;

  /// investmentDetail.spvAgreement
  ///
  /// In en, this message translates to:
  /// **'SPV Agreement'**
  String get investmentDetailSpvAgreement;

  /// investmentDetail.financialStatement
  ///
  /// In en, this message translates to:
  /// **'Financial Statement'**
  String get investmentDetailFinancialStatement;

  /// investmentDetail.auditReport
  ///
  /// In en, this message translates to:
  /// **'Audit Report'**
  String get investmentDetailAuditReport;

  /// completedReport.alNakheelRiyadh
  ///
  /// In en, this message translates to:
  /// **'Al Nakheel Residences, Riyadh'**
  String get completedReportAlNakheelRiyadh;

  /// completedReport.residentialComplex
  ///
  /// In en, this message translates to:
  /// **'Residential Complex'**
  String get completedReportResidentialComplex;

  /// completedReport.location
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get completedReportLocation;

  /// completedReport.activeSince
  ///
  /// In en, this message translates to:
  /// **'Active Since'**
  String get completedReportActiveSince;

  /// completedReport.activeSinceValue
  ///
  /// In en, this message translates to:
  /// **'March 2024'**
  String get completedReportActiveSinceValue;

  /// completedReport.totalInvestorsValue
  ///
  /// In en, this message translates to:
  /// **'847'**
  String get completedReportTotalInvestorsValue;

  /// completedReport.totalStakesValue
  ///
  /// In en, this message translates to:
  /// **'12,450'**
  String get completedReportTotalStakesValue;

  /// completedReport.smallestStake
  ///
  /// In en, this message translates to:
  /// **'Smallest Stake'**
  String get completedReportSmallestStake;

  /// completedReport.fundingPeriodValue
  ///
  /// In en, this message translates to:
  /// **'14 days'**
  String get completedReportFundingPeriodValue;

  /// completedReport.distributionsValue
  ///
  /// In en, this message translates to:
  /// **'SAR 2.8M'**
  String get completedReportDistributionsValue;

  /// completedReport.distributionsPaidValue
  ///
  /// In en, this message translates to:
  /// **'4 quarterly'**
  String get completedReportDistributionsPaidValue;

  /// completedReport.q3_2024
  ///
  /// In en, this message translates to:
  /// **'Q3 2024'**
  String get completedReportQ3_2024;

  /// completedReport.q4_2024
  ///
  /// In en, this message translates to:
  /// **'Q4 2024'**
  String get completedReportQ4_2024;

  /// completedReport.q1_2025
  ///
  /// In en, this message translates to:
  /// **'Q1 2025'**
  String get completedReportQ1_2025;

  /// completedReport.q2_2025
  ///
  /// In en, this message translates to:
  /// **'Q2 2025'**
  String get completedReportQ2_2025;

  /// completedReport.propertyImageAlt
  ///
  /// In en, this message translates to:
  /// **'Property Image'**
  String get completedReportPropertyImageAlt;

  /// completedReport.allDocsZip
  ///
  /// In en, this message translates to:
  /// **'All Documents (ZIP)'**
  String get completedReportAllDocsZip;

  /// completedReport.downloadZip
  ///
  /// In en, this message translates to:
  /// **'Download ZIP'**
  String get completedReportDownloadZip;

  /// completedReport.downloadAllDocumentsDesc
  ///
  /// In en, this message translates to:
  /// **'Download all documents as a single ZIP file'**
  String get completedReportDownloadAllDocumentsDesc;

  /// completedReport.docName1
  ///
  /// In en, this message translates to:
  /// **'Ownership Certificate'**
  String get completedReportDocName1;

  /// completedReport.docName2
  ///
  /// In en, this message translates to:
  /// **'SPV Agreement'**
  String get completedReportDocName2;

  /// completedReport.docName3
  ///
  /// In en, this message translates to:
  /// **'Financial Audit Report'**
  String get completedReportDocName3;

  /// completedReport.docName4
  ///
  /// In en, this message translates to:
  /// **'Property Valuation'**
  String get completedReportDocName4;

  /// completedReport.docName5
  ///
  /// In en, this message translates to:
  /// **'Rental Income Statement'**
  String get completedReportDocName5;

  /// completedReport.docName6
  ///
  /// In en, this message translates to:
  /// **'Tax Certificate'**
  String get completedReportDocName6;

  /// completedReport.timelineEvent1
  ///
  /// In en, this message translates to:
  /// **'Property Listed'**
  String get completedReportTimelineEvent1;

  /// completedReport.timelineEvent2
  ///
  /// In en, this message translates to:
  /// **'Funding Started'**
  String get completedReportTimelineEvent2;

  /// completedReport.timelineEvent3
  ///
  /// In en, this message translates to:
  /// **'Funding Completed'**
  String get completedReportTimelineEvent3;

  /// completedReport.timelineEvent4
  ///
  /// In en, this message translates to:
  /// **'SPV Established'**
  String get completedReportTimelineEvent4;

  /// completedReport.timelineEvent5
  ///
  /// In en, this message translates to:
  /// **'Ownership Transferred'**
  String get completedReportTimelineEvent5;

  /// completedReport.timelineEvent6
  ///
  /// In en, this message translates to:
  /// **'First Distribution'**
  String get completedReportTimelineEvent6;

  /// completedReport.timelineEvent7
  ///
  /// In en, this message translates to:
  /// **'Q4 Distribution'**
  String get completedReportTimelineEvent7;

  /// completedReport.timelineEvent8
  ///
  /// In en, this message translates to:
  /// **'Q1 2025 Distribution'**
  String get completedReportTimelineEvent8;

  /// completedReport.timelineDesc1
  ///
  /// In en, this message translates to:
  /// **'Al Nakheel Residences listed on Hseeltech platform'**
  String get completedReportTimelineDesc1;

  /// completedReport.timelineDesc2
  ///
  /// In en, this message translates to:
  /// **'Crowdfunding campaign opened to investors'**
  String get completedReportTimelineDesc2;

  /// completedReport.timelineDesc3
  ///
  /// In en, this message translates to:
  /// **'SAR 12.45M raised from 847 investors in 14 days'**
  String get completedReportTimelineDesc3;

  /// completedReport.timelineDesc4
  ///
  /// In en, this message translates to:
  /// **'Special Purpose Vehicle registered with REGA'**
  String get completedReportTimelineDesc4;

  /// completedReport.timelineDesc5
  ///
  /// In en, this message translates to:
  /// **'Property ownership transferred to SPV'**
  String get completedReportTimelineDesc5;

  /// completedReport.timelineDesc6
  ///
  /// In en, this message translates to:
  /// **'SAR 680K distributed to all investors'**
  String get completedReportTimelineDesc6;

  /// completedReport.timelineDesc7
  ///
  /// In en, this message translates to:
  /// **'SAR 720K distributed to all investors'**
  String get completedReportTimelineDesc7;

  /// completedReport.timelineDesc8
  ///
  /// In en, this message translates to:
  /// **'SAR 700K distributed to all investors'**
  String get completedReportTimelineDesc8;

  /// darkMode.alHamraRiyadh
  ///
  /// In en, this message translates to:
  /// **'Al Hamra Tower, Riyadh'**
  String get darkModeAlHamraRiyadh;

  /// darkMode.alNakheelRiyadh
  ///
  /// In en, this message translates to:
  /// **'Al Nakheel Mall, Riyadh'**
  String get darkModeAlNakheelRiyadh;

  /// darkMode.detailTab
  ///
  /// In en, this message translates to:
  /// **'Detail'**
  String get darkModeDetailTab;

  /// darkMode.developerNoteContent
  ///
  /// In en, this message translates to:
  /// **'Implement dark mode using Flutter ThemeData with dark color scheme. Use MediaQuery.platformBrightnessOf(context) for system detection.'**
  String get darkModeDeveloperNoteContent;

  /// darkMode.distribution
  ///
  /// In en, this message translates to:
  /// **'Distribution'**
  String get darkModeDistribution;

  /// darkMode.investNow
  ///
  /// In en, this message translates to:
  /// **'Invest Now'**
  String get darkModeInvestNow;

  /// darkMode.more
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get darkModeMore;

  /// darkMode.quarterly
  ///
  /// In en, this message translates to:
  /// **'Quarterly'**
  String get darkModeQuarterly;

  /// empty.noResultsDesc
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search or filters'**
  String get emptyNoResultsDesc;

  /// errorStates.subtitle
  ///
  /// In en, this message translates to:
  /// **'Error Handling Patterns'**
  String get errorStatesSubtitle;

  /// errorStates.network
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get errorStatesNetwork;

  /// errorStates.server
  ///
  /// In en, this message translates to:
  /// **'Server'**
  String get errorStatesServer;

  /// errorStates.timeout
  ///
  /// In en, this message translates to:
  /// **'Timeout'**
  String get errorStatesTimeout;

  /// errorStates.session
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get errorStatesSession;

  /// errorStates.networkTitle
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get errorStatesNetworkTitle;

  /// errorStates.checkConnection
  ///
  /// In en, this message translates to:
  /// **'Check your connection and try again'**
  String get errorStatesCheckConnection;

  /// errorStates.serverTitle
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get errorStatesServerTitle;

  /// errorStates.checkStatus
  ///
  /// In en, this message translates to:
  /// **'Check server status'**
  String get errorStatesCheckStatus;

  /// errorStates.timeoutTitle
  ///
  /// In en, this message translates to:
  /// **'Request Timed Out'**
  String get errorStatesTimeoutTitle;

  /// errorStates.sessionTitle
  ///
  /// In en, this message translates to:
  /// **'Session Expired'**
  String get errorStatesSessionTitle;

  /// errorStates.sessionMessage
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please sign in again.'**
  String get errorStatesSessionMessage;

  /// errorStates.signInAgain
  ///
  /// In en, this message translates to:
  /// **'Sign In Again'**
  String get errorStatesSignInAgain;

  /// errorStates.maintenanceTitle
  ///
  /// In en, this message translates to:
  /// **'Under Maintenance'**
  String get errorStatesMaintenanceTitle;

  /// errorStates.notFoundTitle
  ///
  /// In en, this message translates to:
  /// **'Page Not Found'**
  String get errorStatesNotFoundTitle;

  /// errorStates.openSettings
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get errorStatesOpenSettings;

  /// errorStates.reportIssue
  ///
  /// In en, this message translates to:
  /// **'Report Issue'**
  String get errorStatesReportIssue;

  /// errorStates.needHelp
  ///
  /// In en, this message translates to:
  /// **'Need Help?'**
  String get errorStatesNeedHelp;

  /// errorStates.flutterNote
  ///
  /// In en, this message translates to:
  /// **'Use a centralized error handler with custom error widgets for each error type.'**
  String get errorStatesFlutterNote;

  /// notifDetail.all
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get notifDetailAll;

  /// notifDetail.unread
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get notifDetailUnread;

  /// notifDetail.yesterday
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get notifDetailYesterday;

  /// notifDetail.markAllRead
  ///
  /// In en, this message translates to:
  /// **'Mark All Read'**
  String get notifDetailMarkAllRead;

  /// notifDetail.markUnread
  ///
  /// In en, this message translates to:
  /// **'Mark Unread'**
  String get notifDetailMarkUnread;

  /// notifDetail.trackStatus
  ///
  /// In en, this message translates to:
  /// **'Track Status'**
  String get notifDetailTrackStatus;

  /// notifDetail.developerNote
  ///
  /// In en, this message translates to:
  /// **'Use Firebase Cloud Messaging (FCM) for push notifications in Flutter.'**
  String get notifDetailDeveloperNote;

  /// notifDetail.investConfirmedTitle
  ///
  /// In en, this message translates to:
  /// **'Investment Confirmed'**
  String get notifDetailInvestConfirmedTitle;

  /// notifDetail.investProcessingTitle
  ///
  /// In en, this message translates to:
  /// **'Investment Processing'**
  String get notifDetailInvestProcessingTitle;

  /// notifDetail.dividendReceivedTitle
  ///
  /// In en, this message translates to:
  /// **'Dividend Received'**
  String get notifDetailDividendReceivedTitle;

  /// notifDetail.documentReadyTitle
  ///
  /// In en, this message translates to:
  /// **'Document Ready'**
  String get notifDetailDocumentReadyTitle;

  /// notifDetail.newLoginTitle
  ///
  /// In en, this message translates to:
  /// **'New Login Detected'**
  String get notifDetailNewLoginTitle;

  /// profile.uploadedOn
  ///
  /// In en, this message translates to:
  /// **'Uploaded on'**
  String get profileUploadedOn;

  /// profile.verifiedOn
  ///
  /// In en, this message translates to:
  /// **'Verified on'**
  String get profileVerifiedOn;

  /// rewards.policy.lastUpdated
  ///
  /// In en, this message translates to:
  /// **'Last updated: January 2025'**
  String get rewardsPolicyLastUpdated;

  /// rewards.policy.referralMessage
  ///
  /// In en, this message translates to:
  /// **'Share your referral code with friends and earn rewards!'**
  String get rewardsPolicyReferralMessage;

  /// rewards.policy.section1.title
  ///
  /// In en, this message translates to:
  /// **'How Referrals Work'**
  String get rewardsPolicySection1Title;

  /// rewards.policy.section1.content
  ///
  /// In en, this message translates to:
  /// **'Share your unique referral code. When a friend signs up and makes their first investment, both of you earn bonus points.'**
  String get rewardsPolicySection1Content;

  /// rewards.policy.section2.title
  ///
  /// In en, this message translates to:
  /// **'Earning Points'**
  String get rewardsPolicySection2Title;

  /// rewards.policy.section2.content
  ///
  /// In en, this message translates to:
  /// **'Earn points through investments, referrals, and completing profile milestones. Points can be redeemed for investment credits.'**
  String get rewardsPolicySection2Content;

  /// rewards.policy.section3.title
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get rewardsPolicySection3Title;

  /// rewards.policy.section3.content
  ///
  /// In en, this message translates to:
  /// **'Points expire after 12 months of inactivity. Hseeltech reserves the right to modify the rewards program at any time.'**
  String get rewardsPolicySection3Content;

  /// skeleton.developerNoteTitle
  ///
  /// In en, this message translates to:
  /// **'Developer Note'**
  String get skeletonDeveloperNoteTitle;

  /// skeleton.developerNoteContent
  ///
  /// In en, this message translates to:
  /// **'Use shimmer effect with linear gradient animation for loading states in Flutter.'**
  String get skeletonDeveloperNoteContent;

  /// transaction.madaPayment
  ///
  /// In en, this message translates to:
  /// **'mada Payment'**
  String get transactionMadaPayment;

  /// transaction.referral
  ///
  /// In en, this message translates to:
  /// **'Referral Bonus'**
  String get transactionReferral;

  /// transaction.vibanTransfer
  ///
  /// In en, this message translates to:
  /// **'VIBAN Transfer'**
  String get transactionVibanTransfer;

  /// transactionHistory.detailTitle
  ///
  /// In en, this message translates to:
  /// **'Transaction Details'**
  String get transactionHistoryDetailTitle;

  /// transactionHistory.date
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get transactionHistoryDate;

  /// transactionHistory.type
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get transactionHistoryType;

  /// transactionHistory.reference
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get transactionHistoryReference;

  /// transactionHistory.tryAdjustingFilters
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your filters'**
  String get transactionHistoryTryAdjustingFilters;

  /// rewards.tier.launch.fullName
  ///
  /// In en, this message translates to:
  /// **'Launch (Al-Iitlaq)'**
  String get rewardsTierLaunchFullName;

  /// rewards.tier.launch.name
  ///
  /// In en, this message translates to:
  /// **'Launch'**
  String get rewardsTierLaunchName;

  /// rewards.tier.pioneer.fullName
  ///
  /// In en, this message translates to:
  /// **'Pioneer (Al-Raed)'**
  String get rewardsTierPioneerFullName;

  /// rewards.tier.pioneer.name
  ///
  /// In en, this message translates to:
  /// **'Pioneer'**
  String get rewardsTierPioneerName;

  /// rewards.tier.broker.fullName
  ///
  /// In en, this message translates to:
  /// **'Broker (Al-Simsar)'**
  String get rewardsTierBrokerFullName;

  /// rewards.tier.broker.name
  ///
  /// In en, this message translates to:
  /// **'Broker'**
  String get rewardsTierBrokerName;

  /// rewards.tier.aqili.fullName
  ///
  /// In en, this message translates to:
  /// **'Aqili (Al-Oqail)'**
  String get rewardsTierAqiliFullName;

  /// rewards.tier.aqili.name
  ///
  /// In en, this message translates to:
  /// **'Aqili'**
  String get rewardsTierAqiliName;

  /// rewards.tier.distinguished.fullName
  ///
  /// In en, this message translates to:
  /// **'Distinguished (Al-Wajeeh)'**
  String get rewardsTierDistinguishedFullName;

  /// rewards.tier.distinguished.name
  ///
  /// In en, this message translates to:
  /// **'Distinguished'**
  String get rewardsTierDistinguishedName;

  /// portfolio.prop1.location
  ///
  /// In en, this message translates to:
  /// **'Al Olaya, Riyadh'**
  String get portfolioProp1Location;

  /// portfolio.prop2.location
  ///
  /// In en, this message translates to:
  /// **'Al Malqa, Riyadh'**
  String get portfolioProp2Location;

  /// transaction.joinedViaLink
  ///
  /// In en, this message translates to:
  /// **'{name} joined via your link'**
  String transactionJoinedViaLink(Object name);

  /// transaction.tokensPurchased
  ///
  /// In en, this message translates to:
  /// **'{count} tokens purchased'**
  String transactionTokensPurchased(Object count);

  /// transaction.toVerifiedIBAN
  ///
  /// In en, this message translates to:
  /// **'To verified IBAN ****{last4}'**
  String transactionToVerifiedIBAN(Object last4);

  /// deposit.screenTitle
  ///
  /// In en, this message translates to:
  /// **'Deposit Funds'**
  String get depositScreenTitle;

  /// deposit.currentBalance
  ///
  /// In en, this message translates to:
  /// **'Current Balance'**
  String get depositCurrentBalance;

  /// deposit.payWithMada
  ///
  /// In en, this message translates to:
  /// **'Pay with mada'**
  String get depositPayWithMada;

  /// deposit.bankTransferNote
  ///
  /// In en, this message translates to:
  /// **'Deposit may take from a few minutes to 24 hours. Make sure the transfer is from a bank account under your personal name.'**
  String get depositBankTransferNote;

  /// deposit.bankTransferTime
  ///
  /// In en, this message translates to:
  /// **'Bank transfers typically arrive within a few minutes to 24 hours'**
  String get depositBankTransferTime;

  /// deposit.enterAmount
  ///
  /// In en, this message translates to:
  /// **'Enter Amount'**
  String get depositEnterAmount;

  /// deposit.payWithMadaBtn
  ///
  /// In en, this message translates to:
  /// **'Pay with mada'**
  String get depositPayWithMadaBtn;

  /// deposit.instantNote
  ///
  /// In en, this message translates to:
  /// **'Instant deposit — funds credited immediately'**
  String get depositInstantNote;

  /// withdraw.screenTitle
  ///
  /// In en, this message translates to:
  /// **'Withdraw Funds'**
  String get withdrawScreenTitle;

  /// withdraw.availableToWithdraw
  ///
  /// In en, this message translates to:
  /// **'Available to Withdraw'**
  String get withdrawAvailableToWithdraw;

  /// withdraw.withdrawalAmount
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Amount'**
  String get withdrawWithdrawalAmount;

  /// withdraw.amountExceeds
  ///
  /// In en, this message translates to:
  /// **'Amount exceeds available balance'**
  String get withdrawAmountExceeds;

  /// withdraw.withdrawAll
  ///
  /// In en, this message translates to:
  /// **'Withdraw All'**
  String get withdrawWithdrawAll;

  /// withdraw.withdrawTo
  ///
  /// In en, this message translates to:
  /// **'Withdraw To'**
  String get withdrawWithdrawTo;

  /// withdraw.processingNote
  ///
  /// In en, this message translates to:
  /// **'Withdrawals are processed within 1-3 business days'**
  String get withdrawProcessingNote;

  /// withdraw.noFees
  ///
  /// In en, this message translates to:
  /// **'No withdrawal fees applied'**
  String get withdrawNoFees;

  /// withdraw.onlyVerifiedIban
  ///
  /// In en, this message translates to:
  /// **'Withdrawals are only sent to your pre-verified personal IBAN'**
  String get withdrawOnlyVerifiedIban;

  /// wallet.enterAmount
  ///
  /// In en, this message translates to:
  /// **'Enter Amount'**
  String get walletEnterAmount;

  /// splash.platform
  ///
  /// In en, this message translates to:
  /// **'Real Estate Investment Platform'**
  String get splashPlatform;

  /// common.encryptedPayment
  ///
  /// In en, this message translates to:
  /// **'256-bit encrypted payment processing'**
  String get commonEncryptedPayment;

  /// notif.dividendDetail
  ///
  /// In en, this message translates to:
  /// **'Your Q4 2025 rental dividend of 312.50 SAR for Al Olaya Towers has been credited to your wallet. This distribution represents a 7.5% annualized yield on your investment. The next distribution is scheduled for March 2026.'**
  String get notifDividendDetail;

  /// notif.depositDetail
  ///
  /// In en, this message translates to:
  /// **'Your deposit of SAR 25,000 has been successfully credited to your Hseeltech wallet via bank transfer. Your new wallet balance is SAR 45,250. You can now use these funds to invest in available opportunities.'**
  String get notifDepositDetail;

  /// notif.tierUpgradeDetail
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You\'ve been upgraded to Pioneer tier based on your investment activity. As a Pioneer member, you now enjoy: reduced platform fees, priority access to new opportunities, and enhanced referral bonuses of SAR 250 per referral.'**
  String get notifTierUpgradeDetail;

  /// notif.newOpportunityDetail
  ///
  /// In en, this message translates to:
  /// **'Al Yasmin Tower in Riyadh is now open for investment. This premium commercial property offers an expected annual return of 9.8% with quarterly distributions. Starting from SAR 500 per token. Limited availability — 65% already funded.'**
  String get notifNewOpportunityDetail;

  /// notif.kycCompleteDetail
  ///
  /// In en, this message translates to:
  /// **'Your identity verification has been approved through Nafath. You can now invest in opportunities and withdraw funds. Your verification is valid for 12 months. Please keep your documents up to date.'**
  String get notifKycCompleteDetail;

  /// notif.withdrawalDetail
  ///
  /// In en, this message translates to:
  /// **'Your withdrawal of SAR 10,000 has been processed and sent to your verified bank account (IBAN ****7890). The transfer will arrive within 1-2 business days. Reference: WD-2026-0214.'**
  String get notifWithdrawalDetail;

  /// notif.referralDetail
  ///
  /// In en, this message translates to:
  /// **'You earned SAR 250 referral bonus! Ahmed has completed their first investment of SAR 5,000 in Al-Olaya Towers. Your bonus has been credited to your wallet. Keep referring friends to earn more rewards.'**
  String get notifReferralDetail;

  /// notif.valuationDetail
  ///
  /// In en, this message translates to:
  /// **'Al-Malqa Residences property valuation has increased by 4.2% based on the latest independent market assessment conducted in January 2026. Your token value has been updated accordingly in your portfolio.'**
  String get notifValuationDetail;

  /// notif.documentDetail
  ///
  /// In en, this message translates to:
  /// **'Your National ID verification document has been uploaded and is pending review by our compliance team. Expected review time: 1-2 business days. You will be notified once the review is complete.'**
  String get notifDocumentDetail;

  /// notif.securityDetail
  ///
  /// In en, this message translates to:
  /// **'A new login was detected from Riyadh, Saudi Arabia on February 14, 2026 at 10:30 AM. Device: iPhone 15 Pro. If this wasn\'t you, please change your PIN immediately and contact support.'**
  String get notifSecurityDetail;

  /// notif.viewInvestment
  ///
  /// In en, this message translates to:
  /// **'View Investment'**
  String get notifViewInvestment;

  /// notif.viewWallet
  ///
  /// In en, this message translates to:
  /// **'View Wallet'**
  String get notifViewWallet;

  /// notif.viewRewards
  ///
  /// In en, this message translates to:
  /// **'View Rewards'**
  String get notifViewRewards;

  /// notif.viewOpportunity
  ///
  /// In en, this message translates to:
  /// **'View Opportunity'**
  String get notifViewOpportunity;

  /// notif.viewProfile
  ///
  /// In en, this message translates to:
  /// **'View Profile'**
  String get notifViewProfile;

  /// notif.viewTransactions
  ///
  /// In en, this message translates to:
  /// **'View Transactions'**
  String get notifViewTransactions;

  /// notif.reviewSecurity
  ///
  /// In en, this message translates to:
  /// **'Review Security Settings'**
  String get notifReviewSecurity;

  /// notif.deleted
  ///
  /// In en, this message translates to:
  /// **'Notification deleted'**
  String get notifDeleted;

  /// notif.deleteNotif
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get notifDeleteNotif;

  /// notif.markedUnread
  ///
  /// In en, this message translates to:
  /// **'Marked as unread'**
  String get notifMarkedUnread;

  /// notif.markUnread
  ///
  /// In en, this message translates to:
  /// **'Mark Unread'**
  String get notifMarkUnread;

  /// savedProjects.title
  ///
  /// In en, this message translates to:
  /// **'Saved Projects'**
  String get savedProjectsTitle;

  /// savedProjects.bed
  ///
  /// In en, this message translates to:
  /// **'BED'**
  String get savedProjectsBed;

  /// savedProjects.bath
  ///
  /// In en, this message translates to:
  /// **'Bath'**
  String get savedProjectsBath;

  /// savedProjects.raised
  ///
  /// In en, this message translates to:
  /// **'Raised'**
  String get savedProjectsRaised;

  /// savedProjects.propertyPrice
  ///
  /// In en, this message translates to:
  /// **'Property Price'**
  String get savedProjectsPropertyPrice;

  /// savedProjects.emptyTitle
  ///
  /// In en, this message translates to:
  /// **'No Saved Projects'**
  String get savedProjectsEmptyTitle;

  /// savedProjects.emptyDesc
  ///
  /// In en, this message translates to:
  /// **'Tap the bookmark icon on any opportunity to save it here for quick access.'**
  String get savedProjectsEmptyDesc;

  /// savedProjects.removeConfirm
  ///
  /// In en, this message translates to:
  /// **'Remove from saved?'**
  String get savedProjectsRemoveConfirm;

  /// savedProjects.removed
  ///
  /// In en, this message translates to:
  /// **'Removed from saved'**
  String get savedProjectsRemoved;

  /// deleteAccount.stepConfirm
  ///
  /// In en, this message translates to:
  /// **'Confirm Deletion'**
  String get deleteAccountStepConfirm;

  /// deleteAccount.stepPin
  ///
  /// In en, this message translates to:
  /// **'Verify PIN'**
  String get deleteAccountStepPin;

  /// deleteAccount.stepSuccess
  ///
  /// In en, this message translates to:
  /// **'Account Deleted'**
  String get deleteAccountStepSuccess;

  /// deleteAccount.confirmTitle
  ///
  /// In en, this message translates to:
  /// **'Delete Your Account?'**
  String get deleteAccountConfirmTitle;

  /// deleteAccount.confirmSubtitle
  ///
  /// In en, this message translates to:
  /// **'This action is permanent and cannot be undone. Please review the consequences below.'**
  String get deleteAccountConfirmSubtitle;

  /// deleteAccount.warningInvestments
  ///
  /// In en, this message translates to:
  /// **'All active investments and portfolio data will be permanently removed.'**
  String get deleteAccountWarningInvestments;

  /// deleteAccount.warningWallet
  ///
  /// In en, this message translates to:
  /// **'Your wallet balance will be forfeited. Please withdraw funds before proceeding.'**
  String get deleteAccountWarningWallet;

  /// deleteAccount.warningData
  ///
  /// In en, this message translates to:
  /// **'All personal data, documents, and KYC information will be deleted.'**
  String get deleteAccountWarningData;

  /// deleteAccount.warningIrreversible
  ///
  /// In en, this message translates to:
  /// **'This action is irreversible. You will not be able to recover your account.'**
  String get deleteAccountWarningIrreversible;

  /// deleteAccount.agreeText
  ///
  /// In en, this message translates to:
  /// **'I understand that deleting my account is permanent and all my data, investments, and wallet balance will be lost.'**
  String get deleteAccountAgreeText;

  /// deleteAccount.continueDelete
  ///
  /// In en, this message translates to:
  /// **'Continue to Delete'**
  String get deleteAccountContinueDelete;

  /// deleteAccount.cancel
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get deleteAccountCancel;

  /// deleteAccount.pinTitle
  ///
  /// In en, this message translates to:
  /// **'Enter Your PIN'**
  String get deleteAccountPinTitle;

  /// deleteAccount.pinSubtitle
  ///
  /// In en, this message translates to:
  /// **'Enter your 4-digit PIN to confirm account deletion'**
  String get deleteAccountPinSubtitle;

  /// deleteAccount.pinError
  ///
  /// In en, this message translates to:
  /// **'Incorrect PIN. Please try again.'**
  String get deleteAccountPinError;

  /// deleteAccount.goBack
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get deleteAccountGoBack;

  /// deleteAccount.successTitle
  ///
  /// In en, this message translates to:
  /// **'Account Deleted'**
  String get deleteAccountSuccessTitle;

  /// deleteAccount.successMessage
  ///
  /// In en, this message translates to:
  /// **'Your account has been successfully deleted. All your data has been permanently removed from our systems.'**
  String get deleteAccountSuccessMessage;

  /// deleteAccount.successNote
  ///
  /// In en, this message translates to:
  /// **'If you had any pending withdrawals, they will be processed within 5-7 business days.'**
  String get deleteAccountSuccessNote;

  /// deleteAccount.backToLogin
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get deleteAccountBackToLogin;

  /// deleteAccount.step1
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get deleteAccountStep1;

  /// deleteAccount.step2
  ///
  /// In en, this message translates to:
  /// **'PIN'**
  String get deleteAccountStep2;

  /// deleteAccount.step3
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get deleteAccountStep3;
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
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
