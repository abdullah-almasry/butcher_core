import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:butcher_core/butcher_core.dart';

class CenterError extends StatelessWidget {
  final String? message;
  final IconData? icon;
  final String buttonText;
  final String? path;
  final VoidCallback? callback;

  const CenterError({
    Key? key,
    required this.message,
    this.icon,
    this.buttonText = 'refresh',
    this.callback,
    this.path,
  }) : super(key: key);
  factory CenterError.err(
    String message, {
    Key? key,
    String? buttonText,
    VoidCallback? callback,
  }) {
    return CenterError(
      key: key,
      message: message,
      icon: Icons.error,
      buttonText: buttonText ?? 'refresh'.trs,
      callback: callback,
    );
  }

  Widget _buildIcon() {
    return Icon(
      icon,
      color: const Color(0xff9B4DF4),
      size: size.aspectRatio * 180,
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      message.toString(),
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
          onPressed: callback,
          child: Text(
            buttonText.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget _buildImg() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        path!,
        height: height * .35,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// TODO :: style this widget
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (icon != null) ...[_buildIcon(), SizedBox(height: height * 0.05)],
            if (path != null) _buildImg(),
            if (message != null) _buildText(context),
            if (callback != null) _buildButton(),
          ],
        ),
      ),
    );
  }
}
