import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';

class EditButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const EditButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<EditButton> createState() => _EditPriceButtonState();
}

class _EditPriceButtonState extends State<EditButton> {
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(
      const Duration(milliseconds: 120),
      (_) => widget.onPressed(),
    );
  }

  void stopTimer() {
    timer?.cancel();
    timer = null;
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,

      onLongPressStart: (_) {
        startTimer();
      },

      onLongPressEnd: (_) {
        stopTimer();
      },

      child: Container(
        width: 28.44,
        height: 28.44,
        decoration: BoxDecoration(
          color: darkYellow,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(
          widget.icon,
          color: darkGreen,
        ),
      ),
    );
  }
}