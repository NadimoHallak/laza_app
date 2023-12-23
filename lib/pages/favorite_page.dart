import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laza/pages/product_page.dart';
import 'package:laza/pages/widget/all_product_widget/product_tile.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          childAspectRatio: 10 / 19,
          crossAxisSpacing: 15,
          // mainAxisExtent: 150,
        ),
        itemCount: favorite.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    product: favorite[index],
                    index: index,
                  ),
                ),
              );
            },
            child: ProductTile(
              products: favorite,
              index: index,
            ),
          );
        },
      ),
    );
  }
}
