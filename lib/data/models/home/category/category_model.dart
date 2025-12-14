class CategoryModel {

  final String imagePath;
  final String categoryName;

  CategoryModel({
    required this.imagePath,
    required this.categoryName
  });


  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
        imagePath: json['imagePath'],
        categoryName: json['categoryName']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "imagePath" : imagePath,
      "categoryName" : categoryName
    };
  }


}