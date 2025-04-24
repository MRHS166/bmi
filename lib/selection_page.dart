import 'package:flutter/material.dart';
import 'profile.dart';
class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Selection', style: TextStyle(color: Colors.yellow)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ✅ Background image
          Image.asset(
            'images/selection.jpg', // Make sure this exists in assets
            fit: BoxFit.cover,
          ),

          // ✅ Optional dark overlay (can be removed or adjusted)
          Container(color: Colors.black.withOpacity(0.6)),

          // ✅ Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(context, "Chatbot", Icons.chat, () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Chatbot selected")));
                }),
                const SizedBox(height: 40),
                _buildButton(context, "Profile", Icons.person,  () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()) );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, IconData icon, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.black),
      label: Text(label, style: const TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
