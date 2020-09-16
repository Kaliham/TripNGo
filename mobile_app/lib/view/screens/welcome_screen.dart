import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:mobile_app/view/screens/login_screen.dart';
import 'package:mobile_app/view/screens/register_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      enableSlideIcon: true,
      pages: [
        LoginScreen(),
        RegisterScreen(),
      ],
    );
  }
}
