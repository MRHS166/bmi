import 'package:flutter/material.dart';
import 'user_data.dart'; // Make sure the path is correct

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Full black background
      appBar: AppBar(
        backgroundColor: Colors.black, // AppBar black too
        iconTheme: const IconThemeData(color: Colors.white), // White back arrow
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white), // Title in white
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            _buildItem("First Name", UserData.nickname),
            _buildItem("Full Name", UserData.fullName),
            _buildItem("Age", UserData.age),
            _buildItem("Gender", UserData.gender),
            _buildItem("Weight (kg)", UserData.weight),
            _buildItem("Height (cm)", UserData.height),
            const Divider(height: 30, color: Colors.white), // White divider
            _buildItem("BMI", UserData.bmi),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white, // White label
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.white), // White value
            ),
          ),
        ],
      ),
    );
  }
}
