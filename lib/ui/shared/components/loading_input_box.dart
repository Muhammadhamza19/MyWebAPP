import 'package:local_grocery/ui/shared/components/box_size.dart';
import 'package:flutter/material.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';

/// Should directly mimic and InputBox style and shape when loading
class LoadingInputBox extends StatelessWidget {
  const LoadingInputBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14.0),
          labelText: '..........................',
          border: OutlineInputBorder(),
        ),
        child: const Box.text(width: BoxSize.quarter, fontSize: 16.0),
      ),
    );
  }
}
