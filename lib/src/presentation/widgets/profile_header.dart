 import 'package:flutter/material.dart';

Widget buildProfileHeader(bool isMobile) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'John Wick Poulli',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Senior Data Base Analyst at Orr Appdata Inc',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 1.0,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                  const Text('Profile Completion 100%'),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: isMobile ? double.infinity : null,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Edit Profile'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
 