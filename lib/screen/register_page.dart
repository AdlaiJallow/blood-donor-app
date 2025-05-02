import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const String id = 'register_page';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  User? loggedInUSer;

  String fullName = "";
  String phoneNumber = "";
  String password = "";
  String confirmPassword = "";
  String bloodType = "O+";
  String countryCode = "+220";

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void _submitForm() {
    // final newUser =
    //     _auth.createUserWithEmailAndPassword(email: email, password: password);
    // if (_formKey.currentState!.validate()) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text("Registration Successful!")),
    //   );
    // }
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUSer = user;
      }
    } catch (e) {
      print(e);
    }
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
                  // Title
                  Text(
                    "Enter Your Details",
                    style: GoogleFonts.abel(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Full Name Field
                  _buildTextField("Full Name", Icons.person, false, (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  }),
                  const SizedBox(height: 15),

                  // Phone Number Field
                  // _buildTextField("Phone Number", Icons.phone, false, keyboardType: TextInputType.phone),
                  _buildPhoneField(),
                  const SizedBox(height: 15),

                  // Blood Type Dropdown
                  _buildDropdown(),
                  const SizedBox(height: 15),

                  // // Password Field
                  // _buildTextField("Password", Icons.lock, true, (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please enter a password";
                  //   } else if (value.length < 7) {
                  //     return "Password should be at least 7 characters";
                  //   }
                  //   return null;
                  // }),
                  // const SizedBox(height: 15),

                  // // Confirm Password Field
                  // _buildTextField("Confirm Password", Icons.lock, true,
                  //     (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please confirm your password";
                  //   } else if (value != password) {
                  //     return "Passwords do not match";
                  //   }
                  //   return null;
                  // }),
                  const SizedBox(height: 25),

                  // Register Button
                  ElevatedButton(
                    onPressed: null,
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
                    child: const Text("Register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Reusable TextField Widget
  Widget _buildTextField(String label, IconData icon, bool isPassword,
      String? Function(String?) validator,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.red),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: validator,
    );
  }

  Widget _buildPhoneField() {
    return IntlPhoneField(
      decoration: InputDecoration(
          labelText: "Phone Number",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white),
      initialCountryCode: "GM",
      onChanged: (phone) {
        setState(() {
          phoneNumber = phone.completeNumber;
          countryCode = phone.countryCode;
        });
      },
      validator: (value) {
        if (value == null || value.completeNumber.isEmpty) {
          return "Please enter a valid phone number";
        }
        return null;
      },
    );
  }

  // Blood Type Dropdown
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
