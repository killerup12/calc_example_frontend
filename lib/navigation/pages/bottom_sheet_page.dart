import 'package:flutter/material.dart' show ModalBottomSheetRoute;
import 'package:flutter/widgets.dart';

class BottomSheetPage<T> extends Page<T> {
  const BottomSheetPage({required this.child, super.key});

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        settings: this,
        isScrollControlled: true,
        enableDrag: false,
        constraints: BoxConstraints(
          maxWidth: 512,
          maxHeight: MediaQuery.sizeOf(context).height * 0.9,
        ),
        elevation: 0,
        useSafeArea: true,
        builder: (context) => child,
      );
}
