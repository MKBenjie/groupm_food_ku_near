import 'package:equatable/equatable.dart';

import 'models.dart';

class Restaurant extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> tags;
  // final List<Category> categories;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final String priceCategory;
  final double deliveryFee;
  final double distance;

  const Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.tags,
    // required this.categories,
    required this.menuItems,
    required this.deliveryTime,
    required this.priceCategory,
    required this.deliveryFee,
    required this.distance,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        tags,
        // categories,
        deliveryTime,
        priceCategory,
        deliveryFee,
        distance
      ];

  static List<Restaurant> restaurant = [
    Restaurant(
        id: 1,
        name: "",
        imageUrl: 'assets/restaurant1.jpg',
        tags: MenuItem.menuItem
            .where((menuItem) => menuItem.restaurantId == 1)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        // categories: Category.categories,
        menuItems: MenuItem.menuItem
            .where((menuItem) => menuItem.restaurantId == 1)
            .toList(),
        deliveryTime: 30,
        priceCategory: 'UGX',
        deliveryFee: 1500,
        distance: 0.7),
    Restaurant(
        id: 2,
        name: "",
        imageUrl: 'assets/restaurant2.jpg',
        tags: MenuItem.menuItem
            .where((menuItem) => menuItem.restaurantId == 2)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        // categories: Category.categories,

        // categories: ,
        menuItems: MenuItem.menuItem
            .where((menuItem) => menuItem.restaurantId == 2)
            .toList(),
        deliveryTime: 30,
        priceCategory: 'UGX,UGX',
        deliveryFee: 1500,
        distance: 0.3),
    Restaurant(
        id: 3,
        name: "",
        imageUrl: 'assets/restaurant3.jpg',
        tags: MenuItem.menuItem
            .where((menuItem) => menuItem.restaurantId == 3)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        // categories: Category.categories,
        menuItems: MenuItem.menuItem
            .where((menuItem) => menuItem.restaurantId == 3)
            .toList(),
        deliveryTime: 30,
        priceCategory: 'UGX',
        deliveryFee: 1500,
        distance: 0.6),
    Restaurant(
        id: 4,
        name: "",
        imageUrl: 'assets/restaurant4.jpg',
        tags: MenuItem.menuItem
            .where((menuItem) => menuItem.restaurantId == 4)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        // categories: Category.categories,
        menuItems: MenuItem.menuItem
            .where((menuItem) => menuItem.restaurantId == 4)
            .toList(),
        deliveryTime: 30,
        priceCategory: 'UGX, UGX, UGX',
        deliveryFee: 1500,
        distance: 1),
  ];
}
