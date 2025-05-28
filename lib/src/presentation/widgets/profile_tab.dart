import 'package:flutter/material.dart';

Widget buildProfileTabs(bool isMobile) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 8.0 : 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Saved Jobs'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Custom Job Alerts'),
            ),
          ],
        ),
      ),
    );
  }