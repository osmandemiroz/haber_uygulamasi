// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/feature/viewmodel/news_viewmodel.dart';

import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: EdgeInsets.all(8.w),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Haber ara...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
            ),
            onChanged: (value) {
              if (value.isEmpty) {
                viewModel.fetchNews();
              }
            },
            onSubmitted: viewModel.searchNews,
          ),
        );
      },
    );
  }
}
