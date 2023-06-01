import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  void precacheAssets() async {
    final manifestJson = await rootBundle.loadString('AssetManifest.json');
    final rawAssets = json.decode(manifestJson) as Map<String, dynamic>;
    final imageAssets = rawAssets.keys
        .where((String key) => key.startsWith('assets/images'))
        .toList();
    final iconAssets = rawAssets.keys
        .where((String key) => key.startsWith('assets/icons'))
        .toList();

    List<String> assets = [];
    assets.addAll(imageAssets);
    assets.addAll(iconAssets);

    for (var asset in assets) {
      try {
        if (asset.contains(".png")) {
          // ignore: use_build_context_synchronously
          precacheImage(AssetImage(asset), context);
        } else if (asset.contains(".svg") &&
            asset != "assets/icons/resturants-icon.svg") {
          precachePicture(
              ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, asset),
              null);
        }
      } catch (e) {
        debugPrint("ERROR: $e");
        continue;
      }
    }
  }

  @override
  void didChangeDependencies() {
    precacheAssets();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = ref.watch(themeProvider);
    final router = ref.read(goRouterProvider);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            title: 'MyFlix',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: isDarkTheme ? ThemeMode.light : ThemeMode.dark,
          );
        },
      ),
    );
    // return GestureDetector(
    //   onTap: () {
    //     FocusManager.instance.primaryFocus?.unfocus();
    //   },
    //   child: ScreenUtilInit(
    //     designSize: Size(widthBase, heightBase),
    //     minTextAdapt: true,
    //     builder: (context, child) {
    //       return MaterialApp.router(
    //         title: 'My Foody',

    //         debugShowCheckedModeBanner: false,
    //         routerDelegate: router.routerDelegate,
    //         routeInformationParser: router.routeInformationParser,
    //         routeInformationProvider: router.routeInformationProvider,
    //         builder: (context, child) {
    //           // setupScreenUtil(context);
    //           return MediaQuery(
    //             data: MediaQuery.of(context).copyWith(
    //               textScaleFactor: 1.0,
    //             ),
    //             child: ScrollConfiguration(
    //               behavior: MyBehavior(),
    //               child: child!,
    //             ),
    //           );
    //         },
    //       );
    //     },
    //   ),
    // );
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
