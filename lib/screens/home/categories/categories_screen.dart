import 'package:el_afrik_restaurant/data/models/home/category/category_model.dart';
import 'package:el_afrik_restaurant/data/models/home/top_flavours/top_flavours_model.dart';
import 'package:el_afrik_restaurant/screens/home/categories/widgets/category_screen_item.dart';
import 'package:el_afrik_restaurant/screens/home/top_flavours/widgets/top_flavour_item.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<CategoryModel> dummyModels = [
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      ),
      CategoryModel(
          imagePath: Assets.dummy.pizza.keyName,
          categoryName: 'Food'
      )




    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: TextWidget(
            text: AppStrings.categories.tr,
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
                crossAxisCount: 4,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 12.w,
                mainAxisExtent: 110.h,
              ),
              itemBuilder: (context, index) {

                final CategoryModel model = dummyModels[index];

                return CategoryScreenItem(
                  imagePath: model.imagePath,
                  itemName: model.categoryName,
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
