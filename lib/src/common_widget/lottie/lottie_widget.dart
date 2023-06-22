import 'package:flutter/material.dart';
import 'package:myfoody/src/shared/shared.dart';
import 'package:lottie/lottie.dart';
import 'package:myfoody/src/constants/constants.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({
    Key? key,
    required this.assets,
    this.description,
  }) : super(key: key);

  final String assets;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.6,
      child: Center(
        child: description != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    assets,
                    width: context.screenWidth * 0.7,
                    fit: BoxFit.fitWidth,
                  ),
                  Gap.h16,
                  Text(
                    description!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              )
            : Lottie.asset(
                assets,
                width: context.screenWidth * 0.7,
                fit: BoxFit.fitWidth,
              ),
      ),
    );
  }
}
