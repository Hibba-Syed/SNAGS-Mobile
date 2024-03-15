class ImageModel {
  ImageModel({
    this.id,
    this.path,
    this.name,
    this.size,
    this.createdAt,
    this.updatedAt,
  });

  ImageModel.fromJson(dynamic json) {
    id = json['id'];
    path = json['path'];
    name = json['name'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? path;
  String? name;
  int? size;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['path'] = path;
    map['name'] = name;
    map['size'] = size;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
