// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostListModel _$PostListModelFromJson(Map<String, dynamic> json) =>
    PostListModel(
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostListModelToJson(PostListModel instance) =>
    <String, dynamic>{
      'posts': instance.posts,
    };

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
