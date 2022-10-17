import 'package:flutter_secure_storage/flutter_secure_storage.dart';

dynamic getUserData() async {
  FlutterSecureStorage storage = FlutterSecureStorage();
  var rememberMe = await storage.read(key: 'rememberMe');
  if (rememberMe == 'true') {
    var rememberMeEmail = await storage.read(key: 'emailAddress');
    var rememberMePassword = await storage.read(key: 'pass');
    // AppGlobal.rememberMeEmail = rememberMeEmail.toString();
    // AppGlobal.rememberMePassword = rememberMePassword.toString();
  }

  if (rememberMe != null) {
    return rememberMe;
  } else {
    return null;
  }
}
