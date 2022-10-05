import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';

class PaymentWithWave extends StatefulWidget {
  const PaymentWithWave({super.key});

  @override
  State<PaymentWithWave> createState() => _PaymentWithWaveState();
}

class _PaymentWithWaveState extends State<PaymentWithWave> {

  _handlePaymentInitialization() async {
  final style = FlutterwaveStyle(
      appBarText: "My Standard Blue",
      buttonColor: Color(0xffd0ebff),
      appBarIcon: Icon(Icons.message, color: Color(0xffd0ebff)),
      buttonTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      appBarColor: Color(0xffd0ebff),
      dialogCancelTextStyle: TextStyle(color: Colors.redAccent, fontSize: 18),
      dialogContinueTextStyle: TextStyle(color: Colors.blue, fontSize: 18));

  final Customer customer = Customer(
      name: "FLW Developer",
      phoneNumber: "1234566677777",
      email: "customer@customer.com");

  var ref;
  final Flutterwave flutterwave = Flutterwave(
      context: context,
      style: style,
      publicKey: "Public Key",
      currency: "UGX",
      redirectUrl: "my_redirect_url",
      txRef: ref,
      amount: "3000",
      customer: customer,
      paymentOptions: "ussd, card, mobile money",
      customization: Customization(title: "Test Payment"),
      isTestMode: true);

  // String ref;

  setRef() {
    Random rand = Random();
    int number = rand.nextInt(2500);
    return setState(() {
      ref = "f_ku_near_1200$number";
    });
  } 
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
