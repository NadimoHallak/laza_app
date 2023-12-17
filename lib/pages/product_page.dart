import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laza/model/product_model.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key, required this.product, required this.index});
  Product product;
  int index;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
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
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Text("nadim"),
          ]),
        ),
      ],
    ));
  }
}
