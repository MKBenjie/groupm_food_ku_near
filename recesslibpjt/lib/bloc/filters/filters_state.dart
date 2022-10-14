part of 'filters_bloc.dart';

abstract class FiltersState extends Equatable {
  const FiltersState();

  @override
  List<Object?> get props => [];
}

class FiltersLoading extends FiltersState {}

class FiltersLoaded extends FiltersState {
  final Filter filter;
  // final List<Restaurant>? filteredRestaurants;

  const FiltersLoaded({this.filter = const Filter(), /*this.filteredRestaurants = const <Restaurant>[]*/});

  @override
  List<Object?> get props => [filter, /*filteredRestaurants*/];
}
