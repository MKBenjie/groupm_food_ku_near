import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String image;
  final int index;

  const Category({required this.id, required this.name, required this.image, required this.index});

  @override
  List<Object> get props => [id, name, image, index];

  static List<Category> categories = const [
    Category(id: 1, name: 'Breakfast', image: "assets/image/mask2.png", index: 0),
    Category(id: 2, name: 'Lunch', image: "assets/image/heart1.png", index: 1),
    Category(id: 3, name: 'Diner', image: "assets/image/f_2.png", index: 2),
    Category(id: 4, name: 'Dessert', image: "assets/image/mask4.png", index: 3),
    Category(id: 5, name: 'Local', image: "assets/food5.jpg", index: 4),
  ];
}
