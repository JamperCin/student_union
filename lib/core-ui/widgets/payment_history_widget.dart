import 'package:core_module/core/extensions/double_extension.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/extensions/string_extension.dart';
import 'package:core_module/core/utils/date_time_utils.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/list_view_widget.dart';
import 'package:core_module/core_ui/widgets/no_data_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/enums/payment_type.dart';
import 'package:student_union/core/model/remote/payment_model.dart';

import '../../core/res/asset_path.dart';

class PaymentHistoryWidget extends StatelessWidget {
  final GestureTapCallback? onSeeMoreOnTap;
  final PaymentType paymentType;
  int page = 1;

  PaymentHistoryWidget({
    super.key,
    this.onSeeMoreOnTap,
    this.paymentType = PaymentType.campaign_donation,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _onLoadMorePayment(page = 1),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<PaymentModel>> snapshot,
      ) {
        return snapshot.hasData && snapshot.data != null
            ? _transactionLayout(context, snapshot.data!)
            : ShimmerWidget.withList(length: onSeeMoreOnTap != null ? 1 : 5);
      },
    );
  }

  Widget _transactionLayout(BuildContext context, List<PaymentModel> list) {
    if (list.isEmpty) {
      return onSeeMoreOnTap != null
          ? const SizedBox.shrink()
          : const NoDataWidget(
              asset: icDonate,
              title: "No donation history available",
              description: "Once you start donating to campaigns and core"
                  " ministries, your history will show up here. You don’t have any records just yet.",
            );
    }

    return Column(
      children: [
        Gap(20.dp()),
        if (onSeeMoreOnTap != null)
          TitleTextWidget(
            text: "Donation History",
            onTap: onSeeMoreOnTap,
          ),
        if (onSeeMoreOnTap != null) Gap(5.dp()),
        if (onSeeMoreOnTap != null)
          ...list.map((e) => _transactionItemWidget(context, e)),
        if (onSeeMoreOnTap == null)
          Expanded(
            child: ListViewWidget(
              list: list,
              onLoadMore: () => _onLoadMorePayment(page = page + 1),
              onRefresh: () => _onLoadMorePayment(page = 1),
              listItemWidget: (item) {
                return _transactionItemWidget(context, item);
              },
            ),
          )
      ],
    );
  }

  Widget _transactionItemWidget(BuildContext context, PaymentModel model) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Gap(5.dp()),
        Row(
          children: [
            ContainerWidget.withCircular(
              color: colorTheme.primary,
              radius: 30.dp(),
              padding: EdgeInsets.all(2.dp()),
              child: Center(
                child: AssetImageWidget(
                  asset: icCoreMinistry,
                  height: 20.dp(),
                  width: 25.dp(),
                  assetColor: colorTheme.surface,
                ),
              ),
            ),
            Gap(10.dp()),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 1,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: model.payableMeta?.title,
                          style: textTheme.labelLarge,
                        )
                      ],
                    ),
                  ),
                  // RichText(
                  //   maxLines: 1,
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(text: 'Ref: ', style: textTheme.labelSmall),
                  //       TextSpan(
                  //         text: model.reference,
                  //         style: textTheme.labelMedium
                  //             ?.copyWith(fontSize: 10.dp()),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // Gap(2.dp()),
                  Text(
                    (DateTimeUtils().formatDate(model.createdAt ?? ''))
                        .toString(),
                    style: textTheme.labelSmall?.copyWith(
                      color: colorTheme.inverseSurface,
                      fontSize: 10.dp(),
                    ),
                  ),
                ],
              ),
            ),
            Gap(10.dp()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: model.currency ?? '',
                        style: textTheme.labelMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(text: ' ', style: textTheme.bodyMedium),
                      TextSpan(
                        text: model.amount.toDecimalPlaces(),
                        style: textTheme.labelMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Text(
                  model.status ?? '',
                  style: textTheme.labelMedium?.copyWith(
                    color: _getStatusColor(model.status ?? ''),
                    fontSize: 10.dp(),
                  ),
                ),
              ],
            ),
          ],
        ),
        Gap(5.dp()),
        Divider(color: colorTheme.surfaceDim, height: 0.1),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'success':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Future<List<PaymentModel>> _onLoadMorePayment(int page) async {
    Map<String, dynamic> param = {
      "page": page.toString(),
      "payment_type": paymentType.name,
    };
    return await paymentApiService.fetchPaymentHistory(param: param);
  }
}
