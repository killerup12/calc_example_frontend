part of '../routes.dart';

@TypedShellRoute<HomeNavigationRoute>(
  routes: [
    TypedGoRoute<CreateIssueRoute>(path: '/new'),
    TypedGoRoute<IssuesRoute>(
      path: '/issues',
      routes: [TypedGoRoute<IssueRoute>(path: ':id')],
    ),
  ],
)
class HomeNavigationRoute extends ShellRouteData {
  HomeNavigationRoute();

  @override
  Page<void> pageBuilder(BuildContext context, GoRouterState state, Widget navigator) {
    final int selectedTab;

    if (state.uri.path == '/new') {
      selectedTab = 0;
    } else if (state.uri.path.startsWith('/issues')) {
      selectedTab = 1;
    } else {
      selectedTab = 0;
    }

    return SlideFromRightPage(
      child: HomeScreen(navigator: navigator, selectedTab: selectedTab),
    );
  }
}
