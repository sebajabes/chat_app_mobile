import 'package:flutter/material.dart';

import '../core.dart';

enum ButtonStyle { filled, outlined }

class CustomButton extends StatelessWidget {
  const CustomButton.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.filled,
    this.color = AppColors.button,
    this.textColor = AppColors.blue,
    this.width = double.infinity,
    this.height = 50,
    this.borderRadius = 16,
    this.icon,
    this.disabled = false,
    this.fontSize = 16,
  });

  const CustomButton.outlined({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.outlined,
    this.color = AppColors.button,
    this.textColor = AppColors.blue,
    this.width = double.infinity,
    this.height = 50,
    this.borderRadius = 16,
    this.icon,
    this.disabled = false,
    this.fontSize = 16,
  });

  final Function() onPressed;
  final String label;
  final ButtonStyle style;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final Widget? icon;
  final bool disabled;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: style == ButtonStyle.filled
            ? ElevatedButton(
                onPressed: disabled ? null : onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon ?? const SizedBox.shrink(),
                    icon != null ? const GapWidth(10) : const SizedBox.shrink(),
                    CustomText(
                      text: label,
                      fontSize: fontSize,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ))
            : OutlinedButton(
                onPressed: disabled ? null : onPressed,
                style: OutlinedButton.styleFrom(
                  backgroundColor: color,
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon ?? const SizedBox.shrink(),
                    CustomText(
                      text: label,
                      fontSize: fontSize,
                      color: textColor,
                    )
                  ],
                )));
  }
}
