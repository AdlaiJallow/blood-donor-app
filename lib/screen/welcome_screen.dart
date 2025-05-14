import 'package:blood_donor_app/screen/login_page.dart';
import 'package:blood_donor_app/screen/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blood_donor_app/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image with Gradient Overlay
            Positioned.fill(
              child: Image.asset(
                'assets/welcomepage.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  ),
                ),
              ),
            ),
            // Content on top of Image
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/welcomepage.jpg'), // Optional logo
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Let's donate blood to save lives",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "(... And whoever saves one – it is as if he had saved mankind entirely.) \n(Quran 5:32)",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade300),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RoundedButton(
                    color: Colors.red,
                    title: 'Register',
                    onPressed: () {
                      Navigator.pushNamed(context, SignUp.id);
                    },
                  ),
                  const SizedBox(height: 7),
                  RoundedButton(
                    color: Colors.redAccent.shade400,
                    title: 'Login',
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
