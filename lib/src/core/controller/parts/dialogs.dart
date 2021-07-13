part of 'package:butcher_core/src/core/controller/controller.dart';

mixin QDialogs on _QueenControllerImp {
  Future<T?> dialog<T>(
    Widget dialog, {
    bool dismissible = true,
  }) async {
    return showDialog<T?>(
      context: context,
      builder: (_) => dialog,
      barrierDismissible: dismissible,
    );
  }

  Future<T?> dialogBuilder<T>(
    WidgetBuilder builder, {
    bool dismissible = true,
  }) async {
    return showDialog<T?>(
      context: context,
      builder: builder,
      barrierDismissible: dismissible,
    );
  }
}
