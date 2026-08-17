import 'package:flutter/material.dart';

class AppBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    double? height,
    Color? backgroundColor,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        height: height ?? screenHeight * 0.5,
        child: child,
      ),
    );
  }

  static Future<T?> showWithTitle<T>({
    required BuildContext context,
    required String title,
    required Widget child,
    double? height,
    Color? backgroundColor,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = false,
    EdgeInsetsGeometry? contentPadding,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        height: height ?? screenHeight * 0.5,
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                color: colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 12),
            Text(title, style: textTheme.titleMedium),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    contentPadding ??
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: child,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
