import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  final _auth = LocalAuthentication();

  AndroidAuthMessages androidStrings = const AndroidAuthMessages(
    cancelButton: 'cancel',
    goToSettingsButton: 'setting',
    biometricNotRecognized: 'Not Recognized',
    biometricSuccess: 'authentication success',
  );

  Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException {
      return false;
    }
  }

  Future<bool> authenticate() async {
    final auth = await hasBiometrics();
    if (!auth) {
      return false;
    }
    try {
      return await _auth.authenticate(
          sensitiveTransaction: true,
          localizedReason: "Scan Your Biometrics",
          useErrorDialogs: true,
          androidAuthStrings: androidStrings,
          stickyAuth: true);
    } on PlatformException {
      return false;
    }
  }
}
