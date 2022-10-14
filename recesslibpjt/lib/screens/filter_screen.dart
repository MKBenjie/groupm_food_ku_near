import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recesslibpjt/bloc/filters/filters_bloc.dart';
import 'package:recesslibpjt/models/models.dart';
import 'package:recesslibpjt/utils/filters/custom_category_filter.dart';
import 'package:recesslibpjt/utils/filters/custom_price_filter.dart';

// import 'package:recesslibpjt/models/price_model.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = '/filter';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => FilterScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<FilterBloc, FiltersState>(builder: (context, state) {
              if (state is FiltersLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is FiltersLoaded) {
                return ElevatedButton(
                  child: Text('Apply'),
                  onPressed: () {
                    var categories = state.filter.categoryFilters
                        .where((filter) => filter.value)
                        .map((filter) => filter.category.name)
                        .toList();

                    var prices = state.filter.priceFilters
                        .where((filter) => filter.value)
                        .map((filter) => filter.price.price)
                        .toList();

                    List<Restaurant> restaurants = Restaurant.restaurant
                        .where((restaurant) => categories.any((category) =>
                            restaurant.tags.contains(category)))
                        .where((restaurant) => prices.any((price) =>
                            restaurant.priceCategory.contains(price)))
                        .toList();

                    Navigator.pushNamed(context, '/restaurant-listing',
                    arguments: restaurants
                    );
                  },
                );
              } else {
                return Text('Something went wrong');
              }
            })
          ],
        ),
      )),
      // backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Filter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Price',
              style: TextStyle(fontSize: 20, color: Colors.redAccent),
            ),
            CustomPriceFilter(),
            const Text(
              'Category',
              style: TextStyle(fontSize: 20, color: Colors.redAccent),
            ),
            CustomCategoryFilter()
          ],
        ),
      ),
    );
  }
}
