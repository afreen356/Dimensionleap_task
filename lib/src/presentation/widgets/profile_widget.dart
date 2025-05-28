import 'package:flutter/material.dart';
import 'package:flutter_post_app/src/presentation/constants/colors.dart';
import 'package:flutter_post_app/src/presentation/view/profile/profile_screen.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
     
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360), // Ensures compact width
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Image
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));
                    },
                    child: const CircleAvatar(
                      
                      radius: 24,
                      backgroundImage: NetworkImage(
                        'https://ui-avatars.com/api/?name=John+Wick+Paul&background=random&size=200',
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
        
                  // Name and Title
                  const Text(
                    'John Wick Paul II',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Senior Data Base Analyst at Orr Appdata Inc',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
        
                  const SizedBox(height: 12),
        
                  // Profile Actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: const Text('Edit Profile',
                            style: TextStyle(fontSize: 13, color: Colors.blue)),
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: const Text('Update Resume',
                            style: TextStyle(fontSize: 13, color: Colors.blue)),
                      ),
                    ],
                  ),
        
                  const SizedBox(height: 16),
                  Divider(color: Colors.grey.shade300),
                  const SizedBox(height: 12),
        
                  // Profile Completion
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Profile Completion',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                      Text(
                        '100%',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: LinearProgressIndicator(
                      value: 1.0,
                      minHeight: 5,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Maintain your profile 100% to get more recruiter views',
                    style: TextStyle(
                      fontSize: 11.5,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
        
                  const SizedBox(height: 20),
        
                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            side: BorderSide(color: AppColors.primaryBlue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Column(
                            children: [
                              Text('Applied',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.blue)),
                              Text('Jobs',
                                  style:
                                      TextStyle(fontSize: 13, color: Colors.blue)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            side: BorderSide(color: Colors.blue.shade200),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Column(
                            children: [
                              Text('Custom',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.blue)),
                              Text('Job Alerts',
                                  style:
                                      TextStyle(fontSize: 13, color: Colors.blue)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}
