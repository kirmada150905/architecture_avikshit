import 'package:go_router/go_router.dart';

import '../home_screen/presentation/homepage/home_screen.dart';
import '../home_screen/presentation/homepage/list_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: "listScreen",
          builder: (context, state) => ListScreen(),
        ),
      ],
    ),
  ],
);
