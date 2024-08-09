import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/categories/cards/category_card.dart';
import 'package:local_grocery/ui/categories/view/sub_categories_main_view.dart';
import 'package:local_grocery/ui/shared/components/error_view.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';
import 'package:local_grocery/view_models/category_view_model.dart';

class CategoriesMainView extends StatelessWidget {
  CategoriesMainView({super.key});
  final List<Map<String, String>> categories = [
    {
      'imageUrl':
          'https://storage.googleapis.com/lg-content/WebAssets/Babies.jpg',
      'categoryName': 'Babies',
    },
    {
      'imageUrl':
          'https://storage.googleapis.com/lg-content/WebAssets/Babies.jpg',
      'categoryName': 'Kids',
    },
    {
      'imageUrl':
          'https://storage.googleapis.com/lg-content/WebAssets/Babies.jpg',
      'categoryName': 'Adults',
    },
    {
      'imageUrl':
          'https://storage.googleapis.com/lg-content/WebAssets/Babies.jpg',
      'categoryName': 'Seniors',
    },
    // Add more categories as needed
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryViewModel>(
      init: CategoryViewModel(),
      dispose: (_) => Get.find<CategoryViewModel>().onClose(),
      builder: (_model) {
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
      },
    );
  }

  Widget _appBar() {
    return MyAppBar(
      title: "Categories",
      onBackPressed: () => Get.back(),
    );
  }

  Widget _loadingContent() {
    return ShimmerWidget(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Three cards per row
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio:
              0.75, // Adjust this ratio to fit the height/width of the cards
        ),
        itemBuilder: (context, index) {
          return Card(
            child: SizedBox(
              height: 300,
              width: 200,
            ),
          );
        },
      ),
    );
  }

  Widget _pageContent(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Three cards per row
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio:
              0.75, // Adjust this ratio to fit the height/width of the cards
        ),
        itemBuilder: (context, index) {
          return CategoryCard(
            imageUrl: categories[index]['imageUrl']!,
            categoryName: categories[index]['categoryName']!,
            onTap: () => Get.to(() => SubCategoriesMainView()),
          );
        },
      ),
    );
  }
}
