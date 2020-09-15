import 'dart:convert';
import 'package:mobile_app/model/trip_model.dart';
import 'package:http/http.dart' as http;

class TripsService {
  Future<List<Trip>> getTripsList() {
    var response = http.get("http://127.0.0.1:9090/api/").then((data) {
      //succesful
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData);
      }
    });
    return null;
  }
}
