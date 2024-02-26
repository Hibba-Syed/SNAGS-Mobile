import 'package:iskaan_inspections_mobile/model/company_model.dart';

class Association {
  Association({
    this.id,
    this.name,
    this.companyId,
    this.company,
    this.unitsCount,
    this.activeInspectionsCount,
    this.activeSnagsCount,
  });

  Association.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    companyId = json['company_id'];
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
    unitsCount = json['units_count'];
    activeInspectionsCount = json['active_inspections_count'];
    activeSnagsCount = json['active_snags_count'];
  }
  int? id;
  String? name;
  int? companyId;
  Company? company;
  int? unitsCount;
  int? activeInspectionsCount;
  int? activeSnagsCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['company_id'] = companyId;
    if (company != null) {
      map['company'] = company?.toJson();
    }
    map['units_count'] = unitsCount;
    map['active_inspections_count'] = activeInspectionsCount;
    map['active_snags_count'] = activeSnagsCount;
    return map;
  }
}
