// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$homeNavigationRoute];

RouteBase get $homeNavigationRoute => ShellRouteData.$route(
  factory: $HomeNavigationRouteExtension._fromState,
  routes: [
    GoRouteData.$route(path: '/new', factory: _$CreateIssueRoute._fromState),
    GoRouteData.$route(
      path: '/issues',

      factory: _$IssuesRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: ':id',

          parentNavigatorKey: IssueRoute.$parentNavigatorKey,

          factory: _$IssueRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $HomeNavigationRouteExtension on HomeNavigationRoute {
  static HomeNavigationRoute _fromState(GoRouterState state) =>
      HomeNavigationRoute();
}

mixin _$CreateIssueRoute on GoRouteData {
  static CreateIssueRoute _fromState(GoRouterState state) => CreateIssueRoute();

  @override
  String get location => GoRouteData.$location('/new');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$IssuesRoute on GoRouteData {
  static IssuesRoute _fromState(GoRouterState state) => IssuesRoute();

  @override
  String get location => GoRouteData.$location('/issues');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$IssueRoute on GoRouteData {
  static IssueRoute _fromState(GoRouterState state) =>
      IssueRoute(int.parse(state.pathParameters['id']!)!);

  IssueRoute get _self => this as IssueRoute;

  @override
  String get location => GoRouteData.$location(
    '/issues/${Uri.encodeComponent(_self.id.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
