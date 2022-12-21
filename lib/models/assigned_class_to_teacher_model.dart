class GetAssignedClassToTeacherModel {
  int? teacherId;
  int? standardId;
  String? name;
  bool? isSelected;
  int? teachersClassesId;

  GetAssignedClassToTeacherModel(
      {this.teacherId,
        this.standardId,
        this.name,
        this.isSelected,
        this.teachersClassesId});

  GetAssignedClassToTeacherModel.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacherId'];
    standardId = json['standardId'];
    name = json['name'];
    isSelected = json['isSelected'];
    teachersClassesId = json['teachersClassesId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teacherId'] = this.teacherId;
    data['standardId'] = this.standardId;
    data['name'] = this.name;
    data['isSelected'] = this.isSelected;
    data['teachersClassesId'] = this.teachersClassesId;
    return data;
  }
}
