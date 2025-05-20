import 'package:blood_donor_app/screen/login_page.dart';
import 'package:blood_donor_app/screen/register_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/welcomepage.jpg',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.3), // Subtle darken effect
              colorBlendMode: BlendMode.darken,
            ),
          ),
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                    Colors.red.shade700.withOpacity(0.5),
                  ],
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color:
                      Colors.white.withOpacity(0.95), // Semi-transparent card
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Logo
                        Icon(
                          Icons.volunteer_activism,
                          size: 80,
                          color: Colors.red.shade700,
                        ),
                        const SizedBox(height: 16),
                        // Title
                        Text(
                          "Save Lives with Blood Donation",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.abel(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Quote
                        Text(
                          "(... And whoever saves one – it is as if he had saved mankind entirely.) \n(Quran 5:32)",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.abel(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Register Button
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: GestureDetector(
                            onTapDown: (_) => _animationController.forward(),
                            onTapUp: (_) => _animationController.reverse(),
                            onTapCancel: () => _animationController.reverse(),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, RegisterPage.id);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade600,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 14,
                                ),
                                elevation: 5,
                                shadowColor: Colors.black.withOpacity(0.3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle: GoogleFonts.abel(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: const Text("Register"),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Login Button
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: GestureDetector(
                            onTapDown: (_) => _animationController.forward(),
                            onTapUp: (_) => _animationController.reverse(),
                            onTapCancel: () => _animationController.reverse(),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, LoginPage.id);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade800,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 14,
                                ),
                                elevation: 5,
                                shadowColor: Colors.black.withOpacity(0.3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle: GoogleFonts.abel(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: const Text("Login"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}












































// import 'package:blood_donor_app/screen/login_page.dart';
// // import 'package:blood_donor_app/screen/sign_up.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:blood_donor_app/components/rounded_button.dart';
// import 'package:blood_donor_app/screen/register_page.dart';

// class WelcomeScreen extends StatefulWidget {
//   static const String id = 'welcome_screen';

//   const WelcomeScreen({super.key});

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Background Image with Gradient Overlay
//             Positioned.fill(
//               child: Image.asset(
//                 'assets/welcomepage.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             // Gradient Overlay
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [Colors.black.withOpacity(0.6), Colors.transparent],
//                   ),
//                 ),
//               ),
//             ),
//             // Content on top of Image
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CircleAvatar(
//                     radius: 50,
//                     backgroundImage:
//                         AssetImage('assets/welcomepage.jpg'), // Optional logo
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     "Let's donate blood to save lives",
//                     style: TextStyle(
//                       fontSize: 23,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       letterSpacing: 1.5,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "(... And whoever saves one – it is as if he had saved mankind entirely.) \n(Quran 5:32)",
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.aBeeZee(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey.shade300),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   RoundedButton(
//                     color: Colors.red,
//                     title: 'Register',
//                     onPressed: () {
//                       Navigator.pushNamed(context, RegisterPage.id);
//                     },
//                   ),
//                   const SizedBox(height: 7),
//                   RoundedButton(
//                     color: Colors.redAccent.shade400,
//                     title: 'Login',
//                     onPressed: () {
//                       Navigator.pushNamed(context, LoginPage.id);
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
