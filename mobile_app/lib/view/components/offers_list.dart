import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/model/trip_model.dart';
import 'package:mobile_app/services/offers_service.dart';

import '../../constants.dart';

class OffersItem extends StatefulWidget {
  final Offer offer;

  OffersItem(this.offer);
  @override
  _OffersItemState createState() => _OffersItemState();
}

class _OffersItemState extends State<OffersItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: NeumorphicButton(
        padding: EdgeInsets.all(0),
        style: getlistItemNeuStyle(),
        child: Container(
          height: 160,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                  padding: EdgeInsets.all(0),
                  color: Colors.black,
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  child: Image.network(
                    widget.offer.imageUrl,
                    fit: BoxFit.fitHeight,
                    height: 160,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Center(
                          child: Text(
                            widget.offer.title,
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: Container(
                          margin: EdgeInsets.all(12),
                          alignment: Alignment.topLeft,
                          child: Text(widget.offer.description,
                              style: TextStyle(
                                color: Colors.grey[700],
                              )),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        fit: FlexFit.tight,
                        child: Container(
                          margin: EdgeInsets.all(15),
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.offer.price}JD',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.deepPurple[800]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

class OffersList extends StatefulWidget {
  @override
  _OffersListState createState() => _OffersListState();
}

class _OffersListState extends State<OffersList> {
  List<Offer> data = [];
  OffersService get offersService => GetIt.I<OffersService>();
  bool _isLoading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
    _fetchData();
  }

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    data = await offersService.getOffersList();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Builder(
        builder: (c) {
          if (_isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return OffersItem(data[index]);
            },
          );
        },
      ),
    );
  }
}
