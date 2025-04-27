import 'package:flutter/material.dart';
import 'CHAT_BOT/data/user_data.dart';

class FillProfilePage extends StatelessWidget {
  final TextEditingController fullNameController =
  TextEditingController(text: UserData.fullName);
  final TextEditingController genderController =
  TextEditingController(text: UserData.gender);
  final TextEditingController ageController =
  TextEditingController(text: UserData.age);
  final TextEditingController heightController =
  TextEditingController(text: UserData.height);
  final TextEditingController weightController =
  TextEditingController(text: UserData.weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Fill Your Profile',
          style: TextStyle(color: Colors.yellow),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              '',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              '',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 24),

            _buildInput("Full name", fullNameController),
            _buildInput("Gender", genderController),
            _buildInput("Age", ageController),
            _buildInput("Height", heightController),
            _buildInput("Weight", weightController),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/selection_page'); // ✅ Go to selection page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text("Start"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: true,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ],
    );
  }
}
