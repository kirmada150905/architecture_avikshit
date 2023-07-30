import 'package:architecture_avikshit/features/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/homepage/home_screen.dart';
import '../features/lastpage/last_screen.dart';
import '../features/listPage/presentation/UI/list_screen.dart';

import '../features/login screen/loginscreen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: "/login",
      name: "login",
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: "/home",
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: "listScreen",
          name: 'list',
          builder: (context, state) => const ListScreen(),
          routes: [
            GoRoute(
                path: 'lastScreen',
                name: "last",
                builder: (context, state) {
                  return const LastScreen();
                }),
          ],
        ),
      ],
    )
  ],
);
