import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:student_union/core-ui/snippets/speech_to_voice/text_to_speech_Api.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/utils/share_file_utils.dart';
import 'package:student_union/core/utils/you_version_utils.dart';

class PurchasedBookController extends BaseController {
  Rx<DevotionalBookModel> book = const DevotionalBookModel().obs;
  RxString selectedDate = 'Today'.obs;
  RxBool isLoadingContent = false.obs;
  RxBool hasStartedSharing = false.obs;
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
      _fetchDevotionContent(
        DateTimeUtils().formatDate(
          DateTime.now().toString(),
          format: "yyyy-MM-dd",
        ),
      );
    }
  }

  List<Section> getDevotionSections() {
    List<Section> sections = [];
    if (book.value.devotion == null) return sections;

    if ((book.value.devotion?.question ?? '').isNotEmpty) {
      sections.add(
        Section(
          title: 'Question',
          content: book.value.devotion?.question ?? '',
        ),
      );
    }

    if ((book.value.devotion?.thought ?? '').isNotEmpty) {
      sections.add(
        Section(title: 'Thought', content: book.value.devotion?.thought ?? ''),
      );
    }

    if ((book.value.devotion?.soWhat ?? '').isNotEmpty) {
      sections.add(
        Section(title: 'So What', content: book.value.devotion?.soWhat ?? ''),
      );
    }

    if ((book.value.devotion?.prayer ?? '').isNotEmpty) {
      sections.add(
        Section(title: 'Prayer', content: book.value.devotion?.prayer ?? ''),
      );
    }

    return sections;
  }

  void onPickCalendar(BuildContext context) {
    CalendarPickerWidget.show(
      context: context,
     // backgroundColor: Theme.of(context).colorScheme.onSecondary,
      endDate: DateTime(
        DateTime.now().year + 1,
        DateTime.now().month,
        DateTime.now().day,
      ),
      onSelectDate: (date) {
        if (DateTime.now().year == date.year &&
            DateTime.now().month == date.month &&
            DateTime.now().day == date.day) {
          selectedDate.value = 'Today';
        } else {
          selectedDate.value = DateTimeUtils().formatDate(
            date.toString(),
            format: "dd MMM, yyyy",
          );
        }
        selectedDateTimeline.value = DateTimeUtils().formatDate(
          date.toString(),
          format: "EEEE, MMMM dd",
        );

        _fetchDevotionContent(date.toString());
      },
      okButtonTextStyle: Theme.of(context).textTheme.titleLarge,
      cancelButtonTextStyle: Theme.of(context).textTheme.titleMedium,
    );
  }

  Future<void> _fetchDevotionContent(String date) async {
    textToSpeechApi.stop();

    final formatDate = DateTimeUtils().formatDate(
      date.toString(),
      format: "yyyy-MM-dd",
    );

    final param = {
      "devotion_year_id":
          (book.value.devotionalId == 0
                  ? book.value.id
                  : book.value.devotionalId)
              .toString(),
      "date": formatDate,
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

  Future<void> onShareDevotionOnTap() async {
    if (book.value.devotion == null) {
      return;
    }

    hasStartedSharing.value = true;
    StringBuffer contentBuffer = StringBuffer();
    //final content =html_parser.parse(book.value.devotion?.content ?? '').body?.text ?? '';

    contentBuffer.writeln(book.value.devotion?.title ?? '');
    contentBuffer.writeln('\n');
    contentBuffer.writeln(book.value.devotion?.referenceText ?? '');
    contentBuffer.write('(${book.value.devotion?.reference})');
    //contentBuffer.writeln('\n');
    //contentBuffer.writeln(content);

    await ShareFileUtils().saveAndShareImage(
      imageUrl: book.value.thumbnail,
      title: contentBuffer.toString(),
    );
    hasStartedSharing.value = false;
  }
}
