
import 'package:flutter/material.dart';
import 'package:laza/pages/product_page.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({
    super.key,
    required this.widget,
  });

  final ProductPage widget;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      stretchTriggerOffset: 300.0,
      expandedHeight: 300.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: widget.index,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.product.thumbnail),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}