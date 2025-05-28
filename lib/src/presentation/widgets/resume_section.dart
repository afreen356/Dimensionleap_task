 import 'package:flutter/material.dart';

Widget buildResumeSection(bool isMobile) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Attach Resume',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Resume is the most important document recruiters look for. Recruiters generally do not look at profiles without resumes.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.insert_drive_file),
                const SizedBox(width: 8),
                const Text('Johnwick_Resume.docx'),
                const Spacer(),
                const Text('Updated on Dec 21, 2021'),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: isMobile ? double.infinity : null,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('ATTACH NEW RESUME'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildResumeHeadline(bool isMobile) {
  return Card(
    child: Padding(
      padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Resume Headline',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Nure placerat, tellus nec bichis egestas, ipsum lacus aceleriaque urna, ac dignissim neque nisl eu nisl. Mauris hendrerit ligula et quam aliquam.',
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Add your update logic here
                // Example:
                // _showEditResumeHeadlineDialog(context);
              },
              child: const Text('UPDATE'),
            ),
          ),
        ],
      ),
    ),
  );
}