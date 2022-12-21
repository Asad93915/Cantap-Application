class ClassesListModel {
  List<ClassesList>? result;

  ClassesListModel({this.result});

  ClassesListModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <ClassesList>[];
      json['result'].forEach((v) {
        result!.add(new ClassesList.fromJson(v));
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

class ClassesList {
  int? standardId;
  String? name;

  String? createdDate;


  ClassesList(
      {this.standardId,
        this.name,
        this.createdDate,

      });

  ClassesList.fromJson(Map<String, dynamic> json) {
    standardId = json['standardId'];
    name = json['name'];
    // createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    // updatedBy = json['updatedBy'];
    // updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['standardId'] = this.standardId;
    data['name'] = this.name;
    data['createdDate'] = this.createdDate;

    return data;
  }
}
