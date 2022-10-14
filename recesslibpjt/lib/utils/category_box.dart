import 'package:flutter/material.dart';
import 'package:recesslibpjt/models/category_model.dart';
import 'package:recesslibpjt/models/restaurant_model.dart';

class CategoryBox extends StatelessWidget {
  final Category category;
  const CategoryBox({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Restaurant> restaurants = Restaurant.restaurant
        .where((restaurant) => restaurant.tags.contains(category.name))
        .toList();

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/restaurant-listing',
          arguments: restaurants,
        );
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 5.0),
        decoration: const BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 50,
                width: 60,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.white,
                ),
                child: Image(image: AssetImage(category.image)),
                
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  category.name,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
