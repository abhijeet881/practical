import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical/cart/CartController.dart';

// ignore: must_be_immutable
class MyCart extends GetView<CartController> {

  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return GetBuilder(builder: (CartController controller) {
     return Scaffold(
       appBar: AppBar(
         title: const Text("My Cart"),
         centerTitle: true,
       ),
       body: Container(
         margin: const EdgeInsets.only(top: 16),
         child: Column(
           children: [
             Expanded(
               child:
                 controller.cartProducts.isNotEmpty ? ListView.builder(
                     itemCount: controller.cartProducts.length,
                     itemBuilder: (BuildContext context, int index) {
                       return Column(
                         children: [
                           Card(
                             margin: const EdgeInsets.only(left: 16, right: 16),
                             child: Row(children: [
                               Expanded(
                                 flex: 1,
                                 child: Container(
                                   height: 100,
                                   decoration: const BoxDecoration(
                                       borderRadius: BorderRadius.only(
                                         topLeft: Radius.circular(8.0),
                                         bottomLeft: Radius.circular(8.0),
                                       )),
                                   child: ClipRRect(
                                     borderRadius: const BorderRadius.only(
                                       topLeft: Radius.circular(8.0),
                                       bottomLeft: Radius.circular(8.0),
                                     ),
                                     child: CachedNetworkImage(
                                       imageUrl:
                                       controller.cartProducts[index].image!,
                                       placeholder: (context, url) =>
                                       const CircularProgressIndicator(),
                                       //fit: BoxFit.cover,
                                       errorWidget: (context, url, error) =>
                                       const Icon(Icons.error),
                                     ),
                                   ),
                                 ),
                               ),
                               Expanded(
                                   flex: 3,
                                   child: Container(
                                     height: 100,
                                     padding: const EdgeInsets.all(8),
                                     child: Column(
                                       mainAxisSize: MainAxisSize.max,
                                       crossAxisAlignment: CrossAxisAlignment
                                           .start,
                                       mainAxisAlignment:
                                       MainAxisAlignment.spaceBetween,
                                       children: [
                                         Expanded(
                                           child: Row(
                                             mainAxisAlignment:
                                             MainAxisAlignment.spaceBetween,
                                             children: [
                                               Expanded(
                                                 child: Text(
                                                   controller
                                                       .cartProducts[index]
                                                       .title!,
                                                   maxLines: 1,
                                                   style: const TextStyle(
                                                       color: Colors.grey,
                                                       fontSize: 14,
                                                       fontWeight: FontWeight
                                                           .bold),
                                                 ),
                                               ),
                                               Container(
                                                 alignment: Alignment
                                                     .centerRight,
                                                 child: IconButton(
                                                   padding: EdgeInsets.zero,
                                                   constraints:
                                                   const BoxConstraints(),
                                                   icon: const Icon(
                                                     Icons.delete,
                                                     color: Colors.grey,
                                                   ),
                                                   onPressed: () {
                                                     Get.defaultDialog(
                                                       title: "Alert",
                                                       middleText:
                                                       "Are you sure you want to delete this item?",
                                                       backgroundColor: Colors
                                                           .blue,
                                                       titleStyle: const TextStyle(
                                                           color: Colors.white),
                                                       middleTextStyle: const TextStyle(
                                                           color: Colors.white),
                                                       radius: 8,
                                                       actions: <Widget>[
                                                         ElevatedButton(
                                                           style: ElevatedButton
                                                               .styleFrom(
                                                               primary: Colors
                                                                   .white,
                                                               textStyle: const TextStyle(
                                                                   fontSize: 16,
                                                                   fontWeight: FontWeight
                                                                       .bold)),
                                                           child: const Text(
                                                             "Ok",
                                                             style: TextStyle(
                                                                 color: Colors
                                                                     .black),),

                                                           onPressed: () async {
                                                             controller.delete(
                                                                 controller
                                                                     .cartProducts[index]
                                                                     .id!);
                                                             Get.back();
                                                           },
                                                         ),
                                                         ElevatedButton(
                                                           style: ElevatedButton
                                                               .styleFrom(
                                                               primary: Colors
                                                                   .white,
                                                               textStyle: const TextStyle(
                                                                   fontSize: 16,
                                                                   fontWeight: FontWeight
                                                                       .bold)),
                                                           child: const Text(
                                                             "Cancel",
                                                             style: TextStyle(
                                                                 color: Colors
                                                                     .black),),
                                                           onPressed: () {
                                                             Get.back();
                                                           },
                                                         )
                                                       ],
                                                     );
                                                   },
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                         Row(
                                           mainAxisAlignment:
                                           MainAxisAlignment.spaceBetween,
                                           children: [
                                             const Text(
                                               "Price",
                                               maxLines: 1,
                                               style: TextStyle(
                                                   color: Colors.grey,
                                                   fontSize: 14,
                                                   fontWeight: FontWeight.bold),
                                             ),
                                             Text(
                                               "${controller.cartProducts[index]
                                                   .price}",
                                               maxLines: 1,
                                               style: const TextStyle(
                                                   color: Colors.grey,
                                                   fontSize: 14,
                                                   fontWeight: FontWeight.bold),
                                             ),
                                           ],
                                         ),
                                         Row(
                                           mainAxisAlignment:
                                           MainAxisAlignment.spaceBetween,
                                           children: [
                                             const Text(
                                               "Quantity",
                                               maxLines: 1,
                                               style: TextStyle(
                                                   color: Colors.grey,
                                                   fontSize: 14,
                                                   fontWeight: FontWeight.bold),
                                             ),
                                             Text(
                                               "${controller.cartProducts[index]
                                                   .quantity}",
                                               maxLines: 1,
                                               style: const TextStyle(
                                                   color: Colors.grey,
                                                   fontSize: 14,
                                                   fontWeight: FontWeight.bold),
                                             ),
                                           ],
                                         )
                                       ],
                                     ),
                                   )),
                             ]),

                           ),
                           const SizedBox(height: 16,),
                         ],
                       );
                     }) : const Center(child: Text("No Item Found"),),

             ),
             Container(
               padding: const EdgeInsets.all(16),
               width: double.maxFinite,
               color: Colors.blue,
               child: Center(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [

                           Text(
                             "Total items: ${controller.cartProducts.length}",
                             style: const TextStyle(
                                 color: Colors.white,
                                 fontSize: 14,
                                 fontWeight: FontWeight.bold),
                           ),

                           Text(
                             "Grand Total: ${controller.total}",
                             style: const TextStyle(
                                 color: Colors.white,
                                 fontSize: 14,
                                 fontWeight: FontWeight.bold),
                           ),
                     ],
                   )),
             )
           ],
         ),
       ),
     );
   });
  }


}
