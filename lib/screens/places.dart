import 'package:flutter/material.dart';
import 'package:flutter_master/widgets/places_list.dart';
import 'package:flutter_master/screens/add_place.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => AddPlaceScreen()));
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: PlacesList(
        places: [],
      ),
    );
  }
}
