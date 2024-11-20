import 'package:flutter/material.dart';
import 'package:flutter_master/providers/user_places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_master/widgets/places_list.dart';
import 'package:flutter_master/screens/add_place.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PlacesScreenState();
  }
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(userPlacesProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: FutureBuilder(
          future: _placesFuture,
          builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : PlacesList(
                  places: userPlaces,
                ),
        ),
      ),
    );
  }
}
