import 'package:chap_chap/MizzUp_Code/MizzUp_util.dart';

class ForumModel {
  String id;
  String description;
  String photo;
  String titre;

  ForumModel({
    required this.id,
    required this.description,
    required this.photo,
    required this.titre,
  });

  factory ForumModel.fromJson(Map<String, dynamic> json) {
    return ForumModel(
      id: '',
      description: valueOrDefault(json['description'], ""),
      photo: valueOrDefault(json['photo'], ""),
      titre: valueOrDefault(json['titre'], ""),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'photo': photo,
      'titre': titre,
    };
  }
}
