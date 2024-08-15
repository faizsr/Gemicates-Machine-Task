import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gemicates_machine_task/src/config/alerts.dart';
import 'package:gemicates_machine_task/src/config/navigators.dart';
import 'package:gemicates_machine_task/src/config/validation.dart';
import 'package:gemicates_machine_task/src/feature/auth/controller/auth_controller.dart';
import 'package:gemicates_machine_task/src/feature/auth/model/user_model.dart';
import 'package:gemicates_machine_task/src/feature/auth/view/signup_page.dart';
import 'package:gemicates_machine_task/src/feature/auth/view/widgets/custom_filled_button.dart';
import 'package:gemicates_machine_task/src/feature/auth/view/widgets/custom_input_field.dart';
import 'package:gemicates_machine_task/src/feature/auth/view/widgets/custom_outlined_button.dart';
import 'package:gemicates_machine_task/src/feature/product/view/product_list_page.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(25, 60, 25, 25),
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  'Hello Again!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Welcome back you've \nbeen missed!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.4,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),
                CustomInputField(
                  hintText: 'Email',
                  controller: emailController,
                  validator: validateEmail,
                ),
                const SizedBox(height: 15),
                CustomInputField(
                  hintText: 'Password',
                  controller: passwordController,
                  validator: validatePasswordSignIn,
                ),
                const SizedBox(height: 40),
                CustomFilledButton(
                  text: 'Sign In',
                  onPressed: onSignInPressed,
                ),
                const SizedBox(height: 20),
                const Text(
                  '--------- OR ---------',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                CustomOutlinedButton(
                  text: 'New here? Register Now',
                  onPressed: () {
                    nextScreen(context, const SignUpPage());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSignInPressed() async {
    final authController = Provider.of<AuthController>(context, listen: false);
    if (formKey.currentState!.validate()) {
      final user = UserModel(
        email: emailController.text,
        password: passwordController.text,
      );
      await authController.signIn(user);
    }

    String result = authController.result ?? '';
    log('Result from ui: $result');
    if (result == 'success') {
      nextScreenRemoveUntil(context, const ProductListPage());
      final snackbar = CustomAlerts.snackBar('Sucessfully Logged In');
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (result == 'user-not-found') {
      final snackbar = CustomAlerts.snackBar('User not found');
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (result == 'wrong-password') {
      final snackBar = CustomAlerts.snackBar('Incorrect password');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (result == 'too-many-requests') {
      final snackBar =
          CustomAlerts.snackBar('Too many requests. Please try again later.');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
