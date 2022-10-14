import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:recesslibpjt/bloc/restaurants/restaurant_bloc.dart';
import 'package:recesslibpjt/models/category_filter_model.dart';
import 'package:recesslibpjt/models/price_filter_model.dart';
import 'package:recesslibpjt/models/models.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FilterBloc extends Bloc<FiltersEvent, FiltersState> {
  // final RestaurantsBloc _restaurantsBloc;
  FilterBloc(/*{required RestaurantsBloc restaurantsBloc}*/)
      :/* _restaurantsBloc = restaurantsBloc,*/
        super(FiltersLoading()) {
    on<FilterLoad>(_onFilterLoad);
    on<CategoryFilterUpdated>(_onCategoryFilterUpdated);
    on<PriceFilterUpdated>(_onPriceFilterUpdated);
  }
  void _onFilterLoad(FilterLoad event, Emitter<FiltersState> emit) async {
    emit(FiltersLoaded(
        filter: Filter(
      categoryFilters: CategoryFilter.filters,
      priceFilters: PriceFilter.filters,
    )));
  }

  void _onCategoryFilterUpdated(
      CategoryFilterUpdated event, Emitter<FiltersState> emit) async {
    final state = this.state;
    if (state is FiltersLoaded) {
      final List<CategoryFilter> updatedCategoryFilters =
          state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();

      // var categories = updatedCategoryFilters
      //     .where((filter) => filter.value)
      //     .map((filter) => filter.category)
      //     .toList();

      // var prices = state.filter.priceFilters
      //     .where((filter) => filter.value)
      //     .map((filter) => filter.price.price)
      //     .toList();

      // List<Restaurant> filteredRestaurants =
      //     _getFilteredRestaurants(categories, prices);

      emit(FiltersLoaded(
          filter: Filter(
              categoryFilters: updatedCategoryFilters,
              priceFilters: state.filter.priceFilters),
         /* filteredRestaurants: filteredRestaurants*/));
    }
  }

  void _onPriceFilterUpdated(
      PriceFilterUpdated event, Emitter<FiltersState> emit) async {
    final state = this.state;
    if (state is FiltersLoaded) {
      final List<PriceFilter> updatedPriceFilters =
          state.filter.priceFilters.map((priceFilter) {
        return priceFilter.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilter;
      }).toList();

      // var categories = state.filter.categoryFilters
      //     .where((filter) => filter.value)
      //     .map((filter) => filter.category)
      //     .toList();

      // var prices = updatedPriceFilters
      //     .where((filter) => filter.value)
      //     .map((filter) => filter.price.price)
      //     .toList();

      // List<Restaurant> filteredRestaurants =
      //     _getFilteredRestaurants(categories, prices);

      emit(FiltersLoaded(
        filter: Filter(
          categoryFilters: state.filter.categoryFilters,
          priceFilters: updatedPriceFilters,
        ),
        // filteredRestaurants: filteredRestaurants,
      ));
    }
  }

  // List<Restaurant> _getFilteredRestaurants(
  //     List<Category> categories, List<String> prices) {
  //   return (/*_restaurantsBloc.*/state as RestaurantsLoaded)
  //       .restaurants
  //       .where((restaurants) => categories.any(
  //             (category) => restaurants.categories.contains(category),
  //           ))
  //       .where((restaurants) =>
  //           prices.any((price) => restaurants.priceCategory.contains(price)))
  //       .toList();
  // }
}
