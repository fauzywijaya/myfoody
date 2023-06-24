import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/features/presentation.dart';

class ResultTextWidget extends StatelessWidget {
  const ResultTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final result = ref.watch(restaurantSearchControllerProvider);
        final query = result.query;
        if (query!.isNotEmpty) {
          return Text(
            'Results for "$query"',
            style: Theme.of(context).textTheme.titleMedium,
          );
        }
        return Container();
      },
    );
  }
}
