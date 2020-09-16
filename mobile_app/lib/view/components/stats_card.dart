import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class StatsCard extends StatefulWidget {
  String tripsDone, tripsPlan;
  StatsCard() {
    tripsDone = "12";
    tripsPlan = "4";
  }

  @override
  _StatsCardState createState() => _StatsCardState();
}

class _StatsCardState extends State<StatsCard> {
  bool _isDone = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    setState(() {
      _isDone = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  child: buildTitle(),
                ),
                Expanded(
                  flex: 2,
                  child: buildSubTitles(),
                ),
                Flexible(
                  flex: 1,
                  child: buildScores(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      'Trip Stats',
      style: GoogleFonts.raleway(
        fontSize: 26,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget buildSubTitles() {
    return Row(
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
    );
  }

  Widget buildScores() {
    return Row(
      children: [
        Flexible(
          child: Center(
            child: Container(
              child: Text(
                widget.tripsDone,
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
                widget.tripsPlan,
                style: GoogleFonts.roboto(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
