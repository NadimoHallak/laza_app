import 'package:flutter/material.dart';
import 'package:laza/config/getit.dart';
import 'package:laza/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SerchWidget extends StatefulWidget {
  SerchWidget({super.key, required this.serchResults, required this.products});
  List<Product> serchResults;
  List<Product> products;
  @override
  State<SerchWidget> createState() => _SerchWidgetState();
}

class _SerchWidgetState extends State<SerchWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 260,
            child: TextField(
              onChanged: (value) {
                config.get<SharedPreferences>().setString("Serch", value);
                setState(() {
                  widget.serchResults.clear();
                  for (var element in widget.products) {
                    if (element.title.contains(value)) {
                      widget.serchResults.add(element);
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
                Icons.search_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
