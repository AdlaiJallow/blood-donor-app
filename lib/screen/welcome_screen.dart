// import 'package:flutter/material.dart';
//
// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});
//
//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }
//
// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/welcomepage.jpg', fit: BoxFit.cover, width: double.infinity, height: 300,)
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
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
                  // Logo or Text
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/welcomepage.jpg'), // Optional logo
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Let's donate to save a life",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your journey begins here.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Button or Further Navigation
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the next page (Example)
                      // Navigator.push(context, MaterialPageRoute(builder: (_) => NextPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('Get Started'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
