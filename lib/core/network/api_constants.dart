class ApiConstants {
  static const String baseUrl = 'http://abd.softup.agency:5902/api/v1/';
  static const String socketCoverageBaseUrl = 'http://abd.softup.agency:5902/collection';
  static const String socketTrackingBaseUrl = 'http://abd.softup.agency:5902/collection';
  static const String baseUrl2 = 'http://10.0.2.2:3000/';
  static const String staticMap = 'https://maps.googleapis.com/maps/api/staticmap';
  static const String institutionSignUp = 'auth/register/institution';
  static const String sendActivation = 'auth/otp/resend';
  static const String activation = 'auth/otp/verify';
  static const String resetPassword = 'auth/reset-password';

  static const String signUp = 'auth/register/citizen';
  static const String logIn = 'auth/login/user-app';
  static const String logInWithGoogle = 'auth/login/user-app/google';
  static const String signUpUserWithGoogle = 'auth/register/citizen/google';
  static const String signUpInstitutionWithGoogle = 'auth/register/institution/google';

  static const String forgetPassword = 'auth/password/forgot';
  static const String verifyTokenResetPassword =
      'auth/password/verify';
  static const String confirmResetPassword = 'auth/password/reset';
  static const String uploadFiles = 'onboarding/institution/upload-Doc';
  static const String completeInstitutionInformation = 'onboarding/institution/information';
  static const String addLocation = 'onboarding/location' ;
  static const String getProvinces = 'onboarding/provinces' ;
  static const String getInstitutionType = 'institution/institution-type' ;

  static const String getWasteCategory = 'waste-management/waste-categories' ;
  static const String addMaterialInformation = 'onboarding/institution/material' ;


  static const String notifications = '/notifications';
  static const String fcmToken = 'auth/FCMToken';

  //--------------------------- OFFERS --------------------
static const String getOffers = 'waste/offers' ;


//--------------------------- CATEGORY --------------------
  static const String getCategories = 'waste/categories' ;
  static const String getCategoryProducts = 'waste/categories/{categoryId}/products' ;

//--------------------------- CART --------------------
  static const String getCart = 'cart' ;
  static const String addToCart = 'cart/items' ;
  static const String updateCartItem = 'cart/items/{itemId}';
  static const String removeCartItem = 'cart/items/{itemId}';
  static const String clearCart = 'cart';

  //--------------------------- FAVOURITE --------------------
  static const String getFavourite = 'favourites';
  static const String addFavourite = 'favourites';
  static const String removeFavourite = 'favourites';

  //--------------------------- PROFILE --------------------
  static const String getProfile = 'user/profile';
  static const String updateProfile = 'user/profile';

  static const String changePassword = 'user/password';

  static const String uploadProfileImage = 'user/profile/image';
  static const String updateProfileImage = 'user/profile/image';
  static const String deleteProfileImage = 'user/profile/image';


//--------------------------- RANK --------------------

static const String rank = 'rank' ;



//--------------------------- LOCATIONS --------------------

  static const String getLocations = 'user/locations' ;

//--------------------------- DAWRHA APP  --------------------

  static const String getAbout = 'content/about' ;

  static const String getPrivacy = 'content/privacy' ;

  static const String getTerms = 'content/terms' ;


//--------------------------- ORDER  --------------------

  static const String createOrder = 'collection-requests' ;
  static const String listOrders = 'collection-requests' ;
  static const String getCoverageZone = 'user/coverage-zones' ;


//--------------------------- WALK IN DROP OFF ORDER  --------------------

  static const String getDriverById = 'coverage-zones/drivers/{driverId}' ;
  static const String dropOff = 'user/drop-off' ;



}
