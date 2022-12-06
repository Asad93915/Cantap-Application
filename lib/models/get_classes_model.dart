class GetClassesModel {
  List<GetClass>? result;

  GetClassesModel({this.result});

  GetClassesModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetClass>[];
      json['result'].forEach((v) {
        result!.add(new GetClass.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetClass {
  int? standardId;
  String? name;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  GetClass(
      {this.standardId,
        this.name,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  GetClass.fromJson(Map<String, dynamic> json) {
    standardId = json['standardId'];
    name = json['name'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['standardId'] = this.standardId;
    data['name'] = this.name;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
