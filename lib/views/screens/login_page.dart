
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:maclay_shop_node_project/views/screens/auth/siginUp_screen.dart';
import 'package:maclay_shop_node_project/views/screens/auth/signIn_screen.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AnimationConfiguration.staggeredList(
        position: 0,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 186),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/markflip.png',
                height: 90,
                width: 231,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    }

    Widget signInButton() {
      return AnimationConfiguration.staggeredList(
        position: 1,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 125),
              height: 55,
              width: 220,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  side: const BorderSide(
                    color: const Color(0xFF336699),
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: const Color(0xFF336699),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget signUnButton() {
      return AnimationConfiguration.staggeredList(
        position: 2,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              height: 55,
              width: 220,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF336699),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 500),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              header(),
              signInButton(),
              signUnButton(),
            ],
          ),
        ),
      ),
    );
  }
}