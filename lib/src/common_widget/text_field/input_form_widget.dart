// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:myfoody/src/constants/constants.dart';

enum InputFormType {
  normal,
  search,
}

class InputFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final InputFormType type;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  const InputFormWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onTap,
  })  : type = InputFormType.normal,
        prefixIcon = null,
        suffixIcon = null;

  const InputFormWidget.search(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.onChanged,
      this.onTap,
      this.suffixIcon,
      this.prefixIcon})
      : type = InputFormType.search;

  bool get isSearch => type == InputFormType.search;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      showCursor: true,
      cursorColor: Theme.of(context).iconTheme.color,
      decoration: InputDecoration(
        hintText: hintText,
        isCollapsed: true,
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        contentPadding: const EdgeInsets.all(10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: isSearch
            ? Icon(
                prefixIcon,
                color: Colors.grey[500]!,
              )
            : null,
        suffixIcon: controller.text.isNotEmpty
            ? GestureDetector(
                onTap: () {
                  controller.clear();
                },
                child: Icon(
                  suffixIcon,
                  color: AppColors.red,
                ),
              )
            : null,
      ),
      onChanged: onChanged,
    );
  }
}
