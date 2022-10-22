import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double price;
  final int index;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.index,
  });

  Product copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    double? price,
    int? index,
  }) {
    return Product(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        price: price ?? this.price,
        index: index ?? this.index);
  }

  factory Product.fromSnapshot(Map<String, dynamic> snap) {
    return Product(
        id: snap['id'],
        name: snap['name'],
        category: snap['category'],
        description: snap['description'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        index: snap['index']);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        description,
        price,
        imageUrl,
        index,
      ];

  static List<Product> products = const [
    Product(
        id: '1',
        name: 'Margherita',
        category: 'Lunch',
        description: 'Tomatoes, mozzarella, basil',
        imageUrl: 'imageUrl',
        price: 15000,
        index: 0),
        Product(
        id: '2',
        name: 'Margherita',
        category: 'Breakfast',
        description: 'Tomatoes, mozzarella, basil',
        imageUrl: 'imageUrl',
        price: 15000,
        index: 1)
  ];
}
