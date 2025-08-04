part of '../../../routes.dart';

class IssuesRoute extends NoTransitionRoute with _$IssuesRoute {
  @override
  Widget buildContent(BuildContext context, GoRouterState state) {
    return const IssuesScreen();
  }
}
