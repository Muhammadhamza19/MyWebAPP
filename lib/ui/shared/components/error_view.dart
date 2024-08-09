import 'package:local_grocery/ui/shared/widgets/my_button.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef Refresh = Function();

class ErrorView extends StatelessWidget {
  final String _errorMsg;
  final Refresh? refreshFunction;

  const ErrorView(
    this._errorMsg, {
    this.refreshFunction,
  });

  IconData get _iconData {
    return FontAwesomeIcons.exclamation;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              _iconData,
              color: Colors.grey[400],
              size: 48.0,
            ),
            const SizedBox(height: 4.0),
            MyText(
              _errorMsg,
            ),
            const SizedBox(height: 16.0),
            refreshFunction != null ? MyButton(text: "Refresh") : Container(),
          ],
        ),
      ),
    );
  }
}
