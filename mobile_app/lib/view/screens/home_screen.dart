import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/view/components/trips_list.dart';
import 'package:mobile_app/view/screens/profile_screen.dart';

import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          buildProfileCard(context),
          buildStatsCard(context),
          Container(
            child: Text(
              'Trips',
              style: GoogleFonts.raleway(
                fontSize: 26,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(child: buildTripsList(context)),
        ],
      ),
    );
  }

  Widget buildProfileCard(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Neumorphic(
      style: getlistItemNeuStyle(),
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
              Container(
                margin: EdgeInsets.all(6),
                child: InkWell(
                  child: Text(
                    '< edit profile',
                    style: GoogleFonts.raleway(),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
        width: screenSize.width * 0.85,
      ),
    );
  }

  Widget buildStatsCard(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(20),
      child: Neumorphic(
        style: getlistItemNeuStyle(),
        child: SizedBox(
          width: size.width * 0.85,
          height: 200,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Text(
                    'Trip Stats',
                    style: GoogleFonts.raleway(
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Flexible(
                          child: Center(
                            child: Text(
                              'Trips Done:',
                              style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Center(
                            child: Text(
                              'Trips Planned:',
                              style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Flexible(
                        child: Center(
                          child: Container(
                            child: Text(
                              '89',
                              style: GoogleFonts.roboto(
                                fontSize: 32,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Center(
                          child: Container(
                            child: Text(
                              '89',
                              style: GoogleFonts.roboto(
                                fontSize: 32,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTripsList(BuildContext context) {
    return ListView(
      children: [
        TripsItem(),
        TripsItem(),
        TripsItem(),
        TripsItem(),
        TripsItem(),
        TripsItem(),
        TripsItem(),
      ],
    );
  }
}
