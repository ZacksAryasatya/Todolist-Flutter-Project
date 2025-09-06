import 'package:flutter/material.dart';

class Frame4Button extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final double elevation;
  final Color color;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const Frame4Button({
    super.key,
    this.text = "",
    this.width = 296,
    this.height = 50,
    this.elevation = 4,
    this.color = const Color(0xFF42B6E7),
    required this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: 
              const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
