import 'package:reelstok/domain/entities/videos_post.dart';

class VideoModel{
  final String name; 
  final String videoUrl;
  final int likes;
  final int views;

  VideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0
  });

  factory VideoModel.fromJson(Map<String, dynamic>json) => VideoModel(
    name: json['name'] ?? 'No video.',
    videoUrl: json['videoUrl'],
    likes: json['likes'] ?? 0,
    views: json['views'] ?? 0
    );

  VideoPost toVideoPostEntity() => VideoPost(
    caption: name, 
    videoUrl: videoUrl,
    likes: likes,
    views: views
    );
}