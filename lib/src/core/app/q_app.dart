import 'package:flutter/material.dart';
import 'package:butcher_core/butcher_core.dart';

class QApp extends StatelessWidget {
  final Widget Function(ThemeData? theme, Locale locale, List<LocalizationsDelegate> delegates) builder;
  final List<Locale> supportedLocales;
  final String localizationFilesPath;
  final Locale fallBackLocale;
  final bool useOnlyLangCode;
  final ThemeData? initalTheme;

  const QApp({
    required this.builder,
    required this.supportedLocales,
    this.localizationFilesPath = 'assets/localization',
    this.initalTheme,
    this.fallBackLocale = const Locale('ar'),
    this.useOnlyLangCode = true,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: QCoreCubit(),
      child: EasyLocalization(
        supportedLocales: supportedLocales,
        path: localizationFilesPath,
        fallbackLocale: fallBackLocale,
        useOnlyLangCode: useOnlyLangCode,
        startLocale: const Locale('ar'),
        child: BlocBuilder<QCoreCubit, CoreCubitState>(
          builder: (ctx, state) {
            return builder(
              state.theme ?? initalTheme,
              ctx.locale,
              ctx.localizationDelegates,
            );
          },
        ),
      ),
    );
  }
}
