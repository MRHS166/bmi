import 'package:flutter/material.dart';
import 'CHAT_BOT/data/user_data.dart';


class GenderPage extends StatefulWidget {
  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String? selectedGender;

  void _selectGender(String gender) {
    setState(() {
      selectedGender = gender;
      UserData.gender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // 🔙 Back button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.yellow),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text("Back", style: TextStyle(color: Colors.yellow)),
                ],
              ),
            ),

            // 🧠 Title and description
            const SizedBox(height: 8),
            const Text(
              "What’s Your Gender",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // 👥 Gender options centered
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildGenderOption(
                      label: "Male",
                      icon: Icons.male,
                      selected: selectedGender == "Male",
                      onTap: () => _selectGender("Male"),
                    ),
                    const SizedBox(height: 40),
                    _buildGenderOption(
                      label: "Female",
                      icon: Icons.female,
                      selected: selectedGender == "Female",
                      onTap: () => _selectGender("Female"),
                    ),
                  ],
                ),
              ),
            ),

            // ✅ Continue button at the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: () {
                  if (selectedGender != null) {
                    Navigator.pushNamed(context, '/age'); // ✅ Navigate to age file
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a gender'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderOption({
    required String label,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: selected ? const Color(0xFFE6FF54) : Colors.transparent,
            child: Icon(
              icon,
              size: 50,
              color: selected ? Colors.black : Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
