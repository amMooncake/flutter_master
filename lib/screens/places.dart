import 'package:flutter/material.dart';
import 'package:flutter_master/providers/user_places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_master/models/place.dart';

import 'package:flutter_master/widgets/places_list.dart';
import 'package:flutter_master/screens/add_place.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);

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
        places: userPlaces,
      ),
    );
  }
}