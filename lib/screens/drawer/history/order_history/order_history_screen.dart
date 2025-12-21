import 'package:el_afrik_restaurant/data/models/history/history_model.dart';
import 'package:el_afrik_restaurant/screens/drawer/history/order_history/widgets/history_item_widget.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/assets_gen/assets.gen.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<HistoryModel> histories = [
      HistoryModel(
        id: 'ord-001',
        totalProducts: 3,
        deliveryFee: 25.0,
        price: 75.0,
        date: DateTime(2024, 12, 20, 15, 00),
        driverName: 'Cameron Williamson',
        driverPhone: '+1 (470) 918 8577',
        driverImageUrl: Assets.dummy.historyItem.keyName,
      ),
      HistoryModel(
        id: 'ord-002',
        totalProducts: 1,
        deliveryFee: 10.0,
        price: 45.0,
        date: DateTime(2024, 12, 21, 10, 30),
        driverName: 'Jane Cooper',
        driverPhone: '+1 (415) 555 0123',
        driverImageUrl: Assets.dummy.historyItem.keyName,
      ),
      HistoryModel(
        id: 'ord-003',
        totalProducts: 5,
        deliveryFee: 30.0,
        price: 120.0,
        date: DateTime(2024, 12, 21, 18, 15),
        driverName: 'Wade Warren',
        driverPhone: '+1 (202) 555 0198',
        driverImageUrl: Assets.dummy.historyItem.keyName,
      ),
      HistoryModel(
        id: 'ord-004',
        totalProducts: 2,
        deliveryFee: 15.0,
        price: 60.0,
        date: DateTime(2024, 12, 22, 12, 00),
        driverName: 'Esther Howard',
        driverPhone: '+1 (305) 555 0144',
        driverImageUrl: Assets.dummy.historyItem.keyName,
      ),
      HistoryModel(
        id: 'ord-005',
        totalProducts: 4,
        deliveryFee: 20.0,
        price: 95.0,
        date: DateTime(2024, 12, 22, 14, 45),
        driverName: 'Guy Hawkins',
        driverPhone: '+1 (702) 555 0167',
        driverImageUrl: Assets.dummy.historyItem.keyName,
      ),
      HistoryModel(
        id: 'ord-006',
        totalProducts: 10,
        deliveryFee: 50.0,
        price: 350.0,
        date: DateTime(2024, 12, 23, 09, 15),
        driverName: 'Brooklyn Simmons',
        driverPhone: '+1 (212) 555 0188',
        driverImageUrl: Assets.dummy.historyItem.keyName,
      ),
      HistoryModel(
        id: 'ord-007',
        totalProducts: 2,
        deliveryFee: 12.0,
        price: 40.0,
        date: DateTime(2024, 12, 23, 16, 30),
        driverName: 'Robert Fox',
        driverPhone: '+1 (818) 555 0109',
        driverImageUrl: Assets.dummy.historyItem.keyName,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(AppStrings.orderHistory.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: histories.length,
                itemBuilder: (context, index){

                HistoryModel model = histories[index];

                return HistoryItemWidget(
                  totalProducts: model.totalProducts,
                  deliveryFee: model.deliveryFee,
                  price: model.price,
                  date: model.date.toString(),
                  driverName: model.driverName,
                  driverPhone: model.driverPhone,
                  driverImageUrl: model.driverImageUrl,
                );
            })
          ],
        ),
        ),
      ),
    );
  }
}
