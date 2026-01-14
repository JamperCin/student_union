
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_web.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/enums/book_type.dart';
import 'package:student_union/core/enums/payment_type.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/screens/dashboard/devotion/ui/purchased_book_details_screen.dart';

import '../ui/buy_devotional_book_screen.dart';

class DevotionController extends BaseController {
  RxString selectedYear = "All".obs; //${DateTime.now().year}
  Rx<BookType> bookTypeFilter = BookType.availableBooks.obs;
  TabController? tabController;

  ///Generate list of years starting from current year
  // List<String> get list =>
  //     List<String>.generate(5 + 1, (index) => "${DateTime.now().year - index}");
  ///Generate list of years starting from current year downwards to 2024
  List<String> get list {
    int startYear = 2024;
    int currentYear = DateTime.now().year + 1;
    final data = List<String>.generate(
      currentYear - startYear + 1,
      (index) => "${currentYear - index}",
    );
    return ["All", ...data];
  }

  void onDevotionTap(DevotionalBookModel model) {
    navUtils.fireTarget(
      model.purchased
          ? PurchasedBookDetailsScreen()
          : BuyDevotionalBookScreen(),
      model: model,
    );
  }

  @override
  void onInit() {
    super.onInit();
    checkForScreenUpdate();
  }

  Future<void> checkForScreenUpdate() async {
    final event = currentEvent.value;
    debugPrint(
      "EVENT TRIGGERED MODEL $event bookType ---> ${bookTypeFilter.value}",
    );

    if (event is EventTrigger &&
        event.bookType != null &&
        event.model is DevotionalBookModel) {
      debugPrint("EVENT TRIGGERED ${event.bookType} ---> ${event.model}");
      //Change tab after a short delay to allow for screen to load
      await Future.delayed(const Duration(seconds: 1));
      bookTypeFilter.value = event.bookType!;
      tabController?.index = event.bookType == BookType.availableBooks ? 0 : 1;

      //If a model is passed, open the purchased book details screen
      await Future.delayed(const Duration(seconds: 1));
      navUtils.fireBack();
      navUtils.fireTarget(PurchasedBookDetailsScreen(), model: event.model);
      currentEvent.value = null; //Reset event after use
    } else {
      bookTypeFilter.value = BookType.availableBooks;
      tabController?.index = 0;
    }
  }

  void confirmPayment(BuildContext context, DevotionalBookModel model) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    BottomSheetWidget(
      context: context,
      height: appDimen.screenHeight * 0.4,
      child: ConfirmTransactionLayout(
        title: "Confirm Purchase",
        crossAxisAlignment: CrossAxisAlignment.center,
        cancelAssetColor: Theme.of(context).colorScheme.surface,
        buttonStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.surface,
        ),
        titleStyle: textTheme.titleMedium?.copyWith(color: colorScheme.primary),
        subTitle:
            "Kindly confirm the purchase of this devotional guide with the amount specified below",
        buttonTitle: "Proceed",
        onTap: () => _initiatePayment(context, model),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${model.currency} ${model.price.toDecimalPlaces()}",
                style: textTheme.displayLarge,
              ),
              Gap(5.dp()),
              Text("Amount", style: textTheme.labelMedium),
              Gap(20.dp()),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _initiatePayment(
    BuildContext context,
    DevotionalBookModel model,
  ) async {
    const LoaderWidget().showProgressIndicator(context: context);

    Map<String, dynamic> param = {
      "payment_type": PaymentType.devotion_year_purchase.name,
      "metadata": {
        "devotion_year_id": model.id,
        "note": "Devotional Book Purchase",
      },
    };

    final results = await paymentApiService.makePaymentOfBook(param);
    const LoaderWidget().hideProgress();
    navToPaymentScreen(results.authUrl, book: model);
  }

  void navToPaymentScreen(String url, {DevotionalBookModel? book}) {
    if (url.isEmpty) return;
    navUtils.fireTarget(
      BaseWebView(
        model: WebModel(
          url: url,
          onDoneOnclick: () {
            debugPrint("NAVIGATED BACK ---> $url");
            navUtils.fireTargetHome();
            if (url.isNotEmpty) {
              currentEvent.value = EventTrigger(
                bookType: BookType.purchasedBooks,
                screen: 'Devotional',
                model: book,
              );
            } else {
              currentEvent.value = null;
            }
          },
        ),
      ),
    );
  }

  void onPurchasedBookOnClick(DevotionalBookModel book) {
    navUtils.fireTarget(PurchasedBookDetailsScreen(), model: book);
  }

  void onTabChanged(int value) {
    if (value == 0) {
      bookTypeFilter.value = BookType.availableBooks;
    } else {
      bookTypeFilter.value = BookType.purchasedBooks;
    }
  }
}
