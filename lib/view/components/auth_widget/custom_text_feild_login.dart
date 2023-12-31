import 'package:flutter/material.dart';
import 'package:medicalista/core/constant/color.dart';

class CustomTextWidgetLogin extends StatelessWidget {
  const CustomTextWidgetLogin({
    super.key,
    this.obsecure = false,
    this.hint,
    this.onChanged,
    required this.validat,
    this.icon,
    required this.textEditingController,
  });
  final String? hint;
  final String? Function(String?)? validat;
  final Function(String)? onChanged;
  final bool obsecure;
  final Widget? icon;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obsecure,
      validator: validat,
      onChanged: onChanged,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: icon,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColor.kSeconderyColor))),
    );
  }
}
