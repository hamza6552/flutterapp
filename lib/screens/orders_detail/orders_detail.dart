import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:zabardash/core/utils/app_constants.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/screens/orders/widgets/order_view.dart';

class OrdersDetail extends StatefulWidget {
  static const routeName = '/orders-detail-screen';
  var Product_List;
  OrdersDetail(this.Product_List);
  // const OrdersDetail({Key? key}) : super(key: key);

  @override
  _OrdersDetailState createState() => _OrdersDetailState(Product_List);
}

class _OrdersDetailState extends State<OrdersDetail> {
  var Product_List;
  _OrdersDetailState(this.Product_List);

  void initState() {
    super.initState();
    print(Product_List);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: UIColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Order Details',
          style:
              StyleText.regularDarkGray18.copyWith(fontWeight: FontWeight.w500),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: UIColors.darkGray1,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Product_List["isDelivered"] == "Order"
                ? Column(children: [
                    _timeLine('7:30 PM', 'Order Placed',
                        'Your order #52100 was placed for delivery'),
                    _timeLine(
                      '7:30 PM',
                      'Pending',
                      'Your order is pending for confirmation. Will confirmed within 10 minutes.',
                      icon: Icons.circle,
                    ),
                    _timeLine(
                      '7:30 PM',
                      'Confirmed',
                      'Your order in confirmed.',
                      icon: Icons.circle,
                    ),
                    _timeLine('7:30 PM', 'Processing',
                        'Your product in processing to deliver you on time.',
                        icon: Icons.circle),
                    _timeLine('7:30 PM', 'Delivered',
                        'Order deliver to customer and marked as delivered.',
                        icon: Icons.circle, isLast: true),
                  ])
                : Product_List["isDelivered"] == "Pending"
                    ? Column(children: [
                        _timeLine('7:30 PM', 'Order Placed',
                            'Your order #52100 was placed for delivery'),
                        _timeLine(
                          '7:30 PM',
                          'Pending',
                          'Your order is pending for confirmation. Will confirmed within 10 minutes.',
                        ),
                        _timeLine(
                          '7:30 PM',
                          'Confirmed',
                          'Your order in confirmed.',
                          icon: Icons.circle,
                        ),
                        _timeLine('7:30 PM', 'Processing',
                            'Your product in processing to deliver you on time.',
                            icon: Icons.circle),
                        _timeLine('7:30 PM', 'Delivered',
                            'Order deliver to customer and marked as delivered.',
                            icon: Icons.circle, isLast: true),
                      ])
                    : Product_List["isDelivered"] == "Confirmed"
                        ? Column(children: [
                            _timeLine('7:30 PM', 'Order Placed',
                                'Your order #52100 was placed for delivery'),
                            _timeLine(
                              '7:30 PM',
                              'Pending',
                              'Your order is pending for confirmation. Will confirmed within 10 minutes.',
                            ),
                            _timeLine(
                              '7:30 PM',
                              'Confirmed',
                              'Your order in confirmed.',
                            ),
                            _timeLine('7:30 PM', 'Processing',
                                'Your product in processing to deliver you on time.',
                                icon: Icons.circle),
                            _timeLine('7:30 PM', 'Delivered',
                                'Order deliver to customer and marked as delivered.',
                                icon: Icons.circle, isLast: true),
                          ])
                        : Product_List["isDelivered"] == "Processing"
                            ? Column(children: [
                                _timeLine('7:30 PM', 'Order Placed',
                                    'Your order #52100 was placed for delivery'),
                                _timeLine(
                                  '7:30 PM',
                                  'Pending',
                                  'Your order is pending for confirmation. Will confirmed within 10 minutes.',
                                ),
                                _timeLine(
                                  '7:30 PM',
                                  'Confirmed',
                                  'Your order in confirmed.',
                                ),
                                _timeLine(
                                  '7:30 PM',
                                  'Processing',
                                  'Your product in processing to deliver you on time.',
                                ),
                                _timeLine('7:30 PM', 'Delivered',
                                    'Order deliver to customer and marked as delivered.',
                                    icon: Icons.circle, isLast: true),
                              ])
                            : Column(children: [
                                _timeLine('7:30 PM', 'Order Placed',
                                    'Your order #52100 was placed for delivery'),
                                _timeLine(
                                  '7:30 PM',
                                  'Pending',
                                  'Your order is pending for confirmation. Will confirmed within 10 minutes.',
                                ),
                                _timeLine(
                                  '7:30 PM',
                                  'Confirmed',
                                  'Your order in confirmed.',
                                ),
                                _timeLine(
                                  '7:30 PM',
                                  'Processing',
                                  'Your product in processing to deliver you on time.',
                                ),
                                _timeLine(
                                  '7:30 PM',
                                  'Delivered',
                                  'Order deliver to customer and marked as delivered.',
                                ),
                              ])
          ]),
        ),
        _orderSummary(),
      ],
    );
  }

  _timeLine(String time, String title, String subtitle,
      {IconData? icon, bool? isFirst, bool? isLast}) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.35,
      indicatorStyle: IndicatorStyle(
          height: 26.flexibleHeight,
          width: 26.flexibleWidth,
          iconStyle: IconStyle(
              iconData: icon ?? Icons.check,
              color: UIColors.white,
              fontSize: icon == null ? 16 : 8),
          color: icon == null ? UIColors.primaryColor : UIColors.vDividerGrey,
          indicatorXY: 0.1,
          padding: EdgeInsets.all(8)),
      afterLineStyle: LineStyle(color: UIColors.vDividerGrey, thickness: 2),
      isFirst: isFirst ?? false,
      isLast: isLast ?? false,
      startChild: Container(
        height: 80.flexibleHeight,
        padding:
            EdgeInsets.only(right: 20.flexibleWidth, top: 12.flexibleHeight),
        child: Text(
          time,
          textAlign: TextAlign.right,
          style: StyleText.regularLightGray15,
        ),
      ),
      endChild: Container(
        padding: EdgeInsets.only(
            left: 25.flexibleWidth,
            top: 8.flexibleHeight,
            right: 6.flexibleWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: icon == null
                  ? StyleText.regularDarkGray17
                      .copyWith(fontWeight: FontWeight.w600)
                  : StyleText.regularLightGray17
                      .copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5.flexibleHeight),
            Text(subtitle, style: StyleText.regular1LightGray13),
          ],
        ),
      ),
    );
  }

  _orderSummary() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(22), topLeft: Radius.circular(22)),
          color: UIColors.white,
          boxShadow: [AppConstants.containerShadow]),
      padding: EdgeInsets.symmetric(horizontal: 20.flexibleWidth),
      child: Column(
        children: [
          ListTile(
            horizontalTitleGap: -5,
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.list_alt,
              color: UIColors.primaryColor,
            ),
            title: Text(
              'Order summary',
              textAlign: TextAlign.left,
              style: StyleText.regularDarkGray17
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down,
              color: UIColors.darkGray,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Container(
              height: 100,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: UIColors.shadowGrey,
                            blurRadius: 16,
                            spreadRadius: -10,
                            // spreadRadius:1,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: Product_List["productPicturePath"],
                        // "https://images.unsplash.com/photo-1615444431936-df9a932734f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                        height: 80.flexibleHeight,
                        width: 130.flexibleWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  55.horizontalSpace,
                  Expanded(
                    child: SizedBox(
                      height: 70.flexibleHeight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            Product_List["description"],
                            style: StyleText.mediumDarkGrey14,
                          ),
                          Text(
                            Product_List["description"],
                            style: StyleText.regularLightGray13,
                          ),
                          10.verticalSpace,
                          Text(
                            " \$ ${Product_List["order_price"].toString()}",
                            style: StyleText.regularprimary14,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
