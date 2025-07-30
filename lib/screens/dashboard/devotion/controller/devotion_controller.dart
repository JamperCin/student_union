import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/extensions/string_extension.dart';
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
  RxString selectedYear = "${DateTime.now().year}".obs;
  Rx<BookType> bookTypeFilter = BookType.availableBooks.obs;


  ///Generate list of years starting from current year
  List<String> get list =>
      List<String>.generate(5 + 1, (index) => "${DateTime.now().year - index}");

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
    final event = Get.arguments;
    if (event is EventTrigger && event.bookType != null) {
      await Future.delayed(const Duration(seconds: 1));
      bookTypeFilter.value = event.bookType!;
    }
    debugPrint("Called here ${event.screen} --- ${event.bookType}");
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
              Text(
                "Amount",
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.onInverseSurface,
                ),
              ),
              Gap(20.dp()),
              Text(" ${model.name}", style: textTheme.titleLarge),
              Gap(5.dp()),
              Text(
                "Book Details",
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.onInverseSurface,
                ),
              ),
              Gap(20.dp()),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _initiatePayment(
      BuildContext context, DevotionalBookModel model) async {
    const LoaderWidget().showProgressIndicator(context: context);

    Map<String, dynamic> param = {
      "payment_type": PaymentType.devotion_year_purchase.name,
      "metadata": {
        "devotion_year_id": model.id,
        "note": "Devotional Book Purchase"
      }
    };

    final results = await paymentApiService.makePaymentOfBook(param);
    const LoaderWidget().hideProgress();
    navToPaymentScreen(results.authUrl);
  }

  void navToPaymentScreen(String url) {
    if (url.isEmpty) return;
    navUtils.fireTarget(
      BaseWebView(
        model: WebModel(
          url: url,
          onDoneOnclick: () {
            navUtils.fireTargetHome(
              model: EventTrigger(
                bookType: BookType.purchasedBooks,
                screen: 'Devotional',
              ),
            );
          },
        ),
      ),
    );
  }

  void onPurchasedBookOnClick(DevotionalBookModel book) {
    navUtils.fireTarget(PurchasedBookDetailsScreen(), model: book);
  }
}
