// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/product/core/app_constants.dart';
import 'package:haber_uygulamasi/product/model/article.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@RoutePage()
class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({
    required this.article,
    super.key,
  });
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.categoryTitles[article.category] ?? 'Haber Detayı',
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.imageUrl.isNotEmpty)
              CachedNetworkImage(
                imageUrl: article.imageUrl,
                height: 250.h,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => SizedBox(
                  height: 250.h,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => SizedBox(
                  height: 250.h,
                  child: const Center(child: Icon(Icons.error)),
                ),
              ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Icon(Icons.person, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        article.author,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      const Spacer(),
                      Icon(Icons.calendar_today, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        DateFormat('dd.MM.yyyy').format(article.publishedAt),
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    article.content,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () {
                      // Add URL launcher functionality
                      // launch(article.url);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 48.h),
                    ),
                    child: const Text('Haberin Devamini Oku'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
