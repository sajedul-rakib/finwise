import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/app_colors.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    super.key,
    required this.hintText,
    this.labelText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.focusNode,
    this.onSaved,
    this.initialValue,
    this.maxLines = 1,
    this.maxLength,
    this.fillColor,
    this.textColor,
    this.hintColor,
    this.borderColor,
    this.borderRadius,
    this.contentPadding,
    this.border,
    this.inputFormatters,
    this.obscureText = false,
    this.errorBuilder,
  });

  final String hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function()? onFieldSubmitted;
  final Function()? onTapOutside;
  final FocusNode? focusNode;
  final ValueChanged<String>? onSaved;
  final String? initialValue;
  final int maxLines;
  final int? maxLength;
  final Color? fillColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final OutlineInputBorder? border;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final Widget Function(BuildContext, String?)? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: labelText == null ? 0 : 10,
      children: [
        if (labelText != null)
          Text(
            labelText!,
            style: TextStyle(
              color: AppColors.textGreenColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),

        TextFormField(
          errorBuilder: errorBuilder,
          style: TextStyle(
            color: textColor ?? AppColors.textGreenColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          maxLines: maxLines,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintColor ?? Color(0xff81A498),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            border:
                border ??
                OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(maxLines == 1 ? 50 : 20),
                ),
            filled: true,
            fillColor: fillColor ?? AppColors.lightGreen,
            contentPadding:
                contentPadding ??
                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: border,
            focusedErrorBorder: border,
            errorStyle: TextStyle(color: Color(0xffef4444)),
          ),
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}
