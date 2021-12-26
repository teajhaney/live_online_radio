class RadioModel {
  String name;
  String url;
  String urlResolved;
  String homepage;
  String favicon;
  String tags;
  String country;

  String language;

  int votes;

  RadioModel({
    required this.name,
    required this.url,
    required this.urlResolved,
    required this.homepage,
    required this.favicon,
    required this.tags,
    required this.country,
    required this.language,
    required this.votes,
  });

  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return RadioModel(
      name: json["name"] ?? '',
      url: json["url"] ?? '',
      urlResolved: json["urlResolved"] ?? '',
      homepage: json['homepage'] ?? '',
      favicon: json['favicon'] ?? '',
      tags: json['tags'] ?? '',
      country: json['country'] ?? '',
      language: json['langauge'] ?? '',
      votes: json['votes'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['url'] = url;
    data['url_resolved'] = urlResolved;
    data['homepage'] = homepage;
    data['favicon'] = favicon;
    data['tags'] = tags;
    data['country'] = country;
    data['language'] = language;
    data['votes'] = votes;

    return data;
  }
}
