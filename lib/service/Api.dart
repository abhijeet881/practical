
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ApiService {
  var baseUrl="http://205.134.254.135/~mobile/MtProject/public/api/product_list.php?";
   var token='eyJhdWQiOiI1IiwianRpIjoiMDg4MmFiYjlmNGU1MjIyY2MyNjc4Y2FiYTQwOGY2MjU4Yzk5YTllN2ZkYzI0NWQ4NDMxMTQ4ZWMz';

  Future<ModelProducts> fetchData(int page) async {
    var response =
    await http.get(Uri.parse('${baseUrl}perPage=5&page=$page'),
        headers: {'token':token});
    if (response.statusCode == 200) {
      return ModelProducts.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}