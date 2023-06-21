// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

import 'package:flutter/material.dart';

class InputFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  const InputFormWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

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
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey[500]!,
        ),
        suffixIcon: controller.text.isNotEmpty
            ? GestureDetector(
                onTap: () {
                  controller.clear();
                },
                child: Icon(
                  suffixIcon,
                  color: Colors.grey[500]!,
                ),
              )
            : null,
      ),
      onChanged: (query) {},
    );
  }
}