import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraint.maxHeight),
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: child,
          ),
        ),
      );
    });
  }
}
