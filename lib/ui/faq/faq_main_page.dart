import 'package:flutter/material.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FaqMainPage extends StatefulWidget {
  final String url;
  final String title;

  const FaqMainPage({
    Key? key,
    required this.url,
    this.title = '',
  }) : super(key: key);

  @override
  _FaqMainPageState createState() => _FaqMainPageState();
}

class _FaqMainPageState extends State<FaqMainPage> {
  late WebViewController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUrl();
  }

  void loadUrl() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url))
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            isLoading = true;
          });
        },
        onPageFinished: (url) {
          setState(() {
            isLoading = false;
          });
        },
      ));
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldScreen(
      appBar: MyAppBar(
        title: widget.title,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
