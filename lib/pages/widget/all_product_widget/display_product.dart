import 'package:flutter/material.dart';
import 'package:laza/config/getit.dart';
import 'package:laza/model/product_model.dart';
import 'package:laza/pages/product_page.dart';
import 'package:laza/pages/widget/all_product_widget/display_category.dart';
import 'package:laza/pages/widget/all_product_widget/intro_string.dart';
import 'package:laza/pages/widget/all_product_widget/product_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayProduct extends StatefulWidget {
  const DisplayProduct({
    super.key,
    required this.serchResult,
    required this.products,
  });

  final List<Product> serchResult;
  final List<Product> products;

  @override
  State<DisplayProduct> createState() => _DisplayProductState();
}

class _DisplayProductState extends State<DisplayProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const IntroString(),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 260,
                  child: InkWell(
                    onTap: () {
                      print("object");
                    },
                    child: TextField(
                      enabled: false,
                      onChanged: (value) {
                        config
                            .get<SharedPreferences>()
                            .setString("Serch", value);
                        setState(() {
                          widget.serchResult.clear();
                          for (var element in widget.products) {
                            if (element.title.contains(value)) {
                              widget.serchResult.add(element);
                            }
                          }
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: Icon(Icons.search_rounded),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF9775FA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.record_voice_over,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Choose Brand',
            style: TextStyle(
              color: Color(0xFF1D1E20),
              fontSize: 17,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const DisplayCategory(),
        SizedBox(
          height: 300,
          child: GridView.builder(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              childAspectRatio: 10 / 19,
              crossAxisSpacing: 15,
              // mainAxisExtent: 150,
            ),
            itemCount: widget.serchResult.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(
                        product: widget.serchResult[index],
                        index: index,
                      ),
                    ),
                  );
                },
                child: ProductTile(
                  products: widget.serchResult,
                  index: index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
