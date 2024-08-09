import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/ui/dashboard/dashboard_main_page.dart';

import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/shared/components/error_view.dart';
import 'package:local_grocery/ui/shared/components/loading_list_tile.dart';
import 'package:local_grocery/ui/shared/components/loading_list_view.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/view_models/dashboard_view_model.dart';

class OrderPlacedView extends StatelessWidget {
  final DashboardViewModel _model = Get.find<DashboardViewModel>();

  OrderPlacedView({super.key});

  @override
  Widget build(BuildContext context) {
    // return GetBuilder<DashboardViewModel>(
    //     init: DashboardViewModel(ProductCurrentView.product.index),
    //     dispose: (_) => Get.find<DashboardViewModel>().onClose(),
    //     builder: (_model) {
    return BaseScaffoldScreen(
      automaticallyImplyLeading: false,
      appBar: _appBar(),
      body: Obx(
        () {
          /// Show loader during page load
          if (_model.isLoading) {
            // return LoaderView();
            return _loadingContent();
          }

          /// Show error state
          if (_model.isError) {
            return ErrorView(
              _model.errorMessage.value,
              refreshFunction: () => _model.fetchData(),
            );
          }

          /// show page content
          return Obx(
            () => (_model.shouldNotify.value)
                ? _pageContent(context, _model)
                : const SizedBox(),
          );
        },
      ),
    );
    // });
  }

  Widget _loadingContent() {
    return ShimmerWidget(
      child: LoadingListView(
        child: LoadingListTile(),
      ),
    );
  }

  Widget _appBar() {
    return MyAppBar(
      // title: "dashboard",

      onBackPressed: () {
        _model.currentView.value = DMainCurrentView.dashboard_view.index;
        Get.to(
          () => DashboardMainPage(),
        );
      },
    );
  }

  Widget _pageContent(BuildContext context, DashboardViewModel _model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(
              "congratulations",
              style: primaryLarge,
            ),
            MyText(
              "yourOrderHasBeenPlaced",
              style: titleMedium,
              textAlign: TextAlign.center,
            ),
            MyText(
              "tokenId",
              style: titleSmall,
              textAlign: TextAlign.center,
            ),
            MyText(
              "LG-001256",
              style: titleSmall,
              textAlign: TextAlign.center,
            ),
            MyAssetImage(
              imageName: 'barcode',
              height: 50,
              width: 100,
            ),
            hGap12,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.share,
                  color: primaryColor,
                ),
                wGap12,
                Icon(
                  Icons.print,
                  color: primaryColor,
                )
              ],
            )
          ],
        ),
        MyText("goBackToOrderPage"),
      ],
    );
  }
}
