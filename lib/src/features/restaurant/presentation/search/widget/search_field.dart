import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/features/presentation.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final controller =
            ref.read(restaurantSearchControllerProvider.notifier);
        return InputFormWidget.search(
          controller: controller.queryTextController,
          hintText: 'Kafe Kamara',
          prefixIcon: Icons.search_rounded,
          suffixIcon: Icons.close_rounded,
          onChanged: controller.onChanged,
        );
      },
    );
  }
}
