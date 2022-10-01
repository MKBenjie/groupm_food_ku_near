import 'package:flutter/material.dart';
import 'food.dart';
import 'sold_at.dart';

void main(List<String> args) {
  runApp(Hello());
}

class Hello extends StatefulWidget {
  const Hello({super.key});

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.orange.shade800,
            appBar: AppBar(
              title:
                  Text('Food Ku Near', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.orange,
            ),
            body: ListView.builder(
                itemCount: foodlist.length,
                itemBuilder: (context, rowNumber) {
                  Food food = foodlist[rowNumber];
                  return Card(
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                            child: Image(
                              image: AssetImage(food.image),
                              height: 143.0,
                              width: 200.0,
                              fit: BoxFit.fill,
                            )),
                        Column(
                          children: [
                            Text(food.foodName,
                                style: TextStyle(
                                  fontSize: 30.0,
                                )),
                            Container(
                              margin: EdgeInsets.fromLTRB(5.0, 20.0, 0.0, 0.0),
                              child: Text(
                                'UGX  ' + food.price.toString(),
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  color: Colors.orange.shade400,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.0))),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Sold_detail(food);
                                  }));
                                },
                                child: Text(
                                  'SOLD AT',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              ),
                            )
                            // TextButton.icon(onPressed: (){},icon: Icons. ,label: Text('SOLD AT'))
                          ],
                        ),
                      ],
                    ),
                  );
                })));
  }
}
