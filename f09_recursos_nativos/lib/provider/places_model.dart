import 'dart:io';
import 'dart:math';

import 'package:f09_recursos_nativos/models/place_location.dart';
import 'package:flutter/material.dart';

import '../models/place.dart';
import '../utils/db_util.dart';

class PlacesModel with ChangeNotifier {
  List<Place> _items = [];


  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title,) {
    final newPlace = Place(
        id: Random().nextDouble().toString(),
        title: title,
        location: null,
        image: null);

    _items.add(newPlace);
    DbUtil.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': '',
    });
    notifyListeners();
  }

  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData('places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: item['image'] != '' ? File(item['image']) : null,
            location: PlaceLocation(
              latitude: 0.0,
              longitude: 0.0,
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
