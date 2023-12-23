import 'package:flutter/material.dart';
import 'package:laza/config/getit.dart';
import 'package:laza/pages/add_page.dart';
import 'package:laza/pages/addres_page.dart';
import 'package:laza/pages/all_page.dart';
import 'package:laza/pages/login.dart';
import 'package:laza/pages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
