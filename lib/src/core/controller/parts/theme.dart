part of 'package:butcher_core/src/core/controller/controller.dart';

mixin QThemeUtils on _QueenControllerImp {
  set theme(ThemeData theme) {
    Q.cubit.updateTheme(theme);
  }

  set primaryColor(Color pk) => theme = Q.theme.copyWith(primaryColor: pk);
}
