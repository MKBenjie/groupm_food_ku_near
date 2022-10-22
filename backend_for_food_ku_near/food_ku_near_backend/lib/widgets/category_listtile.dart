import 'package:flutter/material.dart';
import 'package:food_ku_near_backend/models/models.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  final Category category;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(
        category.imageUrl,
        height: 25.0,
      ),
      title: Text(
        category.name,
        style: TextStyle(fontSize: 16.0
            // color: Colors.
            ),
      ),
      // trailing: const Icon(Icons.menu),
    );
  }
}
