import 'dart:convert';
import 'package:mobile_app/model/trip_model.dart';
import 'package:http/http.dart' as http;

class TripsService {
  Future<List<Trip>> getTripsList() {
    var response = http.get("http://127.0.0.1:9090/api/trips").then((data) {
      //succesful
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final trips = <Trip>[];
        for (var item in jsonData) {
          final trip = Trip(
            active: item['active'],
            groupID: item['group'].toString(),
            groupName: item['group'].toString(),
            title: item['title'],
            imageUrl: item['imageUrl'],
            budget: double.parse(item['budget']),
            link: item['link'],
            location: item['location'],
            phoneNumber: item['phoneNumber'],
            date: item['date'],
            time: item['time'],
          );
          trips.add(trip);
        }
        return trips;
      }
    });
    return response;
  }
}
