part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class LoadCategories extends CategoryEvent {
  final List<Category> categories;

  const LoadCategories({this.categories = const <Category>[]});

  @override
  List<Object?> get props => [categories];
}

class SelectCategory extends CategoryEvent {
  final Category? category;

  const SelectCategory(this.category);

  @override
  List<Object?> get props => [category];
}

class SortCatrgories extends CategoryEvent {
  final int oldIndex;
  final int newIndex;

  const SortCatrgories({required this.oldIndex, required this.newIndex});

  @override
  List<Object?> get props => [oldIndex, newIndex];
}
