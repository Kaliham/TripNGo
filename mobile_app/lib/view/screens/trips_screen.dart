import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
          Text('1'),
          Text('1'),
          Text('1'),
          Text('1'),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            height: 200,
            child: Neumorphic(child: Center(child: Text('hello'))),
          ),
          Text('1ddfsasdfsdfasdfadfasfasfdfasdfasdfasdddsdfasdfasdfasdfs'),
          Text('1 dafsdfasd sdfasd ad sdfasd asdf sd'),
          Text('1'),
        ],
      ),
    );
  }
}
