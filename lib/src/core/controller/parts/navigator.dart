part of 'package:butcher_core/src/core/controller/controller.dart';

mixin QNavigator on _QueenControllerImp {
  Future<T?> to<T>(Widget page, [BuildContext? ctx]) async {
    log('[con][navigator] to => ${page.runtimeType}');
    return Navigator.of(ctx ?? context).push<T>(MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> replace<T extends Object?, TO extends Object?>(Widget page, [BuildContext? ctx]) async {
    log('[con][navigator] replace with => ${page.runtimeType}');
    return Navigator.of(ctx ?? context).pushReplacement<T, TO>(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  Future<T?> replaceAll<T extends Object?>(Widget page, [BuildContext? ctx]) async {
    log('[con][navigator] replace with => ${page.runtimeType}');
    return Navigator.of(ctx ?? context).pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page),
      (_) => false,
    );
  }

  Future<void> back<T>([T? data, BuildContext? ctx]) async {
    log('[con][navigator] pop');
    return Navigator.of(ctx ?? context).pop<T>(data);
  }
}
