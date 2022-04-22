import 'dart:convert';

import 'package:use_bloc/feature/home/domain/entity/post.dart';

class PostModel extends Post {
  PostModel({
    required String authorFullname,
    required String title,
    required String thumbnail,
  }) : super(
          authorFullname: authorFullname,
          title: title,
          thumbnail: thumbnail,
        );

  Map<String, dynamic> toMap() {
    return {
      'author_fullname': authorFullname,
      'title': title,
      'thumbnail': thumbnail,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      authorFullname: map['data']['author_fullname'],
      thumbnail: map['data']['thumbnail'],
      title: map['data']['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));
}
