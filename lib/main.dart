import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'onboarding_screen_page.dart';
import 'sign_in_page.dart';
import 'sign_up_page.dart';
import 'set_up.dart';
import 'forgot_password.dart';
import 'set_password.dart';
import 'gender.dart';
import 'age.dart';
import 'height_and_weight.dart';
import 'name.dart';
import 'fill_your_profile.dart';
import 'user_data.dart';
import 'selection_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FITBODY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(nextScreen: OnboardingScreen()),
        '/onboarding': (context) => OnboardingScreen(),
        '/sign_in': (context) => SignInPage(),
        '/sign_up': (context) => SignUpPage(),
        '/set_up': (context) => SetUpPage(), // ✅ Route for setup page
        '/forgot_password': (context) => ForgetPasswordPage(),
        '/set_password': (context) => SetPasswordPage(),
        '/gender': (context) => GenderPage(),
        '/age': (context) => AgePage(),
        '/height_weight': (context) => HeightAndWeightPage(),
        '/name': (context) => NamePage(),
        '/fill_profile': (context) => FillProfilePage(),
        '/selection_page': (context) => SelectionPage(),
      },
    );
  }
}
