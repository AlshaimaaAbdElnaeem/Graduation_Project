import 'package:flutter/material.dart';

class ViewPage1 extends StatelessWidget {
  const ViewPage1({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
             img,
            ),
            fit: BoxFit.fill,
          )),
        ),
      ],
    );
  }
}
