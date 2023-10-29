class SubCategoryModel {
  final int status;
  final List<SubCategory> data;

  SubCategoryModel({required this.status, required this.data});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    List<SubCategory> subCategoryList = (json['data'] as List)
        .map((subCategory) => SubCategory.fromJson(subCategory))
        .toList();

    return SubCategoryModel(
      status: json['status'],
      data: subCategoryList,
    );
  }
}

class SubCategory {
  final String id;
  final List<String> subCategory1;

  SubCategory({required this.id, required this.subCategory1});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['_id'],
      subCategory1: (json['subCategory1'] as List)
          .map((item) => item.toString())
          .toList(),
    );
  }
}