
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/base_screen/base_screen_impl.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:webview_flutter/webview_flutter.dart';


class BaseWebView extends BaseScreenImpl {
  RxBool isPageLoading = true.obs;
  late WebViewController wCtrl;

  @override
  WebModel getModel() {
    return baseObject as WebModel;
  }

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return super
        .appBarTitleStyle(context)
        ?.copyWith(fontWeight: FontWeight.w700);
  }

  @override
  List<Widget> actions() {
    return [
      getModel().onDoneOnclick != null
          ? InkWell(
              onTap: () {
                getModel().onDoneOnclick!();
              },
              child: Padding(
                padding: EdgeInsets.only(
                  right: 16.dp(),
                  top: 5.dp(),
                  bottom: 5.dp(),
                ),
                child: Text(
                  "Done",
                  style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary),
                ),
              ),
            )
          : const SizedBox()
    ];
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  double appBarElevation() {
    return 0;
  }

  @override
  String appBarTitle() {
    return getModel().title ?? "";
  }

  @override
  Widget body(BuildContext context) {
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
          onHttpAuthRequest: (HttpAuthRequest request) {

          },
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            if (!isPageLoading.value) {
              isPageLoading.value = true;
            }

            print("Its started loading ==> $url");
          },
          onPageFinished: (String url) {
            if (isPageLoading.value) {
              isPageLoading.value = false;
            }

            print("Its done loading ==> $url");
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(getModel().url ?? ''));

    return controller;
  }
}
