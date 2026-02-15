//custom text field widget
import 'package:flutter/material.dart';
import 'package:tanzim/core/manager/color_manager.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final Color focusColor;
  final Color color;
  final int? maxLine;
  final bool? readOnly;
  final bool? showCursor;
  final void Function()? onTap;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.color,
    required this.focusColor,
    this.maxLine,
    this.readOnly,
    this.onTap,
    this.showCursor,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      showCursor: showCursor,
      maxLines: maxLine ?? 1,
      cursorColor: focusColor,
      readOnly: readOnly ?? false,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: label,
        labelStyle: TextStyle(color: ColorManager.darkGrey.withOpacity(0.7)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: color)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: focusColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: ColorManager.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: ColorManager.red),
        ),
      ),
    );
  }
}
