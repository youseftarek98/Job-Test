import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:test_one/controller/product_controller.dart';


import 'Details_view.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        bottom: PreferredSize(
            preferredSize:   const Size.fromHeight(150),
            child: Stack(
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.only(top: 20 , left: 12) ,
                        child: Card(
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            // padding: EdgeInsets.only(left: 50, top:29 ),

                            decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: IconButton(
                                onPressed: () {
                                  // Get.back() ;
                                },
                                icon: const Icon(
                                  Icons.grid_view,
                                  color: Colors.black26,
                                )),
                          ),
                        )
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 250),
                  width: double.infinity,
                  alignment: Alignment.topRight,
                  height: 205,
                  decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            blurRadius: 5,
                            spreadRadius: 4,
                            offset: Offset(-2, -1))
                      ]),
                  child:   Padding(padding: const EdgeInsets.only(top: 20 , right: 12) ,
                      child: Card(
                        shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(10.0)),
                        elevation: 3.0,
                        child: Container(
                          // padding: EdgeInsets.only(left: 50, top:29 ),

                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: IconButton(
                              onPressed: () {
                                // Get.back() ;
                              },
                              icon: const Icon(
                                Icons.filter_list,
                                color: Colors.black26,
                              )),
                        ),
                      )
                  ) ,



                ),
                Container(
                  margin: const EdgeInsets.only(left: 25, top: 90, right: 25),
                  //  color: Colors.red,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      // border: Border(left: BorderSide(color: Colors.white) ) ,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 2,
                          spreadRadius: 2,
                          //offset: Offset(-2 , -1)
                        )
                      ]),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(
                          Icons.mic_none_outlined,
                          color: Colors.black,
                        )),
                  ),
                ) ,
                Container(
                  margin: const EdgeInsets.only(left: 25, top: 170, right: 25),
                  //  color: Colors.red,
                  //width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      // border: Border(left: BorderSide(color: Colors.white) ) ,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 2,
                          spreadRadius: 2,
                          //offset: Offset(-2 , -1)
                        )
                      ]),
                  child: const Text("Popular Category" ,
                    style:  TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator(color: Colors.amber,));
              } else {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 1,
                  itemCount: productController.productList.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
              }
            }),
          )
        ],
      ),
    );
  }
}