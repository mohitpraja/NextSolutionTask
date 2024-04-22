import 'package:get/get.dart';
import 'package:nextdaysolution_task/features/home/controller/home_controller.dart';

class HomeBiniding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}