import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomRouteManager {
  static void setupRoutes(Map<String, Widget> routes, RouteManager r, {Map<String, List<RouteGuard>>? guards}) {
    routes.forEach((path, widget) {
      r.child(
        path,
        child: (context) => widget,
        transition: path == '/' ? TransitionType.fadeIn : TransitionType.rightToLeftWithFade,
        duration: const Duration(milliseconds: 300),
        guards: guards?[path] ?? [], // Aplica guards se existirem
      );
    });
  }

  static void setupModules(Map<String, Module> modules, RouteManager r) {
    modules.forEach((path, module) {
      r.module(
        path,
        module: module,
        transition: TransitionType.rightToLeft,
        duration: const Duration(milliseconds: 300),
      );
    });
  }
}
