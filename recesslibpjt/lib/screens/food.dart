import 'package:flutter/material.dart';

class Food {
  String image;
  String foodName;
  String restaurant;
  int price;

  Food(this.image, this.foodName, this.restaurant, this.price) {}
}

List<Food> foodlist = [
  Food('assets/food1.jpg', 'Pizza', 'Kalyakamu', 15000),
  Food('assets/food2.jpg', 'Burger', 'Kalyakamu', 5000),
  Food('assets/food3.jpg', 'Chapati', 'Merz', 1000),
  Food('assets/food4.jpg', 'Rolex', 'Ability', 2000),
  Food('assets/food5.jpg', 'Rice', 'MunaYu', 5000),
  Food('assets/food6.jpg', 'Matooke Soup', 'Toke', 3000),
];
