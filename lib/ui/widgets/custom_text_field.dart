import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  CustomTextFromField(
      {this.hintText,
      this.keyboardType,
      this.onChange,
      this.obscre = false,
      this.preIcone,
      this.suffIcon});
  final String? hintText;
  Function(String)? onChange;
  bool obscre;
  IconButton? suffIcon;
  Icon? preIcone;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscre,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required 🧐';
        }
      },
      keyboardType: keyboardType,
      onChanged: onChange,
      decoration: InputDecoration(
          suffixIcon: suffIcon,
          prefixIcon: preIcone,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          hintStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          )),
    );
  }
}
