part of 'package:butcher_core/src/core/controller/controller.dart';

mixin QAlerts on _QueenControllerImp {
  void alertWithSuccess(Object msg, {String desc = ''}) {
    edgeAlert(
      context,
      title: msg.toString(),
      icon: FontAwesomeIcons.check,
      backgroundColor:  Colors.green,
      description: desc,
    );
  }

  void alertWithErr(Object msg, {String desc = ''}) {
    edgeAlert(
      context,
      title: msg.toString(),
      icon: FontAwesomeIcons.times,
      backgroundColor: const Color(0xFFDC3130),
      description: desc,
    );
  }
}
