
import 'package:card_animated_app/app/models/review.dart';

class Location {
  final String? name;
  final String? urlImage;
  final String? latitude;
  final String? longitude;
  final String? addressLine1;
  final String? addressLine2;
  final int? starRating;
  final List<Review>? reviews;

  Location({
    this.reviews,
    this.name,
    this.urlImage,
    this.latitude,
    this.longitude,
    this.addressLine1,
    this.addressLine2,
    this.starRating,
  });
}