import 'package:flutter/material.dart';

class Food {
  String image;
  String foodName;
  String restaurant;
  int price;

  Food(this.image, this.foodName, this.restaurant, this.price) {}
}

List<Food> foodlist = [
  Food('assets/food1.jpg', 'Pizza', 'kalyakamu', 1200),
  Food('assets/food2.jpg', 'Burger', 'kalyakamu', 5000),
  Food('assets/food3.jpg', 'Chapati', 'Merz', 1000),
  Food('assets/food4.jpg', 'Rolex', 'Ability', 2000),
  Food('assets/food5.jpg', 'Rice', 'MunaYu', 4000),
  Food('assets/food6.jpg', 'Matooke Soup', 'Toke', 3000),
  Food('assets/meat.jpg', 'meat', 'myama_chomo', 5000),
  Food('assets/chipsandchick.jpg', 'chips and chicken', 'friesa', 7000),
];
