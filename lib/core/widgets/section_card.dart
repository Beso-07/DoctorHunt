import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final BorderRadius? borderRadius;
  final double? width;
  final double? padding;

  const SectionCard({
    super.key,
    required this.child,
    this.color,
    this.borderRadius,
    this.width,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(10.r),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(padding: EdgeInsets.all(padding ?? 16.h), child: child),
    );
  }
}
