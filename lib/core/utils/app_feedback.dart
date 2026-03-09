import 'package:flutter/material.dart';
import 'package:student_union/core/app/app_routes.dart';

class AppFeedback {
  static void error(String message, {BuildContext? context}) {
    _show(
      message,
      context: context,
      backgroundColor: Colors.red.shade700,
      icon: Icons.error_outline,
    );
  }

  static void success(String message, {BuildContext? context}) {
    _show(
      message,
      context: context,
      backgroundColor: const Color(0xFF1C6F15),
      icon: Icons.check_circle_outline,
    );
  }

  static void info(String message, {BuildContext? context}) {
    _show(
      message,
      context: context,
      backgroundColor: Colors.blue.shade700,
      icon: Icons.info_outline,
    );
  }

  static void _show(
    String message, {
    BuildContext? context,
    required Color backgroundColor,
    required IconData icon,
  }) {
    final ctx = context ?? AppRouter.rootNavigatorKey.currentContext;
    if (ctx == null) {
      debugPrint(message);
      return;
    }

    final messenger = ScaffoldMessenger.maybeOf(ctx);
    if (messenger == null) {
      debugPrint(message);
      return;
    }

    messenger
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: backgroundColor,
          duration: const Duration(seconds: 3),
          content: Row(
            children: [
              Icon(icon, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
