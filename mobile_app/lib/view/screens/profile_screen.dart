import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mobile_app/main.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            NeumorphicBackButton(
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                color: Colors.white,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: 5,
                lightSource: LightSource.topLeft,
                intensity: 0.24,
                surfaceIntensity: 0.23,
              ),
              onPressed: () {
                MainState.globalLiqController.animateToPage(page: 0);
              },
            ),
            Container(
              alignment: Alignment.center,
              child: Text('profile'),
            ),
          ],
        ),
      ),
    );
  }
}
