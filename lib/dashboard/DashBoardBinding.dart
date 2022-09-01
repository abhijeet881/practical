


import 'package:get/get.dart';
import 'package:practical/dashboard/DashBoardController.dart';

class DashBoardBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
  }

}