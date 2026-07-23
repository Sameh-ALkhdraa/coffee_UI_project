import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localization_ar.dart';
import 'app_localization_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localization.dart';
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
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @coffeeFirstThenTalk.
  ///
  /// In en, this message translates to:
  /// **'coffee first then talk !'**
  String get coffeeFirstThenTalk;

  /// No description provided for @justOne.
  ///
  /// In en, this message translates to:
  /// **'Just one '**
  String get justOne;

  /// No description provided for @sip.
  ///
  /// In en, this message translates to:
  /// **'sip'**
  String get sip;

  /// No description provided for @andFeelGood.
  ///
  /// In en, this message translates to:
  /// **' and feel good'**
  String get andFeelGood;

  /// No description provided for @so.
  ///
  /// In en, this message translates to:
  /// **'So '**
  String get so;

  /// No description provided for @chafe.
  ///
  /// In en, this message translates to:
  /// **'Chafe '**
  String get chafe;

  /// No description provided for @willMakeYouSmile.
  ///
  /// In en, this message translates to:
  /// **'will make you smile :)'**
  String get willMakeYouSmile;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @pleaseEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter password'**
  String get pleaseEnterPassword;

  /// No description provided for @pleaseEnterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter phone number'**
  String get pleaseEnterPhoneNumber;

  /// No description provided for @atLeastPasswordContatinEightCharacters.
  ///
  /// In en, this message translates to:
  /// **'At least password contatin 8 characters'**
  String get atLeastPasswordContatinEightCharacters;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get username;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @pleaseEnterYourUsername.
  ///
  /// In en, this message translates to:
  /// **'Please enter your username'**
  String get pleaseEnterYourUsername;

  /// No description provided for @myTotalBeans.
  ///
  /// In en, this message translates to:
  /// **'My Total Beans'**
  String get myTotalBeans;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'search'**
  String get search;

  /// No description provided for @scanUserQR.
  ///
  /// In en, this message translates to:
  /// **'Scan user QR'**
  String get scanUserQR;

  /// No description provided for @addPoints.
  ///
  /// In en, this message translates to:
  /// **'add points'**
  String get addPoints;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'submit'**
  String get submit;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @negativeNumbersAreNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'Negative numbers are not allowed'**
  String get negativeNumbersAreNotAllowed;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @changesSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Changes saved successfully'**
  String get changesSavedSuccessfully;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login Failed'**
  String get loginFailed;

  /// No description provided for @incorrectLoginInformation.
  ///
  /// In en, this message translates to:
  /// **'The information you entered is incorrect.'**
  String get incorrectLoginInformation;

  /// No description provided for @goToLoginpage.
  ///
  /// In en, this message translates to:
  /// **'login page'**
  String get goToLoginpage;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @cappuccino.
  ///
  /// In en, this message translates to:
  /// **'Cappuccino'**
  String get cappuccino;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @hotDrink.
  ///
  /// In en, this message translates to:
  /// **'Hot Drink'**
  String get hotDrink;

  /// No description provided for @coldDrink.
  ///
  /// In en, this message translates to:
  /// **'Cold Drink'**
  String get coldDrink;

  /// No description provided for @coffeeBeans.
  ///
  /// In en, this message translates to:
  /// **'Coffee beans'**
  String get coffeeBeans;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @lightRoasted.
  ///
  /// In en, this message translates to:
  /// **'Light Roasted'**
  String get lightRoasted;

  /// No description provided for @mediumRoasted.
  ///
  /// In en, this message translates to:
  /// **'Medium Roasted'**
  String get mediumRoasted;

  /// No description provided for @darkRoasted.
  ///
  /// In en, this message translates to:
  /// **'Dark Roasted'**
  String get darkRoasted;

  /// No description provided for @bestCoffeeForYou.
  ///
  /// In en, this message translates to:
  /// **'Best Coffee For You'**
  String get bestCoffeeForYou;

  /// No description provided for @findYourCoffee.
  ///
  /// In en, this message translates to:
  /// **'Find Your Coffee'**
  String get findYourCoffee;

  /// No description provided for @favourite.
  ///
  /// In en, this message translates to:
  /// **'favourites'**
  String get favourite;

  /// No description provided for @noFavouriteProducts.
  ///
  /// In en, this message translates to:
  /// **'No favourite products'**
  String get noFavouriteProducts;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @espresso.
  ///
  /// In en, this message translates to:
  /// **'Espresso'**
  String get espresso;

  /// No description provided for @americano.
  ///
  /// In en, this message translates to:
  /// **'Americano'**
  String get americano;

  /// No description provided for @macchiato.
  ///
  /// In en, this message translates to:
  /// **'Macchiato'**
  String get macchiato;

  /// No description provided for @collectMoreBeansToUnlockCoupons.
  ///
  /// In en, this message translates to:
  /// **'Collect more beans to unlock coupons'**
  String get collectMoreBeansToUnlockCoupons;

  /// No description provided for @scanMe.
  ///
  /// In en, this message translates to:
  /// **'Scan Me'**
  String get scanMe;

  /// No description provided for @cubons.
  ///
  /// In en, this message translates to:
  /// **'Cubons'**
  String get cubons;

  /// No description provided for @totalPrice.
  ///
  /// In en, this message translates to:
  /// **'Total Price'**
  String get totalPrice;

  /// No description provided for @noItemsInCart.
  ///
  /// In en, this message translates to:
  /// **'No Items in Cart'**
  String get noItemsInCart;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @orderHistory.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistory;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @inHouse.
  ///
  /// In en, this message translates to:
  /// **'In-House'**
  String get inHouse;

  /// No description provided for @canceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get canceled;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @payFrom.
  ///
  /// In en, this message translates to:
  /// **'Pay from'**
  String get payFrom;

  /// No description provided for @creditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get creditCard;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @orderSuccess.
  ///
  /// In en, this message translates to:
  /// **'Order Success'**
  String get orderSuccess;

  /// No description provided for @visa.
  ///
  /// In en, this message translates to:
  /// **'VISA'**
  String get visa;

  /// No description provided for @cardHolder.
  ///
  /// In en, this message translates to:
  /// **'CARD HOLDER'**
  String get cardHolder;

  /// No description provided for @expires.
  ///
  /// In en, this message translates to:
  /// **'EXPIRES'**
  String get expires;

  /// No description provided for @authorizedSignatureOnly.
  ///
  /// In en, this message translates to:
  /// **'Authorized signature only.'**
  String get authorizedSignatureOnly;

  /// No description provided for @cardProperty.
  ///
  /// In en, this message translates to:
  /// **'This card is property of Coffee Shop.'**
  String get cardProperty;

  /// No description provided for @ar.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get ar;

  /// No description provided for @en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get en;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @moreInfo.
  ///
  /// In en, this message translates to:
  /// **'More Info'**
  String get moreInfo;

  /// No description provided for @noOrdersYet.
  ///
  /// In en, this message translates to:
  /// **'No orders yet'**
  String get noOrdersYet;

  /// No description provided for @startShoppingToSeeOrders.
  ///
  /// In en, this message translates to:
  /// **'Start shopping to place your first order.'**
  String get startShoppingToSeeOrders;
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
    'that was used.',
  );
}
