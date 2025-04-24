import 'package:flutter/material.dart';

class SetUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ✅ Full background image
          Image.asset(
            'images/setup.jpg', // Replace with your actual image
            fit: BoxFit.cover,
          ),

          // ✅ Content overlay
          Column(
            children: [
              SizedBox(height: 600,),
              // ✅ Black box with motivational text
              Container(
                width: double.infinity,
                color: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                child: const Text(
                  "Consistency Is\nThe Key To Progress.\nDon't Give Up!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFE6FF54), // Neon yellow
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 50,),
              // ✅ NEXT button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/gender'); // ✅ Navigate to GenderPage
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Colors.white30),
                    ),
                  ),
                  child: const Text("Next"),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
