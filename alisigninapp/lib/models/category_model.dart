class Category {
  int? id;
  String? title;
  int? productCount;

  Category({this.id, this.title, this.productCount});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    productCount = json['product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['product_count'] = this.productCount;
    return data;
  }
}