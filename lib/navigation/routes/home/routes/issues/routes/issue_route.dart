part of '../../../../routes.dart';

class IssueRoute extends DefaultTransitionRoute with _$IssueRoute {
  IssueRoute(this.id);

  final int id;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigationKey;

  @override
  Widget buildContent(BuildContext context, GoRouterState state) {
    return IssueScreen(issueId: id);
  }
}
