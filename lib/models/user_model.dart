class UserResponseModel {
  String? token;
  String? expiration;
  UserModel? user;

  List<String>? userRoles;
  int? status;

  UserResponseModel({this.token, this.expiration, this.user, this.userRoles, this.status});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiration = json['expiration'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;

    userRoles = json['userRoles'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expiration'] = this.expiration;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    
    data['userRoles'] = this.userRoles;
    data['status'] = this.status;
    return data;
  }
}

class UserModel {
  int? id;
  String? userName;
  String? email;
  String? imageUrl;
  String? name;
  int? schoolId;

  UserModel({this.id, this.userName, this.email, this.imageUrl, this.name, this.schoolId});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    schoolId = json['schoolId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['imageUrl'] = this.imageUrl;
    data['name'] = this.name;
    data['schoolId'] = this.schoolId;
    return data;
  }
}

