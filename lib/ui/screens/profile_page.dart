
import 'package:flutter/material.dart';
import 'package:graduation_project/ui/constant.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {
  Color editProfileBorderColor = Colors.grey.shade800; // For Edit Profile button
  Color numberBorderColor = Colors.grey.shade800; // For Number button
  Color emailBorderColor = Colors.grey.shade800; // For Email button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);

           
          },
        ),
        title:const Text(
          'My Profile',
          style: TextStyle(
            color: mainColor,
            fontSize: 25,
            fontFamily: 'font1',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 200,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        height: 160.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image:AssetImage('assets/images/first.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 64.0,
                      backgroundColor: Theme
                          .of(context)
                          .scaffoldBackgroundColor,
                      child:const CircleAvatar(
                        radius: 60.0,
                        backgroundImage:AssetImage('assets/images/person.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
             const SizedBox(
                height: 15.0,
              ),
              const Text(
                  'Amira Ezzat',
                  style: TextStyle(
                      fontSize: 22
                  )
              ),
             const SizedBox(
                height: 40,
              ),

              Align(
                alignment: AlignmentDirectional.topStart,
                child: GestureDetector(
                  onTap: () {
                  },
                  onTapDown: (_) {
                    setState(() {
                      editProfileBorderColor = mainColor; // Change color here
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      editProfileBorderColor = Colors.grey.shade800;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      editProfileBorderColor = Colors.grey.shade800;
                    });
                  },
                  child: Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: editProfileBorderColor, // Use the specific borderColor variable
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child:const  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(width: 12.0),
                        Text(
                          'Edit Profile',
                          
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                         // color: Colors.grey[700],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

             const SizedBox(
                height: 20,
              ),

              Align(
                alignment: AlignmentDirectional.topStart,
                child: GestureDetector(
                  onTap: () {
                  
                  },
                  onTapDown: (_) {
                    setState(() {
                      numberBorderColor = Colors.grey.shade800; // Reset color
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      numberBorderColor = Colors.grey.shade800;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      numberBorderColor = Colors.grey.shade800;
                    });
                  },
                  child: Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: numberBorderColor,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                      
                        SizedBox(width: 12.0),
                        Text(
                          'Number',
                         
                        ),
                         Spacer(),

                      ],
                    ),
                  ),
                ),
              ),

             const SizedBox(
                height: 20,
              ),

              Align(
                alignment: AlignmentDirectional.topStart,
                child: GestureDetector(
                  onTap: () {
                    // Handle Email button tap
                  },
                  onTapDown: (_) {
                    setState(() {
                      emailBorderColor = mainColor; // Reset color
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      emailBorderColor = Colors.grey.shade800;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      emailBorderColor = Colors.grey.shade800;
                    });
                  },
                  child: Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: emailBorderColor,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                         Icon(Icons.email_outlined, color: Colors.grey),
                        SizedBox(width: 12.0),
                        Text(
                          'Email',
                         
                        ),
                        Spacer(),

                      ],
                    ),
                  ),
                ),
              ),

              // ... (rest of the code)
            ],
          ),
        ),
      ),
    );
  }
}