class CategoryModel {

  final String id;
  final String categoryName;
  final String imagePath;

  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.imagePath,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
        id: json['_id'],
      categoryName: json['categoryName'],
        imagePath: json['image']
    );
  }

}