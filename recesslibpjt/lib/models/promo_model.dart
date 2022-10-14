
import 'package:equatable/equatable.dart';

class Promo extends Equatable{
  final int id;
  final String title;
  final String description;
  final String image;

  Promo(
      {required this.id,
      required this.title,
      required this.description,
      required this.image});

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        image,
      ];

  static List<Promo> promos = [
    Promo(
        id: 1,
        title: 'FREE Delivery on Your First 3 Orders',
        description:
            "Place an order of UGX 50,000 or more and the delivery fee is on us",
        image: 'assets/image/resto.png'),
    Promo(
        id: 2,
        title: "20% off on Selected Restaurants.",
        description: "Get a discount at more than 5+ restaurants",
        image: 'assets/image/resto1.png')
  ];
}
