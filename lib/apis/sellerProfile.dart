class SellerProfile {
  String message;
  SellerProfileData data;

  SellerProfile({required this.message, required this.data});

  factory SellerProfile.fromJson(Map<String, dynamic> json) {
    return SellerProfile(
      message: json['message'],
      data: SellerProfileData.fromJson(json['data']),
    );
  }
}

class SellerProfileData {
  GSTIN gstin;
  Address address;
  PanCard panCard;
  BankDetails bankDetails;
  List<String> offDays;
  bool isOnline;
  String id;
  String ownerName;
  String phone;
  String businessType;
  String shopName;
  String photo;
  String fssaiImageUrl;
  // List<ShopTimings> shopTimings;
  double marginCharged;
  String shopCategory;

  SellerProfileData({
    required this.gstin,
    required this.address,
    required this.panCard,
    required this.bankDetails,
    required this.offDays,
    required this.isOnline,
    required this.id,
    required this.ownerName,
    required this.phone,
    required this.fssaiImageUrl,
    required this.businessType,
    required this.shopName,
    required this.photo,
    // required this.shopTimings,
    required this.marginCharged,
    required this.shopCategory,
    required landlineNumber,
  });

  factory SellerProfileData.fromJson(Map<String, dynamic> json) {
    return SellerProfileData(
      gstin: GSTIN.fromJson(json['GSTIN']),
      address: Address.fromJson(json['address']),
      panCard: PanCard.fromJson(json['panCard']),
      bankDetails: BankDetails.fromJson(json['bankDetails']),
      offDays: List<String>.from(json['offDays']),
      isOnline: json['isOnline'],
      id: json['_id'],
      ownerName: json['ownerName'],
      phone: json['phone'],
      fssaiImageUrl: json['fssaiImageUrl'] ?? '',
      landlineNumber: json['landlineNumber'] ?? '',
      businessType: json['businessType'] ?? '',
      shopName: json['shopName'] ?? '',
      photo: json['photo'] ?? '',
      // shopTimings: List<ShopTimings>.from(
      //     json['shopTimings'].map((x) => ShopTimings.fromJson(x))),
      marginCharged: json['marginCharged'].toDouble(),
      shopCategory: json['shopCategory'],
    );
  }
}

class GSTIN {
  String gstinNo;
  String gstinImage;

  GSTIN({required this.gstinNo, required this.gstinImage});

  factory GSTIN.fromJson(Map<String, dynamic> json) {
    return GSTIN(
      gstinNo: json['gstinNo'] ?? '',
      gstinImage: json['gstinImage'] ?? 'assets/images/a1.png',
    );
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
      addressLine: json['addressLine'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      pincode: json['pincode'] ?? '',
      location: json['location'] ?? '',
    );
  }
}

class PanCard {
  String panNo;
  String panImage;

  PanCard({required this.panNo, required this.panImage});

  factory PanCard.fromJson(Map<String, dynamic> json) {
    return PanCard(
      panNo: json['panNo'] ?? '',
      panImage: json['panImage'] ?? '',
    );
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
      accountNo: json['accountNo'] ?? '',
      ifscCode: json['ifscCode'] ?? '',
      bankName: json['bankName'] ?? '',
      branchName: json['branchName'] ?? '',
      passbookImage: json['passbookImage'] ?? '',
    );
  }
}

// class ShopTimings {
//   String id;
//   String timing;
//
//   ShopTimings({required this.id, required this.timing});
//
//   factory ShopTimings.fromJson(Map<String, dynamic> json) {
//     return ShopTimings(
//       id: json['_id'],
//       timing: json['0'] +
//           json['1'] +
//           json['2'] +
//           json['3'] +
//           json['4'] +
//           json['5'] +
//           json['6'] +
//           json['7'] +
//           json['8'] +
//           json['9'] +
//           json['10'] +
//           json['11'] +
//           json['12'] +
//           json['13'] +
//           json['14'] +
//           json['15'] +
//           json['16'] +
//           json['17'],
//     );
//   }
// }