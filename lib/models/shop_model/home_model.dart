// class HomeModel {
//   late bool status;
//   late HomeDataModel data;
//
//   HomeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = HomeDataModel.fromJson(json['data']);
//   }
// }
//
// class HomeDataModel {
//   List<BannerModel> banners =[];
//   List<ProductModel> products = [];
//
//   HomeDataModel.fromJson(Map<String, dynamic> json) {
//     if (json['banners'] != null) {
//       json['banners'].forEach((v) {
//         banners.add(new BannerModel.fromJson(v));
//       });
//       }
//     json['products'].forEach((v) {
//       products.add(new ProductModel.fromJson(v));
//     });
//   }
// }
//
// class BannerModel {
//   late int id;
//   late String image;
//
//   BannerModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//   }
// }
//
// class ProductModel {
//   late int id;
//   late dynamic price;
//   late dynamic old_price;
//   late dynamic discount;
//   late String image;
//   late String name;
//   late bool in_favorites;
//   late bool in_cart;
//
//   ProductModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     price = json['price'];
//     old_price = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     in_favorites = json['in_favorites'];
//     in_cart = json['in_cart'];
//   }
// }





// class HomeModel {
//   bool? status;
//   String? message;
//   HomeDataModel? data;
//
//
//   HomeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new HomeDataModel.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class HomeDataModel {
//   List<BannerModel>? banners;
//   List<ProductModel>? products;
//   String? ad;
//
//   HomeDataModel.fromJson(Map<String, dynamic> json) {
//     if (json['banners'] != null) {
//       banners = <BannerModel>[];
//       json['banners'].forEach((v) {
//         banners!.add(new BannerModel.fromJson(v));
//       });
//     }
//     if (json['products'] != null) {
//       products = <ProductModel>[];
//       json['products'].forEach((v) {
//         products!.add(new ProductModel.fromJson(v));
//       });
//     }
//     ad = json['ad'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.banners != null) {
//       data['banners'] = this.banners!.map((v) => v.toJson()).toList();
//     }
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     data['ad'] = this.ad;
//     return data;
//   }
// }
//
// class BannerModel {
//   int? id;
//   String? image;
//   Null? category;
//   Null? product;
//
//
//   BannerModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//     category = json['category'];
//     product = json['product'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['image'] = this.image;
//     data['category'] = this.category;
//     data['product'] = this.product;
//     return data;
//   }
// }
//
// class ProductModel {
//   int? id;
//   dynamic? price;
//   dynamic? oldPrice;
//   dynamic? discount;
//   String? image;
//   String? name;
//   String? description;
//   List<String>? images;
//   bool? inFavorites;
//   bool? inCart;
//
//
//
//   ProductModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     description = json['description'];
//     images = json['images'].cast<String>();
//     inFavorites = json['in_favorites'];
//     inCart = json['in_cart'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['price'] = this.price;
//     data['old_price'] = this.oldPrice;
//     data['discount'] = this.discount;
//     data['image'] = this.image;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['images'] = this.images;
//     data['in_favorites'] = this.inFavorites;
//     data['in_cart'] = this.inCart;
//     return data;
//   }
// }

class HomeModel {
  bool? status;
  Null? message;
  Data? data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Banners>? banners;
  List<Products>? products;
  String? ad;

  Data({this.banners, this.products, this.ad});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    ad = json['ad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['ad'] = this.ad;
    return data;
  }
}

class Banners {
  int? id;
  String? image;
  Category? category;
  Products? product;

  Banners({this.id, this.image, this.category, this.product});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['product'] = this.product;
    return data;
  }
}

class Category {
  int? id;
  String? image;
  String? name;

  Category({this.id, this.image, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}

class Products {
  int? id;
  dynamic? price;
  dynamic? oldPrice;
  dynamic? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Products(
      {this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description,
        this.images,
        this.inFavorites,
        this.inCart});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['images'] = this.images;
    data['in_favorites'] = this.inFavorites;
    data['in_cart'] = this.inCart;
    return data;
  }
}
