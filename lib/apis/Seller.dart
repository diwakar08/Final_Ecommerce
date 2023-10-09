class Seller {
  String ownerName;
  String password;
  String phone;
  String businessType;
  String shopName;
  GSTIN gstin;
  String photo;
  Address address;
  List<String> offDays;
  List<ShopTiming> shopTimings;
  bool isOnline;
  PanCard panCard;
  BankDetails bankDetails;
  double marginCharged;
  String shopCategory;

  Seller({
    required this.ownerName,
    required this.password,
    required this.phone,
    required this.businessType,
    required this.shopName,
    required this.gstin,
    required this.photo,
    required this.address,
    required this.offDays,
    required this.shopTimings,
    required this.isOnline,
    required this.panCard,
    required this.bankDetails,
    required this.marginCharged,
    required this.shopCategory,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      ownerName: json['ownerName'],
      password: json['password'],
      phone: json['phone'],
      businessType: json['businessType'],
      shopName: json['shopName'],
      gstin: GSTIN.fromJson(json['GSTIN']),
      photo: json['photo'],
      address: Address.fromJson(json['address']),
      offDays: List<String>.from(json['offDays']),
      shopTimings: List<ShopTiming>.from(json['shopTimings'].map((x) => ShopTiming.fromJson(x))),
      isOnline: json['isOnline'],
      panCard: PanCard.fromJson(json['panCard']),
      bankDetails: BankDetails.fromJson(json['bankDetails']),
      marginCharged: json['marginCharged'].toDouble(),
      shopCategory: json['shopCategory'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ownerName': ownerName,
      'password': password,
      'phone': phone,
      'businessType': businessType,
      'shopName': shopName,
      'GSTIN': gstin.toJson(),
      'photo': photo,
      'address': address.toJson(),
      'offDays': offDays,
      'shopTimings': List<dynamic>.from(shopTimings.map((x) => x.toJson())),
      'isOnline': isOnline,
      'panCard': panCard.toJson(),
      'bankDetails': bankDetails.toJson(),
      'marginCharged': marginCharged,
      'shopCategory': shopCategory,
    };
  }
}

class GSTIN {
  String gstinNo;
  String gstinImage;

  GSTIN({
    required this.gstinNo,
    required this.gstinImage,
  });

  factory GSTIN.fromJson(Map<String, dynamic> json) {
    return GSTIN(
      gstinNo: json['gstinNo'],
      gstinImage: json['gstinImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gstinNo': gstinNo,
      'gstinImage': gstinImage,
    };
  }
}

class Address {
  String addressLine;
  String city;
  String state;
  String pincode;
  String location;

  Address({
    required this.addressLine,
    required this.city,
    required this.state,
    required this.pincode,
    required this.location,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressLine: json['addressLine'],
      city: json['city'],
      state: json['state'],
      pincode: json['pincode'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addressLine': addressLine,
      'city': city,
      'state': state,
      'pincode': pincode,
      'location': location,
    };
  }
}

class ShopTiming {
  String day;
  DateTime openingTime;
  DateTime closingTime;

  ShopTiming({
    required this.day,
    required this.openingTime,
    required this.closingTime,
  });

  factory ShopTiming.fromJson(Map<String, dynamic> json) {
    return ShopTiming(
      day: json['day'],
      openingTime: DateTime.parse(json['openingTime']),
      closingTime: DateTime.parse(json['closingTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'openingTime': openingTime.toIso8601String(),
      'closingTime': closingTime.toIso8601String(),
    };
  }
}

class PanCard {
  String panNo;
  String panImage;

  PanCard({
    required this.panNo,
    required this.panImage,
  });

  factory PanCard.fromJson(Map<String, dynamic> json) {
    return PanCard(
      panNo: json['panNo'],
      panImage: json['panImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'panNo': panNo,
      'panImage': panImage,
    };
  }
}

class BankDetails {
  String accountNo;
  String ifscCode;
  String bankName;
  String branchName;
  String passbookImage;

  BankDetails({
    required this.accountNo,
    required this.ifscCode,
    required this.bankName,
    required this.branchName,
    required this.passbookImage,
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) {
    return BankDetails(
      accountNo: json['accountNo'],
      ifscCode: json['ifscCode'],
      bankName: json['bankName'],
      branchName: json['branchName'],
      passbookImage: json['passbookImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountNo': accountNo,
      'ifscCode': ifscCode,
      'bankName': bankName,
      'branchName': branchName,
      'passbookImage': passbookImage,
    };
  }
}
