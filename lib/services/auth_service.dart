import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maclay_shop_node_project/models/user_models.dart';
import 'package:maclay_shop_node_project/provider/user_provider.dart';
import 'package:maclay_shop_node_project/utilities/error_handler/error_handling.dart';
import 'package:maclay_shop_node_project/utilities/global_variable.dart';
import 'package:maclay_shop_node_project/views/screens/auth/signIn_screen.dart';
import 'package:maclay_shop_node_project/views/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> createUser({
    required context,
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      UserModel user = UserModel(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );
      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },
      );

      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account has been created for you');
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const SignInPage()),
              (route) => false, // Disable back navigation
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> loginUser({
    required context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$uri/api/signin"),
        body: jsonEncode(
            {"email": email, "password": password}), // Create a map here
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },
      );

      httpErrorHandler(
        response: response,
        context: context,
        onSuccess: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.setString(
            'x-auth-token',
            jsonDecode(response.body)['token'],
          );
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);

          if (Provider.of<UserProvider>(context, listen: false)
              .user
              .token
              .isNotEmpty) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
              (route) => false, // Disable back navigation
            );
          }
        },
      );

      print(jsonDecode(response.body)['token']);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //get user

  getUserData(context) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString('x-auth-token');

      if (token == null) {
        preferences.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signOut(context) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString('x-auth-token');

      if (token != null) {
        http.Response response = await http.post(
          Uri.parse('$uri/api/signout'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );

        if (response.statusCode == 200) {
          // Clear token from SharedPreferences
          await preferences.remove('x-auth-token');

          // Reset user data in the provider or wherever it's stored
          Provider.of<UserProvider>(context, listen: false).clearUser();

          // Show success message or perform any other necessary actions
          showSnackBar(context, 'Signed out successfully');
        } else {
          // Handle unsuccessful sign-out (e.g., server error)
          showSnackBar(context, 'Failed to sign out: ${response.statusCode}');
        }
      }
    } catch (e) {
      // Handle errors
      print('Error signing out: $e');
      showSnackBar(context, 'Error signing out: $e');
    }
  }
}
