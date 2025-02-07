import 'package:flutter/material.dart';

import '../core.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.title = 'E-Rubrik',
    this.leading,
    this.action,
  });

  final String? title;
  final Widget? leading;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          color: AppColors.blue,
        ),
        child: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          leading: leading,
          title: CustomText(
            text: title!,
            color: AppColors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          actions: [
            // ActionIcon(),
            SizedBox(width: 20),
            ...action ?? [],
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class ActionIcon extends StatelessWidget {
  const ActionIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            color: AppColors.blue,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {},
          color: AppColors.blue,
        ),
      ],
    );
  }
}
