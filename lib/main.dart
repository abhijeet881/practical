import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical/cart/my_cart.dart';
import 'package:practical/dashboard/DashBoardBinding.dart';

import 'Constants/Routes.dart';
import 'cart/CartBinding.dart';
import 'dashboard/DashBoardPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashBoardPage(),
      initialBinding: DashBoardBinding(),
      getPages: [
        GetPage(
            name: Routes.routeHome,
            page: () => const DashBoardPage(),
            binding: DashBoardBinding()),
        GetPage(
            name: Routes.routeCart,
            page: () => const MyCart(),
            binding: CartBinding()),
      ],
    );
  }
}
