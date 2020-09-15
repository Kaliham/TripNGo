import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/model/trip_model.dart';
import 'package:mobile_app/services/trips_serivce.dart';

import '../../constants.dart';

class TripsItem extends StatefulWidget {
  final Trip trip;

  TripsItem([this.trip]) {
    TripsService tripsService = GetIt.I<TripsService>();
    var tmp = tripsService.getTripsList();
  }
  @override
  _TripsItemState createState() => _TripsItemState();
}

class _TripsItemState extends State<TripsItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.trip.imageUrl);
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
            widget.trip.imageUrl,
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
              widget.trip.title,
              style:
                  GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Text(
              widget.trip.groupName,
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
            child: Text(widget.trip.date),
          ),
          Container(
            child: Text(widget.trip.time),
          )
        ],
      ),
    );
  }
}

class TripsList extends StatefulWidget {
  TripsService service;
  TripsList() {
    service = GetIt.I<TripsService>();
  }

  @override
  _TripsListState createState() => _TripsListState();
}

class _TripsListState extends State<TripsList> {
  List<Trip> data;
  bool _isLoading;
  TripsService get service => GetIt.instance<TripsService>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = false;
    _fetchData();
  }

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    data = await service.getTripsList();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Builder(
        builder: (c) {
          if (_isLoading) return CircularProgressIndicator();
          return ListView.builder(
            itemBuilder: (_, index) {
              return TripsItem(data[index]);
            },
          );
        },
      ),
    );
  }
}
