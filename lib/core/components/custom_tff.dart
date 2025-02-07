import 'package:flutter/material.dart';

import '../core.dart';

class CustomTFF extends StatelessWidget {
  const CustomTFF({
    super.key,
    this.hPadding = 20.0,
    this.onTap,
    this.controller,
    this.hintText = 'Search',
    this.prefixIcon = const Icon(Icons.search),
    this.suffixIcon,
    this.isEnable = true,
    this.onTapSuffixIcon,
    this.validator,
  });

  final double hPadding;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool isEnable;
  final VoidCallback? onTapSuffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      child: InkWell(
        onTap: onTap,
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: AppColors.white,
            suffixIcon: suffixIcon != null
                ? InkWell(
                    onTap: onTapSuffixIcon,
                    child: suffixIcon,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.blue),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.dangerColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: AppColors.blue.withValues(alpha: .5)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.dangerColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: AppColors.blue.withValues(alpha: .5)),
            ),
          ),
        ),
      ),
    );
  }
}
