class Alternative {
  String? link;
  String? image;
  String? name;

  Alternative.fromJson(Map<String, dynamic> json)
      : link = json['link'],
        image = json['image'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'link': link,
        'image': image,
        'name': name,
      };
}
