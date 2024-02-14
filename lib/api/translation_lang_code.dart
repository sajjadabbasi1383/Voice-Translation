class TranslationLanguageCode {
  static final Map<String, String> languageMap = {
    "انگلیسی": 'English',
    "فارسی": 'Persian',
    "اسپانیایی": 'Spanish',
    "فرانسوی": 'French',
    "آلمانی": 'German',
    "ایتالیایی": 'Italian',
    "روسی": 'Russian',
  };

  static final languageLatin = <String>[
    'English',
    'Persian',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Russian',
  ];

  static String getLanguageCode(String language) {
    switch (language) {
      case 'English':
        return 'en';
      case 'Persian':
        return 'fa';
      case 'French':
        return 'fr';
      case 'Italian':
        return 'it';
      case 'Russian':
        return 'ru';
      case 'Spanish':
        return 'es';
      case 'German':
        return 'de';
      default:
        return 'en';
    }
  }
}
