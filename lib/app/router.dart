import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/home_screen.dart';
import '../features/billing/billing_screen.dart';
import '../features/sizing/sizing_screen.dart';

CustomTransitionPage _fadeSlide(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final fade = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );
      final slide = Tween<Offset>(
        begin: const Offset(0.02, 0.03),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));

      return FadeTransition(
        opacity: fade,
        child: SlideTransition(position: slide, child: child),
      );
    },
  );
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => _fadeSlide(const HomeScreen(), state),
    ),
    GoRoute(
      path: '/billing',
      pageBuilder: (context, state) => _fadeSlide(const BillingScreen(), state),
    ),
    GoRoute(
      path: '/sizing',
      pageBuilder: (context, state) => _fadeSlide(const SizingScreen(), state),
    ),
  ],
);
