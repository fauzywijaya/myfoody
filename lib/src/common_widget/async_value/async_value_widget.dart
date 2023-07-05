import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfoody/src/common_widget/common_widget.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/exception/network_exceptions.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget(
      {Key? key,
      required this.value,
      required this.data,
      this.loading,
      this.error})
      : super(key: key);

  final AsyncValue<T> value;

  final Widget Function(T data) data;

  final Widget Function(Widget loadingWidget)? loading;

  final Widget Function(Widget errorWidget)? error;

  @override
  Widget build(BuildContext context) {
    return value.when(
        data: data,
        error: (e, stackTrace) {
          final message =
              NetworkExceptions.getErrorMessage(e as NetworkExceptions);
          final errorWidget = Center(
            child: Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.red),
              textAlign: TextAlign.center,
            ),
          );
          return error?.call(errorWidget) ?? errorWidget;
        },
        loading: () {
          const loadingWidget = Center(
            child: LottieWidget(assets: Resource.lottieLoading),
          );
          return loading?.call(loadingWidget) ?? loadingWidget;
        });
  }
}
