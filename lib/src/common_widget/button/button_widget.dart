import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myfoody/src/constants/constants.dart';

enum ButtonType {
  primary,
  outlined,
}

class ButtonWidget extends StatelessWidget {
  final ButtonType buttonType;
  final String text;
  final Function()? onTap;
  final bool isLoading;
  final Widget? prefix;
  final bool _isEnabled;

  const ButtonWidget({
    super.key,
    required this.buttonType,
    required this.text,
    this.onTap,
    this.isLoading = false,
    this.prefix,
    bool? isEnabled,
  }) : _isEnabled = isEnabled ?? onTap != null;

  const ButtonWidget.primary({
    super.key,
    this.onTap,
    this.isLoading = false,
    required this.text,
    this.prefix,
    bool? isEnabled,
  })  : buttonType = ButtonType.primary,
        _isEnabled = isEnabled ?? onTap != null;

  const ButtonWidget.outlined({
    super.key,
    this.onTap,
    this.isLoading = false,
    required this.text,
    this.prefix,
    bool? isEnabled,
  })  : buttonType = ButtonType.outlined,
        _isEnabled = isEnabled ?? onTap != null;

  Color getColor() => _isEnabled
      ? buttonType == ButtonType.primary
          ? AppColors.lightBlue
          : AppColors.black
      : AppColors.darkGrey;

  Color getFocusColor() =>
      buttonType == ButtonType.primary ? AppColors.blue : AppColors.darkGrey;

  bool get isPrimary => buttonType == ButtonType.primary;
  bool get isOutlined => buttonType == ButtonType.outlined;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: getColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: isOutlined
            ? const BorderSide(
                color: AppColors.white,
                width: 0.4,
              )
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: _isEnabled && !isLoading ? onTap : null,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: isOutlined
              ? const BorderSide(
                  color: AppColors.white,
                  width: 0.4,
                )
              : BorderSide.none,
        ),
        overlayColor: MaterialStateProperty.all(getFocusColor()),
        focusColor: getFocusColor(),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w28,
            vertical: AppSizes.h16,
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: AppSizes.customHeight(22),
                    width: AppSizes.customHeight(22),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (prefix != null) ...[
                        prefix!,
                        Gap.w8,
                      ],
                      Text(
                        text,
                        style: _isEnabled
                            ? Theme.of(context).textTheme.bodyLarge
                            : Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: AppColors.darkGrey,
                                ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
