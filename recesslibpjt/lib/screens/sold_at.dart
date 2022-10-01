import 'package:flutter/material.dart';
import 'foodmenu.dart';
import 'food.dart';

class Sold_detail extends StatelessWidget {
  final Food food;

  Sold_detail(this.food);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.orange.shade800,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          food.foodName,
          style: TextStyle(fontSize: 30.0, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.symmetric(horizontal: 100.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(food.image),
              ),
              Text(
                'RESTAURANT: ' + food.restaurant,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              Text(
                'PRICE:               ' + 'UGX ' + food.price.toString(),
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
