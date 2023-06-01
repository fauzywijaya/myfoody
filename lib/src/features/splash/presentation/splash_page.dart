import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myfoody/gen/assets.gen.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 3))
        .then((_) => context.goNamed(Routes.home.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: AppSizes.customWidth(130),
              height: AppSizes.customHeight(150),
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                color: AppThemes.isDarkTheme(context)
                    ? AppColors.darkGrey
                    : AppColors.whiteShadow,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Assets.icons.restuarantsIcon.svg(
                  width: AppSizes.customWidth(90),
                  height: AppSizes.customHeight(90),
                ),
              ),
            ),
            Gap.h12,
            Text('MyFoody', style: Theme.of(context).textTheme.bodyLarge!),
          ],
        ),
      ),
    );
  }
}
