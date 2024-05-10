import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:maclay_shop_node_project/services/auth_service.dart';
import 'package:maclay_shop_node_project/views/screens/auth/signIn_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String email;

  late String password;

  late String fullName;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isObscure = true;
  // late String email;

  final AuthService _authService = AuthService();

  registerUser() async {
    setState(() {
      _isLoading = true;
    });
    await _authService
        .createUser(
            context: context, email: email, password: password, name: fullName)
        .whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

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
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 51),
              child: Container(
                height: 90,
                width: 231,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/markflip.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget title() {
      return AnimationConfiguration.staggeredList(
        position: 1,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 19.75, left: 30),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget emailInput() {
      return AnimationConfiguration.staggeredList(
        position: 2,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 15, right: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email Address',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 14.40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter field';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      email = value;
                    },
                    cursorColor: Color(0xFF102DE1),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 16),
                      hintText: 'example@gmail.com',
                      hintStyle: const TextStyle(
                        color: Color(0xff808080),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF102DE1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget fullNameInput() {
      return AnimationConfiguration.staggeredList(
        position: 2,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 15, right: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'First Name',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 14.40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter field';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      fullName = value;
                    },
                    cursorColor: Color(0xFF102DE1),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 16),
                      hintText: 'macaulay',
                      hintStyle: const TextStyle(
                        color: Color(0xff808080),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF102DE1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget createInput() {
      return AnimationConfiguration.staggeredList(
        position: 3,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 16, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'create a password',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 14.40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter field';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: _isObscure,
                    cursorColor: Color(0xFF102DE1),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 16),
                      hintText: 'must be 8 characters',
                      hintStyle: const TextStyle(
                        color: Color(0xff808080),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF102DE1)),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget confirmInput() {
      return AnimationConfiguration.staggeredList(
        position: 4,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 16, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Confirm password',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 14.40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter field';
                      } else {
                        return null;
                      }
                    },
                    obscureText: _isObscure,
                    cursorColor: Color(0xFF102DE1),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 16),
                      hintText: 'repeat password',
                      hintStyle: const TextStyle(
                        color: Color(0xff808080),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF102DE1)),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget tacButton() {
      return AnimationConfiguration.staggeredList(
        position: 5,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              height: 56,
              width: 322.5,
              child: TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    registerUser();
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF5C69E5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          ),
        ),
      );
    }

    Widget line() {
      return AnimationConfiguration.staggeredList(
        position: 7,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(
                top: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 1,
                    width: 160,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(176),
                      ),
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    'or',
                    style: TextStyle(
                      color: Color(0xff80848A),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 160,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(176),
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    // Widget social() {
    //   return AnimationConfiguration.staggeredList(
    //     position: 8,
    //     duration: const Duration(milliseconds: 500),
    //     child: SlideAnimation(
    //       verticalOffset: 50.0,
    //       child: FadeInAnimation(
    //         child: Container(
    //           margin: const EdgeInsets.only(
    //             top: 10,
    //             left: 15,
    //             right: 15,
    //           ),
    //           child: Center(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 SocialItems(
    //                   Social(
    //                     id: 1,
    //                     imageUrl: 'assets/facebook.png',
    //                   ),
    //                 ),
    //                 SocialItems(
    //                   Social(
    //                     id: 2,
    //                     imageUrl: 'assets/google.png',
    //                   ),
    //                 ),
    //                 SocialItems(
    //                   Social(
    //                     id: 3,
    //                     imageUrl: 'assets/apple.png',
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }

    Widget footer() {
      return AnimationConfiguration.staggeredList(
        position: 8,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 17.5),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: Color(0xff80848A),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              header(),
              title(),
              emailInput(),
              fullNameInput(),

              createInput(),
              tacButton(),
              line(),
              // social(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
