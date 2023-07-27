class RegistrationModel {
  RegistrationModel({
    this.name,
    this.email,
    this.password,
    this.gender,
    this.dob,
    this.city,
  });
  String? name;
  String? email;
  String? password;
  String? gender;
  String? dob;
  String? city;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'dob': dob,
      'city': city,
    };
  }
  RegistrationModel.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.email = map['email'];
    this.password = map['password'];
    this.gender = map['gender'];
    this.dob = map['dob'];
    this.city = map['city'];
  }
}