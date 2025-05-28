import 'package:flutter/material.dart';
import 'package:flutter_post_app/src/domain/services/api_service.dart';
import 'package:flutter_post_app/src/presentation/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_post_app/src/application/providers/post_provider.dart';
import 'package:flutter_post_app/src/presentation/widgets/app_bar.dart';
import 'package:flutter_post_app/src/presentation/widgets/search_widget.dart';
import 'package:flutter_post_app/src/presentation/widgets/profile_widget.dart';
import 'package:flutter_post_app/src/presentation/view/components/job_sections.dart';
import 'package:flutter_post_app/src/presentation/view/components/error_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<ApiService>(context, listen: false);
    return ChangeNotifierProvider(
      create: (context) => PostProvider(apiService: apiService),
      child: Scaffold(
        backgroundColor:  AppColors.appBarBackground,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth > 800;
            final provider = Provider.of<PostProvider>(context);

            return SingleChildScrollView(
              child: Column(
                children: [
                  AppBarWidget(isDesktop: isDesktop),

                  if (provider.isLoading)
                    const Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Center(child: CircularProgressIndicator()),
                    ),

                  if (!provider.isLoading)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? 100 : 16,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: isDesktop ? 7 : 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SearchWidget(
                                  isDesktop: isDesktop,
                                  userIdcontroller: provider.userIdcontroller,
                                  postIdcontroller:
                                      provider.postIdcontroller,
                                  onSearch: () => provider.filterPosts(),
                                ),
                                const SizedBox(height: 20),
                                buildJobsSection(
                                  "Recommended Jobs",
                                  provider.recommendedPosts,
                                  provider.toggleSavePost,
                                ),
                                const SizedBox(height: 20),
                                buildJobsSection(
                                  "Suggested Jobs",
                                  provider.suggestedPosts,
                                  provider.toggleSavePost,
                                ),
                                const SizedBox(height: 20),
                                buildJobAlertsSection(
                                  provider.alertPosts,
                                  provider.toggleSavePost,
                                ),
                              ],
                            ),
                          ),

                          if (isDesktop) const SizedBox(width: 20),
                          if (isDesktop)
                            Expanded(flex: 3, child: ProfileWidget()),
                        ],
                      ),
                    ),

                  if (provider.errorMessage.isNotEmpty)
                    buildErrorMessage(provider.errorMessage, isDesktop),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
