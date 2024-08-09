import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/components/base_dialog.dart';
import 'package:local_grocery/ui/shared/components/dialog_action_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_input_box.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class SelectDialog extends StatefulWidget {
  final String? title;
  final List<String> items;
  bool? multiSelect = false;
  bool? searchEnabled = false;

  SelectDialog({
    this.title,
    this.multiSelect,
    this.searchEnabled,
    required this.items,
  });

  @override
  _SelectDialogState createState() => _SelectDialogState();
}

class _SelectDialogState extends State<SelectDialog> {
  List<String> _filteredItems = [];
  List<String> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _onItemCheckedChange(String item, bool checked) {
    setState(() {
      if (checked) {
        _selectedItems.add(item);
      } else {
        _selectedItems.remove(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BaseDialog(
        title: widget.title,
        child: _content(),
        dialogActions: DialogActionButton(
          negativeButtonText: 'Close',
          negativeButtonIcon: FontAwesomeIcons.ban,
          negativeButtonColor: redColor[400]!,
          positiveButtonText: 'Done',
          positiveButtonIcon: FontAwesomeIcons.check,
          positiveButtonColor: primaryColor,
          positiveFunction: () {
            Navigator.of(context).pop(_selectedItems);
          },
        ),
      ),
    );
  }

  Widget _content() {
    return Column(
      children: <Widget>[
        if (widget.searchEnabled ?? false)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyInputBox(
              onChanged: _onSearchChanged,
              borderLabel: 'Search',
            ),
          ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _filteredItems.length,
            itemBuilder: (BuildContext context, int index) {
              final item = _filteredItems[index];
              return CheckboxListTile(
                value: _selectedItems.contains(item),
                title: MyText(
                  item,
                  style: labelLarge,
                ),
                onChanged: (checked) {
                  if (widget.multiSelect ?? false) {
                    _onItemCheckedChange(item, checked!);
                  } else {
                    setState(() {
                      _selectedItems = checked! ? [item] : [];
                    });
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
