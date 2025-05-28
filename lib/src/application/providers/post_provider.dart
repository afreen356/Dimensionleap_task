import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_post_app/src/Data/models/post_model.dart';
import 'package:flutter_post_app/src/domain/services/api_service.dart';

class PostProvider with ChangeNotifier {
  // Private fields
  final List<PostModel> _allPosts = [];
  final ApiService _apiService;
  Timer? _debounce;
  
  // Public state
  List<PostModel> recommendedPosts = [];
  List<PostModel> suggestedPosts = [];
  List<PostModel> alertPosts = [];
  bool isLoading = true;
  String errorMessage = '';
  
  // Controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  PostProvider({required ApiService apiService}) : _apiService = apiService {
    _init();
  }

  void _init() {
    titleController.addListener(_onSearchChanged);
    locationController.addListener(_onSearchChanged);
    _fetchPosts();
  }
  
  @override
  void dispose() {
    titleController.dispose();
    locationController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> refreshPosts() async {
    _allPosts.clear();
    await _fetchPosts();
  }
  
  void _onSearchChanged() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), filterPosts);
  }
  
  Future<void> _fetchPosts() async {
    try {
      _updateLoadingState(true);
      final posts = await _apiService.fetchPosts();
      _allPosts.addAll(posts);
      _distributePosts();
    } catch (e) {
      _handleError(e);
    } finally {
      _updateLoadingState(false);
    }
  }
  
  void _updateLoadingState(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
  
  void _handleError(dynamic error) {
    errorMessage = error.toString();
    notifyListeners();
  }
  
  void _distributePosts() {
    if (_allPosts.isEmpty) {
      errorMessage = 'No posts available';
      notifyListeners();
      return;
    }
    
    recommendedPosts = _allPosts.where((post) => post.id <= 33).toList();
    suggestedPosts = _allPosts.where((post) => post.id > 33 && post.id <= 66).toList();
    alertPosts = _allPosts.where((post) => post.id > 66).toList();
    errorMessage = '';
    notifyListeners();
  }
  
  void filterPosts() {
    final titleQuery = titleController.text.trim().toLowerCase();
    final locationQuery = locationController.text.trim().toLowerCase();
    
    if (titleQuery.isEmpty && locationQuery.isEmpty) {
      _distributePosts();
      return;
    }
    
    final filteredPosts = _allPosts.where((post) {
      final matchesTitle = titleQuery.isEmpty || 
          post.title.toLowerCase().contains(titleQuery);
      final matchesLocation = locationQuery.isEmpty || 
          post.body.toLowerCase().contains(locationQuery);
      return matchesTitle && matchesLocation;
    }).toList();
    
    _updateFilteredPosts(filteredPosts);
  }
  
  void _updateFilteredPosts(List<PostModel> filteredPosts) {
    final totalPosts = filteredPosts.length;
    final postsPerSection = (totalPosts / 3).ceil();
    
    recommendedPosts = filteredPosts.take(postsPerSection).toList();
    suggestedPosts = totalPosts > postsPerSection 
        ? filteredPosts.skip(postsPerSection).take(postsPerSection).toList() 
        : [];
    alertPosts = totalPosts > postsPerSection * 2 
        ? filteredPosts.skip(postsPerSection * 2).toList() 
        : [];
    
    notifyListeners();
  }
  
  void toggleSavePost(PostModel post) {
    post.isSaved = !post.isSaved;
    notifyListeners();
  }
}