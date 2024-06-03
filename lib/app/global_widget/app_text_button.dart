import 'package:flutter/material.dart';

import '../core/app_sizes.dart';

class AppTextButton extends StatefulWidget {
  const AppTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor,
    this.textSize,
    this.textDecoration,
    this.fontWeight,
  });
  final String text;
  final Color? textColor;
  final double? textSize;
  final Function onTap;
  final TextDecoration? textDecoration;
  final FontWeight? fontWeight;

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  Color color = Colors.black87;
  double size = 14;

  @override
  void initState() {
    color = widget.textColor ?? Colors.black87;
    size = widget.textSize ?? 14;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Text(
        widget.text,
        style: TextStyle(
          color: color,
          fontWeight: widget.fontWeight ?? FontWeight.bold,
          decoration: widget.textDecoration ?? TextDecoration.underline,
          decorationColor: color.withOpacity(0.6),
          fontSize: getWidth(size),
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      color = color.withOpacity(0.6);
      // size = size + 2;
    });
  }

  void _onTapUp(TapUpDetails details) {
    Future.delayed(const Duration(milliseconds: 150)).then((value) {
      setState(() {
        color = widget.textColor ?? Colors.black87;
        // size = widget.textSize ?? 14;
      });
    });
  }
}
