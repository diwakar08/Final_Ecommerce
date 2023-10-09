class Payment {
  String paymentID;
  String paymentMode;
  String paymentStatus;
  DateTime paymentDate;
  double paymentAmount;

  Payment({
    required this.paymentID,
    required this.paymentMode,
    required this.paymentStatus,
    required this.paymentDate,
    required this.paymentAmount,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentID: json['paymentID'],
      paymentMode: json['paymentMode'],
      paymentStatus: json['paymentStatus'],
      paymentDate: DateTime.parse(json['paymentDate']),
      paymentAmount: json['paymentAmount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paymentID': paymentID,
      'paymentMode': paymentMode,
      'paymentStatus': paymentStatus,
      'paymentDate': paymentDate.toIso8601String(),
      'paymentAmount': paymentAmount,
    };
  }
}

class Order {
  String orderID;
  String customerID; // Assuming it's a string for simplicity
  String sellerID; // Assuming it's a string for simplicity
  List<String> productList; // List of product IDs
  Map<String, dynamic> shippedBy;
  String orderStatus;
  Payment payment;

  Order({
    required this.orderID,
    required this.customerID,
    required this.sellerID,
    required this.productList,
    required this.shippedBy,
    required this.orderStatus,
    required this.payment,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderID: json['orderID'],
      customerID: json['customerID'],
      sellerID: json['sellerID'],
      productList: List<String>.from(json['productList']),
      shippedBy: json['shippedBy'],
      orderStatus: json['orderStatus'],
      payment: Payment.fromJson(json['payment']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderID': orderID,
      'customerID': customerID,
      'sellerID': sellerID,
      'productList': productList,
      'shippedBy': shippedBy,
      'orderStatus': orderStatus,
      'payment': payment.toJson(),
    };
  }
}
