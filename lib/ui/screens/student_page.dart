import 'package:flutter/material.dart';
import 'package:graduation_project/ui/constant.dart';
import 'package:graduation_project/ui/widgets/subject_card.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => SizedBox(
                          width: 50,
                          child: AlertDialog(
                            content: const TextField(
                              cursorColor: mainColor,
                            ),
                            actions: [
                              TextButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                  },
                                  child: const Center(
                                      child: Text(
                                    'ok',
                                    style: TextStyle(
                                        fontSize: 30, color: mainColor),
                                  )))
                            ],
                          ),
                        ));
              },
              icon: const Icon(
                Icons.add_circle_outline,
                size: 40,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        children: const [
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
          SubjectCard(),
        ],
      ),

      // const Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(
      //       'Enter your subject code',
      //       style: TextStyle(fontFamily: 'Pacifico'),
      //     ),
      //     Center(
      //       child: CircleAvatar(
      //         backgroundImage: AssetImage('assets/images/main.jpg'),
      //         radius: 100,
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
