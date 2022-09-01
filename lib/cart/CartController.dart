


import 'package:get/get.dart';

import '../database/database_helper.dart';
import '../model/cart_model.dart';

class CartController extends GetxController{

  var dbHelper;
  var _total=0.0;

  var cartProducts = <ModelCart>[].obs;

  get total => _total;

  set total(value) {
    _total = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    dbHelper = DatabaseHelper.instance;
    queryAll();
    grandTotal();
  }

  Future<String> grandTotal() async {
    var cartProductsLocal = await dbHelper.queryAllRows();
    total =0.0;
    for (int i = 0; i < cartProductsLocal.length; i++) {
      total = total + cartProductsLocal[i]['price'];
    }
    return total.toString();
  }

  void delete(int id) async {
    // row to delete
    final idw = await dbHelper.delete(id);
    print('deleted row id: $idw');
    queryAll();

  }

  void queryAll() async {
    var cartProductsLocal = await dbHelper.queryAllRows();
    cartProducts.clear();
    total =0.0;
    for (int i = 0; i < cartProductsLocal.length; i++) {
      ModelCart cart = ModelCart.fromMap(cartProductsLocal[i]);
      cartProducts.add(cart);
      total = total + cartProductsLocal[i]['price'];
    }
  }
}