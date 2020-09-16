import 'dart:convert';
import 'package:mobile_app/model/trip_model.dart';
import 'package:http/http.dart' as http;

class OffersService {
  Future<List<Offer>> getOffersList() {
    var response = http.get('http://127.0.0.1:9090/api/offers').then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final offers = <Offer>[];
        for (var item in jsonData) {
          final offer = Offer(
            active: item['active'],
            title: item['title'],
            imageUrl: item['imageUrl'],
            callNumber: item['callNumber'],
            date: item['date'],
            time: item['time'],
            price: double.parse(item['price'].toString()),
            offerId: item['offerId'],
            description: item['description'],
            avaibleQuantity: item['avaibleQuantity'],
          );
          offers.add(offer);
        }
        return offers;
      }
    });
    return response;
  }
}
