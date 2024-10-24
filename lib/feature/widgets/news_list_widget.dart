// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/feature/widgets/news_card_widget.dart';
import 'package:haber_uygulamasi/product/model/article.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({
    required this.articles,
    required this.isLoading,
    required this.error,
    required this.onRefresh,
    super.key,
  });
  final List<Article> articles;
  final bool isLoading;
  final String error;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bir hata oluştu',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              error,
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: onRefresh,
              child: const Text('Tekrar Dene'),
            ),
          ],
        ),
      );
    }

    if (articles.isEmpty) {
      return Center(
        child: Text(
          'Haber bulunamadı',
          style: TextStyle(fontSize: 16.sp),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return NewsCardWidget(article: articles[index]);
        },
      ),
    );
  }
}
