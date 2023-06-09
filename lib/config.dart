final String _productionBaseUrl = "http://3.141.14.53/";
final String _stageBaseUrl = "https://f178-111-119-183-15.eu.ngrok.io/";

class Config {
  // static const APP_NAME = "Faro";
  // static const APP_ID = "com.faro.restaurant";
  static const bool _IS_LIVE = true;
  // static const bool _LOG_INFO_DATA = true;
  //`
  // static String get status => _IS_LIVE ? "live" : "dev";
  // static String get fcmTopic => _IS_LIVE ? _productionFCMTopic : _stageFCMTopic;
  static String get baseUrl => _IS_LIVE ? _productionBaseUrl : _stageBaseUrl;
  //
  // static get canLogInfoEvents => _LOG_INFO_DATA;
  //
  // static bool get isLiveEnvironment => _IS_LIVE;
  //
  // static const NOTIFICATION_CHANNEL_ID = "faro_app_channel_id
  // 

  // static const NOTIFICATION_CHANNEL_NAME = "Faro";
  // static const NOTIFICATION_CHANNEL_DESCRIPTION = "Faro Notifications";
  // static const GOOGLE_MAPS_KEY = "AIzaSyBRGz26XaODZ9j0iICKZ1mNvtmTLLPHiZI";
// static const GOOGLE_MAPS_KEY = "AIzaSyA4srtiOTRbjNEYbEQsZn_MYrevAQG7Dvo";
//static const PLACES_KEY = "AIzaSyAeZRKqV-_ZImKnqCKwp6_HhkNiRi4FGgE";
}