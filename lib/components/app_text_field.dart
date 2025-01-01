import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.prefixIcon,
    this.hintText,
    this.borderRadius = const BorderRadius.all(Radius.circular(16.0)),
    this.textInputAction,
  });

  final TextEditingController? controller;
  final Icon? prefixIcon;
  final String? hintText;
  final BorderRadius? borderRadius;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.6),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.orange, width: 1.2),
          borderRadius: borderRadius,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 3.0),
              blurRadius: 6.0,
            )
          ]),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          prefixIconConstraints: const BoxConstraints(minWidth: 32.0),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        textInputAction: textInputAction,
      ),
    );
  }
}
