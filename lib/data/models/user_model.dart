class UserModel {
  String? user;
  String? password;
  String? email;
  String? id;

  UserModel({this.user, this.password, this.email, this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    password = json['password'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['password'] = password;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
