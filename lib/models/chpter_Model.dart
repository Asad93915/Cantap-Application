class ChapterModel {
  int? totalCount;
  List<ChaptersList>? result;

  ChapterModel({this.totalCount, this.result});

  ChapterModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['result'] != null) {
      result = <ChaptersList>[];
      json['result'].forEach((v) {
        result!.add(new ChaptersList.fromJson(v));
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

class ChaptersList {
  int? chapterId;
  String? no;
  String? name;
  int? bookId;
  Book? book;
  List<SlOs>? slOs;

  ChaptersList(
      {this.chapterId, this.no, this.name, this.bookId, this.book, this.slOs});

  ChaptersList.fromJson(Map<String, dynamic> json) {
    chapterId = json['chapterId'];
    no = json['no'];
    name = json['name'];
    bookId = json['bookId'];
    book = json['book'] != null ? new Book.fromJson(json['book']) : null;
    if (json['slOs'] != null) {
      slOs = <SlOs>[];
      json['slOs'].forEach((v) {
        slOs!.add(new SlOs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chapterId'] = this.chapterId;
    data['no'] = this.no;
    data['name'] = this.name;
    data['bookId'] = this.bookId;
    if (this.book != null) {
      data['book'] = this.book!.toJson();
    }
    if (this.slOs != null) {
      data['slOs'] = this.slOs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Book {
  int? bookId;
  String? name;
  int? standardId;
  Standard? standard;

  Book({this.bookId, this.name, this.standardId, this.standard});

  Book.fromJson(Map<String, dynamic> json) {
    bookId = json['bookId'];
    name = json['name'];
    standardId = json['standardId'];
    standard = json['standard'] != null
        ? new Standard.fromJson(json['standard'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookId'] = this.bookId;
    data['name'] = this.name;
    data['standardId'] = this.standardId;
    if (this.standard != null) {
      data['standard'] = this.standard!.toJson();
    }
    return data;
  }
}

class Standard {
  int? standardId;
  String? name;

  Standard({this.standardId, this.name});

  Standard.fromJson(Map<String, dynamic> json) {
    standardId = json['standardId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['standardId'] = this.standardId;
    data['name'] = this.name;
    return data;
  }
}

class SlOs {
  int? sloId;
  String? no;
  String? name;
  int? chapterId;
  int? bookId;

  SlOs({this.sloId, this.no, this.name, this.chapterId, this.bookId});

  SlOs.fromJson(Map<String, dynamic> json) {
    sloId = json['sloId'];
    no = json['no'];
    name = json['name'];
    chapterId = json['chapterId'];
    bookId = json['bookId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sloId'] = this.sloId;
    data['no'] = this.no;
    data['name'] = this.name;
    data['chapterId'] = this.chapterId;
    data['bookId'] = this.bookId;
    return data;
  }
}
