import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextdaysolution_task/features/favourites/controller/favourites_controller.dart';
import 'package:nextdaysolution_task/models/user_response.dart';
import 'package:nextdaysolution_task/widgets/custom_card.dart';

class FavouriteView extends GetView<FavouriteController> {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Favourites"),
            leading: IconButton(
                onPressed: () {
                  controller.refreshHomePage();
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          body: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                Obx(() => Expanded(
                    child: controller.userList.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.heart_fill,
                                  size: Get.width * 0.3,
                                   color: Colors.grey,
                                ),
                                const Text(
                                  "There is no favourites",
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.userList.length,
                            itemBuilder: (context, index) {
                              UserData userData = controller.userList[index];
                              return CustomCard(
                                userData: userData,
                                onUnFavTap: () {
                                  controller.removeFromFavourite(index: index);
                                },
                              );
                            },
                          )))
              ],
            ),
          )),
    );
  }
}
