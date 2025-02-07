import '../core.dart';
import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({
    super.key,
    this.content,
    this.isLoading,
    this.icon,
  });

  final String? content;
  final bool? isLoading;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: isLoading != null && isLoading == true
              ? [
                  CustomText(text: 'Authenticating ...'),
                  GapHeight(20),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  )
                ]
              : [
                  Icon(
                    icon ?? Icons.receipt,
                    size: 80,
                  ),
                  GapHeight(20),
                  CustomText(
                    text: content ?? 'No data available',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ],
        ),
      ),
    );
  }
}
