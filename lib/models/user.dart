class User {
  int? id;
  String? name;
  String? dob;
  String? gender;
  String? phone;
  String? email;
  String? address;
  String? symptoms;

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['name'] = name!;
    mapping['dob'] = dob!;
    mapping['gender'] = gender!;
    mapping['phone'] = phone!;
    mapping['email'] = email!;
    mapping['address'] = address!;
    mapping['symptoms'] = symptoms!;
    return mapping;
  }
}