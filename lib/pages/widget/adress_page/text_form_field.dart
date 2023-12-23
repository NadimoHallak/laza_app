import 'package:flutter/material.dart';

class MytextFormField extends StatelessWidget {
  MytextFormField(
      {super.key,
      required this.hintTxt,
      required this.controller,
      this.keyboardType,
      this.validator
      });
  String hintTxt;
  TextEditingController controller;
  TextInputType? keyboardType = TextInputType.text;
  String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            color: Color(0xFFF5F6FA),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            color: Color(0xFFF5F6FA),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            color: Color(0xFFF5F6FA),
          ),
        ),
        filled: true,
        fillColor: const Color(0xFFF5F6FA),
        hintText: hintTxt,
      ),
    );
  }
}
