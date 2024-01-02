import 'package:flutter/material.dart';
import 'package:medicalista/core/constant/color.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({
    super.key,
    required this.name,
    required this.detail,
  });

  final String name;
  final String detail;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '$name: ',
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.grey),
          ),
          Text(
            overflow: TextOverflow.clip,
            detail,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
