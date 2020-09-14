import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      alignment: Alignment.topCenter,
      child: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Neumorphic(
      style: getNeuStyle(),
      child: SizedBox(
        height: 200,
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(24),
                    child: Neumorphic(
                      style: getImgNeuStyle(),
                      child: Image.network(
                        "https://media-exp1.licdn.com/dms/image/C4E03AQHMtH7Xg5hpqg/profile-displayphoto-shrink_100_100/0?e=1605744000&v=beta&t=QX_FDnqgGME-v35CRQNnWV8a4_5_TnuxUTjRM-CkZcA",
                        height: 120,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    child: NeumorphicText(
                      "Omar Taher Ibrahim",
                      textStyle: NeumorphicTextStyle(
                        fontFamily: GoogleFonts.raleway().fontFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      style: getTxtNeuStyle(),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text('edit profile!'),
                    onTap: () {
                      MainState.globalLiqController.animateToPage(page: 1);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        width: screenSize.width * 0.85,
      ),
    );
  }

  NeumorphicStyle getNeuStyle() {
    return NeumorphicStyle(
      shape: NeumorphicShape.concave,
      color: Colors.white,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      depth: 5,
      lightSource: LightSource.topLeft,
      intensity: 0.24,
      surfaceIntensity: 0.23,
    );
  }

  NeumorphicStyle getImgNeuStyle() {
    return NeumorphicStyle(
      shape: NeumorphicShape.concave,
      color: Colors.white,
      boxShape: NeumorphicBoxShape.circle(),
      depth: 5,
      lightSource: LightSource.topLeft,
      intensity: 0.24,
      surfaceIntensity: 0.23,
    );
  }

  NeumorphicStyle getTxtNeuStyle() {
    return NeumorphicStyle(
      shape: NeumorphicShape.concave,
      color: Colors.grey[800],
      boxShape: NeumorphicBoxShape.circle(),
      depth: 12,
      lightSource: LightSource.topLeft,
      intensity: 0.83,
      surfaceIntensity: 0.83,
    );
  }
}
