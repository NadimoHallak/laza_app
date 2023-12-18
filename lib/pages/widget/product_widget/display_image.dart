
import 'package:flutter/material.dart';
import 'package:laza/pages/product_page.dart';

class DisplayImagesWithListViewBuilder extends StatelessWidget {
  const DisplayImagesWithListViewBuilder({
    super.key,
    required this.widget,
  });

  final ProductPage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: SizedBox(
        height: 90,
        width: 280,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.product.images.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // height: 100,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.product.images[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}