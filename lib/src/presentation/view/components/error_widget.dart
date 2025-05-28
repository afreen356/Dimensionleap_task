import 'package:flutter/material.dart';

Widget buildErrorMessage(String errorMessage, bool isDesktop) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: isDesktop ? 100 : 16, 
      vertical: 20
    ),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.shade300),
      ),
      child: Text(
        errorMessage,
        style: TextStyle(color: Colors.red.shade800),
      ),
    ),
  );
}