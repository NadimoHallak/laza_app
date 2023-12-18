import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laza/model/product_model.dart';
import 'package:laza/pages/widget/product_widget/display_image.dart';
import 'package:laza/pages/widget/product_widget/row_one.dart';
import 'package:laza/pages/widget/product_widget/row_three.dart';
import 'package:laza/pages/widget/product_widget/row_two.dart';
import 'package:laza/pages/widget/product_widget/sliver_app_bar.dart';

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
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        MySliverAppBar(widget: widget),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              RowOne(widget: widget),
              RowTwo(widget: widget),
              DisplayImagesWithListViewBuilder(widget: widget),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: Color(0xFF1D1E20),
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Text(
                  widget.product.description,
                  style: const TextStyle(
                    color: Color(0xFF8F959E),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const RowThree(),
              const SizedBox(
                height: 400,
              )
            ],
          ),
        ),
      ],
    ));
  }
}






// List<String> size = [
//   "S",
//   "M",
//   "L",
//   "XL",
//   "2XL",
// ];
