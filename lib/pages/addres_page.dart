import 'package:flutter/material.dart';
import 'package:laza/pages/widget/adress_page/text_form_field.dart';

class AdressPage extends StatelessWidget {
  AdressPage({super.key});
  GlobalKey<FormState> adressFormKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        width: double.maxFinite,
        color: const Color(0xFF9775FA),
        child: const Center(
          child: Text(
            'Save Address',
            style: TextStyle(
              color: Color(0xFFFEFEFE),
              fontSize: 17,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Address',
          style: TextStyle(
            color: Color(0xFF1D1E20),
            fontSize: 17,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: adressFormKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormTitle(title: 'Name'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MytextFormField(
                hintTxt: "Mrh Raju",
                controller: name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormTitle(title: 'Country'),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        width: 180,
                        child: MytextFormField(
                          hintTxt: "Bangladesh",
                          controller: country,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormTitle(title: 'City'),
                      Container(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        width: 180,
                        child: MytextFormField(
                          hintTxt: "Sylhet",
                          controller: city,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextFormTitle(title: 'Phone Number'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MytextFormField(
                hintTxt: "+880 1453-987533",
                controller: phoneNumber,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: TextFormTitle(title: 'Address'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MytextFormField(
                hintTxt: "Chhatak, Sunamgonj 12/8AB",
                controller: address,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: const Text(
                      'Save as primary address',
                      style: TextStyle(
                        color: Color(0xFF1D1E20),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0.07,
                      ),
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (bool value) {},
                    activeColor: Colors.green,
                    trackColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.green;
                      }
                      return Colors.green;
                    }),
                    thumbColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.white;
                      }
                      return Colors.white;
                    }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextFormTitle extends StatelessWidget {
  TextFormTitle({
    super.key,
    required this.title,
  });
  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, bottom: 5),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF1D1E20),
          fontSize: 17,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
