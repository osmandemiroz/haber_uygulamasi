// ignore_for_file: public_member_api_docs, inference_failure_on_instance_creation, lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/feature/model/article.dart';
import 'package:haber_uygulamasi/feature/view/full_article_view.dart';
import 'package:haber_uygulamasi/product/core/app_constants.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@RoutePage()
final class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({
    required this.article,
    super.key,
  });
  final Article article;

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.categoryTitles[widget.article.category] ??
              'Haber Detayı',
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.article.imageUrl.isNotEmpty)
              CachedNetworkImage(
                imageUrl: widget.article.imageUrl,
                height: 35.h,
                width: double.infinity,
                fit: BoxFit.fill,
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
                    widget.article.title,
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
                        widget.article.author,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      const Spacer(),
                      Icon(Icons.calendar_today, size: 16.sp),
                      SizedBox(width: 4.w),
                      Text(
                        DateFormat('dd.MM.yyyy')
                            .format(widget.article.publishedAt),
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    widget.article.content,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 24.h),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FullArticle(url: widget.article.url),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      minimumSize: Size(double.infinity, 1.h),
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
