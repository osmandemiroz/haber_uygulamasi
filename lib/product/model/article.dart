// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'article.g.dart';

@HiveType(typeId: 0)

/// [Article] is a class that represents a news article.
class Article extends Equatable {
  const Article({
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
    required this.author,
    required this.publishedAt,
    required this.url,
    required this.category,
  });

  factory Article.fromJson(
    Map<String, String> json, {
    String category = 'general',
  }) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      author: json['author'] ?? 'Unknown',
      publishedAt: DateTime.parse(
        json['publishedAt'] ?? DateTime.now().toIso8601String(),
      ),
      url: json['url'] ?? '',
      category: category,
    );
  }
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final String author;
  @HiveField(5)
  final DateTime publishedAt;
  @HiveField(6)
  final String url;
  @HiveField(7)
  final String category;

  @override
  List<Object?> get props => [title, url];
}
