class UserData {
  final String name;
  final String? email;
  final String phoneNumber;
  final String address;
  final String? voen;
  final String activityArea;
  final String interestCategory;
  final String? logo;

  UserData({
    required this.name,
    this.email,
    required this.phoneNumber,
    required this.address,
    this.voen,
    required this.activityArea,
    required this.interestCategory,
    required this.logo,
  });
}
