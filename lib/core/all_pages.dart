import 'package:get/get.dart';
import 'package:nextdaysolution_task/core/routes.dart';
import 'package:nextdaysolution_task/features/favourites/binding/favourites_binding.dart';
import 'package:nextdaysolution_task/features/favourites/view/favourites_view.dart';
import 'package:nextdaysolution_task/features/home/binding/home_binding.dart';
import 'package:nextdaysolution_task/features/home/view/home_view.dart';

List<GetPage> allPages  = [
  GetPage(name: Routes.home, page:()=> const HomeView(),binding: HomeBiniding()),
  GetPage(name: Routes.favourites, page:()=> const FavouriteView(),binding: FavouriteBinding()),
];