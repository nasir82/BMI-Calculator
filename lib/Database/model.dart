class ListModel {
  int? id;
  String? name;
  String? time;
  String? diff;

  ListModel({this.id, this.name, this.time, this.diff});

  factory ListModel.fromMap(Map<String, dynamic> json) {
    return ListModel(
      id: json['id'], name: json["name"], diff: json["diff"],time: json["time"]);  
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'time': time,
      'diff': diff,
    };
  }
}
