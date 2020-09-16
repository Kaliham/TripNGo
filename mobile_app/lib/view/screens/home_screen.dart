import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/model/trip_model.dart';
import 'package:mobile_app/view/components/profile_card.dart';
import 'package:mobile_app/view/components/stats_card.dart';
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
    return ProfileCard();
  }

  Widget buildStatsCard(BuildContext context) {
    return StatsCard();
  }

  Widget buildTripsList(BuildContext context) {
    return TripsList();
  }
}
