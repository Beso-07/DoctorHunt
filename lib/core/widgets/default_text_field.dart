import 'package:doctorhunt/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextField extends StatefulWidget {
  DefaultTextField({
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

  double? height;
  double? width;
  Widget? prefix;
  Widget? suffix;
  TextInputType? textInputType;
  String? hintText;
  Color? color;
  TextEditingController? controller;
  Function(String)? onSubmitted;
  Function()? onTap;
  final Function(String value)? onChanged;
  double? borderRadius;
  bool obscureText;
  dynamic validator;
  Color? hintColor;
  Color? textColor;
  Color? filledColor;
  final Color? borderColor;
  double? hintTextSize;
  double? fontSize;
  InputBorder? border;
  int? maxLines;
  FocusNode? focusNode;
  String? label;
  Color? labelColor;
  bool? isPassword;
  void Function()? onEditingComplete;
  List<TextInputFormatter>? inputFormatters;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final double radius = widget.borderRadius ?? 10.r;

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
        obscureText: widget.isPassword!
            ? !isPasswordVisible
            : widget.obscureText,
        maxLines: widget.maxLines ?? 1,
        focusNode: widget.focusNode,
  
        cursorColor: primaryColor,
      
        style: TextStyle(
          color: widget.textColor ?? nameColor,
          fontSize: widget.fontSize ?? 16.sp,
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
                      color: widget.hintColor ?? orderHis,
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
          ),
          labelStyle: TextStyle(color: widget.labelColor),
          
          border: widget.border,
          
          enabledBorder: widget.border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: widget.borderColor ?? welcome,
                ),
              ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: primaryColor, 
              width: 1.5.w,        
            ),
          ),

          errorStyle: TextStyle(
            fontSize: 14.sp,
            color: redColor,
            fontWeight: FontWeight.w600,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(width: 1.w, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(width: 1.5.w, color: Colors.red),
          ),
        ),
      ),
    );
  }
}