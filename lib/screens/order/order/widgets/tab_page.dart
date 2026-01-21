import 'package:el_afrik_restaurant/screens/order/order/widgets/order_item_widget.dart';
import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {

  final String status;
  final Color statusColor;
  final Color backgroundColor;

  const TabPage({
    super.key,
    required this.status,
    required this.statusColor,
    required this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
          itemBuilder: (context, index){
        return OrderItemWidget(
          status: status,
          statusColor: statusColor,
          backgroundColor: backgroundColor,
        );
      }),
    );
  }
}
