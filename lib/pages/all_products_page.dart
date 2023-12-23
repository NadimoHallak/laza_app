import 'package:flutter/material.dart';
import 'package:laza/model/product_model.dart';
import 'package:laza/pages/widget/all_product_widget/display_product.dart';
import 'package:laza/service/product_service.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ProductServiceImp().getAllProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data['products'];
            List<Product> products = List.generate(
                temp.length, (index) => Product.fromMap(temp[index]));
            List<Product> serchResult = [];
            return DisplayProduct(serchResult: serchResult, products: products);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("No Connection"),
            );
          } else {
            return const Center(
              child: Text("Error"),
            );
          }
        });
  }
}
