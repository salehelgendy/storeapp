import 'package:flutter/material.dart';

class CustomTextBottom extends StatelessWidget {
  final String textbottom;
  final VoidCallback? onTap;

  // باني واحد يكفي هنا
  const CustomTextBottom({
    super.key,
    required this.textbottom,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blueGrey,
        ),
        child: Center(
          child: Text(
            textbottom,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
