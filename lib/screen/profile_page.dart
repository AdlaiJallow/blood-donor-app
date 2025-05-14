import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static const String id = 'profile_page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _imageFile;

  Future<void> _pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      } else {
        print('No image selected');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Profile Page',
                  style: GoogleFonts.abel(
                      fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 90.0,
                    backgroundColor: Colors.green,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : const AssetImage('assets/download.jpg')
                            as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: buildEditIcon(Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Ummu Aisha',
                style: GoogleFonts.abel(
                    fontSize: 23.0, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'email: adlaibobo@me.com',
                style:
                    GoogleFonts.abel(fontSize: 18.0, color: Colors.grey[600]),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Phone Number: 1234567',
                style:
                    GoogleFonts.abel(fontSize: 18.0, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );

  Widget buildEditIcon(Color color) => buildCircle(
        child: buildCircle(
          child: const Icon(
            Icons.camera_alt,
            size: 20,
            color: Colors.white,
          ),
          all: 8,
          color: color,
        ),
        all: 3,
        color: Colors.white,
      );
}
