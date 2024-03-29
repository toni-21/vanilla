class UserModel {
  String? documentId;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;

  UserModel({
    this.documentId,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map, {String? documentId}) {
    return UserModel(
      documentId: documentId,
      firstName: map['firstName'],
      lastName: map['lastName'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
    );
  }

//for local storage purposes
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'documentId': documentId
    };
  }
}
