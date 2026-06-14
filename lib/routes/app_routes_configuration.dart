import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/ai_page.dart';
import '../pages/create_page.dart';

import '../pages/home_page.dart';
import '../pages/landing_page.dart';
import '../pages/login_page.dart';
import '../pages/profile_page.dart';
import '../pages/progress_page.dart';
import '../pages/registration_page.dart';
import 'app_routes_constants.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithFooter(navigationShell: navigationShell);
      },

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutesConstants.dashboardPage,
              path: '/dashboard',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutesConstants.aiPage,
              path: '/ai',
              builder: (context, state) => const AIPage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutesConstants.createPage,
              path: '/create',
              builder: (context, state) => const CreatePage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutesConstants.progressPage,
              path: '/progress',
              builder: (context, state) => const ProgressPage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutesConstants.profilePage,
              path: '/profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      name: AppRoutesConstants.landingPage,
      path: '/',
      builder: (context, state) => const LandingPage(),
    ),

    GoRoute(
      name: AppRoutesConstants.registerationPage,
      path: '/register',
      builder: (context, state) => RegistrationPage(),
    ),

    // GoRoute(
    //   name: AppRoutesConstants.dashboardPage,
    //   path: '/dashboard',
    //   builder: (context, state) => const HomePage(),
    // ),
    GoRoute(
      name: AppRoutesConstants.loginPage,
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);

class ScaffoldWithFooter extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithFooter({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.smart_toy_outlined),
            selectedIcon: Icon(Icons.smart_toy),
            label: 'AI',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_circle_outline),
            selectedIcon: Icon(Icons.add_circle),
            label: 'Create',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
