import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  final Widget? nextScreen;

  const SplashScreen({Key? key, this.nextScreen}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (widget.nextScreen != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => widget.nextScreen!),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FB Logo with running figure
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'F',
                    style: TextStyle(
                      color: Color(0xFF9370FF), // Purple color
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'B',
                        style: TextStyle(
                          color: Color(0xFF9370FF), // Purple color
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Positioned(
                        child: Icon(
                          Icons.directions_run,
                          color: Color(0xFFE6FF54), // Yellow color
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // FITBODY text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'FIT',
                    style: TextStyle(
                      color: Color(0xFF9370FF), // Purple color
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'BODY',
                    style: TextStyle(
                      color: Color(0xFFE6FF54), // Yellow color
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}