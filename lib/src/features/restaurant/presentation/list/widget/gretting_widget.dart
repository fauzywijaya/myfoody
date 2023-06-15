import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myfoody/src/constants/constants.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int hour = DateTime.now().hour;

    return FadeInUp(
      from: 20.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 22.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (hour >= 0 && hour < 12)
                  ? 'Selamat Pagi  🧇'
                  : (hour >= 12 && hour < 15)
                      ? 'Selamat Siang  🍨'
                      : (hour >= 15 && hour < 18)
                          ? 'Selamat Sore  ☕'
                          : 'Selamat Malam  🍗',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Gap.h12,
            Text(
              'Telusuri Restoran Favoritmu',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
