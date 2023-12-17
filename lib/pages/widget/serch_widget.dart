import 'package:flutter/material.dart';

class SerchWidget extends StatelessWidget {
  const SerchWidget({
    super.key,
  });

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
