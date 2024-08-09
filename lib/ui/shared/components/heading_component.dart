import 'package:flutter/material.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class HeadingComponent extends StatelessWidget {
  final String? text1;
  final String? text2;
  final TextStyle? style1;
  final TextStyle? style2;

  HeadingComponent({this.text1, this.text2, this.style1, this.style2});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          text1 ?? "",
          style: style1 ?? Theme.of(context).textTheme.titleMedium,
        ),
        MyText(
          text2 ?? "",
          style: style2 ?? Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
