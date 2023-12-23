import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laza/config/getit.dart';
import 'package:laza/pages/all_page.dart';
import 'package:laza/service/product_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () async {
          if (formKey.currentState!.validate()) {
            dynamic temp =
                await ProductServiceImp().login(username.text, password.text);
            config
                .get<SharedPreferences>()
                .setString('token4', await temp['token']);
            config
                .get<SharedPreferences>()
                .setString("username", username.text);
            if (config.get<SharedPreferences>().getString('token4') != null) {
              // ignore: use_build_context_synchronously
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllProductPage()));
            } else {
              print("null");
            }
          }
        },
        child: Container(
          height: 60,
          width: double.maxFinite,
          color: const Color(0xFF9775FA),
          child: const Center(
            child: Text(
              'Login',
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
      body: Form(
          key: formKey,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 30, bottom: 140),
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: Color(0xFF1D1E20),
                        fontSize: 28,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Please enter your data to continue',
                      style: TextStyle(
                        color: Color(0xFF8F959E),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 335,
                  child: TextFormField(
                    controller: username,
                    decoration: const InputDecoration(labelText: "Username"),
                    validator: (value) {
                      if (value!.isEmpty || value.trim() == '') {
                        return 'Enter your info';
                      } else if (value.length < 3) {
                        return 'your username is very short';
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 335,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.trim() == '') {
                        return 'Enter your info';
                      } else if (value.length < 6) {
                        return 'your password is very short';
                      }
                    },
                    controller: password,
                    decoration: const InputDecoration(labelText: "Password"),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Color(0xFFEA4335),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 120),
                child: SizedBox(
                  width: 326,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'By connecting your account confirm that you agree with our ',
                          style: TextStyle(
                            color: Color(0xFF8F959E),
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Term and Condition',
                          style: TextStyle(
                            color: Color(0xFF1D1E20),
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
