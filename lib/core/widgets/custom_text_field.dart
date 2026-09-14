import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.prefix,
    this.hintText,
    this.textInputType,
    this.height = 50,
    this.width,
    this.suffix,
    this.color,
    this.controller,
    this.borderRadius,
    this.onSubmitted,
    this.onTap,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.hintColor,
    this.filledColor,
    this.hintTextSize,
    this.fontSize,
    this.border,
    this.maxLines,
    this.textColor,
    this.focusNode,
    this.label,
    this.labelColor,
    this.borderColor,
    this.isPassword = false,
    this.inputFormatters,
    this.onEditingComplete,
  });

  final double? height;
  final double? width;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? textInputType;
  final String? hintText;
  final Color? color;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final Function(String value)? onChanged;
  final double? borderRadius;
  final bool obscureText;
  final dynamic validator;
  final Color? hintColor;
  final Color? textColor;
  final Color? filledColor;
  final Color? borderColor;
  final double? hintTextSize;
  final double? fontSize;
  final InputBorder? border;
  final int? maxLines;
  final FocusNode? focusNode;
  final String? label;
  final Color? labelColor;
  final bool? isPassword;
  final void Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        onTap: widget.onTap,
        onChanged: (value) => widget.onChanged?.call(value),
        validator: widget.validator,
        onFieldSubmitted: widget.onSubmitted,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        onEditingComplete: widget.onEditingComplete,
        obscureText: widget.isPassword == true
            ? isPasswordVisible
            : widget.obscureText,
        maxLines: widget.maxLines ?? 1,
        focusNode: widget.focusNode,
        style: TextStyle(
          color: widget.textColor ?? nameColor,
          fontSize: widget.fontSize ?? 16.sp,
          // fontFamily: AppFontFamily.sfPro,
          // fontWeight: AppFontStyle.fontWeights.medium,
        ),
        decoration: InputDecoration(
          suffixIcon: widget.isPassword!
              ? Focus(
                  descendantsAreFocusable: false,
                  canRequestFocus: false,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: greyColorText,
                    ),
                  ),
                )
              : widget.suffix,
          prefixIcon: widget.prefix,
          filled: true,
          labelText: widget.label,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          isDense: true,
          prefixIconConstraints: BoxConstraints(
            minWidth: 44.w,
            minHeight: 44.h,
          ),
          fillColor: widget.filledColor ?? filledTextFiled,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 14.h,
          ),
          hintText: '${widget.hintText}',
          hintStyle: TextStyle(
            fontSize: widget.hintTextSize ?? 16.sp,
            color: widget.hintColor ?? orderHis,
            // fontFamily: AppFontFamily.sfPro,
            // fontWeight: AppFontStyle.fontWeights.medium,
          ),
          labelStyle: TextStyle(color: widget.labelColor),
          border: widget.border,
          enabledBorder:
              widget.border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.transparent,
                ),
              ),
          focusedBorder:
              widget.border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.transparent,
                ),
              ),
          errorStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.red,
            fontWeight: FontWeight.w600,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(width: 1.w, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(width: 1.w, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
