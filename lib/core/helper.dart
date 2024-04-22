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
