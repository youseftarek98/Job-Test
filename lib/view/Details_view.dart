
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_one/model/product_data_list.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return   Material(
                child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Hero(
                                tag: product.imageLink.toString(),
                                child: Container(
                                  width: double.infinity,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: NetworkImage(product.imageLink.toString()),
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
                                          product.name ,
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
                                      " ${product.brand.toString()}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    Text(
                                      "\$${product.price.toString()}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        Text(
                                          " ${product.rating.toString()}",
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
                                          product.description.toString(),
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
                                  child: checkoutSection(context , product.price.toString()) ,
                                  /*
                                  Container(
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
                                              "\$ ${product.price.toString()}" ,
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

                                   */
                                )

                              ],
                            ),
                          ),
                        )
                      ],
                    )
                ),
              ) ;
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
                        product.imageLink.toString()),
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
                        product.name.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Text(
                          product.description.toString()
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
                            " ${product.brand.toString()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic
                            ),
                          ),
                          Text(
                            "\$${product.price.toString()}",
                            style: const TextStyle(
                              fontStyle: FontStyle.italic ,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                " ${product.rating.toString()}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic
                                ),
                              ),
                              const Icon(Icons.star , color: Colors.amber,)
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
    )
    ;
  }

  Widget checkoutSection(BuildContext context, String subtotal) {

    return Container(
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
              Text( "\$ ${product.price.toString()}",
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
        ));
  }
}