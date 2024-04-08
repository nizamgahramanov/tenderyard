import 'package:tenderyard/feature/register/domain/entities/user_data.dart';

class UserDataModel extends UserData {
  UserDataModel({
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.address,
    required super.voen,
    required super.activityArea,
    required super.interestCategory,
    required super.logo,
  });
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      voen: json['voen'],
      activityArea: json['activityArea'],
      interestCategory: json['interestCategory'],
      logo: json['logo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'voen': voen,
      'activityArea': activityArea,
      'interestCategory': interestCategory,
      'logo': logo,
    };
  }
}
