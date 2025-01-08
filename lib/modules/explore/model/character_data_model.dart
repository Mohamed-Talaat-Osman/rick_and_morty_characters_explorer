class CharacterDataModel {
  Info? info;
  List<Results>? results;

  CharacterDataModel({this.info, this.results});

  CharacterDataModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}

class Info {
  int? count;
  int? pages;
  String? next;

  Info({
    this.count,
    this.pages,
    this.next,
  });

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
  }
}

class Results {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;

  Results({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['species'] = species;
    data['type'] = type;
    data['gender'] = gender;
    data['image'] = image;
    return data;
  }
}
