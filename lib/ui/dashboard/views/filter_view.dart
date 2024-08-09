import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/components/progression_button_view.dart';
import 'package:local_grocery/ui/shared/components/rating_component.dart';
import 'package:local_grocery/ui/shared/components/search_input_field.dart';
import 'package:local_grocery/ui/shared/components/select_dialog.dart';
import 'package:local_grocery/ui/shared/widgets/my_input_box.dart';

import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/view_models/dashboard_view_model.dart';

class FilterView extends StatelessWidget {
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

  FilterView({super.key});

  String? subCategory;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldScreen(
      appBar: _appBar(context),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: _pageContent(context),
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
                onTap: () => _model.toggleDashboardFilterView(true),
                child: Icon(
                  Icons.arrow_back_sharp,
                  color: primaryColor,
                  size: 20,
                ),
              ),
              wGap16,
              MyText(
                "Filter",
                style: titleSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pageContent(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hGap8,
                MyInputBox(
                  borderLabel: "Select Ethnicity",
                  borderColor: primaryColor,
                  onTap: () async {
                    final response = await showDialog(
                      context: context,
                      builder: (context) {
                        return SelectDialog(
                          title: "Select Ethnicity",
                          items: ["uzair1", "uzair2"],
                          multiSelect: true,
                          searchEnabled: true,
                        );
                      },
                    );
                    print(response);
                  },
                ),
                hGap8,
                MyInputBox(
                  borderLabel: "Select Category",
                  borderColor: primaryColor,
                  onTap: () async {
                    final response = await showDialog(
                      context: context,
                      builder: (context) {
                        return SelectDialog(
                          title: "Select Category",
                          items: ["Milk", "Bread", "Butter"],
                          multiSelect: true,
                          searchEnabled: true,
                        );
                      },
                    );
                    print(response);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 10),
                  child: MyText(
                    "Customer Rating",
                    style: primarySmall,
                  ),
                ),
                RatingComponent(
                  currentRating: 1,
                  onRatingChanged: (double value) {},
                ),
                hGap28,
                MyText(
                  "Price",
                  style: primarySmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [MyText("0"), MyText("100")],
                  ),
                ),
                Obx(
                  () => RangeSlider(
                    values: _model.rangeValues.value,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    labels: RangeLabels(
                      _model.rangeValues.value.start.toStringAsFixed(0),
                      _model.rangeValues.value.end.toStringAsFixed(0),
                    ),
                    activeColor: primaryColor,
                    onChanged: (values) {
                      _model.updatePriceSliderValue(values);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 12),
                  child: MyText(
                    "Distance",
                    style: primarySmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [MyText("0"), MyText("10000")],
                  ),
                ),
                Obx(
                  () => Slider(
                    value: _model.distanceSliderValue.value,
                    min: 0,
                    max: 10000,
                    divisions: 10000,
                    activeColor: primaryColor,
                    label: _model.distanceSliderValue.value.toStringAsFixed(0),
                    onChanged: (value) {
                      _model.updateDistanceSliderValue(value);
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, top: 16, bottom: 12),
                  child: MyText(
                    "Category",
                    style: primarySmall,
                  ),
                ),
                SearchInputField(
                  products: items,
                  icons: Icons.arrow_drop_down,
                  onProductSelected: (p0) {},
                ),
                hGap12,
                if (subCategory != null) ...[
                  SearchInputField(
                    products: items,
                    icons: Icons.arrow_drop_down,
                  ),
                ],
                hGap24,
              ],
            ),
          ),
        ),
        Spacer(),
        ProgressionButtonView(
          progressionButtons: [
            ProgressionButton(
              text: 'close',
              icon: FontAwesomeIcons.ban,
              onPressed: () {},
              color: redColor[400],
            ),
            ProgressionButton(
              text: 'applyChanges',
              icon: FontAwesomeIcons.check,
              onPressed: () {},
              color: primaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
