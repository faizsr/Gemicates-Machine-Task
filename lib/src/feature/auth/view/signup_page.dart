import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gemicates_machine_task/src/config/alerts.dart';
import 'package:gemicates_machine_task/src/config/navigators.dart';
import 'package:gemicates_machine_task/src/config/validation.dart';
import 'package:gemicates_machine_task/src/feature/auth/controller/auth_controller.dart';
import 'package:gemicates_machine_task/src/feature/auth/model/user_model.dart';
import 'package:gemicates_machine_task/src/feature/auth/view/signin_page.dart';
import 'package:gemicates_machine_task/src/feature/auth/view/widgets/custom_filled_button.dart';
import 'package:gemicates_machine_task/src/feature/auth/view/widgets/custom_input_field.dart';
import 'package:gemicates_machine_task/src/feature/auth/view/widgets/custom_outlined_button.dart';
import 'package:gemicates_machine_task/src/feature/product/view/product_list_page.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
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
                  'Create Account',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Please enter your credentials to \nget started!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.4,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),
                CustomInputField(
                  hintText: 'Name',
                  controller: nameController,
                  validator: validateName,
                ),
                const SizedBox(height: 15),
                CustomInputField(
                  controller: emailController,
                  validator: validateEmail,
                  hintText: 'Email',
                ),
                const SizedBox(height: 15),
                CustomInputField(
                  controller: passwordController,
                  validator: validatePassword,
                  hintText: 'Password',
                ),
                const SizedBox(height: 40),
                CustomFilledButton(
                  text: 'Sign Up',
                  onPressed: onSignUpPressed,
                ),
                const SizedBox(height: 20),
                const Text(
                  '--------- OR ---------',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                CustomOutlinedButton(
                  text: 'Have an account? Sign In',
                  onPressed: () {
                    nextScreenRemoveUntil(context, const SignInPage());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSignUpPressed() async {
    final authController = Provider.of<AuthController>(context, listen: false);
    if (formKey.currentState!.validate()) {
      final user = UserModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      await authController.signUp(user);
    }

    String result = authController.result ?? '';
    log('Result from ui: $result');
    if (result == 'success') {
      nextScreenRemoveUntil(context, const ProductListPage());
      final snackbar = CustomAlerts.snackBar('Account Created Successfully');
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (result == 'email-already-in-use') {
      final snackbar = CustomAlerts.snackBar('Email already in use');
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (result == 'too-many-requests') {
      final snackBar =
          CustomAlerts.snackBar('Too many requests. Please try again later.');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
