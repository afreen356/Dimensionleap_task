import 'package:flutter/material.dart';
import 'package:flutter_post_app/src/Data/models/post_model.dart';
import 'package:flutter_post_app/src/presentation/constants/colors.dart'; 

class JobCardWidget extends StatelessWidget {
  final PostModel post;  
  final VoidCallback onToggleSave;

  const JobCardWidget({
    super.key,
    required this.post,
    required this.onToggleSave,
  });

  @override
  Widget build(BuildContext context) {
    // Format title for display
    String displayTitle = 'US IT Technical Recruiter';
   
    
    // Create company name
    String companyName = "Ora Apps Inc ${post.userId}";
    
    
   
   String location = 'Remote or Hyattsville, MD, USA';
   String description = 'join our team of growing software professionals Ever found yourself working with an open source library that is just not working...';
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Logo
              Container(
                width: 60,
                height: 60,
                color: AppColors.placeholderText,
                
              ),
              const SizedBox(width: 16),
              
              // Job Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            displayTitle,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            post.isSaved ? Icons.bookmark : Icons.bookmark_border,
                            color: post.isSaved ? AppColors.savedBookmark : AppColors.unsavedBookmark,
                            size: 22,
                          ),
                          onPressed: onToggleSave,
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                    Text(
                      companyName,
                      style: TextStyle(
                        color: AppColors.textMedium,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Metadata
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              _buildJobMetaItem(Icons.location_on_outlined, location),
              _buildJobMetaItem(Icons.access_time, "2 to 8 yrs"),
              _buildJobMetaItem(Icons.attach_money, "Not Disclosed"),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Description
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Icon(
                  Icons.description_outlined,
                  size: 16,
                  color: AppColors.iconBlue,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  description,
                  style: TextStyle(
                    color: AppColors.textLight,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJobMetaItem(IconData icon, String text) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 160),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: AppColors.iconBlue,
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.textMedium,
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
//   String _formatDescription(String body) {
//   String cleaned = body.replaceAll('\n', ' ').trim();
//   return cleaned.isNotEmpty
//       ? "Join our team of growing software professionals ${cleaned.length > 100 ? '${cleaned.substring(0, 100)}...' : cleaned}"
//       : "Join our team of growing software professionals";
// }
}