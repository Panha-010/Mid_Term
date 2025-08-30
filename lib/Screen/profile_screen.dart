import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/Screen/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // background

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          // Profile Picture
          Center(
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.blueGrey[100],
              child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
            ),
          ),
          const SizedBox(height: 16),

          // User Name (Changed to Prum Panha)
          Center(
            child: Text(
              "Prum Panha",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),

          // User Email (example)
          Center(
            child: Text(
              "prumpanha@email.com",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
          const SizedBox(height: 30),

          // Update Info Button
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to edit profile screen
            },
            icon: const Icon(Icons.edit_note),
            label: Text(
              "Update Info",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: const Color(0xFF1E1E2C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 25),

          // Options
          ListTile(
            leading: const Icon(Icons.security, color: Colors.blue),
            title: Text("Update Password", style: GoogleFonts.poppins()),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to update password
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.redAccent),
            title: Text(
              "Sign Out",
              style: GoogleFonts.poppins(color: Colors.redAccent),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
