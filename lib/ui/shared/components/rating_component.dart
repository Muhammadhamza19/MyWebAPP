import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class RatingComponent extends StatefulWidget {
  final int? maxRating;
  final double? currentRating;
  final Function(double)? onRatingChanged;
  final bool? textRightSide;

  RatingComponent({
    this.maxRating = 5,
    this.currentRating = 0,
    this.onRatingChanged,
    this.textRightSide = false,
    // Default to true to keep existing behavior
  });

  @override
  _RatingComponentState createState() => _RatingComponentState();
}

class _RatingComponentState extends State<RatingComponent> {
  double _currentRating = 0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.currentRating ?? 0.0;
  }

  Widget _buildStar(int index) {
    IconData icon;
    if (index >= _currentRating) {
      icon = Icons.star_border;
    } else if (index > _currentRating - 1 && index < _currentRating) {
      icon = Icons.star_half;
    } else {
      icon = Icons.star;
    }

    return GestureDetector(
      onTap: widget.onRatingChanged != null
          ? () {
              setState(() {
                _currentRating = index + 1.0;
                widget.onRatingChanged!(_currentRating);
              });
            }
          : null,
      child: Icon(
        icon,
        color: primaryColor,
        size: 20.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.textRightSide == true) ...[
          MyText(
            "(${_currentRating.toStringAsFixed(1)})", // Show rating with one decimal place
            style: TextStyle(fontSize: 10.0),
          ),
          wGap4
        ],
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              widget.maxRating ?? 5, (index) => _buildStar(index)),
        ),
        SizedBox(width: 8.0),
        // Add some space between stars and rating text
        if (widget.textRightSide == false) ...[
          wGap4,
          MyText(
            "(${_currentRating.toStringAsFixed(1)})", // Show rating with one decimal place
            style: TextStyle(fontSize: 10.0),
          )
        ],
      ],
    );
  }
}
