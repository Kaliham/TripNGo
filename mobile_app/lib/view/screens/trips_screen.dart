import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/constants.dart';
import 'package:neumorphic/neumorphic.dart';

class TripsScreen extends StatefulWidget {
  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          buildListItem(context, "League Stearms"),
          buildListItem(context, "League Stearms"),
          buildListItem(context, "League Stearms"),
          buildListItem(context, "League Stearms"),
        ],
      ),
    );
  }

  Widget buildListItem(BuildContext context, info) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: NeuCard(
        decoration: NeumorphicDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white60),
        curveType: CurveType.convex,
        color: Colors.grey,
        bevel: 12,
        child: Container(
          width: 200,
          height: 100,
          child: Center(
            child: Text(
              info,
              style: GoogleFonts.raleway(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
