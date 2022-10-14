import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recesslibpjt/bloc/basket/basket_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:recesslibpjt/utils/config.dart';

class EditBasketScreen extends StatelessWidget {
  static const String routeName = '/edit-basket';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const EditBasketScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const EditBasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Your Basket'),
        backgroundColor: Colors.redAccent,
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Done'),
          )
        ],
      )),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              'Items Added',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            BlocBuilder<BasketBloc, BasketState>(builder: (context, state) {
              if (state is BasketLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is BasketLoaded) {
                return state.basket.items.length == 0
                    ? Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 5.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Row(
                          children: [
                            Text(
                              'No items in the Basket',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.basket
                            .itemQuantity(state.basket.items)
                            .keys
                            .length,
                        itemBuilder: (context, index) {
                          return Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 5.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}x',
                                    style: TextStyle(),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}',
                                    style: TextStyle(),
                                  ),
                                  IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(RemoveAllItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                      },
                                      icon: Icon(
                                          Icons.remove_shopping_cart_outlined)),
                                  IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(RemoveItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                      },
                                      icon: Icon(Icons.remove_circle_outline)),
                                  IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(AddItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                      },
                                      icon: Icon(Icons.add_circle_outline))
                                ],
                              ));
                        });
              } else {
                return Text('Something went wrong');
              }
            }),
          ])),
    );
  }
}
