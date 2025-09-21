
class ProductModel {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  ProductModel({this.products, this.total, this.skip, this.limit});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if(json["products"] is List) {
      products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    }
    if(json["total"] is num) {
      total = (json["total"] as num).toInt();
    }
    if(json["skip"] is num) {
      skip = (json["skip"] as num).toInt();
    }
    if(json["limit"] is num) {
      limit = (json["limit"] as num).toInt();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(products != null) {
      data["products"] = products?.map((e) => e.toJson()).toList();
    }
    data["total"] = total;
    data["skip"] = skip;
    data["limit"] = limit;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Products({this.id, this.title, this.description, this.category, this.price, this.discountPercentage, this.rating, this.stock, this.tags, this.brand, this.sku, this.weight, this.dimensions, this.warrantyInformation, this.shippingInformation, this.availabilityStatus, this.reviews, this.returnPolicy, this.minimumOrderQuantity, this.meta, this.images, this.thumbnail});

  Products.fromJson(Map<String, dynamic> json) {
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["category"] is String) {
      category = json["category"];
    }
    if(json["price"] is num) {
      price = (json["price"] as num).toDouble();
    }
    if(json["discountPercentage"] is num) {
      discountPercentage = (json["discountPercentage"] as num).toDouble();
    }
    if(json["rating"] is num) {
      rating = (json["rating"] as num).toDouble();
    }
    if(json["stock"] is num) {
      stock = (json["stock"] as num).toInt();
    }
    if(json["tags"] is List) {
      tags = json["tags"] == null ? null : List<String>.from(json["tags"]);
    }
    if(json["brand"] is String) {
      brand = json["brand"];
    }
    if(json["sku"] is String) {
      sku = json["sku"];
    }
    if(json["weight"] is num) {
      weight = (json["weight"] as num).toInt();
    }
    if(json["dimensions"] is Map) {
      dimensions = json["dimensions"] == null ? null : Dimensions.fromJson(json["dimensions"]);
    }
    if(json["warrantyInformation"] is String) {
      warrantyInformation = json["warrantyInformation"];
    }
    if(json["shippingInformation"] is String) {
      shippingInformation = json["shippingInformation"];
    }
    if(json["availabilityStatus"] is String) {
      availabilityStatus = json["availabilityStatus"];
    }
    if(json["reviews"] is List) {
      reviews = json["reviews"] == null ? null : (json["reviews"] as List).map((e) => Reviews.fromJson(e)).toList();
    }
    if(json["returnPolicy"] is String) {
      returnPolicy = json["returnPolicy"];
    }
    if(json["minimumOrderQuantity"] is num) {
      minimumOrderQuantity = (json["minimumOrderQuantity"] as num).toInt();
    }
    if(json["meta"] is Map) {
      meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    }
    if(json["images"] is List) {
      images = json["images"] == null ? null : List<String>.from(json["images"]);
    }
    if(json["thumbnail"] is String) {
      thumbnail = json["thumbnail"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["description"] = description;
    data["category"] = category;
    data["price"] = price;
    data["discountPercentage"] = discountPercentage;
    data["rating"] = rating;
    data["stock"] = stock;
    if(tags != null) {
      data["tags"] = tags;
    }
    data["brand"] = brand;
    data["sku"] = sku;
    data["weight"] = weight;
    if(dimensions != null) {
      data["dimensions"] = dimensions?.toJson();
    }
    data["warrantyInformation"] = warrantyInformation;
    data["shippingInformation"] = shippingInformation;
    data["availabilityStatus"] = availabilityStatus;
    if(reviews != null) {
      data["reviews"] = reviews?.map((e) => e.toJson()).toList();
    }
    data["returnPolicy"] = returnPolicy;
    data["minimumOrderQuantity"] = minimumOrderQuantity;
    if(meta != null) {
      data["meta"] = meta?.toJson();
    }
    if(images != null) {
      data["images"] = images;
    }
    data["thumbnail"] = thumbnail;
    return data;
  }
}

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  Meta.fromJson(Map<String, dynamic> json) {
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["barcode"] is String) {
      barcode = json["barcode"];
    }
    if(json["qrCode"] is String) {
      qrCode = json["qrCode"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["barcode"] = barcode;
    data["qrCode"] = qrCode;
    return data;
  }
}

class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews({this.rating, this.comment, this.date, this.reviewerName, this.reviewerEmail});

  Reviews.fromJson(Map<String, dynamic> json) {
    if(json["rating"] is num) {
      rating = (json["rating"] as num).toInt();
    }
    if(json["comment"] is String) {
      comment = json["comment"];
    }
    if(json["date"] is String) {
      date = json["date"];
    }
    if(json["reviewerName"] is String) {
      reviewerName = json["reviewerName"];
    }
    if(json["reviewerEmail"] is String) {
      reviewerEmail = json["reviewerEmail"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["rating"] = rating;
    data["comment"] = comment;
    data["date"] = date;
    data["reviewerName"] = reviewerName;
    data["reviewerEmail"] = reviewerEmail;
    return data;
  }
}

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  Dimensions.fromJson(Map<String, dynamic> json) {
    if(json["width"] is num) {
      width = (json["width"] as num).toDouble();
    }
    if(json["height"] is num) {
      height = (json["height"] as num).toDouble();
    }
    if(json["depth"] is num) {
      depth = (json["depth"] as num).toDouble();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["width"] = width;
    data["height"] = height;
    data["depth"] = depth;
    return data;
  }
}