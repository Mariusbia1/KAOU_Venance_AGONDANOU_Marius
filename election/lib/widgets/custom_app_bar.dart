import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  CustomAppBar({
  required this.title,
    this.actions, });
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Row(
        children: [
        Text(title), SizedBox(width: 8), Image.asset(
    'assets/images/benin_flag.png', width: 24, height: 24,
          ), Image.asset(
            'assets/images/benin_flag.png', width: 24, height: 24, ),
        ], ), actions: actions, );
  }
}
