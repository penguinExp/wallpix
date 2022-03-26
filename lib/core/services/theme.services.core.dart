class ThemeService {
  ThemeService._instance();
  static final ThemeService _themeService = ThemeService._instance();

  factory ThemeService() {
    return _themeService;
  }

  
}
