import 'package:get/get.dart';
import 'package:nextdaysolution_task/features/favourites/controller/favourites_controller.dart';

class FavouriteBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FavouriteController());
  }
}