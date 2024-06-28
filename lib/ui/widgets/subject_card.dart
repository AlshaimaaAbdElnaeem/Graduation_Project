import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/router/constant_go_router.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(subjectPage);
      },
      child: SizedBox(
        height: 100,
        child: Card(
          margin: const EdgeInsets.all(8),
          elevation: 1,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 16,
                  top: 8,
                  bottom: 8,
                ),
                child: Image.asset(
                  'assets/images/4.jpg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Arabic',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Mr Ahmed',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
