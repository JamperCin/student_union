import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:student_union/core-ui/snippets/speech_to_voice/text_to_speech_Api.dart';
import 'package:student_union/core/app/app_colors.dart';
import 'package:student_union/core/base/base_controller.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';
import 'package:student_union/core/utils/app_feedback.dart';
import 'package:student_union/core/utils/share_file_utils.dart';
import 'package:student_union/core/utils/you_version_utils.dart';

class PurchasedBookController extends BaseController {
  Rx<DevotionalBookModel> book = const DevotionalBookModel().obs;
  RxString selectedDate = 'Today'.obs;
  Rx<DateTime> selectedDateValue = DateTime.now().obs;
  RxBool isLoadingContent = false.obs;
  RxBool hasStartedSharing = false.obs;
  TextToSpeechApi textToSpeechApi = TextToSpeechApi();

  RxString selectedDateTimeline = DateTimeUtils()
      .formatDate(DateTime.now().toString(), format: "dd MMM, yyyy")
      .obs;

  Future<void> setPurchasedBook(DevotionalBookModel book) async {
    this.book.value = book;
    selectedDate.value = 'Today';
    selectedDateValue.value = DateTime.now();
    isLoadingContent.value = false;
    selectedDateTimeline.value = DateTimeUtils().formatDate(
      DateTime.now().toString(),
      format: "dd MMM, yyyy",
    );

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

    // currentEvent.value = null; //Reset event after use
    return sections;
  }

  Future<void> onPickCalendar(BuildContext context) async {
    try {
      final now = DateTime.now();
      final theme = Theme.of(context);
      final isDark = theme.brightness == Brightness.dark;
      final pickerTextColor = isDark ? whiteColor : darkColor;
      final actionColor = theme.colorScheme.secondary;

      final pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDateValue.value,
        firstDate: DateTime(2020, 1, 1),
        lastDate: DateTime(now.year + 1, now.month, now.day),
        builder: (context, child) {
          if (child == null) return const SizedBox.shrink();

          final datePickerTheme = theme.datePickerTheme.copyWith(
            headerHeadlineStyle: theme.textTheme.displaySmall?.copyWith(
              fontSize: 30.dp(),
              fontWeight: FontWeight.w700,
              color: pickerTextColor,
            ),
            dayForegroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return pickerTextColor.withValues(alpha: 0.45);
              }
              if (states.contains(WidgetState.selected)) {
                return whiteColor;
              }
              return pickerTextColor;
            }),
            dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return primaryGreenColor;
              }
              return Colors.transparent;
            }),
            todayForegroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return whiteColor;
              }
              return actionColor;
            }),
            todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return primaryGreenColor;
              }
              return Colors.transparent;
            }),
            todayBorder: BorderSide(color: actionColor, width: 1.5),
            cancelButtonStyle: TextButton.styleFrom(
              foregroundColor: actionColor,
              backgroundColor: Colors.transparent,
            ),
            confirmButtonStyle: TextButton.styleFrom(
              foregroundColor: actionColor,
              backgroundColor: Colors.transparent,
            ),
          );

          return Theme(
            data: theme.copyWith(
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: actionColor,
                  backgroundColor: Colors.transparent,
                ),
              ),
              datePickerTheme: datePickerTheme,
            ),
            child: child,
          );
        },
      );

      if (pickedDate == null) return;

      selectedDateValue.value = pickedDate;
      if (DateUtils.isSameDay(now, pickedDate)) {
        selectedDate.value = 'Today';
      } else {
        selectedDate.value = DateTimeUtils().formatDate(
          pickedDate.toString(),
          format: "dd MMM, yyyy",
        );
      }

      selectedDateTimeline.value = DateTimeUtils().formatDate(
        pickedDate.toString(),
        format: "EEEE, MMMM dd",
      );

      _fetchDevotionContent(pickedDate.toString());
    } catch (e) {
      if (!context.mounted) return;
      AppFeedback.error(
        'Unable to open calendar. Please try again.',
        context: context,
      );
    }
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
