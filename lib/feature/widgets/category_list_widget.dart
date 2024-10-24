// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/feature/viewmodel/news_viewmodel.dart';
import 'package:haber_uygulamasi/product/core/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsViewModel>(
      builder: (context, viewModel, child) {
        return SizedBox(
          height: 50.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            itemCount: AppConstants.categories.length,
            itemBuilder: (context, index) {
              final category = AppConstants.categories[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: FilterChip(
                  label: Text(
                    AppConstants.categoryTitles[category] ?? category,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  selected: viewModel.selectedCategory == category,
                  onSelected: (_) => viewModel.setCategory(category),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
