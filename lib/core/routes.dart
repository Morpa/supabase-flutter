import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth/auth.dart';
import '../memory/memory.dart';
import '../onboarding/onboarding.dart';

part 'routes.g.dart';

@riverpod
GoRouter route(RouteRef _) => _routes;

final _routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MemoryPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/verification',
      builder: (context, state) {
        final params = state.extra as VerificationPageParams?;

        if (params == null) {
          throw 'Missing `VerificationPageParams` object';
        }

        return VerificationPage(params: params);
      },
    ),
  ],
);
