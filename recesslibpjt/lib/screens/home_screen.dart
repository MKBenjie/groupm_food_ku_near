// ignore_for_file: prefer_const_constructors

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:recesslibpjt/provider/sign_in_provider.dart';
import 'package:recesslibpjt/screens/login_screen.dart';
import 'package:recesslibpjt/screens/my_drawer_header.dart';
import 'package:recesslibpjt/screens/wallet_screen.dart';
import 'package:recesslibpjt/utils/next_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 99, 105),
      appBar: AppBar(
        // title: Text("Toffa Njala",),
        // centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Center(
          child: Text('Home page'),
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
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "Dashboard", Icons.dashboard,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Wallet", Icons.wallet,
              currentPage == DrawerSections.wallet ? true : false),
          menuItem(3, "SignOut", Icons.logout,
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
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              nextScreen(context, WalletScreen());
            } else if (id == 3) {
              // currentPage = DrawerSections.wallet;
              sp.userSignOut();
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
}

enum DrawerSections { dashboard, SignOut, wallet }
