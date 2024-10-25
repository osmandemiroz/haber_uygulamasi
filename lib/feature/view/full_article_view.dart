// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

/// Article view
final class FullArticle extends StatefulWidget {
  /// Article view constructor
  const FullArticle({required this.url, super.key});

  /// blog url
  final String url;

  @override
  State<FullArticle> createState() => _FullArticleState();
}

final class _FullArticleState extends State<FullArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Haberin Tamamı'),
        centerTitle: true,
        elevation: 0,
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
