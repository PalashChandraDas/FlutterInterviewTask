import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class AppConstant {
  //INFO
  static const String appName = 'Login';
  static const String appVersion = '1.0.0';

  // VARIABLES
  static const String noData = 'Not found!';
  static const String offline = 'No Internet Connection';

  //COLORS
  static Color primaryTextColor() {
    return const Color(0xFF000000);
  }

  static Color textBorderColor() {
    return const Color(0xFF887E7E);
  }

  static Color loginBtnBgColor() {
    return const Color(0xFF0B6EFE);
  }

  static Color googleBgColor() {
    return const Color(0xFFECE9EC);
  }

  static Color googleBgBorderColor() {
    return const Color(0xFFF89AEE);
  }


  //check internet_connection
  static Future<bool> checkNet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    const noCon = ConnectivityResult.none;
    return (connectivityResult == noCon) ? false : true;
  }

  //WIDGETS
  static SizedBox minSizeBox = const SizedBox(
    height: 20,
  );
  static SizedBox maxSizeBox = const SizedBox(
    height: 45,
  );

}
