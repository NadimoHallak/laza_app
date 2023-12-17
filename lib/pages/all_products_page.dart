import 'package:flutter/material.dart';
import 'package:laza/model/product_model.dart';
import 'package:laza/pages/product_page.dart';
import 'package:laza/pages/widget/category-tile.dart';
import 'package:laza/pages/widget/product_tile.dart';
import 'package:laza/pages/widget/serch_widget.dart';
import 'package:laza/service/product_service.dart';

class AllProductPage extends StatelessWidget {
  const AllProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.shopping_bag_rounded),
        ],
      ),
      body: FutureBuilder(
          future: ProductServiceImp().getAllProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              dynamic temp = snapshot.data['products'];
              List<Product> products = List.generate(
                  temp.length, (index) => Product.fromMap(temp[index]));

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Hello',
                      style: TextStyle(
                        color: Color(0xFF1D1E20),
                        fontSize: 28,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Welcome to Laza.',
                      style: TextStyle(
                        color: Color(0xFF8F959E),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SerchWidget(),
                  const Text(
                    'Choose Brand',
                    style: TextStyle(
                      color: Color(0xFF1D1E20),
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  FutureBuilder(
                      future: ProductServiceImp().getcategory(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          dynamic temp = snapshot.data;
                          List categorys = temp;
                          return CategoryTile(categorys: categorys);
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                  SizedBox(
                    height: 400,
                    child: GridView.builder(
                      padding:
                          const EdgeInsets.only(right: 10, left: 10, top: 10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        childAspectRatio: 10 / 19,
                        crossAxisSpacing: 15,
                        // mainAxisExtent: 150,
                      ),
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductPage(
                                  product: products[index],
                                  index: index,
                                ),
                              ),
                            );
                          },
                          child: ProductTile(
                            products: products,
                            index: index,
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
