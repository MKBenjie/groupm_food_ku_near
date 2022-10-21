import 'package:flutter/material.dart';
import 'package:recesslibpjt/models/restaurant_model.dart';
import 'package:recesslibpjt/utils/wgts/resto_tags.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInformation({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(restaurant.name, style: TextStyle(
            fontSize: 20,
            color: Colors.redAccent
          ),),
          SizedBox(height: 10,),
          RestaurantTags(restaurant: restaurant),
          SizedBox(height: 5.0,),
          Text("${restaurant.distance}km away - UGX${restaurant.deliveryFee} delivery fee", style: TextStyle(
            fontSize: 15,
            // color: Colors.redAccent
          ),
          ),
          Text("Restaurant Information", style: TextStyle(
            fontSize: 18,
            // color: Colors.redAccent
            )),
            SizedBox(height: 5.0,),
            Text("ALL ABOUT THE RESTAURANT"),
        ],
      ),
    );
  }
}
