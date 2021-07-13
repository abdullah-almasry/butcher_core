import 'package:url_launcher/url_launcher.dart';

class LuncherUtils {
  LuncherUtils._();

  static Future<void> openInUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> openChatInWhatsApp(String phoneNo) async {
    final googleUrl = 'whatsapp://send?phone=$phoneNo';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> openInDialr(String phoneNo) async {
    final googleUrl = 'tel://$phoneNo';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> openMap(String latitude, String longitude) async {
    final googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
