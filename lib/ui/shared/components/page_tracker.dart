import 'package:flutter/material.dart';
// import 'package:rap_core_mobile/extension_methods/build_context_extension.dart';
// import 'package:rap_core_mobile/ui/components/page/status_page_title.dart';
// import 'package:rap_core_mobile/view_models/bread_crumbs_view_model.dart';

class PageTrackerWidget extends StatefulWidget {
  final Widget child;
  final Widget? statusIcon;
  final String pageName;
  final int? count;
  final bool showPageTitle;

  const PageTrackerWidget({
    Key? key,
    required this.child,
    required this.pageName,
    this.statusIcon,
    this.count,
    this.showPageTitle = true,
  }) : super(key: key);

  @override
  State<PageTrackerWidget> createState() => _PageTrackerWidgetState();
}

class _PageTrackerWidgetState extends State<PageTrackerWidget> {
  // BreadCrumbsViewModel? breadCrumbsViewModel;

  // @override
  // void initState() {
  //   breadCrumbsViewModel = context.readOrNull<BreadCrumbsViewModel>();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     breadCrumbsViewModel?.push(widget.pageName);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return widget.showPageTitle
        ? Column(
            children: [
              // StatusPageTitle(
              //   title: widget.pageName,
              //   statusIcon: widget.statusIcon,
              //   count: widget.count,
              // ),
              Expanded(child: widget.child),
            ],
          )
        : widget.child;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // breadCrumbsViewModel?.pop(widget.pageName);
    });
    super.dispose();
  }
}
