import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/constants.dart';

class TripsScreen extends StatefulWidget {
  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationContr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationContr =
        new AnimationController(vsync: this, duration: Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      color: Colors.deepPurple[50],
      child: Column(
        children: [
          _buildSearchbar(context),
          SizedBox(
            height: 20,
          ),
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
      child: NeumorphicButton(
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
        onPressed: () {},
      ),
    );
  }

  Widget _buildSearchbar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: Neumorphic(
        style: getlistItemNeuStyle(),
        child: Container(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
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
              NeumorphicButton(
                child: Icon(Icons.filter_list),
                onPressed: () {
                  _showFilterDialog();
                },
                style: getlistItemNeuStyle(),
              )
            ],
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

  Future<void> _showFilterDialog() async {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Center(
          child: SizedBox(
            width: size.width * 0.8,
            height: size.height * 0.8,
            child: Container(
              child: Neumorphic(
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(80),
                  child: _buildFilterContent(context),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterContent(context) {
    return Expanded(
      child: Column(
        children: [],
      ),
    );
  }
}
