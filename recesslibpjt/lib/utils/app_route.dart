// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recesslibpjt/models/restaurant_model.dart';
import 'package:recesslibpjt/screens/basket_screen.dart';
import 'package:recesslibpjt/screens/delivery_time_screen.dart';
import 'package:recesslibpjt/screens/edit_basket_screen.dart';
import 'package:recesslibpjt/screens/filter_screen.dart';
import 'package:recesslibpjt/screens/home_scn.dart';
import 'package:recesslibpjt/screens/restaurant_listing_screen.dart';
import 'package:recesslibpjt/screens/resto_detail_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case HomeScn.routeName:
        return HomeScn.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case EditBasketScreen.routeName:
        return EditBasketScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route(
            restaurant: settings.arguments as Restaurant);
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route(
            restaurants: settings.arguments as List<Restaurant>);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('error')),
      ),
      settings: RouteSettings(name: '/error'),
    );
  }
}
