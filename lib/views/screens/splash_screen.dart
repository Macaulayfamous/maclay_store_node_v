import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:maclay_shop_node_project/views/screens/second_spash_screen.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
void initState() {
  super.initState();

  // Store the context in a local variable
  final context = this.context;

  // Check if the widget is still mounted before setting the timer
  if (mounted) {
    Timer(const Duration(seconds: 3), () {
      if (mounted && context != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondSplashPage(),
          ),
        );
      }
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'assets/markflip.png',
      ),
      splashIconSize: 177.5,
      nextScreen: SecondSplashPage(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: const Color(0xFF5C69E5),
    );
  }
}
