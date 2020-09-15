import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

class TripsItem extends StatefulWidget {
  String imageUrl =
      "https://lp-cms-production.imgix.net/2019-06/f27a1f10a618448d65e6ac16c9270e56-petra.jpg?auto=compress&fit=crop&fm=auto&sharp=10&vib=20&w=1200";
  var dateText = "07/Dec";
  var goingTime = "08:00 Am";
  var title = "Petra With the boys";
  var groupName = "The boys";

  TripsItem({
    this.title,
    this.groupName,
    this.dateText,
    this.goingTime,
    this.imageUrl,
  });
  @override
  _TripsItemState createState() => _TripsItemState();
}

class _TripsItemState extends State<TripsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      width: 350,
      child: Neumorphic(
        style: getlistItemNeuStyle(),
        child: SizedBox(
          width: 350,
          height: 100,
          child: Row(
            children: [
              buildImage(context),
              buildInfo(context),
              buildTimeInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  // Parts of the Widget
  Widget buildImage(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(0),
        color: Colors.black,
        alignment: Alignment.topLeft,
        child: Container(
          child: Image.network(
            widget.imageUrl,
            height: 100,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  Widget buildInfo(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Container(
            child: Text(
              widget.title,
              style:
                  GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Text(
              widget.groupName,
              style:
                  GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTimeInfo(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Container(
            child: Text(widget.dateText),
          ),
          Container(
            child: Text(widget.goingTime),
          )
        ],
      ),
    );
  }
}

class TripsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [],
      ),
    );
  }
}
