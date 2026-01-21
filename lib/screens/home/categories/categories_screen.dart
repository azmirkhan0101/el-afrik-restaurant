import 'package:el_afrik_restaurant/controllers/home/home_controller.dart';
import 'package:el_afrik_restaurant/data/models/home/category/category_model.dart';
import 'package:el_afrik_restaurant/screens/home/categories/widgets/category_screen_item.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes/app_routes.dart';
import '../../../utils/assets_gen/assets.gen.dart';

class CategoriesScreen extends StatelessWidget {

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {

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
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: AppColors.greenPrimary,
        onRefresh: () async{
          controller.getCategoryList();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Obx((){
            if( controller.isCategoryLoading.value ){
              return SizedBox(height: MediaQuery.of(context).size.height*0.7, child: Center( child: CircularProgressIndicator(color: AppColors.greenPrimary,),));
            }else{
              return mainBody(context);
            }
          }),
        ),
      ),
    );
  }

  //MAIN BODY
mainBody(BuildContext context){
    return Padding(padding: EdgeInsets.symmetric(horizontal: 18.w),
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
          Obx((){
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: controller.categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 12.w,
                mainAxisExtent: 110.h,
              ),
              itemBuilder: (context, index) {

                final CategoryModel model = controller.categories[index];

                return CategoryScreenItem(
                  imagePath: model.imagePath,
                  categoryName: model.categoryName,
                  onClick: (){
                    controller.getCategoryProducts(categoryId: model.id);
                    Get.toNamed(AppRoutes.categoryProductsScreen, arguments: model);
                  },
                );
              },
            );
          }),
          SizedBox( height: 30.h,)
        ],
      ),
    );
}
}
