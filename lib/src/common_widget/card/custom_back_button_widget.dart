import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      radius: 24.0,
      child: IconButton(
        splashRadius: 4.0,
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.arrow_back),
        color: Theme.of(context).primaryIconTheme.color,
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}
