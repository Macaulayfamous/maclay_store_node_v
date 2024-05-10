import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpord;
import 'package:maclay_shop_node_project/provider/user_provider.dart';
import 'package:maclay_shop_node_project/services/auth_service.dart';
import 'package:maclay_shop_node_project/views/screens/auth/siginUp_screen.dart';
import 'package:maclay_shop_node_project/views/screens/inner_screens/order_screen.dart';
import 'package:provider/provider.dart';

class ProfilePage extends riverpord.ConsumerStatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends riverpord.ConsumerState<ProfilePage> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Image.asset(
        'assets/markflip.png',
        height: 157.5,
        width: 157.5,
      );
    }

    Widget editProfile() {
      return Container(
        margin: const EdgeInsets.only(
          right: 20,
          left: 20,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Provider.of<UserProvider>(context).user.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    Provider.of<UserProvider>(context).user.email,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 34),
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const EditProfilePage(),
                  //   ),
                  // );
                },
                child: Row(
                  children: [
                    const Text(
                      'Edit Profile',
                      style: TextStyle(
                          color: Color(0xFF336699),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Image.asset(
                        'assets/edit.png',
                        height: 16,
                        width: 16,
                        color: Color(0xFF336699),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget interest() {
      return Container(
        margin: const EdgeInsets.only(
          right: 25,
          left: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFF0F4),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/markflip.png',
                      height: 45,
                      width: 45,
                      fit: BoxFit.cover,
                      color: Color(0xFF336699),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.5,
                ),
                const Text(
                  'Join MarkFlip',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFF0F4),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/atm-card.png',
                      height: 49,
                      width: 49,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.5,
                ),
                const Text(
                  'Fa9ran Credits',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFF0F4),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/product-return.png',
                      height: 44,
                      width: 44,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.5,
                ),
                const Text(
                  'Returns',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrdersPage(),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFF0F4),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/box.png',
                        height: 49,
                        width: 49,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.5,
                  ),
                  const Text(
                    'Orders',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget details() {
      return Container(
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          children: [
            Container(
              height: 125,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 1.5,
                    blurRadius: 1.5,
                    offset: const Offset(0, 1.5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 18, left: 15, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/protection.png',
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                            color: Color(0xFF336699),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Security',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const SecurityPage(),
                              //   ),
                              // );
                            },
                            child: Image.asset(
                              'assets/right.png',
                              height: 13,
                              width: 13,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         const NotificationsPage(),
                              //   ),
                              // );
                            },
                            child: Image.asset(
                              'assets/notification.png',
                              height: 24,
                              width: 24,
                              fit: BoxFit.cover,
                              color: Color(0xFF336699),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         const NotificationsPage(),
                              //   ),
                              // );
                            },
                            child: const Text(
                              'Notifications',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/right.png',
                            height: 13,
                            width: 13,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         const EditLanguagePage(),
                              //   ),
                              // );
                            },
                            child: Image.asset(
                              'assets/translate-2.png',
                              height: 24,
                              width: 24,
                              fit: BoxFit.cover,
                              color: Color(0xFF336699),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         const EditLanguagePage(),
                              //   ),
                              // );
                            },
                            child: const Text(
                              'Language',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/right.png',
                            height: 13,
                            width: 13,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              height: 125,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 1.5,
                    blurRadius: 1.5,
                    offset: const Offset(0, 1.5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/earth.png',
                          height: 24,
                          width: 24,
                          fit: BoxFit.cover,
                          color: Color(0xFF336699),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Country',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        // Image.asset(
                        //   'assets/egypt.png',
                        //   height: 24,
                        //   width: 24,
                        // ),
                        // const SizedBox(
                        //   width: 8.5,
                        // ),
                        Image.asset(
                          'assets/right.png',
                          height: 13,
                          width: 13,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const QrPage(),
                            //   ),
                            // );
                          },
                          child: Image.asset(
                            'assets/scanner.png',
                            height: 22,
                            width: 22,
                            fit: BoxFit.cover,
                            color: Color(0xFF336699),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          'Qr Code',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/right.png',
                          height: 13,
                          width: 13,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/address.png',
                          height: 24,
                          width: 24,
                          fit: BoxFit.cover,
                          color: Color(0xFF336699),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Addresses',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/right.png',
                          height: 13,
                          width: 13,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 125,
              margin: const EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 1.5,
                    blurRadius: 1.5,
                    offset: const Offset(0, 1.5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const EditProfilePage(),
                              //   ),
                              // );
                            },
                            child: Image.asset(
                              'assets/credit-card.png',
                              height: 22,
                              width: 22,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Payment',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/right.png',
                            height: 13,
                            width: 13,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/customer-service (1).png',
                            height: 24,
                            width: 24,
                            fit: BoxFit.cover,
                            color: Color(0xFF336699),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Help & Support',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/right.png',
                            height: 13,
                            width: 13,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/heart.png',
                            height: 23.5,
                            width: 23.5,
                            fit: BoxFit.cover,
                            color: Color(0xFF336699),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'My Favourite',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const FavouritePage(),
                              //   ),
                              // );
                            },
                            child: Image.asset(
                              'assets/right.png',
                              height: 13,
                              width: 13,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signOut(BuildContext context) {
      return InkWell(
        onTap: () async {
          bool confirmSignOut = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm Sign Out'),
                    content: Text('Are you sure you want to sign out?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true); // Return true
                        },
                        child: Text('Sign Out'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false); // Return false
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                },
              ) ??
              false; // Default to false if confirmSignOut is null

          // If user confirms sign out, proceed
          if (confirmSignOut) {
            // ignore: use_build_context_synchronously
            await _authService.signOut(context).whenComplete(() {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
                (route) => false, // Disable back navigation
              );
            });
          }
        },
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Out',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 7.5,
              ),
              InkWell(
                onTap: () async {
                  // Show confirmation dialog
                  bool confirmSignOut = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirm Sign Out'),
                            content: Text('Are you sure you want to sign out?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(true); // Return true
                                },
                                child: Text('Sign Out'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(false); // Return false
                                },
                                child: Text('Cancel'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false; // Default to false if confirmSignOut is null

                  // If user confirms sign out, proceed
                  if (confirmSignOut) {
                    // ignore: use_build_context_synchronously
                    await _authService.signOut(context).whenComplete(() {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                        (route) => false, // Disable back navigation
                      );
                    });
                  }
                },
                child: Image.asset(
                  'assets/logout (1).png',
                  width: 21,
                  height: 21,
                  fit: BoxFit.cover,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget contact() {
      return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 50),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/linkedin.png',
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 23,
              ),
              Image.asset(
                'assets/facebook.png',
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 25,
              ),
              Image.asset(
                'assets/instagram.png',
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 23,
              ),
              Image.asset(
                'assets/twitter.png',
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 23,
              ),
              Image.asset(
                'assets/gmail.png',
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            editProfile(),
            interest(),
            details(),
            signOut(context),
            contact(),
          ],
        ),
      ),
    );
  }
}
