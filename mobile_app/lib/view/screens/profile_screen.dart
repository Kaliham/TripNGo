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
    return NeumorphicApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NeumorphicBackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                alignment: Alignment.center,
                child: Text('profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
