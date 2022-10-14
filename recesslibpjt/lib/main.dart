// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:recesslibpjt/core/constants/app_string.dart';
// import 'package:recesslibpjt/feature/splash_page/view/splash_view.dart';
// import 'package:recesslibpjt/products/global/global.dart';
// import 'package:recesslibpjt/products/navigation/navigation_custom.dart';

// Future<void> main() async {
//   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent,
//   ));
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget with NavigatorCustom {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: MultiProviderInit().providers,
//       child: MaterialApp(
//           title: StringConstant.main,
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//             primarySwatch: Colors.orange,
//           ),
//           initialRoute: '/',
//           routes: {
//             "/": (context) => const SplashPage(),
//           },
//           onGenerateRoute: onGenerateRoute),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recesslibpjt/bloc/basket/basket_bloc.dart';
import 'package:recesslibpjt/bloc/filters/filters_bloc.dart';
import 'package:recesslibpjt/bloc/restaurants/restaurant_bloc.dart';
import 'package:recesslibpjt/provider/internet_provider.dart';
import 'package:recesslibpjt/provider/sign_in_provider.dart';
import 'package:recesslibpjt/repositories/restaurant/restaurant_repository.dart';
import 'package:recesslibpjt/screens/home_scn.dart';
import 'package:recesslibpjt/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:recesslibpjt/utils/app_route.dart';

void main() async {
  //intialize the application
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  // Bloc.observer = MultiProvider();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RestaurantsBloc(restaurantRepository: context.read<RestuarantRepository>()),),
          BlocProvider(create: (context) => FilterBloc(/*restaurantsBloc: context.read<RestaurantsBloc>()*/)..add(FilterLoad())),
          BlocProvider(create: (context) => BasketBloc()..add(StartBasket())),
        ],

      child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => SignInProvider())),
        ChangeNotifierProvider(create: ((context) => InterntProvider())),
      ],
        child: const MaterialApp(
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          // initialRoute: HomeScn.routeName,
        ),
      ),
      // child: const MaterialApp(
      //   home: SplashScreen(),
      //   debugShowCheckedModeBanner: false,
      //   onGenerateRoute: AppRouter.onGenerateRoute,
      //   initialRoute: HomeScn.routeName,
      // ),
    );
  }
}
 

// Using the bloc_provider

// void main() async {
//   Bloc.observer = SimpleBlocObserver();

//   ruuApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override 
//   Widget build (BuildContext context) {
//     return MultiRepositoryProvider(
//       providers: [], 
//       child: MultiBlocProvide (
//          providers: [
//            BlocProvider( create: (context) => FilterBloc)
//] 
// )
//   }
// }