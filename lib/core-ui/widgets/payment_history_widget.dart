import 'package:core_module/core/extensions/double_extension.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/utils/date_time_utils.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core_module.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/model/remote/payment_model.dart';

import '../../core/res/asset_path.dart';

class PaymentHistoryWidget extends StatelessWidget {
  final GestureTapCallback? onSeeMoreOnTap;

  const PaymentHistoryWidget({super.key, this.onSeeMoreOnTap});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: paymentApiService.fetchPaymentHistory(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<PaymentModel>> snapshot,
      ) {
        return snapshot.hasData
            ? Column(
                children: [
                  Gap(20.dp()),
                  if (onSeeMoreOnTap != null)
                    TitleTextWidget(
                      text: "Donation History",
                      onTap: onSeeMoreOnTap,
                    ),
                  if (onSeeMoreOnTap != null) Gap(5.dp()),
                  ...snapshot.data!
                      .map((d) => _transactionItemWidget(context, d)),
                ],
              )
            : ShimmerWidget.withList(length: onSeeMoreOnTap != null ? 1 : 5);
      },
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
                  Text(model.name ?? '', style: textTheme.labelLarge),
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
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: ' ', style: textTheme.bodyMedium),
                      TextSpan(
                        text: model.amount?.toDecimalPlaces(),
                        style: textTheme.labelMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
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
}
