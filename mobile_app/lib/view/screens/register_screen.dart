import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/view/components/neumorphic_textfield.dart';

import '../../constants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Register',
                  style: GoogleFonts.raleway(
                      fontSize: 42,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildInputField("Email", TextInputType.emailAddress, false),
              buildInputField("Password", TextInputType.visiblePassword, true),
              buildInputField(
                  "Confirm Password", TextInputType.visiblePassword, true),
              SizedBox(
                height: 20,
              ),
              NeumorphicButton(
                style: getRegisterNeuStyle(),
                child: Container(
                  child: Text(
                    'Register',
                    style: GoogleFonts.raleway(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              NeumorphicButton(
                style: getlistItemNeuStyle(),
                child: Container(
                  child: Text(
                    'Login',
                    style: GoogleFonts.raleway(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Colors.deepPurple[300]),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(var text, TextInputType textInputType, bool ot) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 5),
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: GoogleFonts.raleway(
                fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
          alignment: Alignment.centerLeft,
          child: NeumorphicTextfield(
            hintText: "$text...",
            dataType: textInputType,
            ob: ot,
          ),
        ),
      ],
    );
  }
}
