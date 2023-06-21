import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myfoody/src/features/presentation.dart';
import 'package:myfoody/src/routes/routes.dart';

enum Routes {
  onboarding,
  splash,
  home,
  detail,
  search,
}

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      urlPathStrategy: UrlPathStrategy.path,
      initialLocation: '/',
      routerNeglect: true,
      routes: [
        GoRoute(
          path: '/',
          name: Routes.splash.name,
          pageBuilder: (context, state) =>
              _navigate(context, state, const SplashPage()),
        ),
        GoRoute(
          path: '/home',
          name: Routes.home.name,
          pageBuilder: (context, state) => _navigate(
            context,
            state,
            const HomePage(),
          ),
        ),

        GoRoute(
          path: '/search',
          name: Routes.search.name,
          pageBuilder: (context, state) => _navigate(
            context,
            state,
            const RestaurantSearchPage(),
          ),
        )
        //
      ],
      errorBuilder: (context, state) => ErrorPage(
        error: state.error,
      ),
    );
  },
);

Page<void> _navigate(BuildContext context, GoRouterState state, Widget screen) {
  return MaterialPage<void>(
    key: state.pageKey,
    restorationId: state.pageKey.value,
    child: screen,
  );
}
