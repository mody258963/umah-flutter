class Audio {
  int? id;
  String? title;
  String? file_path;
  String? duration;

  Audio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    file_path = json['file_path'];
    duration = json['duration'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['file_path'] = file_path;
    data['duration'] = duration;
    return data;
  }
}
