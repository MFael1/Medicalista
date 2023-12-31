import 'package:flutter/material.dart';
import 'package:medicalista/core/constant/color.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    this.obsecure = false,
    this.hint,
    this.onChanged,
    required this.validat,
    this.icon,
    required this.textEditingController,
    this.keyboard = "none",
  });
  final String? hint;
  final String? Function(String?)? validat;
  final Function(String)? onChanged;
  final bool obsecure;
  final Widget? icon;
  final TextEditingController textEditingController;
  final String keyboard;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard == 'phone'
          ? const TextInputType.numberWithOptions(decimal: true)
          : keyboard == 'email'
              ? TextInputType.emailAddress
              : TextInputType.text,
      controller: textEditingController,
      obscureText: obsecure,
      validator: validat,
      onChanged: onChanged,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
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
