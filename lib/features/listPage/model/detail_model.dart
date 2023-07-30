import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../utils/generics/model_factory.dart';

class DetailModelFactory extends ModelFactory<DetailModel> {
  @override
  DetailModel fromMap(Map<String, dynamic> map) {
    return DetailModel.fromMap(map);
  }
}

@immutable
class DetailModel {
  final String id;
  final String title;
  final String price;
  final String image;
  final String description;
  final Rating rating;

  const DetailModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.rating,
  });

  DetailModel copyWith({
    String? id,
    String? title,
    String? price,
    String? image,
    String? description,
    Rating? rating,
  }) {
    return DetailModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      description: description ?? this.description,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'image': image,
      'description': description,
      'rating': rating.toMap(),
    };
  }

  factory DetailModel.fromMap(Map<String, dynamic> map) {
    return DetailModel(
      id: map['id'].toString(),
      title: map['title'] as String,
      price: map['price'].toString(),
      image: map['image'] as String,
      description: map['description'] as String,
      rating: Rating.fromMap(map['rating']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailModel.fromJson(String source) =>
      DetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DetailModel(id: $id, title: $title, price: $price, image: $image, description: $description, rating: $rating)';
  }

  @override
  bool operator ==(covariant DetailModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.price == price &&
        other.image == image &&
        other.description == description &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        image.hashCode ^
        description.hashCode ^
        rating.hashCode;
  }
}

class Rating {
  final String rate;
  final String count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: map['rate'].toString(),
      count: map['count'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'count': count,
    };
  }
}
