import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_one/controller/product_controller.dart';


class HomeView extends StatelessWidget {
  final ProductsController productsController = Get.put(ProductsController());

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
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            //_buildTop(),
            //  _buildCategoriesRow(),
            Expanded(
              child: Obx(
                    () {
                  if (productsController.loading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (productsController.products.isEmpty) {
                    return const Center(child: Text("No products found"));
                  } else if (productsController.showGrid.value) {
                    return GridView.builder(
                      padding: const EdgeInsets.only(top: 16),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: productsController.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 0.0,
                          child: Container(
                            height: 150,
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(productsController
                                          .products[index]["image"]),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          productsController.products[index]
                                          ["title"],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Expanded(
                                          child: Text(
                                            productsController.products[index]
                                            ["description"]
                                                .toString()
                                                .substring(1000),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "\$${productsController.products[index]["price"]}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return _buildProductsList();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder _buildProductsList() {
    return FutureBuilder(builder: (_, snap) {
      return ListView.builder(
        itemCount: productsController.products.length,
        padding: const EdgeInsets.only(top: 4),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return  Scaffold (
                    // bottomSheet: checkoutSection(context , ''),
                      body:
                      SingleChildScrollView(
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: Hero(
                                      tag: productsController.products[index]["image"],
                                      child: Container(
                                        width: double.infinity,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          image: DecorationImage(
                                            image: NetworkImage(productsController
                                                .products[index]["image"]),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        child: Row(
                                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(padding: const EdgeInsets.only(top: 20 , left: 10) ,
                                              child:  Container(
                                                // padding: EdgeInsets.only(left: 50, top:29 ),

                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(8.0)
                                                ),
                                                child: IconButton(
                                                    onPressed: () {
                                                      Get.back() ;
                                                    },
                                                    icon: const Icon(
                                                      Icons.arrow_back_ios_outlined,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                            ) ,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ) ,
                                ],
                              ) ,
                              Padding(
                                padding: const EdgeInsets.only(top: 285 , left: 20 , right: 12 , bottom: 10) ,
                                child:  Container(
                                  alignment: Alignment.topCenter,
                                  decoration: const BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25) ,
                                      topRight: Radius.circular(25) ,
                                    ) ,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(padding: const EdgeInsets.only(left: 15 , top: 15 , right: 15) ,
                                              child:    Text(
                                                productsController.products[index]["title"] ,
                                                style: const TextStyle(
                                                    fontSize: 22,
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ) ,
                                      const SizedBox(height: 13,) ,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            " ${productsController.products[index]["category"]}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          Text(
                                            "\$${productsController.products[index]["price"]}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                " ${productsController.products[index]["rating"]['rate']}",
                                                style: const TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Icon(Icons.star_border , color: Colors.amber,)
                                            ],
                                          ) ,
                                          Row(
                                            children: [
                                              Text(
                                                " ${productsController.products[index]["rating"]['count']}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                              const Icon(Icons.perm_identity_rounded , color: Colors.black,)
                                            ],
                                          )
                                        ],
                                      ) ,

                                      Padding(
                                        padding: const EdgeInsets.only(left: 5 , top: 16 , right: 5) ,
                                        child:  Card(

                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                            elevation: 5.0,
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Text(
                                                productsController.products[index]["description"].toString(),
                                                maxLines: 1000,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 17,
                                                ),

                                              ),
                                            )
                                        ),
                                      ) ,

                                      Padding(
                                        padding: const EdgeInsets.only( top: 50) ,
                                        child: Container(
                                            alignment: Alignment.bottomCenter,
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(color: Colors.grey, width: 0.5),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                /// mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "\$${productsController.products[index]["price"]}" ,
                                                    //textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontStyle: FontStyle.italic,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                  const Spacer(),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        gradient: const LinearGradient(colors: [
                                                          Colors.blue,
                                                          Colors.blue,
                                                        ], stops: [
                                                          0.0,
                                                          0.0
                                                        ]),
                                                      ),
                                                      child: Material(
                                                        color: Colors.transparent,
                                                        child: InkWell(
                                                          borderRadius: BorderRadius.circular(30),
                                                          onTap: () async {},
                                                          splashColor: Theme.of(context).splashColor,
                                                          child: const Padding(
                                                            padding: EdgeInsets.all(8.0),
                                                            child: Text(
                                                              'Add A Product',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                  fontStyle: FontStyle.italic,
                                                                  color: Colors.white , //Theme.of(context).textSelectionColor,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.w600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      )

                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                      ) );
                });
          },
          child: Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 5.0,
            child: Container(
              height: 120,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Container(
                    width: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: NetworkImage(
                            productsController.products[index]["image"]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productsController.products[index]["title"],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            child: Text(
                              productsController.products[index]["description"]
                                  .toString()
                                  .substring(50),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontStyle: FontStyle.italic,),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " ${productsController.products[index]["category"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic
                                ),
                              ),
                              Text(
                                "\$${productsController.products[index]["price"]}",
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic ,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    " ${productsController.products[index]["rating"]['rate']}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic
                                    ),
                                  ),
                                  const Icon(Icons.star_border , color: Colors.amber,)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }




  Widget checkoutSection(BuildContext ctx, String subtotal) {
    return ListView.builder(
        itemCount: productsController.products.length,
        padding: const EdgeInsets.only(top: 16),
        itemBuilder: (context, index) =>  Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                /// mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    ' \$ 7.9',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(colors: [
                          Colors.blue,
                          Colors.blueAccent,
                        ], stops: [
                          0.0,
                          0.0
                        ]),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () async {},
                          splashColor: Theme.of(ctx).splashColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Book A Product',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(ctx).textSelectionColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )) );
  }
}
