import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final IconData? icon;
  final bool outlined;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.icon,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBackgroundColor = outlined 
        ? Colors.transparent 
        : (backgroundColor ?? const Color(0xFFE53E3E));
    final defaultTextColor = outlined 
        ? (textColor ?? const Color(0xFFE53E3E))
        : (textColor ?? Colors.white);

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: defaultBackgroundColor,
          foregroundColor: defaultTextColor,
          elevation: outlined ? 0 : 2,
          shadowColor: outlined ? Colors.transparent : Colors.black.withOpacity(0.1),
          side: outlined 
              ? BorderSide(
                  color: textColor ?? const Color(0xFFE53E3E),
                  width: 2,
                )
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.h,
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 20.w,
                height: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    outlined ? const Color(0xFFE53E3E) : Colors.white,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      size: 20.w,
                      color: defaultTextColor,
                    ),
                    SizedBox(width: 8.w),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: defaultTextColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}