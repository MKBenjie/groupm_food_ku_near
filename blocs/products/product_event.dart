part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {
  final List<Product> products;

  const LoadProducts({this.products = const <Product>[]});

  @override
  List<Object> get props => [products];
}

class UpdateProducts extends ProductEvent {
  final Category category;

  const UpdateProducts({required this.category});

  @override
  List<Object> get props => [category];
}

class SortProducts extends ProductEvent {
  final int oldIndex;
  final int newIndex;

  const SortProducts(this.oldIndex, this.newIndex);

  @override
  List<Object> get props => [oldIndex, newIndex];
}
