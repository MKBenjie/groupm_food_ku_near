import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recesslibpjt/bloc/basket/basket_bloc.dart';
import 'package:recesslibpjt/models/delivery_time_model.dart';

class DeliveryTimeScreen extends StatelessWidget {
  static const String routeName = '/delivery-time';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const DeliveryTimeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const DeliveryTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Delivery Time'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Select'),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Your Day',
              style: TextStyle(
                fontSize: 25,
                color: Colors.red,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Delivery is Today!'),
                        duration: Duration(seconds: 3),
                      ));
                    },
                    child: Text('Today'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Delivery is Tomorrow!'),
                        duration: Duration(seconds: 3),
                      ));
                    },
                    child: Text('Tomorrow'),
                  ),
                ],
              ),
            ),
            Text(
              'Choose Your Time',
              style: TextStyle(
                fontSize: 25,
                color: Colors.red,
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: GridView.builder(
                  itemCount: DeliveryTime.deliveryTimes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 2.5),
                  itemBuilder: ((context, index) {
                    return BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                      return Card(
                        child: TextButton(
                          onPressed: () {
                            context.read<BasketBloc>().add(SelectDeliveryTime(
                                DeliveryTime.deliveryTimes[index]));
                          },
                          child: Text(
                            '${DeliveryTime.deliveryTimes[index].value}',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    });
                  })),
            ))
          ],
        ),
      ),
    );
  }
}
