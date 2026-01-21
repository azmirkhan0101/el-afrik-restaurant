import 'package:el_afrik_restaurant/data/models/order/ordered_item/ordered_item_model.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/order/order_details/widgets/order_details_item.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<OrderedItemModel> orderedList = [
      OrderedItemModel(
        imageUrl: Assets.dummy.orderdItem.keyName,
        name: 'Red Apple',
        quantity: '1 kg',
        price: '3.50',
        point: '10',
      ),
      OrderedItemModel(
        imageUrl: Assets.dummy.orderdItem.keyName,
        name: 'Red Apple',
        quantity: '1 kg',
        price: '3.50',
        point: '10',
      ),
      OrderedItemModel(
        imageUrl: Assets.dummy.orderdItem.keyName,
        name: 'Red Apple',
        quantity: '1 kg',
        price: '3.50',
        point: '10',
      ),
      OrderedItemModel(
        imageUrl: Assets.dummy.orderdItem.keyName,
        name: 'Red Apple',
        quantity: '1 kg',
        price: '3.50',
        point: '10',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: TextWidget(text: AppStrings.order.tr,
        fontSize: 22,
          fontColor: AppColors.black,
        ),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: orderedList.length,
                shrinkWrap: true,
                itemBuilder: (context, index){

              OrderedItemModel model = orderedList[index];

              return OrderDetailsItem(
                  imageUrl: model.imageUrl,
                  name: model.name,
                  quantity: model.quantity,
                  price: model.price,
                  point: model.point
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: AppStrings.subTotal.tr),
                TextWidget(text: "\$715"),
              ],
            ),
            SizedBox(height: 5.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: AppStrings.deliveryFee.tr),
                TextWidget(text: "\$15"),
              ],
            ),
            Divider(
              thickness: 2,
              color: AppColors.greyB8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: AppStrings.total.tr, fontColor: Colors.blue, fontSize: 20, fontWeight: FontWeight.w700,),
                TextWidget(text: "\$730", fontColor: Colors.blue, fontSize: 20, fontWeight: FontWeight.w700,),
              ],
            ),
            Center(
              child: TextButton(onPressed: (){
                Get.toNamed(AppRoutes.trackRiderScreen);
            }, child: TextWidget(
                text: AppStrings.viewMapRoute.tr,
            fontColor: AppColors.orange,
            )),),
            SizedBox(height: 25.h,),
            ButtonWidget(label: AppStrings.complete.tr,
            backgroundColor: AppColors.greenPrimary,
            buttonWidth: double.infinity,
              onPressed: (){
              Get.toNamed(AppRoutes.orderCompletedScreen);
              },
            ),
            SizedBox(height: 35.h,)
          ],
        ),
        ),
      ),
    );
  }
}
