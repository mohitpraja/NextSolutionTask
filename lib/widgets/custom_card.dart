import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextdaysolution_task/models/user_response.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key, required this.userData, this.onFavTap, this.onUnFavTap});

  final UserData userData;
  final void Function()? onFavTap;
  final void Function()? onUnFavTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl: userData.avatar,
                  height: 60,
                  width: 60,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${userData.firstName} ${userData.lastName}",
                    style: const TextStyle(
                        fontSize: 15.5, fontWeight: FontWeight.w500),
                  ),
                  Text(userData.email),
                ],
              )
            ],
          ),
          IconButton(
              onPressed: userData.isFavourite! ? onUnFavTap : onFavTap,
              icon: Icon(
                  userData.isFavourite!
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  color: Colors.grey))
        ],
      ),
    );
  }
}
