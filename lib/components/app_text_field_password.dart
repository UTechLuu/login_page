import 'package:flutter/material.dart';

class AppTextFieldPassword extends StatefulWidget {
  const AppTextFieldPassword({
    super.key,
    this.controller,
    this.prefixIcon,
    this.hintText,
    this.borderRadius = const BorderRadius.all(Radius.circular(16.8)),
    this.textInputAction,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final Icon? prefixIcon;
  final String? hintText;
  final BorderRadius borderRadius;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  @override
  State<AppTextFieldPassword> createState() => _AppTextFieldPasswordState();
}

class _AppTextFieldPasswordState extends State<AppTextFieldPassword> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8.6, right: 0.2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.orange, width: 1.2),
        borderRadius: widget.borderRadius,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 3.0),
            blurRadius: 6.0,
          )
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        textAlignVertical: const TextAlignVertical(y: 0.0),
        obscureText: !showPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: widget.prefixIcon,
          prefixIconConstraints: const BoxConstraints(minWidth: 32.0),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: GestureDetector(
            onTap: () => setState(() => showPassword = !showPassword),
            child: showPassword
                ? Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey.withOpacity(0.8),
                  )
                : const Icon(Icons.remove_red_eye_outlined,
                    color: Colors.green),
          ),
        ),
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
