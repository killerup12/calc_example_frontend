import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract class TransitionedRoute extends GoRouteData {
  Widget buildContent(BuildContext context, GoRouterState state);

  Page<void> buildTransition(BuildContext context, GoRouterState state, Widget child);

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildTransition(context, state, Builder(builder: (context) => buildContent(context, state)));
  }
}
