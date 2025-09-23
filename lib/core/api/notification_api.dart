import 'package:core_module/core/utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:student_union/main.dart';

class NotificationApi {
  static NotificationApi? _instance;
  final _notifications = FlutterLocalNotificationsPlugin();
  final _fileUtils = FileUtils();
  final iconUrl = "https://primeegiftfiles.s3.us-east-2.amazonaws.com/prime-merchants-categories-logo/prime.png";

  NotificationApi._() {
    _initialize();
  }

  factory NotificationApi() {
    return _instance ??= NotificationApi._();
  }

  /// Initializes the notification plugin.
  ///
  /// This method performs the following steps:
  /// 1. Requests notification permissions on Android devices.
  ///    - It uses `resolvePlatformSpecificImplementation` to get the Android-specific plugin.
  ///    - Then, it calls `requestNotificationsPermission()` to prompt the user for permission.
  ///    - The result `isPermissionAccepted` (boolean) indicates if the user granted permission.
  ///      (Currently, this variable is not used after being assigned).
  /// 2. Defines Android-specific initialization settings.
  ///    - `AndroidInitializationSettings('@mipmap/ic_launcher')` specifies the default icon
  ///      for notifications, using the app's launcher icon.
  /// 3. Defines Darwin (iOS/macOS) specific initialization settings.
  ///    - `DarwinInitializationSettings()` uses default settings for Apple platforms.
  /// 4. Combines platform-specific settings into a general `InitializationSettings` object.
  /// 5. Initializes the `_notifications` plugin with the combined settings.
  ///    - `onDidReceiveNotificationResponse`: Specifies a callback function (`onDidReceiveNotificationResponse`)
  ///      to be executed when a user interacts with a notification while the app is in the foreground.
  ///    - `onDidReceiveBackgroundNotificationResponse`: Specifies a callback function (`notificationTapBackground`)
  ///      to be executed when a user interacts with a notification while the app is in the background or terminated.
  Future<void> _initialize() async {
    final isPermissionAccepted = await _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    if (isPermissionAccepted == null || isPermissionAccepted == false) {
      return;
    }

    const androidSetting = AndroidInitializationSettings('notify');

    const initSettingsDarwin = DarwinInitializationSettings();

    const settings = InitializationSettings(

      android: androidSetting,
      iOS: initSettingsDarwin,
    );

    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  // static void onDidReceiveLocalNotification(
  //     int id, String? title, String? body, String? payload) async {
  //   debugPrint("Running ====>> ${payload}");
  // }

   void _onDidReceiveNotificationResponse(NotificationResponse payload) {
    debugPrint("Running ====>> ${payload.payload}");
    //_onNotificationClickHandler.add(payload.payload);
  }

  ///Notification details settings gos here
  Future<NotificationDetails> _notificationDetails({String? url}) async {
    final icon = await _fileUtils.downloadFile(url: url ?? '');
    BigPictureStyleInformation? androidStyle;

    ///Check if big Picture is needed
    if (icon.isNotEmpty) {
      androidStyle = BigPictureStyleInformation(
        FilePathAndroidBitmap(icon),
        largeIcon: FilePathAndroidBitmap(icon),
      );
    }

    final androidNotificationDetails = AndroidNotificationDetails(
      'SU_GHANA',
      'SU_GHANA_CHANNEL',
      channelDescription: 'Scripture Union',
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: androidStyle,
      channelShowBadge: true,
      ticker: 'ticker',
    );
    return NotificationDetails(android: androidNotificationDetails);
  }

  ///---------------------- P U B L I C     A P I s ----------------------------------------------

  ///Show simple Notification on a device
  Future showNotification({
    int id = 0,
    String? title,
    String? body,
    dynamic payload,
    String? largePicture, //= AppStrings.PRIME_ICON,
  }) async =>
      await _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(url: largePicture),
        payload: payload.toString(),
      );
}
