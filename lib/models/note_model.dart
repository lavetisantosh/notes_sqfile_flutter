class Notes {
  late int id;
  String title;
  String? description;
  int priority;
  String date;

  Notes(this.title, this.priority, this.date, [this.description]);

  Notes.withId(this.id, this.title, this.priority, this.date,
      [this.description]);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['priority'] = priority;
    map['date'] = date;

    return map;
  }

  factory Notes.fromMapObject(Map<String, dynamic> map) =>
      Notes(map['title'], map['priority'], map['date'], map['description']);
}
