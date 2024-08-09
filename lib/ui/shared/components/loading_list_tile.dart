import 'package:flutter/material.dart';
import 'package:local_grocery/ui/shared/components/box_size.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';

class LoadingListTile extends StatelessWidget {
  final bool showSubtitle;
  final bool showLeading;
  final bool showTrailing;
  final bool compact;

  const LoadingListTile({
    this.showSubtitle = true,
    this.showLeading = true,
    this.showTrailing = true,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: ListTile(
        visualDensity: compact ? VisualDensity.compact : VisualDensity.standard,
        title: Box.text(fontSize: 15.0),
        subtitle: showSubtitle
            ? Row(
                children: [
                  Expanded(child: Box.text(fontSize: 11.0)),
                  Expanded(child: Container())
                ],
              )
            : null,
        leading: showLeading
            ? Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: const Box(explicitWidth: 20.0, explicitHeight: 20.0),
              )
            : null,
        trailing: showTrailing
            ? const Box(explicitWidth: 20.0, explicitHeight: 20.0)
            : null,
      ),
    );
  }
}
