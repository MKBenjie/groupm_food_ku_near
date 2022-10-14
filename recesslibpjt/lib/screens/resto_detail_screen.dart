import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recesslibpjt/bloc/basket/basket_bloc.dart';
import 'package:recesslibpjt/models/restaurant_model.dart';
import 'package:recesslibpjt/utils/wgts/resto_info.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const String routeName = '/restaurant_details';
  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantDetailsScreen(restaurant: restaurant),
      settings: RouteSettings(name: routeName),
    );
  }

  final Restaurant restaurant;

  const RestaurantDetailsScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/basket');
              },
              child: Text('Basket'),
            )
          ],
        ),
      )),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(restaurant.imageUrl)))),
            RestaurantInformation(restaurant: restaurant),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: restaurant.tags.length,
                itemBuilder: (context, index) {
                  return _buildMenuItems(restaurant, context, index);
                })
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItems(
      Restaurant restaurant, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            restaurant.tags[index],
            style: TextStyle(
              fontSize: 20,
              color: Colors.redAccent,
            ),
          ),
        ),
        Column(
          children: restaurant.menuItems
              .where((menuItem) => menuItem.category == restaurant.tags[index])
              .map((menuItem) => Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(menuItem.name),
                          subtitle: Text(menuItem.descrption),
                          trailing: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('UGX${menuItem.price}'),
                              BlocBuilder<BasketBloc, BasketState>(builder: (context, state) {
                                return IconButton(
                                  onPressed: () {
                                    context.read<BasketBloc>()
                                      ..add(AddItem(menuItem));
                                  },
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: Colors.redAccent,
                                  ),
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 2,
                      )
                    ],
                  ))
              .toList(),
        )
      ],
    );
  }
}
