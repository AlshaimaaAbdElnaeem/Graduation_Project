import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/data/cubit/logincubit/loginStatus.dart';
import 'package:graduation_project/data/cubit/logincubit/logincubit.dart';
import 'package:graduation_project/helper/show_snack_bar.dart';
import 'package:graduation_project/router/constant_go_router.dart';
import 'package:graduation_project/ui/widgets/custom_button.dart';
import 'package:graduation_project/ui/widgets/custom_text_field.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool isHidden = true;
  String? password;
  String? email;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInCubit, LogInState>(builder: (context, state) {
      var userData = BlocProvider.of<LogInCubit>(context);
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  "assets/images/login-security.gif",
                  height: 250,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 20),
                ),
                CustomTextFromField(
                  hintText: 'Email',
                  preIcone: const Icon(Icons.email),
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
                    password = data;
                  },
                  hintText: 'Password',
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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 220),
                  child: GestureDetector(
                    child: const Text(
                      'Forget Password ?',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'LogIn',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      userData.login(email!, password!);
                      if (state is LoginSuccessfully) {
                        showSnackBar(context, 'Success');
                      } else if (state is WrongPassword) {
                        showSnackBar(context, 'Your Password is incorrect');
                      } else if (state is UserNotFound) {
                        showSnackBar(context, 'No user found for that email.');
                      } else if (state is AnotherError) {
                        showSnackBar(context, state.errorMessage);
                      }
                    }
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'don\'t have an account ? ',
                    ),
                    GestureDetector(
                        onTap: () {
                          context.go(registerPage);
                        },
                        child: const Text(
                          ' Register',
                          style: TextStyle(color: Color(0xff5fcf80)),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
