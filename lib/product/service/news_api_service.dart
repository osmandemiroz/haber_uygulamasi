// ignore_for_file: public_member_api_docs, avoid_dynamic_calls

import 'dart:convert';

import 'package:haber_uygulamasi/feature/model/article.dart';
import 'package:haber_uygulamasi/product/core/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService({http.Client? client}) : _client = client ?? http.Client();
  final http.Client _client;

  Future<List<Article>> fetchNews(String category) async {
    try {
      final response = await _client.get(
        Uri.parse(
            '${ApiConstants.baseUrl}/top-headlines?country=${ApiConstants.country}'
            '&category=$category&apiKey=${ApiConstants.apiKey}'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['articles'] as List)
            .map(
              (article) => Article.fromJson(
                article as Map<String, dynamic>,
                category: category,
              ),
            )
            .toList();
      }
      throw Exception('Failed to fetch news');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Article>> searchNews(String query) async {
    try {
      final response = await _client.get(
        Uri.parse('${ApiConstants.baseUrl}/everything?q=$query'
            '&apiKey=${ApiConstants.apiKey}'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['articles'] as List)
            .map((article) => Article.fromJson(article as Map<String, dynamic>))
            .toList();
      }
      throw Exception('Failed to search news');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
