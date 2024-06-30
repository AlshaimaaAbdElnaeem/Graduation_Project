import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/data/cubit/registercubit/registercubit.dart';
import 'package:graduation_project/data/cubit/registercubit/registerstatus.dart';
import 'package:graduation_project/helper/show_snack_bar.dart';
import 'package:graduation_project/router/constant_go_router.dart';
import 'package:graduation_project/ui/constant.dart';
import 'package:graduation_project/ui/widgets/custom_button.dart';
import 'package:graduation_project/ui/widgets/custom_text_field.dart';
import 'package:graduation_project/util/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  bool isHidden = true;

  String? password;
  String? name;
  String? phoneNumber;
  String? email;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  List<String> options = ['Teacher', 'Student'];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        var userData = BlocProvider.of<RegisterCubit>(context);
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: 60,
                                  backgroundImage: MemoryImage(_image!),
                                )
                              : const CircleAvatar(
                                  radius: 60,
                                  backgroundImage: AssetImage(
                                    'assets/images/person.jpg',
                                  ),
                                ),
                          Positioned(
                            left: 80,
                            bottom: -10,
                            child: IconButton(
                                onPressed: selectImage,
                                icon: const Icon(Icons.add_a_photo)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Name',
                      style: TextStyle(fontSize: 20),
                    ),
                    CustomTextFromField(
                      hintText: 'Enter your name',
                      preIcone: const Icon(Icons.person),
                      onChange: (data) {
                        userData.name = data.toString();
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(fontSize: 20),
                    ),
                    CustomTextFromField(
                      onChange: (data) {
                        userData.email = data.toString();
                      },
                      hintText: 'Enter your Email',
                      preIcone: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(fontSize: 20),
                    ),
                    CustomTextFromField(
                      onChange: (data) {
                        userData.password = data.toString();
                      },
                      hintText: 'Enter Password',
                      obscre: isHidden,
                      preIcone: const Icon(Icons.key),
                      suffIcon: isHidden == true
                          ? IconButton(
                              onPressed: () {
                                isHidden = false;
                                setState(() {});
                              },
                              icon: const Icon(Icons.visibility_off))
                          : IconButton(
                              onPressed: () {
                                isHidden = true;
                                setState(() {});
                              },
                              icon: const Icon(Icons.visibility)),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      'Phone Number',
                      style: TextStyle(fontSize: 20),
                    ),
                    CustomTextFromField(
                      hintText: 'Enter your phone number',
                      keyboardType: TextInputType.number,
                      onChange: (data) {
                       userData.phone = data.toString();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text('Teacher'),
                        Radio(
                          value: options[0],
                          groupValue: userData.selectPerson,
                          onChanged: (value) {
                            setState(() {
                              userData.selectPerson = value.toString();
                            });
                          },
                        ),
                        const Text('Student'),
                        Radio(
                          value: options[1],
                          groupValue: userData.selectPerson,
                          onChanged: (value) {
                            setState(() {
                              setState(() {
                                userData.selectPerson = value.toString();
                              });
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    CustomButton(
                      text: 'Register',
                      onTap: () {
                        setState(() {
                            isLoading = true;
                          });
                        if (formKey.currentState!.validate()) {

                          userData.authentication();
                          userData.storagePersonData();
                          setState(() {
                            isLoading = false;
                          });
                          if (state is RegisterationSuccess) {
                            showSnackBar(context, 'Success');
                            if (userData.selectPerson == 'Teacher') {
                              context.go(teacherPage);
                            } else if (userData.selectPerson == 'Student') {
                              context.go(studentPage);
                            }
                          } else if (state is WeakPassword) {
                            showSnackBar(context, 'Password Weak');
                          } else if (state is EmailExist) {
                            showSnackBar(context,
                                'The account already exists for that email.');
                          } else if (state is AnotherError) {
                            showSnackBar(context, state.errorMessage);
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          ' Have an account ? ',
                          style: TextStyle(),
                        ),
                        GestureDetector(
                            onTap: () {
                              context.go(logInPage);
                            },
                            child: const Text(
                              ' LogIn',
                              style: TextStyle(color: mainColor),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
