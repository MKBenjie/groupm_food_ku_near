import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recesslibpjt/provider/internet_provider.dart';
import 'package:recesslibpjt/provider/sign_in_provider.dart';
import 'package:recesslibpjt/screens/splash_screen.dart';
import 'package:provider/provider.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart'; 

void main() async {
  //intialize the application
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => SignInProvider())),
        ChangeNotifierProvider(create: ((context) => InterntProvider())),
      ],
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
