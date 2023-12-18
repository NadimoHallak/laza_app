
import 'package:flutter/material.dart';
import 'package:laza/pages/product_page.dart';

class RowOne extends StatelessWidget {
  const RowOne({
    super.key,
    required this.widget,
  });

  final ProductPage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.product.title,
            style: const TextStyle(
              color: Color(0xFF8F959E),
              fontSize: 13,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const Text(
            'Price',
            style: TextStyle(
              color: Color(0xFF8F959E),
              fontSize: 13,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}