import 'package:flutter/material.dart';
import 'package:medicalista/core/constant/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.name, required this.func});
  final String name;
  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColor.kPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}
