import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int? maxLine;
  final String? label;
  final String? Function(String? text)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLine,
    this.label,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label ?? '',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
        TextFormField(
          maxLines: maxLine ?? 1,
          controller: controller,
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white),
            filled: true,
            fillColor: const Color(0xff2b2f3b),
            // Dark grey to blend with black background
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Colors.transparent)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.w,
            ),
          ),
          autovalidateMode: AutovalidateMode.disabled,
          validator: validator,
        ),
      ],
    );
  }
}
