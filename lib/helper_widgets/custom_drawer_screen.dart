import 'package:flutter/material.dart';

class CustomDrawerScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;

  CustomDrawerScreen({required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Icon(icon),
      title: Text(title),
      onTap: onTap,

    );
  }
}
