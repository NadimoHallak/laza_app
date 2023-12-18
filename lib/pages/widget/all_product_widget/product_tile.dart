import 'package:flutter/material.dart';
import 'package:laza/model/product_model.dart';

class ProductTile extends StatelessWidget {
  ProductTile({
    super.key,
    required this.products,
    required this.index,
  });

  final List<Product> products;

  int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: index,
          child: Container(
            height: 203,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(products[index].thumbnail),
                  fit: BoxFit.cover),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
          child: Text(
            products[index].description,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              color: Color(0xFF1D1E20),
              fontSize: 11,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '${products[index].price} \$',
            style: TextStyle(
              color: Color(0xFF1D1E20),
              fontSize: 13,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
