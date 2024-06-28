import 'package:flutter/material.dart';
import 'package:graduation_project/ui/constant.dart';
import 'package:graduation_project/ui/widgets/wordsStyle.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});
  final Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: const Alignment(0, 0.75),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: mainColor,
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 160),
          child: Text(
            text,
            style: wordStyle(),
          ),
        ),
      ),
    );
  }
}
