class UserModel {
  final String? id;
  final String imagePath;
  final String name;
  final String email;
  final String location;
  final String phoneNumber;
  final String bloodType;

  UserModel(
      {this.id,
      required this.imagePath,
      required this.name,
      required this.email,
      required this.location,
      required this.phoneNumber,
      required this.bloodType});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "imagePath": imagePath,
      "name": name,
      "email": email,
      "location": location,
      "phoneNumber": phoneNumber,
      "bloodType": bloodType
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        location: json["location"] ?? "",
        phoneNumber: json["phoneNumber"] ?? "",
        bloodType: json["bloodType"] ?? "",
        imagePath: json['imagePath'] ?? "");
  }
}
