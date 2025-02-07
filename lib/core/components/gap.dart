import 'package:flutter/material.dart';

class GapHeight extends StatelessWidget {
  const GapHeight(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class GapWidth extends StatelessWidget {
  const GapWidth(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
