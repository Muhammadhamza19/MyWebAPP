import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final Function? onPositivePressed;
  final Function? onNegativePressed;
  final bool showRemarksInput;
  final List<String>? dropdownItems;
  String? selectedDropdownItem;

  MyAlertDialog({
    required this.title,
    required this.content,
    required this.positiveButtonText,
    required this.negativeButtonText,
    this.onPositivePressed,
    this.onNegativePressed,
    this.showRemarksInput = false,
    this.dropdownItems,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: MyText(title),
      content: Column(
        children: [
          MyText(content),
          if (showRemarksInput) _buildRemarksInput(),
          if (dropdownItems != null) _buildDropdown(),
        ],
      ),
      // positiveButtonText: MyString.translate("text"),
      // onPositivePressed: onPositivePressed,
      actions: [
        TextButton(
          onPressed:
              onNegativePressed != null ? () => onNegativePressed!() : null,
          child: MyText(negativeButtonText ?? ""),
        ),
        TextButton(
          onPressed:
              onPositivePressed != null ? () => onPositivePressed!() : null,
          child: MyText(positiveButtonText ?? ""),
        ),
      ],
    );
  }

  Widget _buildRemarksInput() {
    return TextField(
      decoration: InputDecoration(labelText: 'Remarks (Optional)'),
    );
  }

  Widget _buildDropdown() {
    return DropdownButton<String>(
      items: dropdownItems!
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
      value: selectedDropdownItem,
      onChanged: (value) {
        selectedDropdownItem = value;
      },
      hint: Text('Select an item'),
    );
  }
}
