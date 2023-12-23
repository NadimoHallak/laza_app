import 'package:flutter/material.dart';
import 'package:laza/model/request_product.dart';
import 'package:laza/pages/widget/adress_page/text_form_field.dart';
import 'package:laza/service/product_service.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});
  GlobalKey<FormState> addFormKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController discountPercentage = TextEditingController();
  TextEditingController rating = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController thumbnail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          if (addFormKey.currentState!.validate()) {
            RequestProduct reqPro = RequestProduct(
              title: title.text,
              description: description.text,
              price: num.parse(price.text),
              discountPercentage: num.parse(discountPercentage.text),
              rating: num.parse(rating.text),
              stock: num.parse(stock.text),
              brand: brand.text,
              category: category.text,
              thumbnail: thumbnail.text,
              images: [],
            );
            ProductServiceImp().createProduct(reqPro);
          }
        },
        child: Container(
          height: 60,
          width: double.maxFinite,
          color: const Color(0xFF9775FA),
          child: const Center(
            child: Text(
              'Add',
              style: TextStyle(
                color: Color(0xFFFEFEFE),
                fontSize: 17,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0.06,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Add A Product"),
      ),
      body: Form(
        key: addFormKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MytextFormField(
                validator: (value) => validate(value),
                hintTxt: 'title',
                controller: title,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MytextFormField(
                hintTxt: 'description',
                controller: description,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MytextFormField(
                validator: (value) => validate(value),
                hintTxt: 'price',
                controller: price,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MytextFormField(
                hintTxt: 'discountPercentage',
                controller: discountPercentage,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MytextFormField(
                validator: (value) => validate(value),
                hintTxt: 'rating',
                controller: rating,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MytextFormField(
                validator: (value) => validate(value),
                hintTxt: 'stock',
                controller: stock,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MytextFormField(
                hintTxt: 'brand',
                controller: brand,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MytextFormField(
                validator: (value) => validate(value),
                hintTxt: 'category',
                controller: category,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MytextFormField(
                validator: (value) => validate(value),
                hintTxt: 'thumbnail',
                controller: thumbnail,
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

validate(String? value) {
  if (value!.isEmpty || value.trim() == '') {
    return "Enter info";
  }
}