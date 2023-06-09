// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

import 'package:flutter/material.dart';

enum InputFormType {
  normal,
  search,
}

class InputFormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final InputFormType type;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLines;
  final String? Function(String?)? validator;
  const InputFormWidget(
      {super.key,
      this.controller,
      required this.hintText,
      this.onChanged,
      this.onTap,
      this.validator,
      this.maxLines})
      : type = InputFormType.normal,
        prefixIcon = null,
        suffixIcon = null;

  const InputFormWidget.search(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.onChanged,
      this.onTap,
      this.suffixIcon,
      this.validator,
      this.prefixIcon})
      : type = InputFormType.search,
        maxLines = 1;

  bool get isSearch => type == InputFormType.search;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      showCursor: true,
      maxLines: maxLines,
      cursorColor: Theme.of(context).iconTheme.color,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        isCollapsed: false,
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: isSearch
            ? Icon(
                prefixIcon,
                color: Colors.grey[500]!,
              )
            : null,
        // suffix: controller!.text.isNotEmpty
        //     ? GestureDetector(
        //         onTap: () {
        //           controller!.clear();
        //         },
        //         child: Icon(
        //           suffixIcon,
        //           color: AppColors.red,
        //         ),
        //       )
        //     : const SizedBox.shrink(),
      ),
      onChanged: onChanged,
    );
  }
}
