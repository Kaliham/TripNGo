import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/constants.dart';

class TripsScreen extends StatefulWidget {
  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.deepPurple[50],
      child: Column(
        children: [
          _buildSearchbar(context),
          _buildTags(context),
          _buildList(
            context,
          ),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          _buildListItem(context, "League Stearms"),
          _buildListItem(context, "League Stearms"),
          _buildListItem(context, "League Stearms"),
          _buildListItem(context, "League Stearms"),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, info) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Neumorphic(
        style: getlistItemNeuStyle(),
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

  Widget _buildSearchbar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: Center(
        child: Neumorphic(
          style: getlistItemNeuStyle(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 1, 8, 1),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTags(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 1, 1, 1),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTag(context, "Information"),
            _buildTag(context, "Information"),
            _buildTag(context, "Information"),
            _buildTag(context, "Information"),
            _buildTag(context, "Information"),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(BuildContext context, info) {
    return FittedBox(
      child: NeumorphicButton(
        margin: EdgeInsets.fromLTRB(1, 1, 10, 20),
        style: getlistItemNeuStyle(),
        child: Text(
          info,
          style: GoogleFonts.raleway(fontWeight: FontWeight.w300),
        ),
        onPressed: () {},
      ),
    );
  }
}
