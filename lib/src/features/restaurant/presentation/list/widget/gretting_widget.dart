import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.all(24.0),
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
            const SizedBox(height: 14.0),
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
