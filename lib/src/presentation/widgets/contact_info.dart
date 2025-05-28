 import 'package:flutter/material.dart';

Widget buildContactInfo(bool isMobile) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 4),
                const Text('Hyatsville, MD, USA'),
                if (!isMobile) const SizedBox(width: 16),
                if (!isMobile) const Icon(Icons.phone, size: 16),
                if (!isMobile) const SizedBox(width: 4),
                if (!isMobile) const Text('+1 789 658 65 63 / +1 457 965 78 96'),
              ],
            ),
            if (isMobile) const SizedBox(height: 8),
            if (isMobile) Row(
              children: [
                const Icon(Icons.phone, size: 16),
                const SizedBox(width: 4),
                const Text('+1 789 658 65 63 / +1 457 965 78 96'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.work, size: 16),
                const SizedBox(width: 4),
                const Text('7 Year(s) and 3 Month(s)'),
                if (!isMobile) const SizedBox(width: 16),
                if (!isMobile) const Icon(Icons.email, size: 16),
                if (!isMobile) const SizedBox(width: 4),
                if (!isMobile) const Text('johnwickpauill@gmail.com'),
              ],
            ),
            if (isMobile) const SizedBox(height: 8),
            if (isMobile) Row(
              children: [
                const Icon(Icons.email, size: 16),
                const SizedBox(width: 4),
                const Text('johnwickpauill@gmail.com'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.attach_money, size: 16),
                const SizedBox(width: 4),
                const Text('INR 9 Labh(s) and 75 Thousand(s)'),
              ],
            ),
          ],
        ),
      ),
    );
  }