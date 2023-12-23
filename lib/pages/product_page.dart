import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Text(
                  'Reviews',
                  style: TextStyle(
                    color: Color(0xFF1D1E20),
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                  Container(
                    height: 40,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ronald Richards',
                          style: TextStyle(
                            color: Color(0xFF1D1E20),
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '13 Sep, 2020',
                          style: TextStyle(
                            color: Color(0xFF8F959E),
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Container(
                      height: 40,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.product.rating.toString(),
                                style: const TextStyle(
                                  color: Color(0xFF1D1E20),
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Text(
                                ' rating',
                                style: TextStyle(
                                  color: Color(0xFF8F959E),
                                  fontSize: 11,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       // width: 20,
                          //       // height: 20,
                          //       child: RatingBar.builder(
                          //         initialRating: 3,
                          //         minRating: 1,
                          //         direction: Axis.horizontal,
                          //         allowHalfRating: true,
                          //         itemCount: 5,
                          //         // itemPadding:
                          //         //     EdgeInsets.symmetric(horizontal: 4.0),
                          //         itemBuilder: (context, _) => Icon(
                          //           Icons.star,
                          //           color: Colors.amber,
                          //           size: 0.4,
                          //         ),
                          //         onRatingUpdate: (rating) {
                          //           print(rating);
                          //         },
                          //       ),
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
