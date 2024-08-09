import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/categories/cards/category_card.dart';
import 'package:local_grocery/ui/shared/components/error_view.dart';
import 'package:local_grocery/ui/shared/components/loading_list_tile.dart';
import 'package:local_grocery/ui/shared/components/loading_list_view.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/ui/user_profile/card/order_profile_card.dart';
import 'package:local_grocery/view_models/profile_view_model.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({super.key});
  List<String> buttonNames = [
    'Your Order',
    'Buy Again',
    'Your Account',
    'Your Lists'
  ];
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
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      dispose: (_) => Get.find<ProfileViewModel>().onClose(),
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
                    ? _pageContent(context, _model)
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
      title: "Profile View",
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

  Widget _pageContent(BuildContext context, ProfileViewModel model) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: MyText(
                  "Hello, Willam",
                  style: titleMedium,
                )),
                CircleAvatar(
                  child: Icon(FontAwesomeIcons.user),
                )
              ],
            ),
          ),
          GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                mainAxisSpacing: 16.0, // Vertical spacing between cards
                crossAxisSpacing: 16.0, // Horizontal spacing between cards
                childAspectRatio: 7 / 2, // Aspect ratio of the cards
              ),
              itemCount: buttonNames.length, // Number of cards
              itemBuilder: (context, index) {
                return _buttonCard(index);
              }),
          hGap20,
          cardsHeadings(text1: "Your Orders", text2: "See all"),
          _orderCard(model),
          hGap20,
          cardsHeadings(text1: "Keep Shopping for", text2: "Browsing History"),
          SizedBox(
            height: 200,
            child: ListView.builder(
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    imageUrl: categories[index]['imageUrl']!,
                    categoryName: categories[index]['categoryName']!,
                    // onTap: () => Get.to(() => SubCategoriesMainView()),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _buttonCard(int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5, // Elevation of the card
      child: InkWell(
        onTap: () {},
        child: Center(
          child: MyText(
            buttonNames[index],
          ),
        ),
      ),
    );
  }

  Widget _orderCard(ProfileViewModel _model) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _model.orderList?.length,
        itemBuilder: (context, index) {
          return OrderProfileCard(
            orderList: _model.orderList![index],
          );
        },
      ),
    );
  }

  Widget cardsHeadings({void Function()? onTap, String? text1, String? text2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          text1 ?? "",
          style: titleSmall,
        ),

        GestureDetector(
          onTap: onTap ?? null,
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: MyText(
              text2 ?? "",
            ),
          ),
        ),
        // wGap4
      ],
    );
  }
}
