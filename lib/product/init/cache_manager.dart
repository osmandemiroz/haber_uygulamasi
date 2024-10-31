// ignore_for_file: lines_longer_than_80_chars

import 'package:haber_uygulamasi/feature/model/article.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// [CacheManager] is a class that provides methods to cache and retrieve news data from the Hive database.
class CacheManager {
  CacheManager._init();
  static final CacheManager _instance = CacheManager._init();

  /// [instance] is a static instance of the [CacheManager] class.
  static CacheManager get instance => _instance;

  /// [articlesBox] is a Hive box that stores news data.
  late Box<Article> articlesBox;

  /// [init] is a method that initializes the Hive database.
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ArticleAdapter());
    articlesBox = await Hive.openBox<Article>('articles');
  }

  /// [cacheArticles] is a method that caches news data in the Hive database.
  Future<void> cacheArticles(List<Article> articles) async {
    await articlesBox.clear();
    await articlesBox.addAll(articles);
  }

  /// [getCachedArticles] is a method that retrieves cached news data from the Hive database.
  List<Article> getCachedArticles() {
    return articlesBox.values.toList();
  }

  /// [clearCache] is a method that clears the Hive database.
  Future<void> clearCache() async {
    await articlesBox.clear();
  }
}
