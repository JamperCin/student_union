import 'dart:convert';

import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_impl.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/res/asset_path.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BaseWebView extends BaseScreenImpl {
  RxBool isPageLoading = true.obs;
  late WebViewController wCtrl;
  final WebModel model;

  BaseWebView({required this.model});

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700);
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
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorScheme.primary),
                ),
              ),
            )
          : const SizedBox()
    ];
  }

  @override
  bool showAppBar() {
    return model.showAppBar;
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
        title: 'No applicable to read on web browser',
        description: 'You cannot read this book on web browser',
      );
    }
    return Stack(
      children: [
        WebViewWidget(controller: getWebController()),
        Obx(
          () => isPageLoading.value
              ? const Center(child: LoaderWidget.withCircularIndicator())
              : const Text(""),
        ),
      ],
    );
  }

  Uri? _getContent() {
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

  WebViewController getWebController() {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('MessageInvoker', onMessageReceived: (s) {
        //NavApi.fireEvent(Event(action: EventAction.NAV_HOME));
      })
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

            // print("Its done loading ==> $url");
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(_getContent() ?? Uri.parse(model.url ?? ''));

    return controller;
  }
}
