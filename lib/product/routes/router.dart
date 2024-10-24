// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/feature/view/home_view.dart';
import 'package:haber_uygulamasi/feature/view/news_detail_view.dart';
import 'package:haber_uygulamasi/feature/view/news_view.dart';
import 'package:haber_uygulamasi/feature/view/profile_view.dart';
import 'package:haber_uygulamasi/product/model/article.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: NewsRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: ProfileRoute.page,
        ),
        AutoRoute(
          page: NewsDetailRoute.page,
        ),
      ];
}
