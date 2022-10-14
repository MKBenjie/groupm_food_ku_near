import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recesslibpjt/models/category_model.dart';
import 'package:recesslibpjt/models/promo_model.dart';
import 'package:recesslibpjt/models/restaurant_model.dart';
import 'package:recesslibpjt/provider/sign_in_provider.dart';
import 'package:recesslibpjt/screens/login_screen.dart';
import 'package:recesslibpjt/screens/my_drawer_header.dart';
import 'package:recesslibpjt/utils/category_box.dart';
import 'package:recesslibpjt/utils/food_search_widget.dart';
import 'package:recesslibpjt/utils/next_screen.dart';
import 'package:recesslibpjt/utils/promo_box.dart';
import 'package:recesslibpjt/utils/wgts/resto_card.dart';

class HomeScn extends StatefulWidget {
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScn(),
      settings: const RouteSettings(name: routeName),
    );
  }
  const HomeScn({super.key});

  @override
  State<HomeScn> createState() => _HomeScnState();
}

var currentPage = DrawerSections.home;
class _HomeScnState extends State<HomeScn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        // leading: IconButton(
        //   icon: const Icon(Icons.person),
        //   onPressed: () {},
        // ),
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "FOOD KU NEAR",
              style: TextStyle(color: Colors.white, fontFamily: "Merienda"),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 125,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Category.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryBox(category: Category.categories[index]);
                  },
                ),
              ),
              SizedBox(height: 10.0,),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Promo.promos.length,
                  itemBuilder: (context, index) {
                    return PromoBox(promos: Promo.promos[index],);
                  },
                ),
              ),
              const foodSearchBox(),
              // const Padding(
              //   padding: EdgeInsets.all(8.0),
                // child: 
                const SizedBox(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Resturants you might like to try",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              // ),
              const SizedBox(height: 10.0,),
              SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: Restaurant.restaurant.length,
                    itemBuilder: (context, index) {
                      return RestaurantCard(
                          restaurant: Restaurant.restaurant[index]);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "Home", Icons.home,
              currentPage == DrawerSections.home ? true : false),
          menuItem(2, "SignOut", Icons.logout,
              currentPage == DrawerSections.SignOut ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    final sp = context.read<SignInProvider>();
    return Material(
      color: selected ? Colors.orangeAccent[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              // currentPage = DrawerSections.home;
              nextScreenReplace(context, HomeScn());
            } else if (id == 2) {
              // currentPage = DrawerSections.wallet;
              sp.userSignOut();
              logout;
              nextScreenReplace(context, LogInScreen());
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // nextScreenReplace(context, LogInScreen());
  }
}

enum DrawerSections { home, SignOut,}