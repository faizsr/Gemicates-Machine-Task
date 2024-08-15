import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlerts {
  static SnackBar snackBar(String message) {
    return SnackBar(
      margin: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: CupertinoColors.quaternaryLabel,
      elevation: 0,
      content: Text(
        message,
        style: const TextStyle(color: CupertinoColors.black),
      ),
      duration: const Duration(seconds: 3),
    );
  }
}
