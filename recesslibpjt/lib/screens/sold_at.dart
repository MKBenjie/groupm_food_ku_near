import 'package:flutter/material.dart';
import 'foodmenu.dart';
import 'food.dart';

class Sold_detail extends StatelessWidget {
  final Food food;

  Sold_detail(this.food);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange[800],
        title: Text(
          food.foodName,
          style: TextStyle(fontSize: 30.0, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        // margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                fit: BoxFit.fill,
                image: AssetImage(food.image),
                height: 200.0,
                
              ),
              SizedBox(height: 15.0),
              Text(
                'RESTAURANT: ',
                style: TextStyle(fontSize: 20.0, color: Colors.white70),
              ),
              Text(
                food.restaurant,
                style: TextStyle(fontSize: 26.0, color: Colors.white),
              ),
              SizedBox(height: 15.0),
              Text(
                'PRICE:',
                style: TextStyle(fontSize: 20.0, color: Colors.white70),
              ),
              Text(
                'UGX ' + food.price.toString(),
                style: TextStyle(fontSize: 26.0, color: Colors.white),
              ),
            ],
          ),
      ),
    );
  }
}
