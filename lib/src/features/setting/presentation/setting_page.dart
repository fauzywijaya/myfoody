import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/features/setting/presentation/setting_controller.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(settingControllerProvider);
    return ScaffoldWidget(
      appBar: [
        Text("Settings", style: Theme.of(context).appBarTheme.toolbarTextStyle),
      ],
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w24),
        children: [
          Consumer(builder: (context, ref, child) {
            return Material(
              color: Colors.transparent,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("Dark Theme",
                    style: Theme.of(context).textTheme.titleMedium),
                trailing: Switch.adaptive(
                    value: themeModeState.theme, //false or true
                    onChanged: (value) {
                      ref
                          .read(settingControllerProvider.notifier)
                          .setTheme(value);
                    },
                    inactiveThumbColor: Theme.of(context).colorScheme.primary,
                    activeColor: Theme.of(context).colorScheme.secondary),
              ),
            );
          }),
          const Divider(),
          Material(
            color: Colors.transparent,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("Daily Restaurants",
                  style: Theme.of(context).textTheme.titleMedium),
              trailing: Switch.adaptive(
                  value: true,
                  onChanged: (value) {},
                  inactiveThumbColor: Theme.of(context).colorScheme.primary,
                  activeColor: Theme.of(context).colorScheme.secondary),
            ),
          ),
          const Divider(),
          Material(
            color: Colors.transparent,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text(
                    "Language",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 0,
                      child: Text(
                        'ID',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text(
                        'EN',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                  icon: const Icon(Icons.chevron_right_rounded),
                  isDense: true,
                  isExpanded: true,
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
