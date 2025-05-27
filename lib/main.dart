import 'package:blood_donor_app/repository/user_repository.dart';
import 'package:blood_donor_app/screen/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

import 'screen/login_page.dart';
import 'screen/profile_page.dart';
import 'screen/register_page.dart';
// import 'screen/sign_up.dart';
import 'screen/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(UserRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/welcome_screen',
      getPages: [
        GetPage(name: '/welcome_screen', page: () => const WelcomeScreen()),
        GetPage(name: '/register_page', page: () => const RegisterPage()),
        GetPage(name: '/login_screen', page: () => const LoginPage()),
        GetPage(name: '/profile_page', page: () => const ProfilePage()),
        GetPage(name: '/home_screen', page: () => const HomePage())
      ],
      unknownRoute: GetPage(
          name: '/notfound',
          page: () => const Scaffold(
                body: Center(
                  child: Text('Route not found'),
                ),
              )),
    );
  }
}
