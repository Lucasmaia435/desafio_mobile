import 'package:desafio/core/app_colors.dart';
import 'package:desafio/screens/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/custom_elevated_button.dart';
import 'components/custom_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController _controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/bycoders.png'),
                SizedBox(
                  height: 100,
                ),
                CustomFormField(
                  label: "E-mail",
                  controller: _controller.emailController,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomFormField(
                  label: "Password",
                  controller: _controller.passwordController,
                  isPassword: true,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomElevatedButton(
                  label: "Sign In",
                  onPressed: () {
                    _controller.signIn();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                  label: "Sign Up",
                  labelColor: Colors.white,
                  onPressed: () {
                    _controller.registerUser();
                  },
                  borderSide: BorderSide(color: AppColors.secondary),
                  buttonColor: AppColors.primary,
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(color: AppColors.secondary),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
