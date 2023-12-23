import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:laza/config/getit.dart';
import 'package:laza/model/product_model.dart';
import 'package:laza/pages/update_page.dart';
import 'package:laza/service/product_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CrudPage extends StatefulWidget {
  CrudPage({super.key});

  @override
  State<CrudPage> createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty || value.trim() == "") {
                      config
                          .get<SharedPreferences>()
                          .setString("SerchCrud", "");
                    } else {
                      config
                          .get<SharedPreferences>()
                          .setString("SerchCrud", value);
                    }

                    print(
                        config.get<SharedPreferences>().getString("SerchCrud"));
                  });
                },
                decoration: InputDecoration(
                  hintText: "Serch",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: FutureBuilder(
              future: ProductServiceImp().serchProduct(
                  config.get<SharedPreferences>().getString("SerchCrud") ?? ""),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  dynamic temp = snapshot.data;
                  List<Product> crudProducts = List.generate(
                      temp['products'].length,
                      (index) => Product.fromMap(temp['products'][index]));
                  return ListView.builder(
                    itemCount: crudProducts.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                ProductServiceImp().deleteProduct(
                                    crudProducts[index].id.toString());

                                setState(() {
                                  crudProducts.removeWhere(
                                    (element) =>
                                        element.title ==
                                        crudProducts[index].title,
                                  );
                                });
                              },
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              // label: 'Delete',
                            ),
                            SlidableAction(
                              onPressed: (context) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateProductPage(product: crudProducts[index],),
                                  ),
                                );
                              },
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                              icon: Icons.update,
                              // label: 'Update',
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(crudProducts[index].title),
                          leading: Image.network(crudProducts[index].thumbnail),
                        ),
                      );
                    },
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Center(
                    child: Text('connection is Faile'),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
