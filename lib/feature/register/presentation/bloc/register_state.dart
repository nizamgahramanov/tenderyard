part of 'bloc.dart';

class RegisterState {
  final ApiResponse? apiResponse;
  final int selectedIndex;
  final String name;
  final String? email;
  final String phoneNumber;
  final String address;
  final String? voen;
  final String activityArea;
  final String interestCategory;
  final String? logo;

  RegisterState({
    this.apiResponse,
    this.selectedIndex = -1,
    this.name = '',
    this.email = '',
    this.phoneNumber = '',
    this.address = '',
    this.voen = '',
    this.activityArea = '',
    this.interestCategory = '',
    this.logo = '',
  });

  RegisterState copyWith({
    ApiResponse? apiResponse,
    int? selectedIndex,
    String? name,
    String? email,
    String? phoneNumber,
    String? address,
    String? voen,
    String? activityArea,
    String? interestCategory,
    String? logo,
  }) {
    return RegisterState(
      apiResponse: apiResponse ?? this.apiResponse,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      voen: voen ?? this.voen,
      activityArea: activityArea ?? this.activityArea,
      interestCategory: interestCategory ?? this.interestCategory,
      logo: logo ?? this.logo,
    );
  }
}
