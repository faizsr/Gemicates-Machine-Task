import 'package:flutter/material.dart';
import 'package:gemicates_machine_task/src/feature/auth/view/signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gemicates',
        theme: ThemeData(
          fontFamily: 'OverusedGrotesk',
          scaffoldBackgroundColor: const Color.fromARGB(255, 241, 245, 255),
        ),
        home: const SignInPage(),
      ),
    );
  }
}
