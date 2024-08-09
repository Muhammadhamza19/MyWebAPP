import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/shared/components/box_size.dart';
import 'package:flutter/material.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';

import 'loading_list_tile.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final row = Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 6.0, bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Box.text(width: BoxSize.quarter, fontSize: 12.0),
                Box.text(width: BoxSize.quarter, fontSize: 12.0),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Box.text(width: BoxSize.quarter, fontSize: 12.0),
                Box.text(width: BoxSize.quarter, fontSize: 12.0),
              ],
            ),
          ),
        ],
      ),
    );
    return ShimmerWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const LoadingListTile(compact: true),
          Divider(color: secondaryColor, height: 0.0),
          row,
          Divider(color: secondaryColor, height: 0.0),
          row,
          SizedBox(height: 4.0)
        ],
      ),
    );
  }
}
