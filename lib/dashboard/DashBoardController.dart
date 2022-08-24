

import 'package:get/get.dart';
import 'package:practical/model/cart_model.dart';
import '../database/database_helper.dart';
import '../model/product_model.dart';
import '../service/Api.dart';

class DashBoardController extends GetxController{
  var pageNumber=1.obs;
  var total=0.0.obs;
  var isLoading=false.obs;
   var myProducts = <Datum>[].obs;
   var cartProducts = <ModelCart>[].obs;
   var api =ApiService();
  // ignore: prefer_typing_uninitialized_variables
  var dbHelper;
   @override
  void onInit() {
    super.onInit();
    dbHelper = DatabaseHelper.instance;
   getData();
   queryAll();
  }

  void getData() {
    api.fetchData(pageNumber.value).then((value) {
      isLoading.value = false;
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

    final id = await dbHelper.insert(modelCart);
    print('inserted row id: $id');
    queryAll();
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
    total.value =0;
      for (int i = 0; i < cartProductsLocal.length; i++) {
        ModelCart cart = ModelCart.fromMap(cartProductsLocal[i]);
        cartProducts.add(cart);
        total.value = total.value + cartProductsLocal[i]['price'];
      }
var dd=total.value;
  }
Future<String> grandTotal() async {
    var cartProductsLocal = await dbHelper.queryAllRows();
    total.value =0;
      for (int i = 0; i < cartProductsLocal.length; i++) {

        total.value = total.value + cartProductsLocal[i]['price'];
      }
      return total.value.toString();
  }

}