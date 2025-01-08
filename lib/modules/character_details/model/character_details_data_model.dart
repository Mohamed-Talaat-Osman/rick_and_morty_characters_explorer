import 'package:rick_and_morty_characters_explorer/helpers/codable/codable.dart';

class CharacterDetailsDataModel extends Codable {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<String>? episode;

  CharacterDetailsDataModel(
      {this.id,
        this.name,
        this.status,
        this.species,
        this.type,
        this.gender,
        this.origin,
        this.location,
        this.image,
        this.episode});

  CharacterDetailsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin =
    json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    location =
    json['location'] != null ? Origin.fromJson(json['location']) : null;
    image = json['image'];
    episode = json['episode'].cast<String>();
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return CharacterDetailsDataModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
