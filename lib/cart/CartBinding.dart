


import 'package:get/get.dart';
import 'package:practical/cart/CartController.dart';

class CartBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }

}