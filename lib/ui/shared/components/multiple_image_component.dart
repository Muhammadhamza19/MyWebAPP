import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class MultipleImageComponent extends StatefulWidget {
  final List<String>? images;
  final List<String>? texts; // Added texts list
  final ValueChanged<int>? onPageChanged; // Added callback

  MultipleImageComponent({this.images, this.texts, this.onPageChanged});

  @override
  _MultipleImageComponentState createState() => _MultipleImageComponentState();
}

class _MultipleImageComponentState extends State<MultipleImageComponent> {
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < (widget.images?.length ?? 0) - 1) {
      setState(() {
        _currentPage++;
        widget.onPageChanged?.call(_currentPage);
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        widget.onPageChanged?.call(_currentPage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // Set a fixed width for the Container
      height: 160, // Set a fixed height for the Container
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_currentPage > 0)
            IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft),
              onPressed: _previousPage,
            ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyAssetImage(
                  imageName: widget.images?[_currentPage] ?? "",
                  width: 120,
                  height: 120,
                ),
                if ((widget.texts?.length ?? 0) > 0) ...[
                  SizedBox(height: 8), // Use SizedBox for consistent spacing
                  MyText(
                    widget.texts?[_currentPage] ?? "",
                    maxLines: 1,
                  ),
                ]
              ],
            ),
          ),
          if (_currentPage < (widget.images?.length ?? 0) - 1)
            IconButton(
              icon: Icon(FontAwesomeIcons.arrowRight),
              onPressed: _nextPage,
            ),
        ],
      ),
    );
  }
}
