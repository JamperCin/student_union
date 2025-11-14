import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class BaseController extends GetxController {
  ///A generic method to execute any request
  ///
  Future<void> executeRequest<T>({
    BuildContext? context,
    bool Function()? validate,
    Map Function()? param,
    Future<T> Function()? execute,
    Function(T?)? results,
    String? validationErrorMessage,
  }) async {
    if (validate != null && !validate()) {
      if (validationErrorMessage != null) {
        SnackBarSnippet().snackBarError(validationErrorMessage);
      }
      return;
    }

    if (context != null) {
      const LoaderWidget().showProgressIndicator(context: context);
    }
    final response  = await execute?.call();
    if (context != null) const LoaderWidget().hideProgress();
    results?.call(response);
  }
}
