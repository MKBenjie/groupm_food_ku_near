import 'package:flutter/material.dart';
import 'package:recesslibpjt/models/restaurant_model.dart';
import 'package:recesslibpjt/utils/wgts/resto_card.dart';


class RestaurantListingScreen extends StatelessWidget {
  static const String routeName = '/restaurant-listing';
  static Route route({required List <Restaurant> restaurants}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantListingScreen(restaurants: restaurants),
      settings: const RouteSettings(name: routeName),
    );
  }

  final List<Restaurant> restaurants;
  const RestaurantListingScreen({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Restaurants You Can Try"),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: ((context, index) {
          return RestaurantCard(restaurant: restaurants[index]);
        })),
      )
    );
  }
}