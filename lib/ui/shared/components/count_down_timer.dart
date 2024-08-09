import 'dart:async';
import 'package:flutter/material.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';

class CountDownTimer extends StatefulWidget {
  final DateTime endTime;
  final VoidCallback? onFinish;
  final TextStyle? applythemeColor;

  const CountDownTimer({
    Key? key,
    required this.endTime,
    this.onFinish,
    this.applythemeColor,
  }) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountDownTimer> {
  late Duration _remainingTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.endTime.difference(
      DateTime.now(),
    );
    // Update the remaining time every second
    _timer = Timer.periodic(
      Duration(seconds: 1),
      _updateRemainingTime,
    );
  }

  void _updateRemainingTime(Timer timer) {
    setState(() {
      _remainingTime = widget.endTime.difference(DateTime.now());
      if (_remainingTime.isNegative) {
        // Stop the timer when time is up
        timer.cancel();
        if (widget.onFinish != null) {
          widget.onFinish!();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = _formatDuration(_remainingTime);
    return Center(
      child: MyText(
        formattedTime,
        style: widget.applythemeColor ??
            Theme.of(context).textTheme.titleMedium?.copyWith(
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  offset: Offset(2, 2), // Shadow offset
                  blurRadius: 5, // Shadow blur radius
                ),
              ],
            ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    // Check if the remaining time is negative
    if (duration.isNegative) {
      return ''; // Return an empty string when the time is negative
    }

    // Format the remaining time as HH:mm:ss
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
}
