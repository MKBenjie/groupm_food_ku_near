import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
// import 'package:recesslibpjt/feature/home_page/view/home_view.dart';
import 'package:recesslibpjt/provider/sign_in_provider.dart';
import 'package:recesslibpjt/screens/home_scn.dart';
import 'package:recesslibpjt/screens/home_screen.dart';
import 'package:recesslibpjt/screens/login_screen.dart';
import 'package:recesslibpjt/utils/config.dart';
import 'package:provider/provider.dart';
import 'package:recesslibpjt/utils/next_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();

    //create timer
    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == true || FirebaseAuth.instance.currentUser != null
          ?nextScreenReplace(context, const HomeScn()):
          nextScreenReplace(context, const LogInScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage(Config.app_icon),
                height: 80,
                width: 80,
              ),
            ),
            SizedBox(height: 20),
            spinkit,
          ],
        ),
      ),
    );
  }

  final spinkit = SpinKitFoldingCube(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.orangeAccent,
        ),
      );
    },
  );
}
