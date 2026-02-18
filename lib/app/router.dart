import 'package:go_router/go_router.dart';

import '../features/home/home_screen.dart';
import '../features/billing/billing_screen.dart';
import '../features/sizing/sizing_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/billing',
      builder: (context, state) => const BillingScreen(),
    ),
    GoRoute(
      path: '/sizing',
      builder: (context, state) => const SizingScreen(),
    ),
  ],
);
