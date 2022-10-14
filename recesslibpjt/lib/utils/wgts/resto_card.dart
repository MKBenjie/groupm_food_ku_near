import 'package:flutter/material.dart';
import 'package:recesslibpjt/models/restaurant_model.dart';

import 'resto_tags.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/restaurant_details',
            arguments: restaurant);
      },
      // child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        image: AssetImage(restaurant.imageUrl),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover)),
                // child: Positioned(
                //   top: 10,
                //   right: 10,
                  child: Container(
                    width: 60,
                    height: 30,
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   borderRadius: BorderRadius.circular(5.0),
                    // ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "${restaurant.deliveryTime} min",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                // ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  // Text('${restaurant.tags}'),
                  RestaurantTags(restaurant: restaurant),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                      '${restaurant.distance}km - UGX${restaurant.deliveryFee} delivery fee')
                ],
              ),
            )
          ],
        ),
      // ),
    );
  }
}
