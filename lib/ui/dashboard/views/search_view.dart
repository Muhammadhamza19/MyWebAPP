import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/dashboard/cards/search_product_card.dart';
import 'package:local_grocery/ui/product/product_main_page.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/components/progression_button_view.dart';
import 'package:local_grocery/ui/shared/components/search_input_field.dart';
import 'package:local_grocery/ui/shared/components/select_dialog.dart';
import 'package:local_grocery/ui/shared/widgets/my_input_box.dart';
import 'package:local_grocery/ui/shared/widgets/my_location_text.dart';

import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/view_models/dashboard_view_model.dart';

class SearchView extends StatelessWidget {
  final DashboardViewModel _model = DashboardViewModel.load();
  final List<String> items = List<String>.generate(
    10,
    (index) => 'PAKISTANI',
  );
  List<bool> checkboxValues = [
    false,
    false,
    false,
    false,
  ];

  SearchView({super.key});

  String? subCategory;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldScreen(
      appBar: _appBar(context),
      body: Obx(
        () => GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: _model.shouldNotify.value
              ? _pageContent(context)
              : const SizedBox(),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return MyAppBar(
      // title: "dashboard",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _model.toggleDashboardSearchView(true);
                  _model.searchProducts = [];
                },
                child: Icon(
                  Icons.arrow_back_sharp,
                  color: primaryColor,
                  size: 20,
                ),
              ),
              wGap16,
              MyText(
                "Search",
                style: titleSmall,
              ),
            ],
          ),
          wGap8,
          Expanded(
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.locationDot,
                  size: 15,
                  color: primaryColor,
                ),
                wGap4,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LocationTextField(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hGap8,
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: MyInputBox(
                        borderLabel: "Select",
                        borderColor: primaryColor,
                        onTap: () async {
                          final response = await showDialog(
                            context: context,
                            builder: (context) {
                              return SelectDialog(
                                title: "Select ",
                                items: ["Product", "Shop"],
                                multiSelect: true,
                                searchEnabled: true,
                              );
                            },
                          );
                          print(response);
                        },
                      ),
                    ),
                    hGap8,
                    SearchInputField(
                      labelText: "what do you want to buy",
                      labelColor: primaryColor,
                      products: items,
                      onProductSelected: (String value) {
                        print(value);
                      },
                    ),
                    hGap8,
                    ProgressionButtonView(
                      progressionButtons: [
                        ProgressionButton(
                          text: 'search',
                          icon: FontAwesomeIcons.searchengin,
                          onPressed: () async {
                            await _model.searchProduct("");
                            _model.notify();
                          },
                          color: primaryColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            if ((_model.searchProducts?.length ?? 0) != 0) ...[
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 300 // Adjust as needed
                    ),
                itemCount: _model.searchProducts?.length,
                itemBuilder: (BuildContext context, int index) {
                  return SearchProductCard(
                    searchProducts: _model.searchProducts![index],
                    onTap: () => Get.to(
                      () => ProductMainPage(
                        productId: _model.allProducts![index].productId,
                        productTitle: _model.allProducts?[index].productName,
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
