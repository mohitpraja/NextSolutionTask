import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextdaysolution_task/services/local_db.dart';

AppPreferences appPrefs = AppPreferences.instance;

showSnackBar({required String msg}) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.black,
      shape: const Border(top: BorderSide(width: 3, color: Colors.green)),
      content: Text(msg)));
}

Future checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    try {
      final result = await InternetAddress.lookup('www.google.com')
          .timeout(const Duration(seconds: 5));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on TimeoutException {
      return false;
    } on SocketException catch (_) {
      return false;
    }
  } else {
    return false;
  }
}
