class Association {
  Association({
    this.id,
    this.name,
    this.companyId,});

  Association.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    companyId = json['company_id'];
  }
  int? id;
  String? name;
  int? companyId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['company_id'] = companyId;
    return map;
  }

}