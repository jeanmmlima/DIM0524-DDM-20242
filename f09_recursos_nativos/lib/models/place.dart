import 'dart:io';

import 'package:f09_recursos_nativos/models/place_location.dart';

class Place {
  final String id;
  final String title;
  final PlaceLocation? location;
  final File? image;

  Place({
    required this.id,
    required this.title,
    this.location,
    this.image,
  });
}
