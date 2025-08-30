import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  void _showComingSoonDialog(String title) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            title,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          ),
          content: Text(
            "🚧 This feature is coming soon / under maintenance.",
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK", style: GoogleFonts.poppins(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Gradient Header
          const SizedBox(height: 20),

          // Menu Items List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _menuItem(
                  Icons.notifications,
                  "Notifications",
                  Colors.orange,
                  () {
                    _showComingSoonDialog("Notifications");
                  },
                ),
                _menuItem(Icons.info, "About", Colors.blue, () {
                  _showComingSoonDialog("About");
                }),
                _menuItem(Icons.help, "Help & Support", Colors.green, () {
                  _showComingSoonDialog("Help & Support");
                }),
                _menuItem(
                  Icons.privacy_tip,
                  "Privacy Policy",
                  Colors.redAccent,
                  () {
                    _showComingSoonDialog("Privacy Policy");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
    IconData icon,
    String title,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 3,
      shadowColor: color.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}
