import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Whoever kills a soul unless for a soul or for corruption [done] in the land – it is as if he had slain mankind entirely. And whoever saves one – it is as if he had saved mankind entirely. \n(Quran 5:32)",
                textAlign: TextAlign.center, style: GoogleFonts.aBeeZee(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
