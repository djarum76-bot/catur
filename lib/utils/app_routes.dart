import 'package:catur/features/chess/views/chess_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static const chess = '/chess';

  static Route<dynamic>? onGenerateRoutes(RouteSettings settings){
    switch(settings.name){
      case chess:
        return _pageRouteBuilder(page: const ChessScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          );
        });
    }
  }

  static PageRouteBuilder<dynamic> _pageRouteBuilder({required Widget page}){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return page;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }
    );
  }
}