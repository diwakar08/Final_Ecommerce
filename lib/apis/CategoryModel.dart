class CategoryModel {
  final int status;
  final List<Category> data;

  CategoryModel({required this.status, required this.data});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    List<Category> categoryList = (json['data'] as List)
        .map((category) => Category.fromJson(category))
        .toList();

    return CategoryModel(
      status: json['status'],
      data: categoryList,
    );
  }
}

class Category {
  final String? id;
  final List<String> category;

  Category({this.id, required this.category});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      category:
          (json['category'] as List).map((item) => item.toString()).toList(),
    );
  }
}
