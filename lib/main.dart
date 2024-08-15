import 'package:flutter/material.dart';
import 'package:gemicates_machine_task/src/feature/auth/controller/auth_controller.dart';
import 'package:gemicates_machine_task/src/feature/auth/model/services/auth_service.dart';
import 'package:gemicates_machine_task/src/feature/auth/view/signin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gemicates_machine_task/src/feature/product/view/product_list_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        )
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gemicates',
          theme: ThemeData(
            fontFamily: 'OverusedGrotesk',
            scaffoldBackgroundColor: const Color.fromARGB(255, 241, 245, 255),
          ),
          home: FutureBuilder<bool>(
              future: authService.getUserStatus(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data ?? false
                      ? const ProductListPage()
                      : const SignInPage();
                }
                return const SignInPage();
              }),
        ),
      ),
    );
  }
}
