import 'package:json_annotation/json_annotation.dart';

// import 'package:json_serializable/builder.dart';

part 'marvel_model.g.dart';

@JsonSerializable(createToJson: false)
class Results {
  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  Series? series;
  String? resourceURI;

  Results({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceURI,
    this.series,
  });

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({this.path, this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }
}

class Series {
  String? resourceURI;
  String? name;

  Series({this.resourceURI, this.name});

  Series.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceURI'] = this.resourceURI;
    data['name'] = this.name;
    return data;
  }
}
