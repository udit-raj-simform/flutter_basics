import 'package:flutter/material.dart';

class MyAppLocalization {
  final Locale locale;

  MyAppLocalization(this.locale);

  static MyAppLocalization? of(BuildContext context) {
    return Localizations.of<MyAppLocalization>(context, MyAppLocalization);
  }

  static final Map<String, Map<String, String>> _localizationValues = {
    'en': {'hello': 'Hello World'},
    'hi': {'hello': 'हैलो वर्ल्ड'},
    'es': {'hello': 'Hola Mundo'},
    'fr': {'hello': 'Bonjour le monde'},
  };

  String? get hello {
    return _localizationValues[locale.languageCode]!['hello'];
  }
}
