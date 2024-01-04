import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,
    {required Color color, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 4),
      content: Text(
        message,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: color,
    ),
  );
}
