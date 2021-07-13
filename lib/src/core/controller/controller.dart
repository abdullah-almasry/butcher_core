import 'dart:ui' as ui;

import 'package:edge_alerts/edge_alerts.dart';
import 'package:flutter/material.dart';
import 'package:butcher_core/butcher_core.dart';
import 'package:butcher_core/src/core/blocs/obs.dart';
part 'package:butcher_core/src/core/controller/parts/ctx.dart';
part 'package:butcher_core/src/core/controller/parts/navigator.dart';
part 'package:butcher_core/src/core/controller/parts/theme.dart';
part 'package:butcher_core/src/core/controller/parts/translations.dart';
part 'package:butcher_core/src/core/controller/parts/alerts.dart';
part 'package:butcher_core/src/core/controller/parts/dialogs.dart';
part 'package:butcher_core/src/core/controller/parts/utils.dart';

final Q = _QueenController();

class _QueenControllerImp {
  static GlobalKey _coreKey = GlobalKey();
  static final _navKey = GlobalKey<NavigatorState>();
  GlobalKey get key => _coreKey;
  GlobalKey<NavigatorState> get navKey => _navKey;

  BuildContext get context {
    if (navKey.currentContext != null) {
      return navKey.currentContext!;
    } else {
      throw "you can't use the context before the app comes to the screen";
    }
  }

  QCoreCubit get cubit => QCoreCubit.of(context);

  void _update() => cubit.refresh();

  void restart() {
    _coreKey = GlobalKey();
    _update();
  }
}

class _QueenController extends _QueenControllerImp with QUtils, QNavigator, QContextUtils, QTranslator, QThemeUtils, QAlerts, QDialogs {
  _QueenController();

  Future<void> coreBoot() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    Bloc.observer = ConBlocObs();
  }
}
