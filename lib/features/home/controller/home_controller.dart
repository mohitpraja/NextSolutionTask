import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:nextdaysolution_task/core/helper.dart';
import 'package:nextdaysolution_task/models/user_response.dart';
import 'package:nextdaysolution_task/services/api_helper.dart';

class HomeController extends GetxController {
  RxList<UserData> userList = <UserData>[].obs;
  RxBool isConnection = false.obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    isConnection.value = await checkConnectivity();
    if (await checkConnectivity()) {
      getUserData();
    } else {
      isLoading.value = false;
    }
    super.onInit();
  }

  getUserData() async {
    UserResponse result = await ApiHelper.getPersonData();
    List<UserData> localData = appPrefs.favouriteList != ''
        ? List<UserData>.from(
            jsonDecode(appPrefs.favouriteList).map((x) => UserData.fromJson(x)))
        : [];
    List<UserData> userDataList = result.data;
    log("line 23 : ${userDataList.length}");

    userDataList.removeWhere((userData) =>
        localData.any((localUserData) => localUserData.id == userData.id));
    log("after remove len : ${userDataList.length}");
    userList.clear();
    userList.addAll(userDataList);
    userList.addAll(localData);

    userList.refresh();
    isLoading.value = false;
    log("home controller user len: ${userList.length}");
  }

  addToFavourite({required UserData userData}) {
    List temp =
        appPrefs.favouriteList != '' ? jsonDecode(appPrefs.favouriteList) : [];
    userData.isFavourite = true;
    temp.add(userData);
    if (!(appPrefs.favouriteList.contains(userData.id.toString()))) {
      appPrefs.favouriteList = jsonEncode(temp);
      userList.refresh();
      log('added to FAv : ${appPrefs.favouriteList}');
      showSnackBar(msg: 'Added to favourites');
    }
  }
}
