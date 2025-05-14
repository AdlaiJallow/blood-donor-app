class UserModel {
  final String? id;
  // final String imagePath;
  final String name;
  final String email;
  final String location;
  final String phoneNumber;
  final String bloodType;

  UserModel(
      {this.id,
      // required this.imagePath,
      required this.name,
      required this.email,
      required this.location,
      required this.phoneNumber,
      required this.bloodType});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "FullName": name,
      "Email": email,
      "Location": location,
      "Phone": phoneNumber,
      "BloodType": bloodType
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json["FullName"] ?? "",
        email: json["email"] ?? "",
        location: json["location"] ?? "",
        phoneNumber: json["phone"] ?? "",
        bloodType: json["bloodType"] ?? "");
  }
}
