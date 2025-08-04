import 'package:calc_example_frontend/screens/screens.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../pages/slide_from_right_page.dart';
import '../transitions/transitions.dart';

part 'home/home_route.dart';
part 'home/routes/create_issue/create_issue_route.dart';
part 'home/routes/issues/issues_route.dart';
part 'home/routes/issues/routes/issue_route.dart';
part 'routes.g.dart';

final rootNavigationKey = GlobalKey<NavigatorState>();
