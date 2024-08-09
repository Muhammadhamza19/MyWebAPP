import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/categories/cards/category_card.dart';
import 'package:local_grocery/ui/dashboard/cards/dashboard_product_card.dart';
import 'package:local_grocery/ui/product/product_main_page.dart';
import 'package:local_grocery/ui/shared/components/error_view.dart';
import 'package:local_grocery/ui/shared/components/loading_list_tile.dart';
import 'package:local_grocery/ui/shared/components/loading_list_view.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';
import 'package:local_grocery/view_models/category_view_model.dart';
import 'package:local_grocery/view_models/dashboard_view_model.dart';

class SubCategoriesMainView extends StatelessWidget {
  final CategoryViewModel _model = Get.find<CategoryViewModel>();

  SubCategoriesMainView({super.key});
  final List<Map<String, String>> subCategories = [
    {
      'imageUrl':
          'https://storage.googleapis.com/lg-content/WebAssets/Babies.jpg',
      'subCategoryName': 'Baby Bath & Skin care',
    },
    {
      'imageUrl':
          'https://storage.googleapis.com/lg-content/WebAssets/Babies.jpg',
      'subCategoryName': 'Baby Feeding',
    },

    // Add more categories as needed
  ];
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldScreen(
      automaticallyImplyLeading: false,
      appBar: _appBar(),
      body: Obx(
        () {
          /// Show loader during page load
          if (_model.isLoading) {
            return _loadingContent();
          }

          /// Show error state
          if (_model.isError) {
            return ErrorView(_model.errorMessage.value,
                refreshFunction: () => _model.fetchData());
          }

          /// show page content
          return Obx(
            () => (_model.shouldNotify.value)
                ? _pageContent(context)
                : const SizedBox(),
          );
        },
      ),
    );
  }

  Widget _appBar() {
    return MyAppBar(
      title: "Sub Categories",
      onBackPressed: () => Get.back(),
    );
  }

  Widget _loadingContent() {
    return ShimmerWidget(
      child: LoadingListView(
        child: LoadingListTile(),
      ),
    );
  }

  Widget _pageContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            itemCount: subCategories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Three cards per row
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio:
                  0.75, // Adjust this ratio to fit the height/width of the cards
            ),
            itemBuilder: (context, index) {
              return CategoryCard(
                imageUrl: subCategories[index]['imageUrl']!,
                categoryName: subCategories[index]['subCategoryName']!,
              );
            },
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 300 // Adjust as needed
                ),
            itemCount: DashboardViewModel.load().allProducts!.length,
            itemBuilder: (BuildContext context, int index) {
              return DashboardProductCard(
                allProduct: DashboardViewModel.load().allProducts![index],
                onTap: () => Get.to(
                  () => ProductMainPage(
                    productId:
                        DashboardViewModel.load().allProducts![index].productId,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
