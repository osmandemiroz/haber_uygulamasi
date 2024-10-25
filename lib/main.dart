// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/feature/viewmodel/news_viewmodel.dart';
import 'package:haber_uygulamasi/product/core/app_constants.dart';
import 'package:haber_uygulamasi/product/init/cache_manager.dart';
import 'package:haber_uygulamasi/product/routes/router.dart';
import 'package:haber_uygulamasi/product/service/news_api_service.dart';
import 'package:haber_uygulamasi/product/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize cache
  await CacheManager.instance.init();

  runApp(_App());
}

class _App extends StatelessWidget {
  _App();

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsViewModel(
            apiService: ApiService(),
            cacheManager: CacheManager.instance,
          ),
        ),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp.router(
            title: AppConstants.appName,
            theme: AppTheme.lightTheme,
            routerConfig: _appRouter.config(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
