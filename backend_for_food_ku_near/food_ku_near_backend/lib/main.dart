import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ku_near_backend/blocs/blocs.dart';
import 'package:food_ku_near_backend/models/category_model.dart';
import 'package:food_ku_near_backend/models/models.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc()
            ..add(LoadCategories(categories: Category.categories)),
        ),
        BlocProvider(
          create: (context) => ProductBloc(categoryBloc: BlocProvider.of<CategoryBloc>(context))
            ..add(LoadProducts(products: Product.products)),
        )
      ],
      child: MaterialApp(
        title: 'FOOD KU NEAR',
        initialRoute: '/menu',
        routes: {
          '/menu': (context) => const MenuScreen(),
          // '/dash':(context) => const DashboardScreen(),
          // '/opening-hours':(context) => const OpeningHoursScreen()
        },
      ),
    );
  }
}
