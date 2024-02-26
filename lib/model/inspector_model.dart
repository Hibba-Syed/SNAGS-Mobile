class Inspector {
  Inspector({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.fullName,
    this.profilePicture,});

  Inspector.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    profilePicture = json['profile_picture'];
  }
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? fullName;
  String? profilePicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['full_name'] = fullName;
    map['profile_picture'] = profilePicture;
    return map;
  }

}
