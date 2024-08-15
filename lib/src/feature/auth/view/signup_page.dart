import 'package:flutter/material.dart';
import 'package:gemicates_machine_task/src/config/navigators.dart';
import 'package:gemicates_machine_task/src/feature/auth/view/signin_page.dart';
import 'package:gemicates_machine_task/src/feature/auth/view/widgets/custom_filled_button.dart';
import 'package:gemicates_machine_task/src/feature/auth/view/widgets/custom_input_field.dart';
import 'package:gemicates_machine_task/src/feature/auth/view/widgets/custom_outlined_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(25, 60, 25, 25),
          physics: const BouncingScrollPhysics(),
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
              const CustomInputField(
                hintText: 'Name',
              ),
              const SizedBox(height: 15),
              const CustomInputField(
                hintText: 'Email',
              ),
              const SizedBox(height: 15),
              const CustomInputField(
                hintText: 'Password',
              ),
              const SizedBox(height: 40),
              CustomFilledButton(
                text: 'Sign Up',
                onPressed: () {},
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
    );
  }
}
