import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/ui/cart/cart_main_page.dart';
import 'package:local_grocery/ui/dashboard/views/dashboard_main_view.dart';
import 'package:local_grocery/ui/dashboard/views/filter_view.dart';
import 'package:local_grocery/ui/dashboard/views/search_view.dart';
import 'package:local_grocery/view_models/dashboard_view_model.dart';

class DashboardMainPage extends StatelessWidget {
  final DashboardViewModel _model = DashboardViewModel.load();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _pageContent(context),
    );
  }

  Widget _pageContent(BuildContext context) {
    switch (_model.currentView.value) {
      case 0:
        return FilterView();
      case 1:
        return CartMainPage();
      case 2:
        return SearchView();
      default:
        return DashboardMainView();
    }
  }
}
