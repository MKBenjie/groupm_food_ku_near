import 'package:flutter/material.dart';
import 'package:food_ku_near_backend/models/models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.index});

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 150,
      margin: const EdgeInsets.only(
        right: 10
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: (index == 0) ?
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            iconSize: 40,
            icon: Icon(Icons.add_circle,
            color: Colors.redAccent),
          ),
          Text(
            'Add a Product',
            // style: ,
          ),
         ]
       ) :

      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(product.imageUrl),
          ),
          Text(
            product.name,
            // style: ,
          ),
          Text(
            'UGX${product.price}',
            // style: ,
          ),
        ],
      ),
    );
  }
}