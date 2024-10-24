/// [AppConstants] is a class that contains constants used in the application.
final class AppConstants {
  AppConstants._();

  ///app name
  static const String appName = 'Haber App';

  ///categories
  static const List<String> categories = [
    'general',
    'business',
    'technology',
    'sports',
    'entertainment',
    'health',
    'science',
  ];

  ///category titles
  static const Map<String, String> categoryTitles = {
    'general': 'Genel',
    'business': 'İş',
    'technology': 'Teknoloji',
    'sports': 'Spor',
    'entertainment': 'Eğlence',
    'health': 'Sağlık',
    'science': 'Bilim',
  };
}
