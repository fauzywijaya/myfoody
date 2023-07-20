import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myfoody/src/routes/routes.dart';

class AppBarListSection extends StatelessWidget {
  const AppBarListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "MyFoody",
          style: Theme.of(context).appBarTheme.toolbarTextStyle,
        ),
        CircleAvatar(
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.3),
          radius: 24,
          child: IconButton(
            splashRadius: 4.0,
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.search),
            color: Theme.of(context).primaryIconTheme.color,
            onPressed: () {
              context.goNamed(Routes.search.name);
            },
          ),
        ),
      ],
    );
  }
}
