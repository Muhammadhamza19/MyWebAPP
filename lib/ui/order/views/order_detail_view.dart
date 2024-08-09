import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/order/cards/order_detail_card.dart';
import 'package:local_grocery/ui/shared/components/error_view.dart';
import 'package:local_grocery/ui/shared/components/loading_list_tile.dart';
import 'package:local_grocery/ui/shared/components/loading_list_view.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';
import 'package:local_grocery/view_models/product_view_model.dart';

class OrderDetailView extends StatelessWidget {
  final ProductViewModel _model = Get.find<ProductViewModel>();

  String? tokenId;
  int? indexes;
  OrderDetailView({
    this.tokenId,
    this.indexes,
  });

  @override
  Widget build(BuildContext context) {
    // return GetBuilder<ProductViewModel>(
    //   init: ProductViewModel(ProductCurrentView.order.index),
    //   dispose: (_) => Get.find<ProductViewModel>().onClose(),
    //   builder: (_model) {
    return BaseScaffoldScreen(
      automaticallyImplyLeading: false,
      appBar: _appBar(),
      body: Obx(
        () {
          /// Show loader during page load
          if (_model.isLoading) {
            print("1");
            // return LoaderView();
            return _loadingContent();
          }

          /// Show error state
          if (_model.isError) {
            return ErrorView(
              _model.errorMessage.value,
              refreshFunction: () =>
                  _model.fetchData(ProductCurrentView.order.index),
            );
          }

          /// show page content
          return _pageContent(context, _model);
        },
      ),
    );
    //   },
    // );
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
      title: tokenId ?? "",
      onBackPressed: () => Get.back(),
    );
  }

  Widget _pageContent(BuildContext context, ProductViewModel _model) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: _model.orders?[indexes!].orderDetailResponse?.length,
          itemBuilder: (context, index) {
            return OrderDetailCard(
              orderDetail: _model.orders![indexes!].orderDetailResponse![index],
            );
          },
        )
      ],
    );
  }
}
