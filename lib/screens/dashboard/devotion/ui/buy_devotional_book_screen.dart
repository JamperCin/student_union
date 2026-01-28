import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/screen/base_shared_screen.dart';
import 'package:student_union/core-ui/widgets/create_account_button.dart';
import 'package:student_union/core/model/remote/devotional_book_model.dart';

import '../controller/devotion_controller.dart';

class BuyDevotionalBookScreen extends BaseSharedScreen {
  final _controller = Get.put(DevotionController());

  @override
  String appBarTitle() {
    return "Devotionals";
  }

  @override
  DevotionalBookModel getModel() {
    return super.getModel() as DevotionalBookModel;
  }

  @override
  Widget body(BuildContext context) {
    if (isGuestUser.value) return CreateAccountButton();
    final lead = '—  ';
    final script =
        "${getModel().devotionalType?.name}\n${getModel().devotionalType?.description}"; //'Deuteronomy 29:29';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.dp(), vertical: 14.dp()),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 16.dp(),
                vertical: 14.dp(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: NetworkImageWidget(
                      url: getModel().thumbnail,
                      width: appDimen.screenWidth * 0.7,
                      height: appDimen.screenHeight * 0.4,
                      fit: BoxFit.contain,
                      heroTag: getModel().heroTag,
                      placeHolderWidget: ContainerWidget(
                        width: appDimen.screenWidth,
                        height: appDimen.screenHeight * 0.4,
                      ),
                    ),
                  ),
                  Gap(30.dp()),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: getModel().description,
                          style: textTheme.labelMedium,
                        ),
                        TextSpan(text: "\n\n", style: textTheme.labelMedium),
                        TextSpan(
                          text: lead,
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: 12.dp(),
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextSpan(
                          text: script,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(20.dp()),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "GHS ", style: textTheme.bodyLarge),
                          TextSpan(
                            text: getModel().price.toDecimalPlaces(),
                            style: textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(20.dp()),
                ],
              ),
            ),
          ),
          ButtonWidget(
            text: "Buy",
            textColor: colorScheme.surface,
            onTap: () {
              _controller.confirmPayment(context, getModel());
            },
          ),
          Gap(40.dp()),
        ],
      ),
    );
  }
}
