import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandler(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, json.decode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context, 'Something Went Wrong');
      break;
    case 201:
      onSuccess();
      break;
  }
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: const EdgeInsets.all(15),
      backgroundColor: Colors.grey,
      behavior: SnackBarBehavior.floating,
      content: Text(text)));
}
