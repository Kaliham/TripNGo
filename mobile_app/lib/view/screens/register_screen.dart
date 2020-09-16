import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/model/user_model.dart';
import 'package:mobile_app/view/components/neumorphic_textfield.dart';

import '../../constants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  User user;
  List<TextEditingController> listController = List<TextEditingController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = new User();
    for (int i = 0; i < 7; i++) {
      listController.add(TextEditingController());
    }
  }

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
              buildInputField(
                  "First Name", TextInputType.name, false, listController[0]),
              buildInputField(
                  "Last Name", TextInputType.name, false, listController[1]),
              buildInputField("Email", TextInputType.emailAddress, false,
                  listController[2]),
              buildInputField("Password", TextInputType.visiblePassword, true,
                  listController[3]),
              buildInputField("Confirm Password", TextInputType.visiblePassword,
                  true, listController[4]),
              buildInputField("Phone Number", TextInputType.phone, false,
                  listController[5]),
              buildInputField(
                  "Image Url", TextInputType.phone, false, listController[6]),
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
                onPressed: () {
                  user = User(
                    firstName: listController[0].text,
                    lastName: listController[1].text,
                    email: listController[2].text,
                    password: listController[3].text,
                    phoneNumber: listController[5].text,
                    imageUrl: listController[6].text,
                  );
                  print("${user.password} ${listController[4].text} ");
                  if (!user.confirmPassword(listController[4].text)) {
                    user = null;
                  } else {
                    http
                        .post(
                      "http://127.0.0.1:9090/api/users/create",
                      body: jsonEncode(<String, String>{
                        'firstName': user.firstName,
                        'lastName': user.lastName,
                        'email': user.email,
                        'password': user.password,
                        'phoneNumber': user.phoneNumber,
                        'imageUrl': user.imageUrl,
                      }),
                    )
                        .then((value) {
                      print(value);
                    });
                    print('sent');
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(var text, TextInputType textInputType, bool ot,
      TextEditingController controller) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          margin: EdgeInsets.all(0),
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: GoogleFonts.raleway(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
          margin: EdgeInsets.all(0),
          alignment: Alignment.centerLeft,
          child: NeumorphicTextfield(
            hintText: "$text...",
            dataType: textInputType,
            ob: ot,
            controller: controller,
          ),
        ),
      ],
    );
  }
}
