import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/constants.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/services/shared_preference.dart';
import 'package:mobile_app/view/screens/login_screen.dart';
import 'package:mobile_app/view/screens/welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: SafeArea(
        child: Container(
          color: lightBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  NeumorphicBackButton(
                    style: getlistItemNeuStyle(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  NeumorphicButton(
                    style: getlistItemDarkNeuStyle(),
                    child: Container(
                      child: Center(
                        child: Text(
                          'Logout',
                          style: GoogleFonts.roboto(color: Colors.white),
                        ),
                      ),
                    ),
                    onPressed: () {
                      SharedPreferencesHelper s = SharedPreferencesHelper();
                      s.setId(-1);
                      s.setLogin('');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()));
                    },
                  ),
                ],
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
