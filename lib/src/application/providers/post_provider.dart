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
  
  //  Controllers
  final TextEditingController userIdcontroller= TextEditingController();
  final TextEditingController postIdcontroller= TextEditingController();

  PostProvider({required ApiService apiService}) : _apiService = apiService {
    _init();
  }

  void _init() {
    userIdcontroller.addListener(_onSearchChanged);
    postIdcontroller.addListener(_onSearchChanged);
    _fetchPosts();
  }
  
  @override
  void dispose() {
    userIdcontroller.dispose();
    postIdcontroller.dispose();
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
  final userIdStr = userIdcontroller.text.trim();
  final postIdStr = postIdcontroller.text.trim();

  // If both fields are empty, show all posts
  if (userIdStr.isEmpty && postIdStr.isEmpty) {
    _distributePosts();
    return;
  }

  // Convert inputs to integers
  final userId = userIdStr.isNotEmpty ? int.tryParse(userIdStr) : null;
  final postId = postIdStr.isNotEmpty ? int.tryParse(postIdStr) : null;

  List<PostModel> filteredPosts = [];

  // Search logic based on priority (Post ID takes precedence)
  if (postId != null) {
    filteredPosts = _allPosts.where((post) => post.id == postId).toList();
  } 
  else if (userId != null) {
    filteredPosts = _allPosts.where((post) => post.userId == userId).toList();
  }

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