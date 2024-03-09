class Product {
  int? id;
  String? title;
  String? description;
  String? slug;
  double? weight;
  int? productType;
  int? numInBox;
  int? user;
  String? containerType;
  int? inventory;
  double? price;
  int? category;
  List<Images>? images;

  Product(
      {this.id,
        this.title,
        this.description,
        this.slug,
        this.weight,
        this.productType,
        this.numInBox,
        this.user,
        this.containerType,
        this.inventory,
        this.price,
        this.category,
        this.images});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    slug = json['slug'];
    weight = json['weight'];
    productType = json['productType'];
    numInBox = json['num_in_box'];
    user = json['user'];
    containerType = json['container_type'];
    inventory = json['inventory'];
    price = json['price'];
    category = json['category'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['slug'] = this.slug;
    data['weight'] = this.weight;
    data['productType'] = this.productType;
    data['num_in_box'] = this.numInBox;
    data['user'] = this.user;
    data['container_type'] = this.containerType;
    data['inventory'] = this.inventory;
    data['price'] = this.price;
    data['category'] = this.category;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  String? image;

  Images({this.id, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
