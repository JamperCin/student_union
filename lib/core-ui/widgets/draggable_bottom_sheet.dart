import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class DraggableBottomSheetWidget {
  void show({
    required BuildContext context,
    List<Widget>? children,
    double? initialChildSize,
    double? minChildSize,
    double? maxChildSize,
    bool? expand,
    String? backgroundImageAsset,
  }) {
    // Implementation to show the draggable bottom sheet
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Required for the sheet to use DraggableScrollableSheet
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize:
              initialChildSize ?? 0.35, // Initial height as 35% of screen
          minChildSize: minChildSize ?? 0.1, // Minimum height as 10% of screen
          maxChildSize: maxChildSize ?? 0.75, // Maximum height as 75% of screen
          expand:
              expand ??
              false, // Set to false to prevent the sheet from taking the full screen initially
          builder: (BuildContext context, ScrollController scrollController) {
            return ContainerWidget(
              backgroundImage: backgroundImageAsset,
              borderColor: Colors.transparent,
              padding: EdgeInsets.symmetric(
                horizontal: 16.dp(),
                vertical: 16.dp(),
              ),
              child: Column(
                children: [
                  Center(
                    child: DividerWidget(width: 70.dp(), height: 1.dp()),
                  ),
                  Gap(10.dp()),
                  Expanded(
                    child: ListView.builder(
                      controller:
                          scrollController, // Important: pass the controller to the scrollable content
                      itemCount: children?.length ?? 0,
                      itemBuilder: (context, index) {
                        return children?[index] ?? Container();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
