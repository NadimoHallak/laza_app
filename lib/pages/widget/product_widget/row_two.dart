import 'package:flutter/material.dart';
import 'package:laza/pages/product_page.dart';

class RowTwo extends StatelessWidget {
  const RowTwo({
    super.key,
    required this.widget,
  });

  final ProductPage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.product.brand,
            style: const TextStyle(
              color: Color(0xFF1D1E20),
              fontSize: 22,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '${widget.product.price} \$',
            style: const TextStyle(
              color: Color(0xFF1D1E20),
              fontSize: 22,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0.05,
            ),
          ),
        ],
      ),
    );
  }
}