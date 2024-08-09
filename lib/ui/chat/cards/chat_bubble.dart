import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  String? text;
  String? time;

  ChatBubble({this.text, this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  text ?? "",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5.0),
                Text(
                  time ?? "",
                  style: TextStyle(color: Colors.white70, fontSize: 10.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
