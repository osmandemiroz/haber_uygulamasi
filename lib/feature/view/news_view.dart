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
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchBar(
                      context,
                    ),
                  );
                },
              ),
            ],
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
              if (!viewModel.isSearching)
                Padding(
                  padding: EdgeInsets.only(top: 4.h, bottom: 1.h),
                  child: const CategoryListWidget(),
                ),
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

final class SearchBar extends SearchDelegate<String> {
  SearchBar(
    this.context,
  );
  final BuildContext context;
  NewsViewModel get viewModel => context.read<NewsViewModel>();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final matchQuery = <String>[];
    for (final item in AppConstants.categoryTitles.keys) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final result = matchQuery[index];
        return ListTile(
          onTap: () {
            query = result;
            viewModel.setCategory(result);
            close(context, result);
          },
          title:
              Text(result.substring(0, 1).toUpperCase() + result.substring(1)),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final matchQuery = <String>[];
    for (final item in AppConstants.categoryTitles.keys) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final result = matchQuery[index];
        return ListTile(
          title:
              Text(result.substring(0, 1).toUpperCase() + result.substring(1)),
          onTap: () {
            query = result;
            viewModel.setCategory(result);
            close(context, result);
          },
        );
      },
    );
  }
}
