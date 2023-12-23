import 'package:flutter/material.dart';
import 'package:laza/config/getit.dart';
import 'package:laza/model/product_model.dart';
import 'package:laza/pages/add_page.dart';
import 'package:laza/pages/addres_page.dart';
import 'package:laza/pages/all_products_page.dart';
import 'package:laza/pages/crud_page.dart';
import 'package:laza/pages/favorite_page.dart';
import 'package:laza/pages/product_page.dart';
import 'package:laza/pages/splash_screen.dart';
import 'package:laza/pages/widget/all_product_widget/category-tile.dart';
import 'package:laza/pages/widget/all_product_widget/display_category.dart';
import 'package:laza/pages/widget/all_product_widget/display_product.dart';
import 'package:laza/pages/widget/all_product_widget/intro_string.dart';
import 'package:laza/pages/widget/all_product_widget/product_tile.dart';
import 'package:laza/pages/widget/all_product_widget/serch_widget.dart';

import 'package:laza/service/product_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllProductPage extends StatefulWidget {
  AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 200,
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                config.get<SharedPreferences>().setString('token4', ' ');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SplashScreen()));
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.deepPurple,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdressPage()));
              },
              icon: const Icon(
                Icons.pages,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: const [
          Icon(Icons.shopping_bag_rounded),
        ],
      ),
      body: [
        const AllProduct(),
        const FavoritePage(),
        CrudPage(),
        AddProductPage(),
      ][currentIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedIndex: currentIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          NavigationDestination(
            icon: Icon(Icons.delete),
            label: 'U & D',
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
        ],
      ),
    );
  }
}
