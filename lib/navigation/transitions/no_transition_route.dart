import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'transitioned_route.dart';

abstract class NoTransitionRoute extends TransitionedRoute {
  Page<void> buildTransition(BuildContext context, GoRouterState state, Widget child) => NoTransitionPage(
        key: state.pageKey,
        name: state.name,
        child: child,
      );
}
