import 'package:recipe_mobile_frontend/models/review_models.dart';

class Review {
  final String? review;
  final String? user;

  Review({
    this.review,
    this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(review: json['reviewss'], user: json['mance']);
  }
}
