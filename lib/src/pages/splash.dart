import 'package:butcher_core/butcher_core.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage();
  @override
  Widget build(BuildContext context) {
    // TODO :: splash page
    AuthCubit.of(context).checkUserAuthStats();
    return Scaffold(
      body: Center(
        child: Text('Queen Butchers 👑'),
      ),
    );
  }
}
