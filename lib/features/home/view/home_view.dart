import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextdaysolution_task/core/routes.dart';
import 'package:nextdaysolution_task/features/home/controller/home_controller.dart';
import 'package:nextdaysolution_task/models/user_response.dart';
import 'package:nextdaysolution_task/widgets/custom_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.favourites);
              },
              icon: const Icon(
                CupertinoIcons.heart_fill,
                color: Colors.red,
              ))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Obx(() => Expanded(
                child: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    :  ListView.builder(
                            itemCount: controller.userList.length,
                            itemBuilder: (context, index) {
                              UserData userData = controller.userList[index];
                              return CustomCard(
                                userData: userData,
                                onFavTap: () {
                                  controller.addToFavourite(userData: userData);
                                },
                              );
                            },
                          )))
          ],
        ),
      ),
    );
  }
}
