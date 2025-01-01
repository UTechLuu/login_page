import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    this.height = 48.0,
    this.color = Colors.red,
    this.borderColor = Colors.red,
    required this.text,
    this.textColor = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0),
  });

  const AppElevatedButton.outline({
    super.key,
    this.onPressed,
    this.height = 48.0,
    this.color = Colors.white,
    this.borderColor = Colors.orange,
    required this.text,
    this.textColor = Colors.red,
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0),
  });

  final Function()? onPressed;
  final double height;
  final Color color;
  final Color borderColor;
  final String text;
  final Color textColor;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        height: height,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor, width: 1.2),
          borderRadius: borderRadius,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 3.0),
              blurRadius: 6.0,
            )
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: 16.8, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
