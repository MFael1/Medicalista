import 'package:flutter/material.dart';
import 'package:medicalista/core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final VoidCallback onPressed;
  const CustomButtonLang({
    super.key,
    required this.textbutton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.kPrimaryColor,
        child: Text(
          textbutton,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
