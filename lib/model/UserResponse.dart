class UserResponse {

  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? gender;


  UserResponse({
      this.id,
      this.firstName, 
      this.lastName, 
      this.phone, 
      this.email, 
      this.gender,});

  UserResponse.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['phone'] = phone;
    map['email'] = email;
    map['gender'] = gender;
    return map;
  }

}