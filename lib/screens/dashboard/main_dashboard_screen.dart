import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_union/screens/dashboard/dashboard_controller.dart';

class MainDashboardScreen extends BaseScreenStandard {
  final StatefulNavigationShell navigationShell;
  final _controller = Get.put(DashboardController());

  MainDashboardScreen({required this.navigationShell}) {
    _controller.initData();
  }

  @override
  bool safeArea() {
    return false;
  }

  @override
  Widget body(BuildContext context) {
    return navigationShell;
  }

  @override
  Widget bottomNavigationBar(BuildContext context) {
    return CardContainerWidget(
      color: colorScheme.onSecondary,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
        top: appDimen.dimen(8),
        right: appDimen.dimen(5),
        left: appDimen.dimen(5),
      ),
      margin: EdgeInsets.zero,
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List<Widget>.generate(
              _controller.bottomBarMenuList.length,
              (index) {
                final model = _controller.bottomBarMenuList[index].copyWith(
                  isSelected: index == navigationShell.currentIndex,
                );

                return BottomAppBarWidget(
                  activeColor: colorScheme.secondary,
                  inActiveColor: colorScheme.primary,
                  model: model,
                  style: textTheme.labelMedium?.copyWith(fontSize: 12.dp()),
                  onTap: () {
                    navigationShell.goBranch(index, initialLocation: true);
                    _controller.onBottomMenuOnClick(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
