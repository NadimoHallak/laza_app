import 'package:flutter/material.dart';
import 'package:laza/model/product_model.dart';

class ProductTile extends StatefulWidget {
  ProductTile({
    super.key,
    required this.products,
    required this.index,
  });

  final List<Product> products;
  int index;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

List<Product> favorite = [];

class _ProductTileState extends State<ProductTile> {
  // bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: widget.index,
          child: Container(
            height: 203,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.products[widget.index].thumbnail),
                fit: BoxFit.cover,
              ),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.products[widget.index].favourit =
                        !widget.products[widget.index].favourit;

                    if (widget.products[widget.index].favourit) {
                      if (favorite.any((element) =>
                          widget.products[widget.index] == element)) {
                        print("Exist");
                      } else {
                        favorite.add(widget.products[widget.index]);
                      }
                    } else {
                      favorite.removeAt(widget.index);
                    }

                    print(favorite);
                  });
                },
                icon: Icon(
                  widget.products[widget.index].favourit
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: widget.products[widget.index].favourit
                      ? Colors.red
                      : null,
                  size: 25,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
          child: Text(
            widget.products[widget.index].description,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              color: Color(0xFF1D1E20),
              fontSize: 11,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '${widget.products[widget.index].price} \$',
            style: TextStyle(
              color: Color(0xFF1D1E20),
              fontSize: 13,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
