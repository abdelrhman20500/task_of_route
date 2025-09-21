import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final String image;
  final String description;
  final double price;
  final double rating;
  final double discountPercentage;


  const ProductEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.rating,
    required this.discountPercentage,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    image,
    description,
    price,
    rating,
    discountPercentage,
  ];
}
