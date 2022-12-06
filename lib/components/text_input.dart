import 'package:flutter/material.dart';

class TextInputBox extends StatelessWidget {
  const TextInputBox(
      {required this.textInputHint,
      required this.obscureText,
      required this.controller});

  final String textInputHint;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: textInputHint,
            ),
          ),
        ),
      ),
    );
  }
}
