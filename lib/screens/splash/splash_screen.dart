import 'package:flutter/material.dart';
import 'package:food_app/router/router_names.dart';
import 'package:food_app/style/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, RouterNames.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffFF939B),
              Color(0xffEF2A39),
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 250),
                Text(
                  "Foodgo",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                        fontFamily: "Lobster",
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              child: Image(
                width: 300,
                image: AssetImage(AppImages.splash),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
