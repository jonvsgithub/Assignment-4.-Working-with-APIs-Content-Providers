import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizationService {
  static const LocalizationsDelegate<MaterialLocalizations> localizationsDelegate =
      GlobalMaterialLocalizations.delegate;

  static const LocalizationsDelegate<WidgetsLocalizations> widgetsDelegate =
      GlobalWidgetsLocalizations.delegate;

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    localizationsDelegate,
    widgetsDelegate,
    AppLocalizations.delegate,  // Add this line
  ];

  static const List<Locale> supportedLocales = [
    Locale('en', ''), // English
    Locale('es', ''), // Spanish
    // Add more supported locales here
  ];
}
