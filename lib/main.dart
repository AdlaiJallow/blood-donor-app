import 'package:flutter/material.dart';
import 'screen/welcome_screen.dart';
import 'screen/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screen/login_page.dart';
import 'screen/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        SignUp.id: (context) => const SignUp()
      },
    );
  }
}
