import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core-ui/widgets/title_text_widget.dart';
import 'package:student_union/core/app/app_routes.dart';
import 'package:student_union/core/def/global_access.dart';
import 'package:student_union/core/enums/payment_type.dart';
import 'package:student_union/core/model/local/web_model.dart';
import 'package:student_union/core/model/remote/payment_model.dart';

import '../../core/res/asset_path.dart';

class PaymentHistoryWidget extends StatefulWidget {
  final GestureTapCallback? onSeeMoreOnTap;
  final PaymentType paymentType;

  const PaymentHistoryWidget({
    super.key,
    this.onSeeMoreOnTap,
    this.paymentType = PaymentType.campaign_donation,
  });

  @override
  State<PaymentHistoryWidget> createState() => _PaymentHistoryWidgetState();
}

class _PaymentHistoryWidgetState extends State<PaymentHistoryWidget> {
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    final firstPageParam = {
      "page": "1",
      "payment_type": widget.paymentType.name,
    };
    final hasCachedData = paymentApiService.hasCachedPaymentHistory(
      param: firstPageParam,
    );
    return FutureBuilder<List<PaymentModel>>(
      future: _onLoadMorePayment(page: 1),
      initialData: hasCachedData
          ? paymentApiService.getCachedPaymentHistory(param: firstPageParam)
          : null,
      builder: (context, snapshot) {
        return snapshot.hasData && snapshot.data != null
            ? _transactionLayout(context, snapshot.data!)
            : ShimmerWidget.withList(
                length: widget.onSeeMoreOnTap != null ? 1 : 5,
              );
      },
    );
  }

  Widget _transactionLayout(BuildContext context, List<PaymentModel> list) {
    if (list.isEmpty) {
      return widget.onSeeMoreOnTap != null
          ? const SizedBox.shrink()
          : const NoDataWidget(
              asset: icDonate,
              title: "No donation history available",
              description:
                  "Once you start donating to campaigns and core ministries, your history will show up here. You don’t have any records just yet.",
            );
    }

    return Column(
      children: [
        Gap(20.dp()),
        if (widget.onSeeMoreOnTap != null)
          TitleTextWidget(
            text: "Donation History",
            onTap: widget.onSeeMoreOnTap,
          ),
        if (widget.onSeeMoreOnTap != null) Gap(5.dp()),
        if (widget.onSeeMoreOnTap != null)
          ...list
              .getRange(0, list.length > 5 ? 5 : list.length)
              .map((item) => _transactionItemWidget(context, item)),
        if (widget.onSeeMoreOnTap == null)
          Expanded(
            child: ListViewWidget<PaymentModel>(
              list: list,
              onLoadMore: () => _onLoadMorePayment(page: ++_page),
              onRefresh: () {
                _page = 1;
                return _onLoadMorePayment(page: _page);
              },
              listItemWidget: (item) => _transactionItemWidget(context, item),
            ),
          ),
      ],
    );
  }

  Widget _transactionItemWidget(BuildContext context, PaymentModel model) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
    final canRetry = _canRetryPayment(model);

    return Column(
      children: [
        Gap(5.dp()),
        InkWell(
          onTap: canRetry ? () => _retryPendingPayment(model) : null,
          borderRadius: BorderRadius.circular(8.dp()),
          child: Row(
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
                          ),
                        ],
                      ),
                    ),
                    Text(
                      DateTimeUtils().formatDate(model.createdAt).toString(),
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
                          text: model.currency,
                          style: textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(text: ' ', style: textTheme.bodyMedium),
                        TextSpan(
                          text: model.amount.toDecimalPlaces(),
                          style: textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    canRetry ? 'Retry' : model.status,
                    style: textTheme.labelMedium?.copyWith(
                      color: _getStatusColor(model.status),
                      fontSize: 10.dp(),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(5.dp()),
        Divider(color: colorTheme.surfaceDim, height: 0.1),
      ],
    );
  }

  bool _canRetryPayment(PaymentModel model) {
    final url =
        model.paymentInfoMeta?.paystackInit?.data?.authorizationUrl ?? '';

    debugPrint("\n----Pay --> $url---\n");
    final status = model.status.toLowerCase().trim();
    return status == 'pending' && url.isNotEmpty;
  }

  void _retryPendingPayment(PaymentModel model) {
    final retryUrl =
        model.paymentInfoMeta?.paystackInit?.data?.authorizationUrl ?? '';

    if (retryUrl.isEmpty) return;

    AppRouter.pushNamed(
      AppRouteNames.web,
      extra: WebModel(
        url: retryUrl,
        title: "Complete Payment",
        showAppBar: true,
        onDoneOnclick: () {
          paymentApiService.clearCache();
          AppRouter.goNamed(AppRouteNames.donationsHistory);
        },
      ),
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

  Future<List<PaymentModel>> _onLoadMorePayment({required int page}) async {
    final param = {
      "page": page.toString(),
      "payment_type": widget.paymentType.name,
    };
    return paymentApiService.fetchPaymentHistory(param: param);
  }
}
