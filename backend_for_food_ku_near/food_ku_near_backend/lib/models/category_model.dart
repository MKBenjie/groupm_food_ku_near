import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final int index;

  const Category(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.index});

  Category copyWith({
    String? id,
    String? name,
    // String? description,
    String? imageUrl,
    int? index,
  }) {
    return Category(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        index: index ?? this.index);
  }

  factory Category.fromSnapshot(Map<String, dynamic> snap) {
    return Category(
        id: snap['id'],
        name: snap['name'],
        imageUrl: snap['imageUrl'],
        index: snap['index']);
  }

  @override
  List<Object> get props => [id, name, imageUrl, index];

  static List<Category> categories = const [
    Category(id: '1', name: 'Breakfast', imageUrl: "assets/mask2.png", index: 0),
    Category(id: '2', name: 'Lunch', imageUrl: "assets/heart1.png", index: 1),
    Category(id: '3', name: 'Diner', imageUrl: "assets/f_2.png", index: 2),
    Category(id: '4', name: 'Dessert', imageUrl: "assets/mask4.png", index: 3),
    Category(id: '5', name: 'Local', imageUrl: "assets/food5.jpg", index: 4),
  ];
}
