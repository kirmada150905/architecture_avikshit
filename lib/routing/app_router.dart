import 'package:go_router/go_router.dart';

import '../features/homepage/home_screen.dart';
import '../features/lastpage/last_screen.dart';
import '../features/listPage/model/detail_model.dart';
import '../features/listPage/presentation/UI/list_screen.dart';

import '../features/login screen/loginscreen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/home/:name/:url",
      name: 'home',
      builder: (context, state) => HomeScreen(
        name: state.pathParameters['name'],
        imageUrl: state.pathParameters['url'],
      ),
      routes: [
        GoRoute(
          path: "listScreen",
          builder: (context, state) => const ListScreen(),
          routes: [
            GoRoute(
                path: 'last',
                name: "dashboard",
                builder: (context, state) {
                  DetailModel args = state.extra as DetailModel;
                  return LastScreen(detailModel: args);
                }),
            // GoRoute(
            //   path: "lastScreen",
            //   builder: (context, state) => ListScreen(),
            // ),
          ],
        ),
      ],
    )
  ],
);
