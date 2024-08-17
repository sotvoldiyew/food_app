import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/router/router_names.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:food_app/screens/order/order_screen.dart';
import 'package:food_app/screens/payment/payment_screen.dart';
import 'package:food_app/screens/product/product_screen.dart';
import 'package:food_app/screens/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        RouterNames.splash: (context) => const SplashScreen(),
        RouterNames.home: (context) => const HomeScreen(),
        RouterNames.product: (context) => const ProductScreen(),
        RouterNames.order: (context) => const OrderScreen(),
        RouterNames.payment: (context) => const PaymentScreen(),
      },
    );
  }
}