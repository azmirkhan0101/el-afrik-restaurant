import 'package:el_afrik_restaurant/data/models/home/top_flavours/top_flavours_model.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/drawer/wishlist/widgets/wishlist_item_widget.dart';
import 'package:el_afrik_restaurant/screens/home/top_flavours/widgets/top_flavour_item.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<TopFlavoursModel> dummyModels = [
      TopFlavoursModel(
        id: 'p1',
        name: 'Cheesy Pan Pizza',
        imageUrl: '',
        weightInfo: '(± 50 gm)',
        currentPrice: 22.00,
        originalPrice: 25.00,
        isFavorite: true,
      ),
      TopFlavoursModel(
        id: 'p2',
        name: 'Pepperoni Feast',
        imageUrl: '',
        weightInfo: '(± 60 gm)',
        currentPrice: 18.50,
        originalPrice: 22.00,
        isFavorite: false,
      ),
      TopFlavoursModel(
        id: 'p3',
        name: 'Veggie Supreme',
        imageUrl: '',
        weightInfo: '(± 45 gm)',
        currentPrice: 20.00,
        originalPrice: 20.00, // No discount example
        isFavorite: false,
      ),
      TopFlavoursModel(
        id: 'p4',
        name: 'BBQ Chicken Blast',
        imageUrl: '',
        weightInfo: '(± 70 gm)',
        currentPrice: 24.00,
        originalPrice: 28.50,
        isFavorite: true,
      ),
      TopFlavoursModel(
        id: 'p1',
        name: 'Cheesy Pan Pizza',
        imageUrl: '',
        weightInfo: '(± 50 gm)',
        currentPrice: 22.00,
        originalPrice: 25.00,
        isFavorite: true,
      ),
      TopFlavoursModel(
        id: 'p2',
        name: 'Pepperoni Feast',
        imageUrl: '',
        weightInfo: '(± 60 gm)',
        currentPrice: 18.50,
        originalPrice: 22.00,
        isFavorite: false,
      ),
      TopFlavoursModel(
        id: 'p3',
        name: 'Veggie Supreme',
        imageUrl: '',
        weightInfo: '(± 45 gm)',
        currentPrice: 20.00,
        originalPrice: 20.00, // No discount example
        isFavorite: false,
      ),
      TopFlavoursModel(
        id: 'p4',
        name: 'BBQ Chicken Blast',
        imageUrl: '',
        weightInfo: '(± 70 gm)',
        currentPrice: 24.00,
        originalPrice: 28.50,
        isFavorite: true,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: TextWidget(
            text: AppStrings.wishList.tr,
          fontSize: 22.sp,
          fontWeight: FontWeight.w800,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            //===================ITEMS GRID=========================//
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: dummyModels.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.w,
                mainAxisExtent: 310.h,
              ),
              itemBuilder: (context, index) {

                final TopFlavoursModel model = dummyModels[index];

                return WishlistItemWidget(
                    imageUrl: model.imageUrl,
                    title: model.name,
                    weightInfo: model.weightInfo,
                    currentPrice: model.currentPrice,
                    originalPrice: model.originalPrice,
                  onItemTap: (){
                      Get.toNamed(AppRoutes.topFlavoursDetailsScreen);
                  },
                );
              },
            ),
            SizedBox( height: 30.h,)
          ],
        ),
        ),
      ),
    );
  }
}
