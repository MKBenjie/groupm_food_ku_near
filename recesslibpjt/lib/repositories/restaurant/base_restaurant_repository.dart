

import 'package:recesslibpjt/models/models.dart';

abstract class BaseRestaurantRepository {
  Stream<List<Restaurant>> getRestaurants();
}