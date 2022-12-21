class ClassLogModel {
  int? schoolStandardId;
  int? schoolId;
  String? userName;
  String? password;
  int? standardId;
  bool? isActive;


  ClassLogModel(
      {this.schoolStandardId,
        this.schoolId,
        this.userName,
        this.password,
        this.standardId,
        this.isActive,
        });

  ClassLogModel.fromJson(Map<String, dynamic> json) {
    schoolStandardId = json['schoolStandardId'];
    schoolId = json['schoolId'];
    userName = json['userName'];
    password = json['password'];

    isActive = json['isActive'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolStandardId'] = this.schoolStandardId;
    data['schoolId'] = this.schoolId;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['standardId'] = this.standardId;
    data['isActive'] = this.isActive;

    return data;
  }
}


