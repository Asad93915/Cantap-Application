class GetTutorialsModel {
  int? tutorialId;
  int? type;
  int? sloId;
  Slo? slo;
  int? chapterId;
  Chapter? chapter;
  int? bookId;
  String? caption;
  String? youtubeLink;
  String? description;

  GetTutorialsModel(
      {this.tutorialId,
        this.type,
        this.sloId,
        this.slo,
        this.chapterId,
        this.chapter,
        this.bookId,
        this.caption,
        this.youtubeLink,
        this.description});

  GetTutorialsModel.fromJson(Map<String, dynamic> json) {
    tutorialId = json['tutorialId'];
    type = json['type'];
    sloId = json['sloId'];
    slo = json['slo'] != null ? new Slo.fromJson(json['slo']) : null;
    chapterId = json['chapterId'];
    chapter =
    json['chapter'] != null ? new Chapter.fromJson(json['chapter']) : null;
    bookId = json['bookId'];
    caption = json['caption'];
    youtubeLink = json['youtubeLink'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tutorialId'] = this.tutorialId;
    data['type'] = this.type;
    data['sloId'] = this.sloId;
    if (this.slo != null) {
      data['slo'] = this.slo!.toJson();
    }
    data['chapterId'] = this.chapterId;
    if (this.chapter != null) {
      data['chapter'] = this.chapter!.toJson();
    }
    data['bookId'] = this.bookId;
    data['caption'] = this.caption;
    data['youtubeLink'] = this.youtubeLink;
    data['description'] = this.description;
    return data;
  }
}

class Slo {
  Null? sloId;
  String? no;
  String? name;
  int? chapterId;
  int? bookId;

  Slo({this.sloId, this.no, this.name, this.chapterId, this.bookId});

  Slo.fromJson(Map<String, dynamic> json) {
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

class Chapter {
  Null? chapterId;
  Null? no;
  String? name;
  int? bookId;
  Null? book;
  Null? slOs;

  Chapter(
      {this.chapterId, this.no, this.name, this.bookId, this.book, this.slOs});

  Chapter.fromJson(Map<String, dynamic> json) {
    chapterId = json['chapterId'];
    no = json['no'];
    name = json['name'];
    bookId = json['bookId'];
    book = json['book'];
    slOs = json['slOs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chapterId'] = this.chapterId;
    data['no'] = this.no;
    data['name'] = this.name;
    data['bookId'] = this.bookId;
    data['book'] = this.book;
    data['slOs'] = this.slOs;
    return data;
  }
}
