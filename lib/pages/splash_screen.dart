import 'package:flutter/material.dart';
import 'package:laza/config/getit.dart';
import 'package:laza/pages/all_page.dart';
import 'package:laza/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 4),
      () {
        if (config.get<SharedPreferences>().getString('token4') == ' ') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AllProductPage()));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9775FA),
      body: Center(
        child: Image.asset('assets/Logo.png'),
      ),
    );
  }
}
