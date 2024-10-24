// lib/viewmodels/news_viewmodel.dart
// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:haber_uygulamasi/product/init/cache_manager.dart';
import 'package:haber_uygulamasi/product/model/article.dart';
import 'package:haber_uygulamasi/product/service/news_api_service.dart';

class NewsViewModel extends ChangeNotifier {
  NewsViewModel({
    required ApiService apiService,
    required CacheManager cacheManager,
  })  : _apiService = apiService,
        _cacheManager = cacheManager {
    _initializeArticles();
  }
  final ApiService _apiService;
  final CacheManager _cacheManager;

  List<Article> _articles = [];
  String _selectedCategory = 'general';
  bool _isLoading = false;
  String _error = '';
  bool _isSearching = false;

  List<Article> get articles => _articles;
  String get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;
  String get error => _error;
  bool get isSearching => _isSearching;

  Future<void> _initializeArticles() async {
    _articles = _cacheManager.getCachedArticles();
    if (_articles.isEmpty) {
      await fetchNews();
    }
  }

  Future<void> fetchNews() async {
    _isLoading = true;
    _error = '';
    _isSearching = false;
    notifyListeners();

    try {
      final articles = await _apiService.fetchNews(_selectedCategory);
      _articles = articles;
      await _cacheManager.cacheArticles(articles);
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchNews(String query) async {
    if (query.isEmpty) {
      _isSearching = false;
      await fetchNews();
      return;
    }

    _isLoading = true;
    _error = '';
    _isSearching = true;
    notifyListeners();

    try {
      final articles = await _apiService.searchNews(query);
      _articles = articles;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      fetchNews();
    }
  }

  Future<void> refreshNews() async {
    await fetchNews();
  }
}
