import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recesslibpjt/bloc/basket/basket_bloc.dart';
import 'package:recesslibpjt/models/basket_model.dart';
import 'dart:math';
import 'package:recesslibpjt/screens/QR_Generate.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:recesslibpjt/utils/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:recesslibpjt/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recesslibpjt/provider/sign_in_provider.dart';
// import 'QR_Generate.dart';

class BasketScreen extends StatefulWidget {
  static const String routeName = '/basket';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const BasketScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  Future getData() async {
    final s = context.read<SignInProvider>();
    s.getDataFromSharedPreferences();
  }

  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

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
              _handlePaymentInitialization();
            },
            child: Text('Go To Checkout'),
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

  _handlePaymentInitialization() async {
    final style = FlutterwaveStyle(
        appBarText: "Food Ku Near",
        buttonColor: Colors.redAccent,
        // appBarIcon: Icon(Icons.message, color: Color(0xffd0ebff)),
        appBarIcon: const Icon(Icons.arrow_back, color: Colors.white),
        buttonTextStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        appBarColor: Colors.orange[600],
        dialogCancelTextStyle:
            const TextStyle(color: Colors.redAccent, fontSize: 18),
        dialogContinueTextStyle:
            const TextStyle(color: Colors.blue, fontSize: 18));
    final s = context.read<SignInProvider>();
    var userName1 = s.name.toString();
    String userName =
        '${loggedInUser.firstName.toString()} ${loggedInUser.secondName.toString()}';
    String userEmail = loggedInUser.email.toString();
    String finalUserName;
    if (loggedInUser.firstName == null) {
      finalUserName = userName1;
    } else {
      finalUserName = userName;
    }

    final Customer customer = Customer(
        name: finalUserName, phoneNumber: "1234566677777", email: userEmail);

    Random rand = Random();
    int number = rand.nextInt(2500);
    var ref = "f_ku_near_1200$number";
    // var foodPrice = state.basket.totalString;
    var foodPrice = Basket().totalString ;
    final Flutterwave flutterwave = Flutterwave(
        context: context,
        style: style,
        publicKey: "FLWPUBK_TEST-c2bddc6b89ccece1fe24d075b5f05a30-X",
        currency: "UGX",
        redirectUrl: "my_redirect_url",
        txRef: ref,
        amount: foodPrice,
        customer: customer,
        paymentOptions: "ussd, card, mobile money",
        customization: Customization(title: "Test Payment"),
        isTestMode: true);

    // String ref;

    final ChargeResponse response = await flutterwave.charge();
    if (response != null) {
      // ignore: unnecessary_this
      await this.showLoading(response.status!);
      // print("${response.toJson()}");
      // if(response.success) {
      //  Call the verify transaction endpoint with the transactionID returned in `response.transactionId` to verify transaction before offering value to customer
    }
    // else {
    // Transaction not successful
    // }
    // }
    else {
//   // User cancelled
      showLoading("No Response!");
    }
  }

  Future<void> showLoading(String message) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              width: double.infinity,
              height: 50,
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        });
  }
}
