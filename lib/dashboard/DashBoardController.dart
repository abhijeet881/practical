

import 'package:get/get.dart';
import 'package:practical/model/cart_model.dart';
import '../database/database_helper.dart';
import '../model/product_model.dart';
import '../service/Api.dart';

class DashBoardController extends GetxController{
  var _pageNumber=1;
  var _cartSize=0;
  var _isLoading=false;
  var _myProducts = <Datum>[];

  get myProducts => _myProducts;
  set myProducts(value) {
    _myProducts = value;
    update();
  }

  get cartSize => _cartSize;
  set cartSize(value) {
    _cartSize = value;
    update();
  }

  get pageNumber => _pageNumber;
  set pageNumber(value) {
    _pageNumber = value;
    update();
  }

  get isLoading => _isLoading;
  set isLoading(value) {
    _isLoading = value;
    update();
  }


   var api =ApiService();
  // ignore: prefer_typing_uninitialized_variables
  var dbHelper;
   @override
  void onInit() {
    super.onInit();
    dbHelper = DatabaseHelper.instance;
   getData();
   getCartTotalItems();
  }

  void getData() {
    api.fetchData(pageNumber).then((value) {
      isLoading = false;
      myProducts.addAll(value.data!);
    });
  }
  void insert(Datum model) async {
    // row to insert
    var modelCart=ModelCart();
    modelCart.id=model.id!;
    modelCart.title=model.title!;
    modelCart.price=model.price!;
    modelCart.quantity=1;
    modelCart.image=model.featuredImage!;

    await dbHelper.insert(modelCart);
    getCartTotalItems();
  }

  Future<void> getCartTotalItems() async {
    var cartProductsLocal = await dbHelper.queryAllRows();
    cartSize=cartProductsLocal.length;
  }



}