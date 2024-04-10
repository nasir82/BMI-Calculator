class PlanListModel {
  int? id;
  String? title;
  String? time;
  String? details;

  PlanListModel({this.id, this.title, this.time, this.details});

  factory PlanListModel.fromMap(Map<String, dynamic> json) {
    return PlanListModel(
      id: json['id'], title: json["title"], time: json["time"],details: json["details"]);  
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'time': time,
      'details': details,
    };
  }
}
