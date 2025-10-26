import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';

class AddTripScreen extends ConsumerWidget {
  AddTripScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: 'City 1');
  final _descriptionController = TextEditingController(text: 'City 1');
  final _locationController = TextEditingController(text: 'City 1');
  final _pictureController = TextEditingController(text: 'City 1');
  List<String> pictures = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(labelText: "Title"),
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: "Description"),
          ),
          TextFormField(
            controller: _locationController,
            decoration: InputDecoration(labelText: "Location"),
          ),
          TextFormField(
            controller: _pictureController,
            decoration: InputDecoration(labelText: "Picture"),
          ),
          ElevatedButton(onPressed: (){
            pictures.add(_pictureController.text);
            if(_formKey.currentState!.validate()){
              final newTrip = Trip(
                title: _titleController.text,
                description: _descriptionController.text,
                date: DateTime.now(),
                location: _locationController.text,
                photos: pictures,
              );
              ref.read(tripListNotifierProvider.notifier).addNewTrip(newTrip);
              ref.watch(tripListNotifierProvider.notifier).loadTrips();
            }
          }, child: Text("Add Trip"))
        ],
      ),
    );
  }
}
