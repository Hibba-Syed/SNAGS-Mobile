class Comment {
  Comment({
    this.id,
    this.comment,
    this.commenter,
    this.createdAt,
    this.updatedAt,});

  Comment.fromJson(dynamic json) {
    id = json['id'];
    comment = json['comment'];
    commenter = json['commenter'] != null ? Commenter.fromJson(json['commenter']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? comment;
  Commenter? commenter;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['comment'] = comment;
    if (commenter != null) {
      map['commenter'] = commenter?.toJson();
    }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Commenter {
  Commenter({
    this.id,
    this.name,
    this.type,
    this.profilePicture,});

  Commenter.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    profilePicture = json['profile_picture'];
  }
  int? id;
  String? name;
  String? type;
  String? profilePicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    map['profile_picture'] = profilePicture;
    return map;
  }

}