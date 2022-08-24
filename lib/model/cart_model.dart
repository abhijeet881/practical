


import '../database/database_helper.dart';

class ModelCart {

  int? id;
   String? title;
   int? quantity;
   String? image;
   num? price;



  Map<String, dynamic> toMap() {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId :id,
      DatabaseHelper.columnTitle :title,
      DatabaseHelper.columnPrice :price,
      DatabaseHelper.columnQTY : 1,
      DatabaseHelper.columnImage : image
    };
    return row;
  }
ModelCart();
  ModelCart.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    price = map['price'];
    image = map['image'];
    quantity = 1;
  }
}