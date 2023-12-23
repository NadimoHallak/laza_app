import 'package:flutter/material.dart';
import 'package:laza/pages/widget/all_product_widget/category-tile.dart';
import 'package:laza/service/product_service.dart';

class DisplayCategory extends StatelessWidget {
  const DisplayCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
        });
  }
}