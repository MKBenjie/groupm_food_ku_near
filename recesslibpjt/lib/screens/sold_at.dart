import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'foodmenu.dart';
import 'food.dart';

class Sold_detail extends StatefulWidget {
  final Food food;

  Sold_detail(this.food);

  @override
  State<Sold_detail> createState() => _Sold_detailState();
}

class _Sold_detailState extends State<Sold_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange[800],
        title: Text(
          widget.food.foodName,
          style: TextStyle(fontSize: 30.0, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              fit: BoxFit.fill,
              image: AssetImage(widget.food.image),
              height: 200.0,
            ),
            SizedBox(height: 15.0),
            Text(
              'RESTAURANT: ',
              style: TextStyle(fontSize: 20.0, color: Colors.white70),
            ),
            Text(
              widget.food.restaurant,
              style: TextStyle(fontSize: 26.0, color: Colors.white),
            ),
            SizedBox(height: 15.0),
            Text(
              'PRICE:',
              style: TextStyle(fontSize: 20.0, color: Colors.white70),
            ),
            Text(
              'UGX ' + widget.food.price.toString(),
              style: TextStyle(fontSize: 26.0, color: Colors.white),
            ),
            SizedBox(height: 15.0),
            GestureDetector(
              onTap: () {
                _handlePaymentInitialization();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  color: Colors.redAccent,
                ),
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.payments_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Make Payment',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handlePaymentInitialization() async {
    final style = FlutterwaveStyle(
        appBarText: "Food Ku Near",
        buttonColor: Colors.redAccent,
        // appBarIcon: Icon(Icons.message, color: Color(0xffd0ebff)),
        appBarIcon: Icon(Icons.arrow_back, color: Colors.white),
        buttonTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        appBarColor: Colors.orange[600],
        dialogCancelTextStyle: TextStyle(color: Colors.redAccent, fontSize: 18),
        dialogContinueTextStyle: TextStyle(color: Colors.blue, fontSize: 18));

    final Customer customer = Customer(
        name: "Benjie Developer",
        phoneNumber: "1234566677777",
        email: "customer@customer.com");

    Random rand = Random();
    int number = rand.nextInt(2500);
    var _ref = "f_ku_near_1200$number";
    var food_price = widget.food.price.toString().trim();
    final Flutterwave flutterwave = Flutterwave(
        context: context,
        style: style,
        publicKey: "FLWPUBK_TEST-c2bddc6b89ccece1fe24d075b5f05a30-X",
        currency: "UGX",
        redirectUrl: "my_redirect_url",
        txRef: _ref,
        amount: food_price,
        customer: customer,
        paymentOptions: "ussd, card, mobile money",
        customization: Customization(title: "Test Payment"),
        isTestMode: true);

    // String ref;

    final ChargeResponse response = await flutterwave.charge();
    if (response != null) {
      // ignore: unnecessary_this
      await this.showLoading(response.status!);
      print("${response.toJson()}");
      // if(response.success) {
      //  Call the verify transaction endpoint with the transactionID returned in `response.transactionId` to verify transaction before offering value to customer
    }
    // else {
    // Transaction not successful
    // }
    // }
    else {
//   // User cancelled
      this.showLoading("No Response!");
    }
  }

  Future<void> showLoading(String message) {
    return showDialog(
        context: this.context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
              width: double.infinity,
              height: 50,
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        });
  }
}
