import 'package:flutter/material.dart';
import 'package:flutter_post_app/src/presentation/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderCard(),
              const SizedBox(height: 20),
              _buildTabNavigation(),
              const SizedBox(height: 20),
              _buildQuickEditsAndProfileDetails(isMobile),
            ],
          ),
        ),
      ),
    );
  }

 Widget _buildHeaderCard() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xFFD1B2F7), // Light purple background
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, 2),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top section with name, title, image, edit button
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
             CircleAvatar(
                      
                      radius: 24,
                      backgroundImage: NetworkImage(
                        'https://ui-avatars.com/api/?name=John+Wick+Paul&background=random&size=200',
                      ),
                    ),
              const SizedBox(width: 12),
              // Name and Role
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'John Wick Paul II',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Senior Data Base Analyst at Orr Appdata Inc',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              // Edit button
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit, size: 16),
                label: Text("Edit Profile"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),

        // Profile Completion
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Profile Completion',
                style: TextStyle(color: Colors.black87, fontSize: 12),
              ),
              SizedBox(height: 4),
              LinearProgressIndicator(
                value: 1.0, // 100%
                backgroundColor: Colors.white54,
                color: Colors.green,
              ),
              SizedBox(height: 4),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '100%',
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Bottom info section
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Wrap(
            runSpacing: 10,
            spacing: 40,
            children: const [
              _IconText(icon: Icons.location_on, text: 'Hyattsville, MD, USA'),
              _IconText(icon: Icons.access_time, text: '7 Year(s) and 3 Month(s)'),
              _IconText(icon: Icons.attach_money, text: 'INR 9 Lakh(s) and 75 Thousand(s)'),
              _IconText(icon: Icons.phone, text: '+1 789 658 65 63 / +1 457 965 78 96'),
              _IconText(icon: Icons.email, text: 'johnwickpaulii@gmail.com'),
            ],
          ),
        ),
      ],
    ),
  );
}

// Helper Widget



  Widget _buildTabNavigation() {
    final tabs = ['Profile', 'Saved Jobs', 'Custom Job Alerts'];
    return Row(
      children: tabs.map((label) {
        final isActive = label == 'Profile';
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: isActive ? Colors.deepPurple : Colors.grey[200],
              foregroundColor: isActive ? Colors.white : Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: Text(label),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildQuickEditsAndProfileDetails(bool isMobile) {
    return isMobile
        ? Column(
            children: [
              _buildQuickEdits(),
              const SizedBox(height: 20),
              _buildProfileSections(),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 180,
                child: _buildQuickEdits(),
              ),
              const SizedBox(width: 20),
              Expanded(child: _buildProfileSections()),
            ],
          );
  }

Widget _buildQuickEdits() {
  final items = [
    'Attach Resume',
    'Resume Headline',
    'Key Skills',
    'Employment',
    'Education',
    'IT Skills',
    'Projects',
    'Profile Summary',
    'Accomplishments',
    'Career Profile',
    'Personal Details'
  ];

  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((e) {
        final isAttachResume = e == 'Attach Resume';
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            e,
            style: TextStyle(
              color: isAttachResume ? Colors.blue : Colors.black,
              decoration: isAttachResume ? TextDecoration.underline : TextDecoration.none,
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
    ),
  );
}


  Widget _buildProfileSections() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCardSection('Attach Resume', 'Johnwick_Resume.docx', 'Updated on Dec 21, 2021'),
        _buildCardSection('Resume Headline',
            'Experienced and reliable database analyst skilled in designing and maintaining high-performing systems.'),
        _buildEmploymentSection(),
        _buildEducationSection(),
        _buildSkillsSection(),
      ],
    );
  }

  Widget _buildCardSection(String title, String content, [String? subContent]) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.cardBorder),
       
      ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 10),
              Text(content, style: const TextStyle(fontSize: 14)),
              if (subContent != null) ...[
                const SizedBox(height: 6),
                Text(subContent, style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ],
          ),
        ),
      ),
    );
  }

 Widget _buildEmploymentSection() {
  return Card(
    elevation: 1,
    color: AppColors.appBarBackground,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Container(
      
      width: double.infinity,
       decoration: BoxDecoration(
        color: AppColors.appBarBackground,
        border: Border.all(color: AppColors.cardBorder,),borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Employment',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.cardBorder), 
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Senior Data Base Analyst',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // handle edit action
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.edit, size: 14, color: Colors.blue),
                          SizedBox(width: 4),
                          Text('Edit Job', style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Orr Appdata Inc',
                  style: TextStyle(color: Colors.blue, fontSize: 13,decoration: TextDecoration.underline),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Jan 2019 to Present (3 years 1 month)',
                  style: TextStyle(color: Colors.orange, fontSize: 13),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Pellentesque at auctor lectus. Aliquam vulputate mauris vel enim lobortis pharetra. Ut vehicula arcu rhoncus dolor ultricies, auctor ullamcorper nibh tristique. Pellentesque at auctor lectus. Aliquam vulputate mauris vel enim lobortis pharetra. Ut vehicula arcu rhoncus dolor ultricies, auctor ullamcorper nibh tristique.',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    // handle project action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[50],
                    foregroundColor: Colors.black87,
                  ),
                  child: const Text('Projects Included in this place'),
                ),
              ],
              
            ),
            
          ),
          Text('Add New Employment',style: TextStyle(fontSize: 16,color: AppColors.primaryBlue,decoration: TextDecoration.underline),)
        ],
      ),
    ),
  );
}


  Widget _buildEducationSection() {
    return Container(
       
        
      decoration: BoxDecoration(color: AppColors.appBarBackground,border: Border.all(color: AppColors.cardBorder,),borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Education',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.cardBorder), 
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Bachelor of Data Science',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                      
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.edit, size: 14, color: Colors.blue),
                          SizedBox(width: 4),
                          Text('Edit Job', style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'MIT Institute of Management',
                  style: TextStyle(color: Colors.blue, fontSize: 13,decoration: TextDecoration.underline),
                ),
                const SizedBox(height: 6),
                const Text(
                  '2013 (full time)',
                  style: TextStyle(color: Colors.orange, fontSize: 13),
                ),
                const SizedBox(height: 12),              
              ],
            ),
          ),
          Text('Add New Education',style: TextStyle(fontSize: 16,color: AppColors.primaryBlue,decoration: TextDecoration.underline),),
        ],
      ),
    );  
  }

  Widget _buildSkillsSection() {
    return _buildCardSection(
      'IT Skills',
      '• Data Analysis - Latest - 2022 - 3 Years\n• Data Science - Latest - 2022 - 6 Years',
    );
  }
}
class _IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const _IconText({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.deepPurple),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ],
    );
  }
}
