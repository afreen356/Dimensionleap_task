import 'package:flutter/material.dart';
import 'package:flutter_post_app/src/presentation/constants/colors.dart';

class SearchWidget extends StatelessWidget {
  final bool isDesktop;
  final TextEditingController userIdcontroller;
  final TextEditingController postIdcontroller;
  final VoidCallback onSearch;

  const SearchWidget({
    super.key,
    required this.isDesktop,
    required this.userIdcontroller,
    required this.postIdcontroller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              // Job Title Search
              _buildSearchField(
                controller: userIdcontroller,
                hintText: 'User Experience Designer',
                suffixIcon:  Icons.search,
                width: isDesktop ? 300 : double.infinity,
              ),
              
              // Location Search
              _buildSearchField(
                controller: postIdcontroller,
                hintText: 'Hyattsville',
                
               suffixIcon: Icons.location_pin,
                width: isDesktop ? 300 : double.infinity,
              ),
              
              // Search Button
              ElevatedButton(
                onPressed: onSearch,
                style: ElevatedButton.styleFrom(
                  backgroundColor:AppColors.primaryBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15, 
                    horizontal: 30,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'Search',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField({
    required TextEditingController controller,
    required String hintText,
   
    IconData? suffixIcon,
    required double width,
  }) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
         
          suffixIcon: suffixIcon != null 
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(suffixIcon, color: Colors.black, size: 20),
              )
            : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15, 
            horizontal: 15,
          ),
        ),
      ),
    );
  }
}