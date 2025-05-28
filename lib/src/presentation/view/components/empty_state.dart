import 'package:flutter/material.dart';

Widget buildEmptyState(String message) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(24),
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey.shade200),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.02),
          blurRadius: 8,
          spreadRadius: 1,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: Column(
      children: [
        Icon(Icons.search_off, size: 48, color: Colors.grey.shade400),
        const SizedBox(height: 16),
        Text(
          message,
          style: TextStyle(color: Colors.grey.shade700),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}