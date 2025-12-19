import 'package:el_afrik_restaurant/data/models/home/top_flavours/top_flavours_model.dart';
import 'package:el_afrik_restaurant/screens/home/top_flavours/widgets/top_flavour_item.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class TopFlavoursScreen extends StatelessWidget {
  const TopFlavoursScreen({super.key});

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
            text: AppStrings.elAfrikTopFlavours.tr,
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
            //===================SEARCH - FILTER=========================//
            Row(
                spacing: 6.w,
                children: [
                  Expanded(
                    child: SearchBar(
                      constraints: BoxConstraints(maxHeight: 55.h, minHeight: 55.h),
                      padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 10),
                      ),
                      hintText: AppStrings.search.tr,
                      hintStyle: WidgetStatePropertyAll(TextStyle(color: Colors.grey)),
                      backgroundColor: WidgetStateProperty.all(Colors.transparent),
                      elevation: WidgetStateProperty.all(0),
                      leading: SvgPicture.asset(Assets.icons.search),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.w),
                          side: BorderSide(color: Colors.grey, width: 1.w),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 56.h,
                    padding: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.greenPrimary,
                    ),
                    child: SvgPicture.asset(Assets.icons.filter,
                    ),
                  )
                ]
            ),
            SizedBox(height: 20.h,),
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

                return TopFlavourItem(
                    imageUrl: model.imageUrl,
                    title: model.name,
                    weightInfo: model.weightInfo,
                    currentPrice: model.currentPrice,
                    originalPrice: model.originalPrice
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
