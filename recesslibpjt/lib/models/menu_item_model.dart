import 'package:equatable/equatable.dart';

class MenuItem extends Equatable{
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String descrption;
  final double price;

  MenuItem(
      {required this.id,
      required this.restaurantId,
      required this.name,
      required this.category,
      required this.descrption,
      required this.price});

  @override
  List<Object?> get props => [id, restaurantId, name, category, descrption, price];

  static List<MenuItem> menuItem = [
    MenuItem(
        id: 1,
        restaurantId: 1,
        name: "Rice",
        category: "Local",
        descrption: "It comes with Peas",
        price: 2500),
    MenuItem(
        id: 2,
        restaurantId: 2,
        name: "Rolex",
        category: "Breakfast",
        descrption: "Comes in different kinds",
        price: 2000),
    MenuItem(
        id: 3,
        restaurantId: 3,
        name: "Pizza",
        category: "Breakfast",
        descrption: "We have chicken, beef and Vegetable",
        price: 5000),
    MenuItem(
        id: 4,
        restaurantId: 4,
        name: "Matooke",
        category: "Local",
        descrption: "Offered with P-nuts",
        price: 5000),
  ];
}
