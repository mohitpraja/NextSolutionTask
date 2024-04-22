import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:nextdaysolution_task/core/helper.dart';
import 'package:nextdaysolution_task/features/home/controller/home_controller.dart';
import 'package:nextdaysolution_task/models/user_response.dart';

class FavouriteController extends GetxController {
  RxList<UserData> userList = <UserData>[].obs;

  @override
  void onInit() {
    getFavouriteUserList();
    super.onInit();
  }

  getFavouriteUserList() async {
    if (appPrefs.favouriteList != '') {
      userList.value = List<UserData>.from(jsonDecode(appPrefs.favouriteList)
          .map((x) => UserData.fromJson(x))).reversed.toList();
      userList.refresh();
      log("userlist len : ${userList.length}");
    } else {
      userList.value = [];
    }
  }

  removeFromFavourite({required int index}) {
    log("temp DAta : ${userList.length}");
    userList.removeAt(index);
    log("temp DAta rem: ${userList.length}");
    appPrefs.favouriteList = jsonEncode(userList);

    userList.refresh();
    log('added to FAv : ${appPrefs.favouriteList}');
    showSnackBar(msg: 'Remove from favourites');
  }

  refreshHomePage() {
    HomeController homeController = Get.put(HomeController());
    homeController.onInit();
    Get.back();
  }
}
