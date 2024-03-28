class UserModel {
  String? uid;
  String? name;
  String? phoneNumber;
  String? email;

  UserModel({
    this.uid,
    this.name,
    this.phoneNumber,
    this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'uid': uid
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
    );
  }
}
