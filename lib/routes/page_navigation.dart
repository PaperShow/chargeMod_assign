import 'package:flutter/material.dart';

Route pageRoute(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destination,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

moveTo(BuildContext context, Widget widget) {
  Navigator.of(context).push(pageRoute(widget));
}

moveReplacement(BuildContext context, Widget widget) {
  Navigator.of(context).pushReplacement(pageRoute(widget));
}

moveRemoveUntil(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(pageRoute(widget), (route) => false);
}

moveBack(BuildContext context) {
  Navigator.of(context).pop();
}
