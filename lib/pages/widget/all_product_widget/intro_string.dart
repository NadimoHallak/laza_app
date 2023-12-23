import 'package:flutter/material.dart';
import 'package:laza/config/getit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroString extends StatelessWidget {
  const IntroString({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 8.0, bottom: 2.0),
          child: Text(
            'Hello ${config.get<SharedPreferences>().getString('username')}',
            style: const TextStyle(
              color: Color(0xFF1D1E20),
              fontSize: 28,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 4.0, left: 20.0, bottom: 2.0),
          child: Text(
            'Welcome to Laza.',
            style: TextStyle(
              color: Color(0xFF8F959E),
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
