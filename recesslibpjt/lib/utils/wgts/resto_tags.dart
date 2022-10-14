import 'package:flutter/material.dart';
import 'package:recesslibpjt/models/restaurant_model.dart';

class RestaurantTags extends StatelessWidget {
  const RestaurantTags({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: restaurant.tags
          .map((tag) => restaurant.tags.indexOf(tag) ==
                  restaurant.tags.length
              ? Text(
                  tag,
                )
              : Text('$tag, '))
          .toList(),
    );
  }
}
