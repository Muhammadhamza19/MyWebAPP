import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class DialogAppBar extends StatelessWidget {
  final String title;
  final String? subTitle;

  const DialogAppBar({this.title = "", this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: borderColor),
        ),
      ),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      width: double.infinity,
      height: 50.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyText(
            title,
            key: Key(title),
            softWrap: false,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: primaryColor),
          ),
          subTitle != null
              ? MyText(
                  subTitle ?? "",
                  softWrap: false,
                  style: TextStyle(fontSize: 14.0),
                )
              : Container(),
        ],
      ),
    );
  }
}
