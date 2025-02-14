class LocaleManager {
  static final LocaleManager _instance = LocaleManager._internal();

  String _currentLocale = 'en'; // Use String instead of Locale

  factory LocaleManager() {
    return _instance;
  }

  LocaleManager._internal();

  String get currentLocale => _currentLocale;

  void setLocale(String locale) {
    _currentLocale = locale;
  }
}
