import 'package:flutter/material.dart';

void showErrorSnackbar(BuildContext context, String error,
    {String? buttonText, VoidCallback? onTap}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(error,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    )),
          ),
          if (buttonText != null)
            InkWell(
              onTap: onTap,
              child: Text(buttonText,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      )),
            )
        ],
      ),
      backgroundColor: Colors.red,
    ),
  );
}

void showSuccessSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
              )),
      backgroundColor: Colors.green,
    ),
  );
}

void showSuccessSnackbarWithAction(context, message, actionTitle, action) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
          TextButton(
            onPressed: action,
            child: Text(
              actionTitle,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green,
    ),
  );
}

void showDefaultSnackbar(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
      ),
    ),
  );
}
