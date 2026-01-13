import 'dart:convert';

import 'package:core_module/core_module.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BaseWebView extends BaseScreenStatefulStandard {
  RxBool isPageLoading = true.obs;
  WebViewController wCtrl = WebViewController();
  final WebModel model;

  BaseWebView({required this.model}) {
    wCtrl = getWebController();
  }

  @override
  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: appBarBackgroundColor(context),
      elevation: appBarElevation(),
      centerTitle: true,
      title: Text(appBarTitle(), style: appBarTitleStyle(context)),
      iconTheme: IconThemeData(color: appBarIconColor(context)),
      actions: actions(),
    );
  }

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700, color: colorScheme.tertiary);
  }

  @override
  List<Widget> actions() {
    return [
      model.onDoneOnclick != null
          ? InkWell(
              onTap: () {
                model.onDoneOnclick!();
              },
              child: Padding(
                padding: EdgeInsets.only(
                  right: 16.dp(),
                  top: 5.dp(),
                  bottom: 5.dp(),
                ),
                child: Text(
                  "Done",
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.tertiary,
                  ),
                ),
              ),
            )
          : const SizedBox(),
    ];
  }

  @override
  bool showAppBar() {
    return model.showAppBar;
  }

  @override
  Color appBarBackgroundColor(BuildContext context) {
    return model.appBarColor ??
        Theme.of(context).appBarTheme.backgroundColor ??
        super.appBarBackgroundColor(context);
  }

  @override
  appBarIconColor(BuildContext context) {
    return Theme.of(context).appBarTheme.iconTheme?.color ??
        super.appBarIconColor(context);
  }

  @override
  Color backgroundColor(BuildContext context) {
    return model.backgroundColor ?? super.backgroundColor(context);
  }

  @override
  double appBarElevation() {
    return 0;
  }

  @override
  String appBarTitle() {
    return model.title ?? "";
  }

  @override
  Widget body(BuildContext context) {
    if (kIsWeb) {
      return const NoDataWidget(
        asset: icReadBible,
        title: 'Not applicable to read on web browser',
        description: 'You cannot read this book on a web browser',
      );
    }
    return Stack(
      children: [
        WebViewWidget(controller: wCtrl),
        Obx(
          () => isPageLoading.value
              ? const Center(child: LoaderWidget.withCircularIndicator())
              : const Text(""),
        ),
      ],
    );
  }

  Uri? _getContent() {
    if (model.uri != null) return model.uri;

    final buffer = StringBuffer();

    // Add main content if available
    if (model.content != null && model.content!.trim().isNotEmpty) {
      buffer.writeln("""
      <div class="section">
        ${model.content}
      </div>
    """);
    }

    // Add extra sections (if any)
    if (model.sections != null && model.sections!.isNotEmpty) {
      for (final section in model.sections!) {
        buffer.writeln("""
      <div class="section">
        <div class="title" style="font-size: 18px;">${section.title}</div>
        <div class="content" style="font-size: 16px;">${section.content}</div>
      </div>
      """);
      }
    }

    // If nothing to render, return null
    if (buffer.isEmpty) return null;

    return Uri.dataFromString(
      '''
    <!DOCTYPE html>
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          body {
            font-family: sans-serif;
            padding: 16px;
            line-height: 1.6;
          }
          .section {
            margin-bottom: 16px;
          }
          .title {
            font-weight: bold;
            margin-bottom: 4px;
          }
          .content {
            font-weight: normal;
          }
        </style>
      </head>
      <body>
        ${buffer.toString()}
      </body>
    </html>
    ''',
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    );
  }

  @Deprecated('Use _getContent() instead')
  Uri? _getContents() {
    return model.uri ??
        (model.content != null
            ? Uri.dataFromString(
                '''
            <!DOCTYPE html>
            <html>
              <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <style>body { font-family: sans-serif; padding: 16px; }</style>
              </head>
              <body>
                ${model.content ?? ''}
                </body>
              </html>
              ''',
                mimeType: 'text/html',
                encoding: Encoding.getByName('utf-8'),
              )
            : null);
  }

  @override
  void initState(SingleTickerProviderStateMixin<StatefulWidget> vsync) {
    super.initState(vsync);

    wCtrl = getWebController();
  }

  WebViewController getWebController() {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'FlutterChannel',
        onMessageReceived: (s) {
          debugPrint("BUTTON ===> ${s.message}");

          if (s.message == 'dashboard_clicked' ||
              s.message == 'back_to_dashboard_clicked') {
            model.onDoneOnclick?.call();
          }
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onHttpAuthRequest: (HttpAuthRequest request) {},
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            if (!isPageLoading.value) {
              isPageLoading.value = true;
            }

            debugPrint("Its started loading ==> $url");
          },
          onPageFinished: (String url) {
            if (isPageLoading.value) {
              isPageLoading.value = false;
            }

            // Inject JS to listen for button click
            //Get the view which has the text 'Back To Home' and add click listener
            wCtrl.runJavaScript("""

              function findElementByText(tagName, searchText) {
                  // Get all elements of the specified tag name (e.g., 'a')
                  const elements = document.getElementsByTagName(tagName); 
                  
                  // Iterate through the elements to find a match
                  for (let i = 0; i < elements.length; i++) {
                    // Use .textContent for a robust text comparison
                    if (elements[i].textContent.trim() === searchText) {
                      return elements[i]; // Return the first matching element
                    }
                  }
                  return null; // Return null if not found
                }


              const backToDashboardButton = findElementByText('a', 'Back to Home');
              const dashboardButton = document.querySelector('a[href="/dashboard"]');
              
              if (dashboardButton) {
                dashboardButton.addEventListener('click', function(event) {
                  FlutterChannel.postMessage('dashboard_clicked');
                });
              }

              if (backToDashboardButton) {
                backToDashboardButton.addEventListener('click', function(event) {
                  FlutterChannel.postMessage('back_to_dashboard_clicked');
                });
              }
            """);
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(_getContent() ?? Uri.parse(model.url));

    return controller;
  }
}
