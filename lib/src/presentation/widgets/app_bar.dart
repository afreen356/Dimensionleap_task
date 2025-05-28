import 'package:flutter/material.dart';
import 'package:flutter_post_app/src/presentation/constants/colors.dart';

class AppBarWidget extends StatelessWidget {
  final bool isDesktop;
  const AppBarWidget({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : 16, 
        vertical: 12
      ),
      decoration: BoxDecoration(
        color: AppColors.appBarBackground,
        boxShadow: [
          BoxShadow(
            color: AppColors.appBarShadow,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: isDesktop 
        ? _buildDesktopLayout()
        : _buildMobileLayout(),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        // Nav Links
        Row(
          children: [
            _buildNavLink('Home', false),
            const SizedBox(width: 20),
            _buildNavLink('Search Jobs', true),
            const SizedBox(width: 20),
            _buildNavLink('Companies', false),
            const SizedBox(width: 20),
            _buildNavLink('Post Jobs', false),
          ],
        ),
        
        // Logo
        Expanded(
          child: Center(
            child: _buildLogo(height: 50, fontSize: 20),
          ),
        ),
        
        // User Area
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              color: AppColors.iconDark,
              onPressed: () {},
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 24),
            _buildUserInfo(isLarge: true),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLogo(height: 40, fontSize: 18),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  color: AppColors.iconDark,
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.menu),
                  color: AppColors.iconDark,
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: _buildUserInfo(isLarge: false),
        ),
      ],
    );
  }

  Widget _buildNavLink(String text, bool isActive) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: isActive ? AppColors.activeNavLink : AppColors.inactiveNavLink,
        padding: EdgeInsets.zero,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          color: isActive ? AppColors.activeNavLink : AppColors.inactiveNavLink,
        ),
      ),
    );
  }

  Widget _buildLogo({required double height, required double fontSize}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/100708567-removebg-preview.png', height: height),
        const SizedBox(width: 8),
        Text(
          'GetJob',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo({required bool isLarge}) {
    return Row(
      children: [
        CircleAvatar(
          radius: isLarge ? 16 : 12,
          backgroundColor: AppColors.avatarBackground,
          backgroundImage: const NetworkImage(
            'https://ui-avatars.com/api/?name=John+Wick&background=random',
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'Hello, John Wick',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}