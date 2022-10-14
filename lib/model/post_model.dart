import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostListModel {
  PostListModel({required this.posts});
  final List<PostModel>? posts;

  factory PostListModel.fromJson(Map<String, dynamic> json) =>
      _$PostListModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostListModelToJson(this);
}

@JsonSerializable()
class PostModel {
  PostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
