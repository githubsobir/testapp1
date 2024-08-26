class DataFreeExams {
  DataFreeExams({
      this.userId,
      this.bookNum,
      this.questionId,
      this.isFavorite,
      this.userAns,
      this.orderId,
      this.scienceId,
      this.name,
      this.nameRu,
      this.nameQq,
      this.svgUrl,
      this.pdfUrl,
  });

  dynamic userId;
  dynamic bookNum;
  dynamic questionId;
  dynamic isFavorite;
  dynamic userAns;
  dynamic orderId;
  dynamic scienceId;
  dynamic name;
  dynamic nameRu;
  dynamic nameQq;
  dynamic svgUrl;
  dynamic pdfUrl;

  factory DataFreeExams.fromJson(Map<String, dynamic> json) => DataFreeExams(
    userId: json["user_id"],
    bookNum: json["book_num"],
    questionId: json["question_id"],
    isFavorite: json["is_favorite"],
    userAns: json["user_ans"],
    orderId: json["order_id"],
    scienceId: json["science_id"],
    name: json["name"],
    nameRu: json["name_ru"],
    nameQq: json["name_qq"],
    svgUrl: json["svg_url"],
    pdfUrl: json["pdf_url"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "book_num": bookNum,
    "question_id": questionId,
    "is_favorite": isFavorite,
    "user_ans": userAns,
    "order_id": orderId,
    "science_id": scienceId,
    "name": name,
    "name_ru": nameRu,
    "name_qq": nameQq,
    "svg_url": svgUrl,
    "pdf_url": pdfUrl,
  };
}



