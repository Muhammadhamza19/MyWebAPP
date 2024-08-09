import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/shared/components/error_view.dart';
import 'package:local_grocery/ui/shared/components/loading_list_tile.dart';
import 'package:local_grocery/ui/shared/components/loading_list_view.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';
import 'package:local_grocery/ui/shared/widgets/my_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_input_box.dart';
import 'package:local_grocery/view_models/dashboard_view_model.dart';

class VoucherView extends StatelessWidget {
  final DashboardViewModel _model = Get.find<DashboardViewModel>();

  VoucherView({super.key});

  @override
  Widget build(BuildContext context) {
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
      title: "Add Voucher",
      onBackPressed: () => Get.back(),
    );
  }

  Widget _pageContent(BuildContext context, DashboardViewModel _model) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: MyInputBox(
                  onChanged: (value) {},
                ),
              ),
              wGap4,
              MyButton(
                text: "Add",
                color: primaryColor,
                onPressed: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}
