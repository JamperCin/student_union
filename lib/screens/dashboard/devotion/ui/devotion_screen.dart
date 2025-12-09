import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_impl.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/widgets/devotional_guide_widget.dart';
import 'package:student_union/core/enums/book_type.dart';

import '../controller/devotion_controller.dart';

// class DevotionsScreen extends BaseScreenWithTabs {
//   final _controller = Get.put(DevotionController());

//   @override
//   String appBarTitle() {
//     return "Devotionals";
//   }

//   @override
//   Color appBarBackgroundColor(BuildContext context) {
//     return colorScheme.primary;
//   }

//   @override
//   Color appBarIconColor(BuildContext context) {
//     return colorScheme.surface;
//   }

//   @override
//   TextStyle? appBarTitleStyle(BuildContext context) {
//     return super
//         .appBarTitleStyle(context)
//         ?.copyWith(
//           fontWeight: FontWeight.w700,
//           color: colorScheme.surface,
//           fontSize: 20.dp(),
//         );
//   }

//   @override
//   PreferredSizeWidget? appBarBottomWidget(BuildContext context) {
//     return PreferredSize(
//       preferredSize: Size.fromHeight(48.dp()),
//       child: Material(
//         color: colorScheme.surface,
//         child: super.appBarBottomWidget(context),
//       ),
//     );
//   }

//   @override
//   List<Widget> actions() {
//     return [
//       DropDownWidget(
//         initialItem: _controller.selectedYear.value,
//         list: _controller.list,
//         onItemSelected: (value) {
//           _controller.selectedYear.value = value;
//         },
//       ),
//     ];
//   }

//   @override
//   int initialIndex() {
//     return _controller.bookTypeFilter.value == BookType.availableBooks ? 0 : 1;
//   }

//   @override
//   List<Widget> tabs() {
//     return [
//       const Tab(text: "Available Books"),
//       const Tab(text: "Purchased Books"),
//     ];
//   }

//   @override
//   List<Widget> tabsViews() {
//     return [
//       Obx(
//         () => DevotionalGuideWidget.withAvailableBooks(
//           yearFilter: _controller.selectedYear.value,
//           onTap: _controller.onDevotionTap,
//           axis: Axis.vertical,
//         ),
//       ),
//       Obx(
//         () => DevotionalGuideWidget.withPurchasedBooks(
//           yearFilter: _controller.selectedYear.value,
//           onTap: _controller.onPurchasedBookOnClick,
//         ),
//       ),
//     ];
//   }
// }

class DevotionsScreen extends StatefulWidget implements BaseImpl {
  BaseObject model = BaseObject();
  DevotionsScreen({super.key});

  @override
  State<DevotionsScreen> createState() => _DevotionsScreenState();

  @override
  BaseObject getModel() {
    return model;
  }

  @override
  void setModel(BaseObject baseObject) {
    model = baseObject;
  }
}

class _DevotionsScreenState extends State<DevotionsScreen>
    with TickerProviderStateMixin {
  final _controller = Get.put(DevotionController());
  TabController? tabController;

  @override
  void initState() {
    _controller.checkForScreenUpdate();
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: _controller.bookTypeFilter.value == BookType.availableBooks
          ? 0
          : 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final appBarTheme = Theme.of(context).appBarTheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "Devotionals",
          style: appBarTheme.titleTextStyle?.copyWith(
            fontWeight: FontWeight.w700,
            color: colorScheme.tertiary,
            fontSize: 20.dp(),
          ),
        ),
        // backgroundColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.surface),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.dp()),
          child: Material(
            color: colorScheme.surface,
            child: TabBar(
              controller: tabController,
              tabs: [
                const Tab(text: "Available Books"),
                const Tab(text: "Purchased Books"),
              ],
              unselectedLabelStyle: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w200,
                color: colorScheme.primary,
                //fontSize: 16.dp(),
              ),
              labelStyle: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: colorScheme.primary,
                // fontSize: 16.dp(),
              ),
            ),
          ),
        ),
        actions: [
          DropDownWidget(
            initialItem: _controller.selectedYear.value,
            list: _controller.list,
            onItemSelected: (value) {
              _controller.selectedYear.value = value;
              debugPrint("Selected year: $value");
            },
          ),
        ],
      ),
      body: TabBarView(controller: tabController, children: tabsViews()),
    );
  }

  List<Widget> tabsViews() {
    return [
      Obx(
        () => DevotionalGuideWidget.withAvailableBooks(
          yearFilter: _controller.selectedYear.value,
          onTap: _controller.onDevotionTap,
          axis: Axis.vertical,
        ),
      ),
      Obx(
        () => DevotionalGuideWidget.withPurchasedBooks(
          yearFilter: _controller.selectedYear.value,
          onTap: _controller.onPurchasedBookOnClick,
        ),
      ),
    ];
  }
}
