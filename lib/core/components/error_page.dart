import 'package:flutter/material.dart';

import 'custom_text.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: CustomText(text: '404 NOT FOUND \nERROR PAGE'),
        // child: badge.Badge()
      ),
    );
  }
}
