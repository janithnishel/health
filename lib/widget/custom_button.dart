import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget widget;
  final Color color;
  const CustomButton({super.key, required this.widget, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          border: Border.all(
            color: Color(0xff156778),
            width: 1,
          ),
        ),
        child: widget);
  }
}
