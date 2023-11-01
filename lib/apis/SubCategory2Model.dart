class SubCategory2Model {
  final int status;
  final List<String> data;

  SubCategory2Model({required this.status, required this.data});

  factory SubCategory2Model.fromJson(Map<String, dynamic> json) {
    List<String> subCategories = (json['data'] as List)
        .map((item) => item.toString())
        .toList();

    return SubCategory2Model(
      status: json['status'],
      data: subCategories,
    );
  }
}
