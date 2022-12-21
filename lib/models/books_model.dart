class BooksModel {
  int? totalCount;
  List<BooksList>? result;

  BooksModel({this.totalCount, this.result});

  BooksModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['result'] != null) {
      result = <BooksList>[];
      json['result'].forEach((v) {
        result!.add(new BooksList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BooksList {
  int? bookId;
  String? name;
  int? standardId;
  Standard? standard;
  Null? createdBy;
  String? createdDate;
  Null? updatedBy;
  Null? updatedDate;

  BooksList(
      {this.bookId,
        this.name,
        this.standardId,
        this.standard,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  BooksList.fromJson(Map<String, dynamic> json) {
    bookId = json['bookId'];
    name = json['name'];
    standardId = json['standardId'];
    standard = json['standard'] != null
        ? new Standard.fromJson(json['standard'])
        : null;
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookId'] = this.bookId;
    data['name'] = this.name;
    data['standardId'] = this.standardId;
    if (this.standard != null) {
      data['standard'] = this.standard!.toJson();
    }
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}

class Standard {
  int? standardId;
  String? name;
  Null? createdBy;
  String? createdDate;
  Null? updatedBy;
  Null? updatedDate;

  Standard(
      {this.standardId,
        this.name,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  Standard.fromJson(Map<String, dynamic> json) {
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
