import 'package:flutter/material.dart';

class CustomSectionListTile extends StatelessWidget {
  const CustomSectionListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onTap});

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.teal, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        tileColor: Colors.tealAccent,
        enabled: true,
        onTap: onTap,
      ),
    );
  }
}
