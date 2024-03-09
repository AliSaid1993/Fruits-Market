class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? phone;

  UserModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.username,
        this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['username'] = this.username;
    data['phone'] = this.phone;
    return data;
  }
}