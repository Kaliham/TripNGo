import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/constants.dart';
import 'package:mobile_app/view/components/neumorphic_textfield.dart';

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
    return NeumorphicSearchbar(
      hintText: 'Searching...',
      function: _showFilterDialog,
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
                style: getlistItemNeuStyle(),
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topCenter,
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
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(5, 5, 5, 15),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: NeumorphicBackButton(
                  style: getCircBtnNeuStyle(),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.fromLTRB(2, 10, 3, 10),
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Text(''),
              ),
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Text(''),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(),
              ),
              Flexible(
                flex: 8,
                fit: FlexFit.tight,
                child: Material(
                  color: Colors.transparent,
                  child: SizedBox(
                    height: 100,
                    child: NeumorphicTextfield(
                      hintText: 'Enter Lower Price...',
                      dataType: TextInputType.number,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'JD',
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      textBaseline: TextBaseline.ideographic,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(),
              ),
              Flexible(
                flex: 8,
                fit: FlexFit.tight,
                child: SizedBox(
                  height: 100,
                  child: Material(
                    color: Colors.transparent,
                    child: SizedBox(
                      height: 100,
                      child: NeumorphicTextfield(
                        hintText: 'Enter Upper Price...',
                        dataType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'JD',
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      textBaseline: TextBaseline.ideographic,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
          alignment: Alignment.centerLeft,
          child: Text(
            'Tags',
            style: GoogleFonts.raleway(fontSize: 20),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Wrap(
            children: [
              _buildTag(context, "information"),
              _buildTag(context, "inf"),
              _buildTag(context, "information"),
              _buildTag(context, "information"),
              _buildTag(context, "information"),
              _buildTag(context, "information"),
            ],
          ),
        ),
      ],
    );
  }
}
