import 'package:go_router/go_router.dart';

import '../home_screen/presentation/homepage/home_screen.dart';
import '../home_screen/presentation/homepage/list_screen.dart';
import '../login screen/loginscreen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => LoginScreen(),
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
          builder: (context, state) => ListScreen(),
        ),
      ],
    )
  ],
);
