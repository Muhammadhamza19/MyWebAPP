import 'package:local_grocery/support/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_theme.dart';

class BaseScaffoldScreen extends StatefulWidget {
  final Widget? appBar;
  final Widget body;
  final Widget? drawer;
  final Widget? endDrawer;

  final Widget? title;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final bool? automaticallyImplyLeading;
  const BaseScaffoldScreen(
      {Key? key,
      required this.body,
      this.title,
      this.appBar,
      this.endDrawer,
      this.drawer,
      this.bottomNavigationBar,
      this.automaticallyImplyLeading,
      this.resizeToAvoidBottomInset})
      : super(key: key);

  @override
  _BaseScaffoldScreenState createState() => _BaseScaffoldScreenState();
}

class _BaseScaffoldScreenState extends State<BaseScaffoldScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.drawer != null ? widget.drawer : null,
      endDrawer: widget.endDrawer != null ? widget.endDrawer : null,
      appBar: widget.appBar != null
          ? AppBar(
              automaticallyImplyLeading:
                  widget.automaticallyImplyLeading ?? true,
              title: widget.appBar,
              iconTheme: IconThemeData(color: primaryColor),
              backgroundColor: isDark ? secondaryColor : backgroundColor,
              elevation: 2.0,
            )
          : null,
      body: widget.body,
      bottomNavigationBar: widget.bottomNavigationBar != null
          ? widget.bottomNavigationBar
          : null,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset ?? false,
    );
  }
}
