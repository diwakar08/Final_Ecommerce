class QuantityPricing {
  int quantityFrom;
  int quantityTo;
  double price;

  QuantityPricing({
    required this.quantityFrom,
    required this.quantityTo,
    required this.price,
  });

  factory QuantityPricing.fromJson(Map<String, dynamic> json) {
    return QuantityPricing(
      quantityFrom: json['quantityFrom'],
      quantityTo: json['quantityTo'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quantityFrom': quantityFrom,
      'quantityTo': quantityTo,
      'price': price,
    };
  }
}

class Product {
  String productName;
  String sellerID;
  String category;
  List<String> image;
  String description;
  String quantityType;
  double mrpPrice;
  double offerPrice;
  String productType;
  bool isReturnable;
  bool replacement;
  int returnPeriod;
  int replacementPeriod;
  bool inStock;
  List<QuantityPricing> quantityPricing;

  Product({
    required this.productName,
    required this.sellerID,
    required this.category,
    required this.image,
    required this.description,
    required this.quantityType,
    required this.mrpPrice,
    required this.offerPrice,
    required this.productType,
    required this.isReturnable,
    required this.replacement,
    required this.returnPeriod,
    required this.replacementPeriod,
    required this.inStock,
    required this.quantityPricing,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['productName'],
      sellerID: json['sellerID'],
      category: json['category'],
      image: List<String>.from(json['image']),
      description: json['description'],
      quantityType: json['quantityType'],
      mrpPrice: json['mrpPrice'].toDouble(),
      offerPrice: json['offerPrice'].toDouble(),
      productType: json['productType'],
      isReturnable: json['returnReplacement']['isReturnable'],
      replacement: json['returnReplacement']['replacement'],
      returnPeriod: json['returnReplacement']['returnPeriod'],
      replacementPeriod: json['returnReplacement']['replacementPeriod'],
      inStock: json['inStock'],
      quantityPricing: List<QuantityPricing>.from(json['quantityPricing'].map((x) => QuantityPricing.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'sellerID': sellerID,
      'category': category,
      'image': image,
      'description': description,
      'quantityType': quantityType,
      'mrpPrice': mrpPrice,
      'offerPrice': offerPrice,
      'productType': productType,
      'returnReplacement': {
        'isReturnable': isReturnable,
        'replacement': replacement,
        'returnPeriod': returnPeriod,
        'replacementPeriod': replacementPeriod,
      },
      'inStock': inStock,
      'quantityPricing': List<dynamic>.from(quantityPricing.map((x) => x.toJson())),
    };
  }
}
