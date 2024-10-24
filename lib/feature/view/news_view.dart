// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/feature/viewmodel/news_viewmodel.dart';
import 'package:haber_uygulamasi/feature/widgets/category_list_widget.dart';
import 'package:haber_uygulamasi/feature/widgets/news_list_widget.dart';
import 'package:haber_uygulamasi/product/core/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@RoutePage()
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              viewModel.isSearching
                  ? 'Arama Sonuçları'
                  : AppConstants.categoryTitles[viewModel.selectedCategory] ??
                      'Haberler',
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
          body: Column(
            children: [
              const SearchBar(),
              if (!viewModel.isSearching) const CategoryListWidget(),
              Expanded(
                child: NewsListWidget(
                  articles: viewModel.articles,
                  isLoading: viewModel.isLoading,
                  error: viewModel.error,
                  onRefresh: viewModel.refreshNews,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
