
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.categorys,
  });

  final List categorys;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categorys.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEEEE),
                    borderRadius:
                        BorderRadius.circular(10)),
                width: 100,
                child: Center(
                  child: Text(
                    categorys[index],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF1D1E20),
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
