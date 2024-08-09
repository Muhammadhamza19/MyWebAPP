import 'package:flutter/material.dart';

class MyAssetImage extends StatelessWidget {
  final String imageName;
  final double height;
  final double width;
  final String tooltipText;
  final Function(String)? onClick;

  const MyAssetImage(
      {required this.imageName,
      this.height = 30.0,
      this.width = 30.0,
      this.tooltipText = "",
      this.onClick});
  @override
  Widget build(BuildContext context) {
    // const a = String.fromEnvironment('FLUTTER_APP_FLAVOR');

    if (this.onClick == null) {
      return Image(
        key: Key("MyAssetImage"),
        image: AssetImage("assets/images/$imageName.png"),
        height: this.height,
        width: this.width,
        fit: BoxFit.fill,
      );
    }

    return MouseRegion(
        key: Key("MyAssetImage"),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => this.onClick!(imageName),
          child: Tooltip(
            message: tooltipText,
            child: Image(
              image: AssetImage("assets/images/$imageName.png"),
              height: this.height,
              width: this.width,
            ),
          ),
        ));
  }
}
