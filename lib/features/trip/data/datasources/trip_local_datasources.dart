import 'package:hive/hive.dart';
import 'package:travel_app/features/trip/data/models/trip_model.dart';

class TripLocalDatasources {
  final Box<TripModel> tripBox;

  TripLocalDatasources(this.tripBox);

  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }

  addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  deleteTrip(int index) {
    tripBox.deleteAt(index);
  }
}
