import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ku_near_backend/models/category_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<SortCatrgories>(_onSortCatrgories);
    on<SelectCategory>(_onSelectCategory);
  }

  void _onLoadCategories(
    LoadCategories event,
    Emitter<CategoryState> emit,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(CategoryLoaded(categories: event.categories));
  }

  void _onSortCatrgories(
    SortCatrgories event,
    Emitter<CategoryState> emit,
  ) async {
    final state = this.state as CategoryLoaded;

    emit(CategoryLoading());
    await Future<void>.delayed(const Duration(seconds: 1));

    int newIndex =
        (event.newIndex > event.oldIndex) ? event.newIndex - 1 : event.newIndex;

    try {
      Category selectedCategory = state.categories[event.oldIndex];

      List<Category> sortedCategories = List.from(state.categories)
        ..remove(selectedCategory)
        ..insert(newIndex, selectedCategory);

      emit(CategoryLoaded(categories: sortedCategories));
    } catch (_) {}
  }

  void _onSelectCategory(
    SelectCategory event,
    Emitter<CategoryState> emit,
  ) {
        final state = this.state as CategoryLoaded;

    emit(CategoryLoaded(
        categories: state.categories, selectedCategory: event.category));
  }
}
