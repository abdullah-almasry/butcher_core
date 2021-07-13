import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:butcher_core/butcher_core.dart';

class ConBlocObs extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    L.i('[BLOC] ${bloc.runtimeType} [onChange] F ==> ${change.currentState.runtimeType} T ==> ${change.nextState.runtimeType}');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    L.i('[BLOC] ${bloc.runtimeType} [onError] E => $error \n [stack]=> $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
