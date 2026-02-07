import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Message {
  static void showToast({
    String message = 'Done',
    ToastGravity gravity = ToastGravity.BOTTOM,
    int timeInSecForIosWeb = 1,
    Color backgroundColor = Colors.green,
    Color textColor = Colors.white,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  static void showToastinfo(String message) => showToast(message: message);

  static void showToastDanger(String message) => showToast(
    message: message,
    backgroundColor: Colors.red.withValues(alpha: 0.1),
    textColor: Colors.red,
  );
  static void showToastSuccess(String message) => showToast(
    message: message,
    backgroundColor: Colors.green.withValues(alpha: 0.1),
    textColor: Colors.green,
  );
}
