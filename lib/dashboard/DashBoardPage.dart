import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical/dashboard/DashBoardController.dart';
import '../Constants/Routes.dart';

class DashBoardPage extends StatelessWidget {
   const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (DashBoardController controller) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Shopping Mall"),
            centerTitle: true,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    height: 150.0,
                    width: 30.0,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.routeCart)!.then((value){
                          controller.getCartTotalItems();
                        });
                      },
                      child:  Stack(
                          children: <Widget>[
                            const IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              onPressed: null,
                            ),
                            controller.cartSize==0
                                ? const SizedBox()
                                : Positioned(
                                    child: Stack(
                                    children: <Widget>[
                                      Icon(Icons.brightness_1,
                                          size: 20.0, color: Colors.green[800]),
                                      Positioned(
                                          top: 3.0,
                                          right: 4.0,
                                          child: Center(
                                            child: Text(
                                              controller.cartSize
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                    ],
                                  )),
                          ],
                        ),

                    )),
              )
            ],
          ),
          body: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (!controller.isLoading) {
                if (scrollNotification.metrics.pixels ==
                    scrollNotification.metrics.maxScrollExtent) {
                  controller.isLoading = true;
                  controller.pageNumber += 1;
                  controller.getData();
                }
              }
              return true;
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child:  GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  // childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16),
                          itemCount: controller.myProducts.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.insert(controller.myProducts[index]);
                              },
                              child: Card(
                                margin: const EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(8.0),
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ), // if you need this
                                  side: BorderSide(
                                    color: Colors.grey.withOpacity(0.2),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        width: double.maxFinite,
                                        child: CachedNetworkImage(
                                          imageUrl: controller
                                              .myProducts[index].featuredImage!,
                                          placeholder: (context, url) =>
                                              Container(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.only(left: 8),
                                        width: double.maxFinite,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                controller
                                                    .myProducts[index].title!,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const IconButton(
                                              icon: Icon(
                                                Icons.shopping_cart,
                                                color: Colors.grey,
                                              ),
                                              onPressed: null,
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            );
                          }),

                  ),
                ),
                 controller.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
