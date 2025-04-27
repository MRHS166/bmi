import 'package:flutter/material.dart';
import 'CHAT_BOT/data/user_data.dart'; // Make sure the path is correct

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  String getBmiStatus() {
    final double? bmiValue = double.tryParse(UserData.bmi);
    if (bmiValue == null) return 'Unknown';

    if (bmiValue < 18.5) {
      return 'Underweight';
    } else if (bmiValue < 25) {
      return 'Normal';
    } else if (bmiValue < 30) {
      return 'Overweight';
    } else if (bmiValue < 35) {
      return 'Obese Class I';
    } else if (bmiValue < 40) {
      return 'Obese Class II';
    } else {
      return 'Obese Class III';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
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
            const Divider(height: 30, color: Colors.white),
            _buildItem("BMI", UserData.bmi),
            const SizedBox(height: 10),
            _buildItem("BMI Status", getBmiStatus()),
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
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
