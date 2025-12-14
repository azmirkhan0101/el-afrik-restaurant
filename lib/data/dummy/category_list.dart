import 'package:el_afrik_restaurant/data/models/home/category/category_model.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';

import '../../utils/assets_gen/assets.gen.dart';

class CategoryList {

  static final List<CategoryModel> categories = [
    CategoryModel(imagePath: Assets.dummy.pizza.keyName, categoryName: AppStrings.categories),
    CategoryModel(imagePath: Assets.dummy.pizza.keyName, categoryName: AppStrings.categories),
    CategoryModel(imagePath: Assets.dummy.pizza.keyName, categoryName: AppStrings.categories),
    CategoryModel(imagePath: Assets.dummy.pizza.keyName, categoryName: AppStrings.categories),
    CategoryModel(imagePath: Assets.dummy.pizza.keyName, categoryName: AppStrings.categories),
    CategoryModel(imagePath: Assets.dummy.pizza.keyName, categoryName: AppStrings.categories),
    CategoryModel(imagePath: Assets.dummy.pizza.keyName, categoryName: AppStrings.categories),
    CategoryModel(imagePath: Assets.dummy.pizza.keyName, categoryName: AppStrings.categories),
    CategoryModel(imagePath: Assets.dummy.pizza.keyName, categoryName: AppStrings.categories),
    CategoryModel(imagePath: Assets.dummy.pizza.keyName, categoryName: AppStrings.categories),
  ];
}