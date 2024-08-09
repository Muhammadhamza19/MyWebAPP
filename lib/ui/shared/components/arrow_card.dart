// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class ArrowCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final String? text;
  final double? trianglesize;
  final TextStyle? style;
  ArrowCard(
      {super.key,
      this.height,
      this.width,
      this.color,
      this.text,
      this.trianglesize,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height ?? 35,
          width: width ?? 120,
          color: color ?? secondaryColor,
          child: Center(
            child: MyText(
              text ?? "",
              textAlign: TextAlign.center,
              style: style ?? TextStyle(color: backgroundColor),
            ),
          ),
        ),
        CustomPaint(
          size: Size(trianglesize ?? 35, trianglesize ?? 35),
          painter: Triangle(color: color),
        )
      ],
    );
  }
}

class Triangle extends CustomPainter {
  final Color? color;
  Triangle({
    this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color ?? secondaryColor
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(size.width, size.height / 2)
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
