import 'package:core_module/core/utils/date_time_utils.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/calendar_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:share_plus/share_plus.dart';
import 'package:student_union/core-ui/snippets/speech_to_voice/text_to_speech_Api.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/utils/you_version_utils.dart';

class PurchasedBookController extends BaseController {
  Rx<DevotionalBookModel> book = const DevotionalBookModel().obs;
  RxString selectedDate = 'Today'.obs;
  RxBool isLoadingContent = false.obs;
  TextToSpeechApi textToSpeechApi = TextToSpeechApi();

  RxString selectedDateTimeline = DateTimeUtils()
      .formatDate(DateTime.now().toString(), format: "dd MMM, yyyy")
      .obs;

  Future<void> setPurchasedBook(DevotionalBookModel book) async {
    this.book.value = book;
    selectedDate = 'Today'.obs;
    isLoadingContent = false.obs;
    selectedDateTimeline = DateTimeUtils()
        .formatDate(DateTime.now().toString(), format: "dd MMM, yyyy")
        .obs;

    if (book.devotion == null) {
      await Future.delayed(const Duration(milliseconds: 30));
      _fetchDevotionContent(DateTimeUtils().formatDate(
        DateTime.now().toString(),
        format: "yyyy-MM-dd",
      ));
    }
  }

  void onPickCalendar(BuildContext context) {
    CalendarPickerWidget.show(
      context: context,
      onSelectDate: (date) {
        if (DateTime.now().year == date.year &&
            DateTime.now().month == date.month &&
            DateTime.now().day == date.day) {
          selectedDate.value = 'Today';
        } else {
          selectedDate.value = DateTimeUtils()
              .formatDate(date.toString(), format: "dd MMM, yyyy");
        }
        selectedDateTimeline.value = DateTimeUtils()
            .formatDate(date.toString(), format: "EEEE, MMMM dd");

        _fetchDevotionContent(date.toString());
      },
      okButtonTextStyle: Theme.of(context).textTheme.titleLarge,
      cancelButtonTextStyle: Theme.of(context).textTheme.titleMedium,
    );
  }

  Future<void> _fetchDevotionContent(String date) async {
    textToSpeechApi.stop();

    final formatDate =
        DateTimeUtils().formatDate(date.toString(), format: "yyyy-MM-dd");

    final param = {
      "devotion_year_id": (book.value.devotionalId == 0
              ? book.value.id
              : book.value.devotionalId)
          .toString(),
      "date": formatDate
    };

    isLoadingContent.value = true;
    final result = await devGuideService.fetchPurchasedBooks(param: param);
    isLoadingContent.value = false;
    book.value = result.isNotEmpty ? result.first : book.value;
  }

  void onReadAloudOnTap() {
    final content =
        html_parser.parse(book.value.devotion?.content ?? '').body?.text ?? '';

    textToSpeechApi.regulateSpeech(content);
  }

  Future<void> onOpenBibleTextOnTap() async {
    YouVersionUtils().openBibleReference(ref: book.value.devotion?.reference);
  }

  void onShareDevotionOnTap() {
    if (book.value.devotion == null) {
      return;
    }

    SharePlus.instance.share(
      ShareParams(
        text: book.value.devotion?.reference,
        title: book.value.devotion?.title,
        subject: book.value.devotion?.referenceText,
      ),
    );
  }
}
