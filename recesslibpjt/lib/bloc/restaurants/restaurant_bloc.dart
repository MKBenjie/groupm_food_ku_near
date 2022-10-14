import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recesslibpjt/models/restaurant_model.dart';
import 'package:recesslibpjt/repositories/restaurant/restaurant_repository.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  final RestuarantRepository _restaurantRepository;
  StreamSubscription? _restaurantSubscription;

  RestaurantsBloc({required RestuarantRepository restaurantRepository})
      : _restaurantRepository = restaurantRepository,
        super(RestaurantsLoading()) {
    on<LoadRestaurants>(_onLoadRestaurants);

    _restaurantSubscription = _restaurantRepository
        .getRestaurants()
        .listen((restaurants) => add(LoadRestaurants(restaurants)));
  }

  void _onLoadRestaurants(
    LoadRestaurants event,
    Emitter<RestaurantsState> emit,
  ) {
    emit(RestaurantsLoaded(event.restaurants));
  }

  @override
  Future<void> close() async {
    _restaurantSubscription?.cancel();
    super.close();
  }
}
