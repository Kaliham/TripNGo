import 'package:get_it/get_it.dart';
import 'package:mobile_app/services/trips_serivce.dart';

void initalizer() {
  setupLocators();
}

void setupLocators() {
  GetIt.instance.registerLazySingleton(() => TripsService());
}
