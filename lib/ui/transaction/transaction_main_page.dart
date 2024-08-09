import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/order/order_main_page.dart';
import 'package:local_grocery/ui/shared/components/error_view.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';
import 'package:local_grocery/ui/transaction/card/transaction_card.dart';
import 'package:local_grocery/view_models/transaction_view_model.dart';

class TransactionMainPage extends StatelessWidget {
  const TransactionMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionViewModel>(
      init: TransactionViewModel(),
      dispose: (_) => Get.find<TransactionViewModel>().onClose(),
      builder: (_model) {
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
      },
    );
  }

  Widget _loadingContent() {
    return ShimmerWidget(
        child: Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: SizedBox(
                  height: 120,
                ),
              ),
            );
          },
        )
      ],
    ));
  }

  Widget _appBar() {
    return MyAppBar(
      title: "My Transaction",
      onBackPressed: () => Get.back(),
    );
  }

  Widget _pageContent(BuildContext context, TransactionViewModel _model) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: _model.transaction?.length,
          itemBuilder: (context, index) {
            return TransactionCard(
              transaction: _model.transaction?[index],
              onTap: () => Get.to(
                () => OrderMainPage(),
              ),
            );
          },
        )
      ],
    );
  }
}
