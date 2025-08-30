import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  void decrease() {
    setState(() {
      if (counter > 0) counter--;
    });
  }

  void increase() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const SizedBox(height: 40),

          // Welcome message with gradient text
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              "Welcome Back 👋",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Here’s your updated dashboard",
            style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey[700]),
          ),
          const SizedBox(height: 30),

          // Feature cards (changed icons & colors)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _featureCard(Icons.shopping_cart, "Orders", Colors.indigo),
              _featureCard(Icons.inventory_2, "Products", Colors.green),
              _featureCard(Icons.bar_chart_rounded, "Reports", Colors.orange),
            ],
          ),
          const SizedBox(height: 40),

          // Counter demo
          Center(
            child: Column(
              children: [
                Text("Counter", style: GoogleFonts.poppins(fontSize: 20)),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Text(
                    "$counter",
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A00E0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Counter buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _counterButton("-", decrease, Colors.redAccent),
                    const SizedBox(width: 25),
                    _counterButton("+", increase, Colors.teal),
                  ],
                ),
                const SizedBox(height: 25),

                // Extra quick action row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _quickAction(Icons.settings, "Settings"),
                    _quickAction(Icons.person, "Profile"),
                    _quickAction(Icons.logout, "Logout"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureCard(IconData icon, String title, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _counterButton(String text, VoidCallback onPressed, Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
    );
  }

  Widget _quickAction(IconData icon, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.blueGrey[50],
          child: Icon(icon, color: Colors.blueAccent, size: 28),
        ),
        const SizedBox(height: 6),
        Text(title, style: GoogleFonts.poppins(fontSize: 13)),
      ],
    );
  }
}
