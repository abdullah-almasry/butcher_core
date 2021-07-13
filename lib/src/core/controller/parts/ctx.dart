part of 'package:butcher_core/src/core/controller/controller.dart';

MediaQueryData get mediaQuery => Q.mediaQuery;
double get pixelRatio => ui.window.devicePixelRatio;
Size get size => ui.window.physicalSize / pixelRatio;
double get width => size.width;
double get height => size.height;
ThemeData get theme => Q.theme;
TextTheme get textTheme => theme.textTheme;

mixin QContextUtils on _QueenControllerImp {
  MediaQueryData get mediaQuery => MediaQuery.of(Q.context);
  Size get size => ui.window.physicalSize / pixelRatio;
  double get width => size.width;
  double get height => size.height;
  ThemeData get theme => Theme.of(context);
  TextTheme get textTheme => theme.textTheme;
}
