import 'package:flutter/cupertino.dart';

class SlideRightRoute extends PageRouteBuilder<void> {
  final Widget nextScreen;

  SlideRightRoute({required this.nextScreen})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
    },
  );
}

class FadeRoute extends PageRouteBuilder<void> {
  final Widget nextScreen;

  FadeRoute({required this.nextScreen})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
        child: child,
      );
    },
  );
}