part of '../../../routes.dart';

class CreateIssueRoute extends NoTransitionRoute with _$CreateIssueRoute {
  @override
  Widget buildContent(BuildContext context, GoRouterState state) {
    return const CreateIssueScreen();
  }
}
