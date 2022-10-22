import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recesslibpjt/bloc/basket/basket_bloc.dart';
import 'package:recesslibpjt/screens/QR_Generate.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:recesslibpjt/utils/config.dart';
import 'QR_Generate.dart';

class BasketScreen extends StatelessWidget {
  static const String routeName = '/basket';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const BasketScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Basket'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/edit-basket');
            },
            icon: Icon(Icons.edit),
          )
        ],
        backgroundColor: Colors.redAccent,
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigator.pushNamed(context, '/basket');
            },
            child: Text('Go TO Checkout'),
          ),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/QR_Generate');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QR_Generate()));
              },
              child: Text('Generate QR Code'))
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
                                  Text(
                                    '${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).price}',
                                    style: TextStyle(),
                                  )
                                ],
                              ));
                        });
              } else {
                return Text('Something went wrong');
              }
            }),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.only(top: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SvgPicture.asset(Config.app_icon, fit: BoxFit.contain, allowDrawingOutsideViewBox: false,),
                  Image(
                    image: AssetImage(Config.app_icon),
                    fit: BoxFit.contain,
                  ),
                  BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                    if (state is BasketLoaded) {
                      return (state.basket.deliveryTime == null)
                          ? Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Text(
                                  'Delivery in 20minutes',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/delivery-time');
                                    },
                                    child: const Text(
                                      'Change',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.redAccent),
                                    ))
                              ],
                            )
                          : Column(
                              children: [
                                const SizedBox(height: 20.0),
                                Text(
                                  'Delivery at ${state.basket.deliveryTime!.value}',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/delivery-time');
                                    },
                                    child: const Text(
                                      'Change',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.redAccent),
                                    )),
                              ],
                            );
                    } else {
                      return Text('Something went wrong');
                    }
                  })
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              // width: MediaQuery.of(context).size.width,
              height: 100,
              margin: EdgeInsets.only(top: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: BlocBuilder<BasketBloc, BasketState>(
                  builder: (context, state) {
                if (state is BasketLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is BasketLoaded) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'UGX ${state.basket.subtotalString}',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Delivery fee',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'UGX 1500',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(fontSize: 16.0, color: Colors.red),
                          ),
                          Text(
                            'UGX ${state.basket.totalString}',
                            style: TextStyle(fontSize: 16.0, color: Colors.red),
                          )
                        ],
                      ),
                    ],
                  );
                } else {
                  return Text("Something went wrong");
                }
              }),
            ),
          ])),
    );
  }
}
