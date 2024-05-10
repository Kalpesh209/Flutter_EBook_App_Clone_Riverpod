class MetaData {
  int? total;
  int? perPage;

  MetaData({this.total, this.perPage});

  MetaData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['perPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['perPage'] = perPage;
    return data;
  }
}