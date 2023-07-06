import 'dart:convert';
import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfoody/src/constants/constants.dart';
import 'package:myfoody/src/features/setting/presentation/setting_controller.dart';
import 'package:myfoody/src/routes/app_routes.dart';
import 'package:myfoody/src/services/services.dart';
import 'package:myfoody/src/services/storage/storage_helper.dart';
import 'package:myfoody/src/shared/shared.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  await hiveInit();
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  final notificationHelper = container.read(notificationProvider);
  final BackgroundService service = BackgroundService();
  service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

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
    final isDarkTheme = ref.watch(settingControllerProvider);
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
            themeMode: isDarkTheme.theme ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
