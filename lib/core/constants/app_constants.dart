class AppConstants {
  static const String appName = "Edutime";

  static const String tokenKey = "auth_token";
  static const String userKey = "user_data";
  static const String themeKey = "theme_preference";

  static const Duration todayEventCacheDuration = Duration(minutes: 10);
  static const Duration upcomingEventCacheDuration = Duration(minutes: 30);

  static const Duration defaultConnectTimeout = Duration(milliseconds: 60000);
  static const Duration defaultReceiveTimeout = Duration(milliseconds: 60000);
}