import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../constants.dart';

class TripsItem extends StatefulWidget {
  @override
  _TripsItemState createState() => _TripsItemState();
}

class _TripsItemState extends State<TripsItem> {
  var imageUrl = "";
  var dateText = "";
  var title = "";
  var groupName = "";

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
              ,
              Flexible(
                child: Container(
                  child: Text(""),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Parts of the Widget
  Widget buildImage(BuildContext context) {
    return Flexible(
      child: Image.network(imageUrl),
    );
  }

  Widget buildInfo(BuildContext context){
return Flexible(
                child: Column(
                  children: [],
                ),
              );
  }
}
