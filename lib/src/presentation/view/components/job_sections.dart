import 'package:flutter/material.dart';
import 'package:flutter_post_app/src/Data/models/post_model.dart';
import 'package:flutter_post_app/src/presentation/view/components/empty_state.dart';
import 'package:flutter_post_app/src/presentation/widgets/job_card.dart';

Widget buildJobsSection(String title, List<PostModel> posts, Function(PostModel) onToggleSave) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      const SizedBox(height: 16),
      posts.isEmpty
        ? buildEmptyState('No jobs found matching your criteria.')
        : Column(
            children: posts.map((post) => JobCardWidget(
              post: post, 
              onToggleSave: () => onToggleSave(post),
            )).toList(),
          ),
    ],
  );
}

Widget buildJobAlertsSection(List<PostModel> posts, Function(PostModel) onToggleSave) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Job Alerts',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: const Color(0xFF2871FA)),
            child: const Text(
              'MANAGE ALERTS',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
        ],
      ),
      const SizedBox(height: 16),
      posts.isEmpty
        ? buildEmptyState('No job alerts found matching your criteria.')
        : Column(
            children: posts.map((post) => JobCardWidget(
              post: post, 
              onToggleSave: () => onToggleSave(post),
            )).toList(),
          ),
    ],
  );
}