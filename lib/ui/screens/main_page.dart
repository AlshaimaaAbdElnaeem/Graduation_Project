import 'package:flutter/material.dart';
import 'package:graduation_project/ui/constant.dart';
import 'package:graduation_project/ui/widgets/navegationbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: const Column(),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
