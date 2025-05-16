import 'package:blood_donor_app/models/user_model.dart';
import 'package:blood_donor_app/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const String id = 'register_page';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String phoneNumber = "";
  String bloodType = "O+";
  String countryCode = "+220";
  bool isLoading = false;

  void registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      // 1. Firebase Authentication
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final User? user = userCredential.user;

      if (user != null) {
        // 2. Save user data to Firestore
        final userModel = UserModel(
          id: user.uid,
          name: _fullNameController.text.trim(),
          email: _emailController.text.trim(),
          location: _locationController.text.trim(),
          phoneNumber: phoneNumber,
          bloodType: bloodType,
        );

        await UserRepository.instance.createUser(userModel);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration successful!")),
        );

        // Optional: Navigate to home/dashboard
        // Navigator.pushReplacementNamed(context, HomeScreen.id);
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Registration failed')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An unexpected error occurred")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _locationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Create Account",
                    style: GoogleFonts.abel(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField("Full Name", Icons.person,
                      controller: _fullNameController),
                  const SizedBox(height: 15),
                  _buildTextField("Email", Icons.email,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 15),
                  _buildTextField("Password", Icons.lock,
                      controller: _passwordController, isPassword: true),
                  const SizedBox(height: 15),
                  _buildPhoneField(),
                  const SizedBox(height: 15),
                  _buildTextField("Location", Icons.location_city_outlined,
                      controller: _locationController),
                  const SizedBox(height: 15),
                  _buildDropdown(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isLoading ? null : registerUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.red)
                        : const Text("Register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon,
      {required TextEditingController controller,
      bool isPassword = false,
      TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.red),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildPhoneField() {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: "Phone Number",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
      ),
      initialCountryCode: "GM",
      onChanged: (phone) {
        setState(() {
          phoneNumber = phone.completeNumber;
          countryCode = phone.countryCode;
        });
      },
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Select Blood Type",
        prefixIcon: const Icon(Icons.bloodtype, color: Colors.red),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      value: bloodType,
      items: ["O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-"]
          .map((type) => DropdownMenuItem(value: type, child: Text(type)))
          .toList(),
      onChanged: (value) => setState(() => bloodType = value!),
    );
  }
}






























































































// import 'package:blood_donor_app/models/user_model.dart';
// import 'package:blood_donor_app/repository/user_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});
//   static const String id = 'register_page';

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _auth = FirebaseAuth.instance;
//   User? loggedInUser;

//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();

//   String email = '';
//   String phoneNumber = "";
//   String bloodType = "O+";
//   String countryCode = "+220";

//   @override
//   void initState() {
//     super.initState();
//     getCurrentUser();
//   }

//   @override
//   void dispose() {
//     _fullNameController.dispose();
//     _locationController.dispose();
//     super.dispose();
//   }

//   void _saveUser() {
//     final userId = FirebaseAuth.instance.currentUser?.uid;

//     if (userId == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("User not authenticated")),
//       );
//       return;
//     }

//     final user = UserModel(
//         id: userId,
//         name: _fullNameController.text.trim(),
//         email: email,
//         location: _locationController.text.trim(),
//         phoneNumber: phoneNumber,
//         bloodType: bloodType);

//     UserRepository.instance.createUser(user);
//   }

//   void getCurrentUser() {
//     try {
//       final user = _auth.currentUser;
//       if (user != null) {
//         loggedInUser = user;
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void handleRegister() {
//     final name = _fullNameController.text.trim();
//     final location = _locationController.text.trim();

//     if (name.isEmpty || location.isEmpty || phoneNumber.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please fill all fields")),
//       );
//       return;
//     }

//     // Proceed with registration logic here
//     print("Full Name: $name");
//     print("Location: $location");
//     print("Phone: $phoneNumber");
//     print("Blood Type: $bloodType");

//     _saveUser();

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Registered Successfully")),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red.shade300,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "Enter Your Details",
//                   style: GoogleFonts.abel(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 26,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 _buildTextField("Full Name", Icons.person, _fullNameController),
//                 const SizedBox(height: 15),
//                 _buildPhoneField(),
//                 const SizedBox(height: 15),
//                 _buildTextField("Location", Icons.location_city_outlined,
//                     _locationController),
//                 const SizedBox(height: 15),
//                 _buildDropdown(),
//                 const SizedBox(height: 15),
//                 ElevatedButton(
//                   onPressed: handleRegister,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     foregroundColor: Colors.red,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 50, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     textStyle: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   child: const Text("Register"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//       String label, IconData icon, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, color: Colors.red),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//         filled: true,
//         fillColor: Colors.white,
//       ),
//     );
//   }

//   Widget _buildPhoneField() {
//     return IntlPhoneField(
//       decoration: InputDecoration(
//         labelText: "Phone Number",
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//         filled: true,
//         fillColor: Colors.white,
//       ),
//       initialCountryCode: "GM",
//       onChanged: (phone) {
//         setState(() {
//           phoneNumber = phone.completeNumber;
//           countryCode = phone.countryCode;
//         });
//       },
//     );
//   }

//   Widget _buildDropdown() {
//     return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//         labelText: "Select Blood Type",
//         prefixIcon: const Icon(Icons.bloodtype, color: Colors.red),
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//       value: bloodType,
//       items: ["O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-"]
//           .map((type) => DropdownMenuItem(value: type, child: Text(type)))
//           .toList(),
//       onChanged: (value) => setState(() => bloodType = value!),
//     );
//   }
// }




































































// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:intl_phone_field/intl_phone_field.dart';
// // import 'package:firebase_auth/firebase_auth.dart';

// // class RegisterPage extends StatefulWidget {
// //   const RegisterPage({super.key});
// //   static const String id = 'register_page';

// //   @override
// //   State<RegisterPage> createState() => _RegisterPageState();
// // }

// // class _RegisterPageState extends State<RegisterPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _auth = FirebaseAuth.instance;
// //   User? loggedInUSer;

// //   String fullName = "";
// //   String phoneNumber = "";
// //   String password = "";
// //   String confirmPassword = "";
// //   String bloodType = "O+";
// //   String countryCode = "+220";

// //   @override
// //   void initState() {
// //     super.initState();
// //     getCurrentUser();
// //   }

// //   void dispose() {}

// //   void getCurrentUser() {
// //     try {
// //       final user = _auth.currentUser;
// //       if (user != null) {
// //         loggedInUSer = user;
// //       }
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.red.shade300,
// //       body: SafeArea(
// //         child: Center(
// //           child: SingleChildScrollView(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Form(
// //               key: _formKey,
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   // Title
// //                   Text(
// //                     "Enter Your Details",
// //                     style: GoogleFonts.abel(
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 26,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 20),

// //                   // Full Name Field
// //                   _buildTextField("Full Name", Icons.person, false, (value) {
// //                     if (value == null || value.isEmpty) {
// //                       return 'Please enter your full name';
// //                     }
// //                     return null;
// //                   }),
// //                   const SizedBox(height: 15),

// //                   _buildPhoneField(),
// //                   const SizedBox(height: 15),
// //                   _buildTextField(
// //                       "Location", Icons.location_city_outlined, false, (value) {
// //                     if (value == null || value.isEmpty) {
// //                       return 'Please enter your location';
// //                     }
// //                   }),

// //                   const SizedBox(height: 15),

// //                   // Blood Type Dropdown
// //                   _buildDropdown(),
// //                   const SizedBox(height: 15),

// //                   // Register Button
// //                   ElevatedButton(
// //                     onPressed: null,
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.white,
// //                       foregroundColor: Colors.red,
// //                       padding: const EdgeInsets.symmetric(
// //                           horizontal: 50, vertical: 12),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                       textStyle: const TextStyle(
// //                           fontSize: 18, fontWeight: FontWeight.bold),
// //                     ),
// //                     child: const Text("Register"),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // Reusable TextField Widget
// //   Widget _buildTextField(String label, IconData icon, bool isPassword,
// //       String? Function(String?) validator,
// //       {TextInputType keyboardType = TextInputType.text}) {
// //     return TextFormField(
// //       obscureText: isPassword,
// //       keyboardType: keyboardType,
// //       decoration: InputDecoration(
// //         labelText: label,
// //         prefixIcon: Icon(icon, color: Colors.red),
// //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
// //         filled: true,
// //         fillColor: Colors.white,
// //       ),
// //       validator: validator,
// //     );
// //   }

// //   Widget _buildPhoneField() {
// //     return IntlPhoneField(
// //       decoration: InputDecoration(
// //           labelText: "Phone Number",
// //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
// //           filled: true,
// //           fillColor: Colors.white),
// //       initialCountryCode: "GM",
// //       onChanged: (phone) {
// //         setState(() {
// //           phoneNumber = phone.completeNumber;
// //           countryCode = phone.countryCode;
// //         });
// //       },
// //       validator: (value) {
// //         if (value == null || value.completeNumber.isEmpty) {
// //           return "Please enter a valid phone number";
// //         }
// //         return null;
// //       },
// //     );
// //   }

// //   // Blood Type Dropdown
// //   Widget _buildDropdown() {
// //     return DropdownButtonFormField<String>(
// //       decoration: InputDecoration(
// //         labelText: "Select Blood Type",
// //         prefixIcon: const Icon(Icons.bloodtype, color: Colors.red),
// //         filled: true,
// //         fillColor: Colors.white,
// //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
// //       ),
// //       value: bloodType,
// //       items: ["O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-"]
// //           .map((type) => DropdownMenuItem(value: type, child: Text(type)))
// //           .toList(),
// //       onChanged: (value) => setState(() => bloodType = value!),
// //     );
// //   }
// // }
