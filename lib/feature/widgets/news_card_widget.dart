// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/product/model/article.dart';
import 'package:haber_uygulamasi/product/routes/router.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    required this.article,
    super.key,
  });
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: InkWell(
        onTap: () => context.router.push(NewsDetailRoute(article: article)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: article.imageUrl,
                  height: 32.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Center(
                    child: SizedBox(
                      height: 4.h,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => SizedBox(
                    height: 16.h,
                    child: const Icon(CupertinoIcons.person),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    article.description,
                    style: TextStyle(fontSize: 14.sp),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        article.author,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        DateFormat('dd.MM.yyyy').format(article.publishedAt),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
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
