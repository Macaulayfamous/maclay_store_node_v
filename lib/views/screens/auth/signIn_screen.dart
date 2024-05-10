import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:maclay_shop_node_project/services/auth_service.dart';
import 'package:maclay_shop_node_project/views/screens/auth/siginUp_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  late String email;
  bool _isObscure = true;

  late String password;

  bool _isLoading = false;

  loginUser() async {
    setState(() {
      _isLoading = true;
    });
    await _authService
        .loginUser(
      context: context,
      email: email,
      password: password,
    )
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

    Widget content() {
      return AnimationConfiguration.staggeredList(
        position: 1,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 18, left: 15),
              child: const Center(
                child: Text(
                  'Welcome Back👋',
                  style: TextStyle(
                    color: Color(0xff80848A),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Widget title() {
    //   return AnimationConfiguration.staggeredList(
    //     position: 2,
    //     duration: const Duration(milliseconds: 500),
    //     child: SlideAnimation(
    //       verticalOffset: 50.0,
    //       child: FadeInAnimation(
    //         child: Container(
    //           margin: const EdgeInsets.only(
    //             top: 18,
    //           ),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               const Text(
    //                 'Log in',
    //                 style: TextStyle(
    //                   color: Colors.black,
    //                   fontSize: 27.5,
    //                   fontWeight: FontWeight.w700,
    //                 ),
    //                 textAlign: TextAlign.center,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }

    Widget emailInput() {
      return AnimationConfiguration.staggeredList(
        position: 3,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 18, right: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.5,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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
                      if (value!.isNotEmpty) {
                        return null;
                      }
                      return "Please enter email Field";
                    },
                    onChanged: (value) {
                      email = value;
                    },
                    cursorColor: Color(0xFF102DE1),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 16),
                      hintText: 'Your email address',
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

    Widget passwordInput() {
      return AnimationConfiguration.staggeredList(
        position: 4,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 16, right: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Password',
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
                      if (value!.isNotEmpty) {
                        return null;
                      }
                      return "Please enter password Field";
                    },
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: _isObscure,
                    cursorColor: Color(0xFF102DE1),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 16),
                        hintText: 'Your Password',
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
                          borderSide:
                              const BorderSide(color: Color(0xFF102DE1)),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget forget() {
      return AnimationConfiguration.staggeredList(
        position: 5,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(
                top: 15,
                right: 24,
              ),
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ForgotPasswordPage(),
                  //   ),
                  // );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget tacButton() {
      return AnimationConfiguration.staggeredList(
        position: 6,
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
                    loginUser();
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
                        'Sign in',
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
                top: 27.5,
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
    //             top: 15,
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
        position: 9,
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
                    "Don't have an account?",
                    style: TextStyle(
                      color: Color(0xff80848A),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(
                    width: 6.75,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              header(),
              content(),
              // title(),
              emailInput(),
              passwordInput(),
              forget(),
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
