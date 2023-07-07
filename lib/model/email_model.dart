class EmailModel {
  String? id;
  String? accountId;
  String? msgid;
  Map<String, dynamic>? from;
  List<Map<String, dynamic>>? to;
  String? subject;
  String? intro;
  bool? seen;
  bool? isDeleted;
  bool? hasAttachments;
  int? size;
  String? downloadUrl;
  String? createdAt;
  String? updatedAt;

  EmailModel({
    this.id,
    this.accountId,
    this.msgid,
    this.from,
    this.to,
    this.subject,
    this.intro,
    this.seen,
    this.isDeleted,
    this.hasAttachments,
    this.size,
    this.downloadUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return EmailModel(
      id: json['id'],
      accountId: json['accountId'],
      msgid: json['msgid'],
      from: json['from'],
      to: List<Map<String, dynamic>>.from(json['to']),
      subject: json['subject'],
      intro: json['intro'],
      seen: json['seen'],
      isDeleted: json['isDeleted'],
      hasAttachments: json['hasAttachments'],
      size: json['size'],
      downloadUrl: json['downloadUrl'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}