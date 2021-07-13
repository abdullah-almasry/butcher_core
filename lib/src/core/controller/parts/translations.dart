part of 'package:butcher_core/src/core/controller/controller.dart';

extension StringTranslator on String {
  String get trs => tr(this);
}

mixin QTranslator on _QueenControllerImp {
  Future<void> setLocale(String langCode, [String? countryCode]) async {
    await context.setLocale(Locale(langCode, countryCode));
  }

  Locale get locale => context.locale;
}
