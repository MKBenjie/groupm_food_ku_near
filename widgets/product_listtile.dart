import 'package:flutter/material.dart';
import 'package:food_ku_near_backend/models/models.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({Key? key, required this.product, required this.onTap})
      : super(key: key);

  final Product product;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(
        product.name,
        style: TextStyle(fontSize: 16.0
            // color: Colors.
            ),
      ),
      // trailing: const Icon(Icons.menu),
    );
  }
}
