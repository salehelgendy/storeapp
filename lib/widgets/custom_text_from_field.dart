import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labeltext;
  TextInputType? inputType;
  final Function(String) onChanged;
  CustomTextField({
    this.obscureText = false,
    required this.labeltext,
    required this.onChanged,
    this.inputType,
  });
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: obscureText!,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        label: Text(labeltext),
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Enter Your $labeltext',
        hintStyle: const TextStyle(color: Colors.white38),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
