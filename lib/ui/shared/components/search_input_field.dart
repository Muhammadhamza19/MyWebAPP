// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_input_box.dart';

class SearchInputField extends StatefulWidget {
  final Function(String)? onProductSelected; // Callback function
  final List<String>? products;
  final String? labelText;
  final Color? labelColor;
  final IconData? icons;
  final Function(String)? onClickIcon;
  const SearchInputField({
    Key? key,
    this.onProductSelected,
    this.products,
    this.labelText,
    this.labelColor,
    this.onClickIcon,
    this.icons,
  }) : super(key: key);

  @override
  _SearchInputFieldState createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  List<String> filteredProducts = [];
  TextEditingController searchController = TextEditingController();
  bool isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products ?? [];
    searchController.addListener(_filterProducts);
  }

  void _filterProducts() {
    setState(() {
      filteredProducts = widget.products!
          .where((product) => product
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
      isDropdownOpen = searchController.text.isNotEmpty;
    });
  }

  void _toggleDropdown() {
    setState(() {
      isDropdownOpen = !isDropdownOpen;
    });
  }

  void _selectProduct(String product) {
    searchController.text = product;
    _toggleDropdown();
    FocusScope.of(context).unfocus();
    // Call the callback function with the selected product
    widget.onProductSelected!(product);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              MyInputBox(
                controller: searchController,
                borderLabel: widget.labelText ?? "",
                icon: widget.icons ?? Icons.search,
                borderColor: widget.labelColor ?? primaryColor,
                labelColor: widget.labelColor ?? primaryColor,
                iconColor: widget.labelColor ?? primaryColor,
                onChanged: (value) => _toggleDropdown,
              ),
              if (isDropdownOpen)
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredProducts[index]),
                        onTap: () => _selectProduct(filteredProducts[index]),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
        wGap8,
        if (widget.onClickIcon != null)
          if (!isDropdownOpen)
            MyAssetImage(
              imageName: 'filter_icon',
              onClick: widget.onClickIcon,
            )
      ],
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
